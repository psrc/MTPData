#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblProject

# ![Tables](../../../../Images/Table32.png) [dbo].[tblProject]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Row Count (~) | 953 |
| Created | 9:18:36 AM Tuesday, December 31, 2013 |
| Last Modified | 12:28:17 PM Tuesday, October 18, 2016 |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default |
|---|---|---|---|---|---|
| [![Cluster Primary Key pk_tblProject_MTPID: MTPID](../../../../Images/pkcluster.png)](#indexes) | MTPID | int | 4 | NOT NULL |  |
|  | Agency | smallint | 2 | NULL allowed |  |
|  | Title | nvarchar(1000) | 2000 | NULL allowed |  |
|  | ProjDesc | nvarchar(max) | max | NULL allowed |  |
|  | TotProjCost | money | 8 | NULL allowed | ((0)) |
|  | ContactName | nvarchar(50) | 100 | NULL allowed |  |
|  | ContactPhone | nvarchar(100) | 200 | NULL allowed |  |
|  | ContactEmail | nvarchar(100) | 200 | NULL allowed |  |
|  | EstCostYear | int | 4 | NULL allowed |  |
|  | CompletionYear | int | 4 | NULL allowed |  |
|  | MTPStatus | int | 4 | NULL allowed |  |
|  | ProjectOn | nvarchar(255) | 510 | NULL allowed |  |
|  | ProjectFrom | nvarchar(255) | 510 | NULL allowed |  |
|  | ProjectTo | nvarchar(255) | 510 | NULL allowed |  |
|  | MilePostFrom | decimal(18,1) | 9 | NULL allowed |  |
|  | MilePostTo | decimal(18,1) | 9 | NULL allowed |  |
|  | CountyID | smallint | 2 | NULL allowed |  |
|  | StateRouteID | smallint | 2 | NULL allowed |  |
|  | FuncClassID | tinyint | 1 | NULL allowed |  |
|  | StartYear | int | 4 | NULL allowed |  |
|  | WebLinks | nvarchar(1000) | 2000 | NULL allowed |  |
|  | PrimaryImpType | smallint | 2 | NULL allowed |  |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique |
|---|---|---|---|
| [![Cluster Primary Key pk_tblProject_MTPID: MTPID](../../../../Images/pkcluster.png)](#indexes) | pk_tblProject_MTPID | MTPID | YES |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblProject]
(
[MTPID] [int] NOT NULL,
[Agency] [smallint] NULL,
[Title] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProjDesc] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TotProjCost] [money] NULL CONSTRAINT [DF__tblProjec__TotPr__3B40CD36] DEFAULT ((0)),
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
[PrimaryImpType] [smallint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblProject] ADD CONSTRAINT [pk_tblProject_MTPID] PRIMARY KEY CLUSTERED ([MTPID]) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewPrimaryImpType]](../Views/dbo_viewPrimaryImpType.md)
* [[dbo].[viewProject]](../Views/dbo_viewProject.md)
* [[dbo].[viewProjEdition]](../Views/dbo_viewProjEdition.md)
* [[dbo].[viewRevisionSummary]](../Views/dbo_viewRevisionSummary.md)
* [[dbo].[viewScopeElements]](../Views/dbo_viewScopeElements.md)
* [[dbo].[viewScoresByProject]](../Views/dbo_viewScoresByProject.md)
* [[dbo].[viewScoresBySectionAndProject]](../Views/dbo_viewScoresBySectionAndProject.md)
* [[dbo].[merge_stg_projects]](../Programmability/Stored_Procedures/dbo_merge_stg_projects.md)
* [[dbo].[mtpsp_PostRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_PostRevision.md)
* [[dbo].[mtpsp_PostRevisionProj]](../Programmability/Stored_Procedures/dbo_mtpsp_PostRevisionProj.md)
* [[dbo].[mtpsp_projToRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_projToRevision.md)
* [[dbo].[mtpsp_StageToReview_Project]](../Programmability/Stored_Procedures/dbo_mtpsp_StageToReview_Project.md)
* [[stg].[merge_stg_projects]](../Programmability/Stored_Procedures/stg_merge_stg_projects.md)
* [[dbo].[mtpfn_currentProjects]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_currentProjects.md)
* [[dbo].[mtpfn_predictProject]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_predictProject.md)
* [[dbo].[next_mtpid]](../Programmability/Functions/Scalar-valued_Functions/dbo_next_mtpid.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

