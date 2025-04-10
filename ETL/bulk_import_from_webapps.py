import psrcelmerpy
# import polars
import pandas as pd
import os
import sys
import json
import pyodbc
import sqlalchemy
import uuid

conn_string = "Driver={ODBC Driver 17 for SQL Server};Server=SQLserver;Database=MTPData;trusted_connection=yes;"
engine = sqlalchemy.create_engine("mssql+pyodbc:///?odbc_connect=%s" % conn_string)

json_file = './ETL/mtp_projects.json'

try:
    with open(json_file, 'r', encoding='utf-8') as f:
        json_data = json.load(f)
except UnicodeDecodeError:
    with open(json_file, 'r', encoding='latin-1') as f:
        json_data = json.load(f)

projects_data = []
for item in json_data:
    project = item.get('mtp_project', {})
    project_copy = {k: v for k, v in project.items() if k != 'mtp_improvement_types'}
    projects_data.append(project_copy)

df = pd.DataFrame(projects_data)
df['uuid'] = df.apply(lambda _: uuid.uuid4(), axis=1)
df = df[['id', 'uuid'] + [col for col in df.columns if col not in ['id', 'uuid']]]

def reshape_prioritization(df):
    """ Reshape the prioritization columns into a long format.
        include columns 'ID', 'AppGUID' and 'MTPID'"""
    try:
        condition = df.columns.isin(['id', 'uuid', 'project_id']) | df.columns.str.startswith('prioritization_')
        df = df.loc[:, condition]
        df = df.drop('prioritization_a4_continued', axis=1, errors='ignore')
        prioritization_columns = [col for col in df.columns if (col.startswith('prioritization_') )]
        for col in prioritization_columns:
            df[col] = df[col].map(lambda x: 1 if isinstance(x, bool) and x else 0 if isinstance(x, bool) and not x else x)
        df_prioritization = df.melt(id_vars=['id', 'uuid', 'project_id'], var_name='WebappsID', value_name='Response') 
        df_prioritization = df_prioritization.sort_values(by=['id', 'WebappsID'])
        df_prioritization = df_prioritization.rename(columns={'id': 'ID', 'uuid': 'AppGUID', 'project_id': 'MTPID'})
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
        df2 = rename_columns(df2)
        return(df2)

    except Exception as e:
        print(e.args[0])
        raise


df_project = prepare_project(df)
df_project.to_sql(name='project', schema='stg', con=engine, if_exists='replace', index=False)

df_prioritization = reshape_prioritization(df)
df_prioritization.to_sql(name='prioritization', schema='stg', con=engine, if_exists='replace', index=False)

print(json_data)

df_project.columns
df_project.Cosponsors
df_project.MtpImprovementTypes

print("run complete")