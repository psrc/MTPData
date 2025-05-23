import psrcelmerpy
# import polars
import pandas as pd
import os
import sys
import json
import pyodbc
import sqlalchemy
from sqlalchemy.sql import select, func
from sqlalchemy import text
import uuid
import openpyxl

TARGET_REVISION_ID = 68

conn_string = "Driver={ODBC Driver 17 for SQL Server};Server=SQLserver;Database=MTPData;trusted_connection=yes;"
engine = sqlalchemy.create_engine("mssql+pyodbc:///?odbc_connect=%s" % conn_string)

json_file = './ETL/mtp_projects_submitted_250428.json'

elmer_conn = psrcelmerpy.ElmerConn()

try:
    with open(json_file, 'r', encoding='utf-8') as f:
        json_data = json.load(f)
except UnicodeDecodeError:
    with open(json_file, 'r', encoding='latin-1') as f:
        json_data = json.load(f)

projects_data = []
for item in json_data:
    project = item.get('mtp_project', {})
    project_copy = {k: v for k, v in project.items()} 
    projects_data.append(project_copy)


df = pd.DataFrame(projects_data)
df['AppGUID'] = df.apply(lambda _: uuid.uuid4(), axis=1)
df = df[['id', 'AppGUID'] + [col for col in df.columns if col not in ['id', 'AppGUID']]]

def calculate_mtpids(df):
    """ Calculate the MTPID for each project in the dataframe that doesn't already have an MTPID."""
    try:
        with engine.connect() as conn:
            next_empty_mtpid = conn.scalar(
                select(func.dbo.next_mtpid())
            )
        mask = df['project_id'].isna() | (df['project_id'] == 0)
        num_rows_to_update = mask.sum()
        max_new_mtpid = int(next_empty_mtpid + num_rows_to_update) - 1
        
        if num_rows_to_update > 0:
            new_ids = list(range(next_empty_mtpid, next_empty_mtpid + num_rows_to_update))
            df.loc[mask, 'project_id'] = new_ids
        
        return df

    except Exception as e:
        print(f"Exception in calculate_mtpids(): {e.args[0]}")
        raise    


def reshape_prioritization(df):
    """ Reshape the prioritization columns into a long format.
        include columns 'ID', 'AppGUID' and 'MTPID'"""
    try:
        condition = df.columns.isin(['id', 'AppGUID', 'project_id']) | df.columns.str.startswith('prioritization_')
        df = df.loc[:, condition]
        df = df.drop('prioritization_a4_continued', axis=1, errors='ignore')
        prioritization_columns = [col for col in df.columns if (col.startswith('prioritization_') )]
        for col in prioritization_columns:
            df[col] = df[col].map(lambda x: 1 if isinstance(x, bool) and x else 0 if isinstance(x, bool) and not x else x)
        df_prioritization = df.melt(id_vars=['id', 'AppGUID', 'project_id'], var_name='WebappsID', value_name='Response') 
        df_prioritization = df_prioritization.sort_values(by=['id', 'WebappsID'])
        # Convert Response column to integer, preserving nulls
        df_prioritization['Response'] = pd.to_numeric(df_prioritization['Response'], errors='coerce').astype('Int64')
        df_prioritization = df_prioritization.rename(columns={'id': 'ID', 'project_id': 'MTPID'})
        return(df_prioritization)

    except Exception as e:
        print(e.args[0])
        raise


def remove_prioritization_cols(df):
    """return a dataframe without the prioritization columns"""
    try:
        my_cols = [col for col in df.columns if not col.startswith('prioritization_')]
        return df[my_cols]
    except Exception as e:
        print(e.args[0])
        raise

def rename_columns(df):
    """Rename columns to PascalCase"""
    try:
        snake_to_pascal = {}
        for c in df.columns: 
            pc = ''.join(word.capitalize() for word in c.split('_'))
            snake_to_pascal[c] = pc
        df_renamed = df.rename(columns=snake_to_pascal)
        return(df_renamed)
        
    except Exception as e:
        print(e.args[0])
        raise

def prepare_project(df):
    """Prepare the project dataframe for importation into the database"""
    try:
        df2 = remove_prioritization_cols(df)
        df2 = calculate_mtpids(df2)
        df2 = rename_columns(df2)
        return(df2)

    except Exception as e:
        print(e.args[0])
        raise


def create_cosponsors_df(df):
    """Create a dataframe with AppGUID and cosponsor numbers from the list in column df.cosponsors"""
    try:
        df_cosponsors = df[['AppGUID', 'cosponsors']].copy()
        df_cosponsors = df_cosponsors.explode('cosponsors')
        df_cosponsors = df_cosponsors[df_cosponsors['cosponsors'].notna() & (df_cosponsors['cosponsors'] != '')]
        df_cosponsors['cosponsor_number'] = df_cosponsors['cosponsors'].apply(
            lambda x: int(x.get('number')) if isinstance(x, dict) and 'number' in x else None
        )
        df_cosponsors = df_cosponsors.drop('cosponsors', axis=1)
        df_cosponsors = df_cosponsors[df_cosponsors['cosponsor_number'].notna()]
        df_cosponsors = rename_columns(df_cosponsors)
        return df_cosponsors
    except Exception as e:
        print(f"Error creating cosponsors dataframe: {e}")
        raise

