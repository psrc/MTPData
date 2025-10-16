#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblReviewProject

# ![Tables](../../../../Images/Table32.png) [dbo].[tblReviewProject]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Row Count (~) | 47853 |
| Created | 3:51:38 PM Thursday, January 2, 2014 |
| Last Modified | 4:02:51 PM Monday, April 14, 2025 |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default |
|---|---|---|---|---|---|
| [![Cluster Primary Key pk_tblProject_APPGUID: AppGUID](../../../../Images/pkcluster.png)](#indexes) | AppGUID | uniqueidentifier | 16 | NOT NULL |  |
| [![Indexes tblReviewProject_unique_mtpid_revision_id, IDX_ReviewProject_RevisionID](../../../../Images/Index.png)](#indexes)(2) | RevisionID | int | 4 | NULL allowed |  |
|  | DateStamp | datetime | 8 | NULL allowed |  |
| [![Indexes IDX_ReviewProject_MTPID, tblReviewProject_unique_mtpid_revision_id](../../../../Images/Index.png)](#indexes)(2) | MTPID | int | 4 | NULL allowed |  |
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
|  | DatePosted | datetime | 8 | NULL allowed |  |
|  | DateOverwritten | datetime | 8 | NULL allowed |  |
|  | Edit | bit | 1 | NULL allowed |  |
|  | ReviewTypeID | int | 4 | NULL allowed | ((1)) |
|  | PrimaryImpType | smallint | 2 | NULL allowed |  |
|  | PlanningProcess | nvarchar(2000) | 4000 | NULL allowed |  |
|  | LettersOfConcurrence | nvarchar(2000) | 4000 | NULL allowed |  |
|  | FundsDescription | nvarchar(2000) | 4000 | NULL allowed |  |
|  | FundsCommitted | decimal(18,0) | 9 | NULL allowed |  |
|  | ApplicationID | int | 4 | NULL allowed |  |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique |
|---|---|---|---|
| [![Cluster Primary Key pk_tblProject_APPGUID: AppGUID](../../../../Images/pkcluster.png)](#indexes) | pk_tblProject_APPGUID | AppGUID | YES |
|  | tblReviewProject_unique_mtpid_revision_id | MTPID, RevisionID | YES |
|  | IDX_ReviewProject_MTPID | MTPID |  |
|  | IDX_ReviewProject_RevisionID | RevisionID |  |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblReviewProject]
(
[AppGUID] [uniqueidentifier] NOT NULL,
[RevisionID] [int] NULL,
[DateStamp] [datetime] NULL,
[MTPID] [int] NULL,
[Agency] [smallint] NULL,
[Title] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProjDesc] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TotProjCost] [money] NULL CONSTRAINT [DF__tblReview__TotPr__55009F39] DEFAULT ((0)),
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
[DatePosted] [datetime] NULL,
[DateOverwritten] [datetime] NULL,
[Edit] [bit] NULL,
[ReviewTypeID] [int] NULL CONSTRAINT [df_tblReviewProject_ReviewType] DEFAULT ((1)),
[PrimaryImpType] [smallint] NULL,
[PlanningProcess] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LettersOfConcurrence] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FundsDescription] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FundsCommitted] [decimal] (18, 0) NULL,
[ApplicationID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblReviewProject] ADD CONSTRAINT [pk_tblProject_APPGUID] PRIMARY KEY CLUSTERED ([AppGUID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_ReviewProject_MTPID] ON [dbo].[tblReviewProject] ([MTPID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblReviewProject] ADD CONSTRAINT [tblReviewProject_unique_mtpid_revision_id] UNIQUE NONCLUSTERED ([MTPID], [RevisionID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_ReviewProject_RevisionID] ON [dbo].[tblReviewProject] ([RevisionID]) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewImprovementTypesRevisionData]](../Views/dbo_viewImprovementTypesRevisionData.md)
* [[dbo].[viewProjectsPending]](../Views/dbo_viewProjectsPending.md)
* [[dbo].[viewProjRevision]](../Views/dbo_viewProjRevision.md)
* [[dbo].[viewReviewPrimaryImpType]](../Views/dbo_viewReviewPrimaryImpType.md)
* [[dbo].[viewReviewProject]](../Views/dbo_viewReviewProject.md)
* [[dbo].[viewReviewProjectEdited]](../Views/dbo_viewReviewProjectEdited.md)
* [[dbo].[viewReviewProjectsArchive]](../Views/dbo_viewReviewProjectsArchive.md)
* [[dbo].[viewReviewProjEdition]](../Views/dbo_viewReviewProjEdition.md)
* [[dbo].[viewReviewScopeElements]](../Views/dbo_viewReviewScopeElements.md)
* [[dbo].[viewReviewScoresByProject]](../Views/dbo_viewReviewScoresByProject.md)
* [[dbo].[viewReviewScoresBySectionAndProject]](../Views/dbo_viewReviewScoresBySectionAndProject.md)
* [[dbo].[viewRevisionHistory]](../Views/dbo_viewRevisionHistory.md)
* [[dbo].[viewRevisionSummary]](../Views/dbo_viewRevisionSummary.md)
* [[dbo].[viewRevisionSummary_ImpTypes]](../Views/dbo_viewRevisionSummary_ImpTypes.md)
* [[dbo].[viewWebMapData_2018Update]](../Views/dbo_viewWebMapData_2018Update.md)
* [[dbo].[merge_stg_projects]](../Programmability/Stored_Procedures/dbo_merge_stg_projects.md)
* [[dbo].[mtpsp_AddRevisionComment]](../Programmability/Stored_Procedures/dbo_mtpsp_AddRevisionComment.md)
* [[dbo].[mtpsp_DeleteProjRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_DeleteProjRevision.md)
* [[dbo].[mtpsp_newProjInRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_newProjInRevision.md)
* [[dbo].[mtpsp_PostRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_PostRevision.md)
* [[dbo].[mtpsp_PostRevisionProj]](../Programmability/Stored_Procedures/dbo_mtpsp_PostRevisionProj.md)
* [[dbo].[mtpsp_PostToNewEdition]](../Programmability/Stored_Procedures/dbo_mtpsp_PostToNewEdition.md)
* [[dbo].[mtpsp_projToRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_projToRevision.md)
* [[dbo].[mtpsp_RevisionToRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_RevisionToRevision.md)
* [[dbo].[mtpsp_StageToReview_Project]](../Programmability/Stored_Procedures/dbo_mtpsp_StageToReview_Project.md)
* [[stg].[merge_cosponsors]](../Programmability/Stored_Procedures/stg_merge_cosponsors.md)
* [[stg].[merge_scope_elements]](../Programmability/Stored_Procedures/stg_merge_scope_elements.md)
* [[stg].[merge_stg_projects]](../Programmability/Stored_Procedures/stg_merge_stg_projects.md)
* [[dbo].[mtpfn_ArchivedProject]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_ArchivedProject.md)
* [[dbo].[mtpfn_predictProj_ImpType]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_predictProj_ImpType.md)
* [[dbo].[mtpfn_predictProj_SecondaryImpType]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_predictProj_SecondaryImpType.md)
* [[dbo].[mtpfn_predictProjCharacteristics]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_predictProjCharacteristics.md)
* [[dbo].[mtpfn_predictProject]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_predictProject.md)
* [[dbo].[mtpfn_predictProject_draftPlan]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_predictProject_draftPlan.md)
* [[dbo].[mtpfn_PrioritizationAnswers]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_PrioritizationAnswers.md)
* [[dbo].[mtpfn_PrioritizationScoresByMeasure]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_PrioritizationScoresByMeasure.md)
* [[dbo].[mtpfn_PrioritizationScoresByProject]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_PrioritizationScoresByProject.md)
* [[dbo].[mtpfn_ReviewPrioritizationScores]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_ReviewPrioritizationScores.md)
* [[dbo].[mtpfn_ReviewProjects]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_ReviewProjects.md)
* [[dbo].[mtpfn_ReviewScoresByProject]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_ReviewScoresByProject.md)
* [[dbo].[mtpfn_RevisionHistory]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_RevisionHistory.md)
* [[dbo].[mtpfn_ScaledProjCostFromAppGUID]](../Programmability/Functions/Scalar-valued_Functions/dbo_mtpfn_ScaledProjCostFromAppGUID.md)
* [[dbo].[next_mtpid]](../Programmability/Functions/Scalar-valued_Functions/dbo_next_mtpid.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

