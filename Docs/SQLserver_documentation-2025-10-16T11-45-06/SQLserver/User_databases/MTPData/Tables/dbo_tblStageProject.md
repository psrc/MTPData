#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblStageProject

# ![Tables](../../../../Images/Table32.png) [dbo].[tblStageProject]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Heap | YES |
| Row Count (~) | 1 |
| Created | 3:39:46 PM Thursday, April 16, 2015 |
| Last Modified | 2:42:46 PM Monday, March 6, 2017 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability | Default |
|---|---|---|---|---|
| AppGUID | uniqueidentifier | 16 | NULL allowed | (newid()) |
| MTPID | int | 4 | NOT NULL |  |
| Agency | smallint | 2 | NULL allowed |  |
| PrimaryImpType | int | 4 | NULL allowed |  |
| Title | nvarchar(1000) | 2000 | NULL allowed |  |
| ProjDesc | nvarchar(max) | max | NULL allowed |  |
| TotProjCost | money | 8 | NULL allowed |  |
| ContactName | nvarchar(50) | 100 | NULL allowed |  |
| ContactPhone | nvarchar(100) | 200 | NULL allowed |  |
| ContactEmail | nvarchar(100) | 200 | NULL allowed |  |
| EstCostYear | int | 4 | NULL allowed |  |
| CompletionYear | int | 4 | NULL allowed |  |
| MTPStatus | int | 4 | NULL allowed |  |
| ProjectOn | nvarchar(255) | 510 | NULL allowed |  |
| ProjectFrom | nvarchar(255) | 510 | NULL allowed |  |
| ProjectTo | nvarchar(255) | 510 | NULL allowed |  |
| MilePostFrom | decimal(18,1) | 9 | NULL allowed |  |
| MilePostTo | decimal(18,1) | 9 | NULL allowed |  |
| CountyID | smallint | 2 | NULL allowed |  |
| StateRouteID | smallint | 2 | NULL allowed |  |
| FuncClassID | tinyint | 1 | NULL allowed |  |
| StartYear | int | 4 | NULL allowed |  |
| WebLinks | nvarchar(1000) | 2000 | NULL allowed |  |
| planning_process | nvarchar(2000) | 4000 | NULL allowed |  |
| letters_of_concurrence | nvarchar(2000) | 4000 | NULL allowed |  |
| funds_description | nvarchar(2000) | 4000 | NULL allowed |  |
| funds_committed | decimal(18,0) | 9 | NULL allowed |  |
| id | int | 4 | NULL allowed |  |
| new_project | bit | 1 | NULL allowed |  |
| sponsor_name | varchar(50) | 50 | NULL allowed |  |
| status | varchar(20) | 20 | NULL allowed |  |
| modify_from_unprogrammed_to_constrained | bit | 1 | NULL allowed |  |
| modify_constrained_project_details | bit | 1 | NULL allowed |  |
| modify_complete | bit | 1 | NULL allowed |  |
| change_title | bit | 1 | NULL allowed |  |
| change_description | bit | 1 | NULL allowed |  |
| change_sponsoring_agency | bit | 1 | NULL allowed |  |
| change_start_year | bit | 1 | NULL allowed |  |
| change_location_information | bit | 1 | NULL allowed |  |
| change_total_cost | bit | 1 | NULL allowed |  |
| change_constant_dollar_year | bit | 1 | NULL allowed |  |
| change_completion_year | bit | 1 | NULL allowed |  |
| change_functional_class | bit | 1 | NULL allowed |  |
| prepopulated | bit | 1 | NULL allowed |  |
| contact_2_first_name | varchar(100) | 100 | NULL allowed |  |
| contact_2_last_name | varchar(100) | 100 | NULL allowed |  |
| contact_2_email | varchar(100) | 100 | NULL allowed |  |
| contact_2_phone | varchar(100) | 100 | NULL allowed |  |
| application_id | int | 4 | NULL allowed |  |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblStageProject]
(
[AppGUID] [uniqueidentifier] NULL CONSTRAINT [def_guid] DEFAULT (newid()),
[MTPID] [int] NOT NULL,
[Agency] [smallint] NULL,
[PrimaryImpType] [int] NULL,
[Title] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProjDesc] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TotProjCost] [money] NULL,
[ContactName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactPhone] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactEmail] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EstCostYear] [int] NULL,
[CompletionYear] [int] NULL,
[MTPStatus] [int] NULL,
[ProjectOn] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProjectFrom] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProjectTo] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MilePostFrom] [decimal] (18, 1) NULL,
[MilePostTo] [decimal] (18, 1) NULL,
[CountyID] [smallint] NULL,
[StateRouteID] [smallint] NULL,
[FuncClassID] [tinyint] NULL,
[StartYear] [int] NULL,
[WebLinks] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[planning_process] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[letters_of_concurrence] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[funds_description] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[funds_committed] [decimal] (18, 0) NULL,
[id] [int] NULL,
[new_project] [bit] NULL,
[sponsor_name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[status] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[modify_from_unprogrammed_to_constrained] [bit] NULL,
[modify_constrained_project_details] [bit] NULL,
[modify_complete] [bit] NULL,
[change_title] [bit] NULL,
[change_description] [bit] NULL,
[change_sponsoring_agency] [bit] NULL,
[change_start_year] [bit] NULL,
[change_location_information] [bit] NULL,
[change_total_cost] [bit] NULL,
[change_constant_dollar_year] [bit] NULL,
[change_completion_year] [bit] NULL,
[change_functional_class] [bit] NULL,
[prepopulated] [bit] NULL,
[contact_2_first_name] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[contact_2_last_name] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[contact_2_email] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[contact_2_phone] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[application_id] [int] NULL
) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[mtpsp_DeleteFromStagingTables]](../Programmability/Stored_Procedures/dbo_mtpsp_DeleteFromStagingTables.md)
* [[dbo].[mtpsp_ImportToStaging]](../Programmability/Stored_Procedures/dbo_mtpsp_ImportToStaging.md)
* [[dbo].[mtpsp_StageToReview_Prioritization]](../Programmability/Stored_Procedures/dbo_mtpsp_StageToReview_Prioritization.md)
* [[dbo].[mtpsp_StageToReview_Proj_ImpType]](../Programmability/Stored_Procedures/dbo_mtpsp_StageToReview_Proj_ImpType.md)
* [[dbo].[mtpsp_StageToReview_Project]](../Programmability/Stored_Procedures/dbo_mtpsp_StageToReview_Project.md)
* [[dbo].[mtpsp_StageToReviewProjEdition]](../Programmability/Stored_Procedures/dbo_mtpsp_StageToReviewProjEdition.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