def create_improvement_types_df(df):
    """Create a dataframe with AppGUID and improvement type numbers from the list in column df.mtp_improvement_types"""
    try:
        df_improvement_types = df[['AppGUID', 'mtp_improvement_types']].copy()
        df_improvement_types = df_improvement_types.explode('mtp_improvement_types')
        df_improvement_types = df_improvement_types[df_improvement_types['mtp_improvement_types'].notna() & 
                                                   (df_improvement_types['mtp_improvement_types'] != '')]
        df_improvement_types['improvement_type_number'] = df_improvement_types['mtp_improvement_types'].apply(
            lambda x: int(x.get('number')) if isinstance(x, dict) and 'number' in x else None
        )
        df_improvement_types = df_improvement_types.drop('mtp_improvement_types', axis=1)
        df_improvement_types = df_improvement_types[df_improvement_types['improvement_type_number'].notna()]
        df_improvement_types = rename_columns(df_improvement_types)
        
        return df_improvement_types
    except Exception as e:
        print(f"Error creating improvement types dataframe: {e}")
        raise

# Create the project table
df_project = prepare_project(df)
df_project.to_sql(name='project', schema='stg', con=engine, if_exists='replace', index=False)

# Create the prioritization table
df_scores = reshape_prioritization(df)
df_scores.to_sql(name='scores', schema='stg', con=engine, if_exists='replace', index=False)

# Create the cosponsors table
df_cosponsors = create_cosponsors_df(df)
df_cosponsors.to_sql(name='cosponsors', schema='stg', con=engine, if_exists='replace', index=False)

# Create the improvement types table
df_improvement_types = create_improvement_types_df(df)
df_improvement_types.to_sql(name='scope_elements', schema='stg', con=engine, if_exists='replace', index=False)

# run the stored procedure to import the data into the main tables
try:
    sql = f"EXEC stg.stage_to_revision {TARGET_REVISION_ID}"
    with engine.connect() as conn:
        with conn.begin():
           #conn.execute(text(sql))
           pass
    print(f"tables staged and imported into revision {TARGET_REVISION_ID}")
except Exception as e:
    print(f"Error running the sproc stg.stage_to_review: {e}")
    print("staging tables written but not imported into a revision")


print("initial import run complete")


# Separate "Add/Remove GP Lanes" scope element into add vs remove
#  per the spreadsheet emailed from Kalon to Chris 5/15/2025

excel_file = r'.\ETL\rcp_projects_lane_changes_db_updates_5_15_2025.xlsx'

df = pd.read_excel(excel_file, sheet_name='data')

df = df.rename(columns={'MTP ID': 'MTPID'})
df = df.rename(columns= {'Add General Purpose Capacity Lanes': 'AddGPLanes',
                         'Remove General Purpose Capacity Lanes': 'RemoveGPLanes'})
df = df[['MTPID', 'AddGPLanes', 'RemoveGPLanes']] 

df['AddGPLanes'] = df['AddGPLanes'].replace(1, 36)
df['RemoveGPLanes'] = df['RemoveGPLanes'].replace(1, 37)
df[df['RemoveGPLanes'] == 37]

df = pd.melt(df, id_vars=['MTPID'], value_vars=['AddGPLanes', 'RemoveGPLanes'], var_name='ScopeElement', value_name='Response')
df = df[df['Response'] >0]
df = df[['MTPID', 'Response']]
df.to_sql(name='parsed_gplanes_scopelements', schema='stg', con=engine, if_exists='replace', index=False)

qry = f"""insert into tblReviewProjCharacteristics (AppGUID, CharacteristicID)
select rp.AppGUID, se.Response
from stg.parsed_gplanes_scopelements se 
    join tblReviewProject rp on se.mtpid = rp.mtpid 
where rp.RevisionID = {TARGET_REVISION_ID}"""

#elmer_conn.execute_sql(qry)
# run the stored procedure to import the data into the main tables
try:
    qry = f"""insert into tblReviewProjCharacteristics (AppGUID, CharacteristicID)
    select rp.AppGUID, se.Response
    from stg.parsed_gplanes_scopelements se 
        join tblReviewProject rp on se.mtpid = rp.mtpid 
    where rp.RevisionID = {TARGET_REVISION_ID}"""
    with engine.connect() as conn:
        with conn.begin():
           conn.execute(text(qry))
    print(f"scope elements updated per the spreadsheet from 5-15-2025")
except Exception as e:
    print(f"Error inserting new scope elements: {e}")
    print("projects imported but not updated with new scope elements")