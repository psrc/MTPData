#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblRevision

# ![Tables](../../../../Images/Table32.png) [dbo].[tblRevision]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Heap | YES |
| Row Count (~) | 60 |
| Created | 2:51:56 PM Thursday, January 2, 2014 |
| Last Modified | 2:37:36 PM Thursday, May 14, 2015 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability | Identity | Default |
|---|---|---|---|---|---|
| RevisionID | int | 4 | NOT NULL | 1 - 1 |  |
| RevisionName | nvarchar(100) | 200 | NULL allowed |  |  |
| RevisionTypeID | tinyint | 1 | NULL allowed |  |  |
| ExecBoardApprovalDate | datetime | 8 | NULL allowed |  |  |
| PolicyBoardApprovalDate | datetime | 8 | NULL allowed |  |  |
| EditionID | smallint | 2 | NULL allowed |  |  |
| Posted | tinyint | 1 | NULL allowed |  | ((0)) |
| SourceEditionID | smallint | 2 | NULL allowed |  |  |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblRevision]
(
[RevisionID] [int] NOT NULL IDENTITY(1, 1),
[RevisionName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RevisionTypeID] [tinyint] NULL,
[ExecBoardApprovalDate] [datetime] NULL,
[PolicyBoardApprovalDate] [datetime] NULL,
[EditionID] [smallint] NULL,
[Posted] [tinyint] NULL CONSTRAINT [DF__tblRevisi__Poste__5224328E] DEFAULT ((0)),
[SourceEditionID] [smallint] NULL
) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewPendingRevisions]](../Views/dbo_viewPendingRevisions.md)
* [[dbo].[viewProjectLog]](../Views/dbo_viewProjectLog.md)
* [[dbo].[viewProjectsPending]](../Views/dbo_viewProjectsPending.md)
* [[dbo].[viewProjRevision]](../Views/dbo_viewProjRevision.md)
* [[dbo].[viewReviewProject]](../Views/dbo_viewReviewProject.md)
* [[dbo].[viewReviewProjectsArchive]](../Views/dbo_viewReviewProjectsArchive.md)
* [[dbo].[viewRevision]](../Views/dbo_viewRevision.md)
* [[dbo].[viewRevisionHistory]](../Views/dbo_viewRevisionHistory.md)
* [[dbo].[viewRevisionSummary]](../Views/dbo_viewRevisionSummary.md)
* [[dbo].[viewRevisionSummary_ImpTypes]](../Views/dbo_viewRevisionSummary_ImpTypes.md)
* [[dbo].[mtpsp_AddNewRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_AddNewRevision.md)
* [[dbo].[mtpsp_newProjInRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_newProjInRevision.md)
* [[dbo].[mtpsp_PostRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_PostRevision.md)
* [[dbo].[mtpsp_predictProject]](../Programmability/Stored_Procedures/dbo_mtpsp_predictProject.md)
* [[dbo].[mtpsp_predictProject_draftPlan]](../Programmability/Stored_Procedures/dbo_mtpsp_predictProject_draftPlan.md)
* [[stg].[merge_proj_edition]](../Programmability/Stored_Procedures/stg_merge_proj_edition.md)
* [[dbo].[mtpfn_ArchivedProject]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_ArchivedProject.md)
* [[dbo].[mtpfn_ControlTotals_ConstrainedPlan]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_ControlTotals_ConstrainedPlan.md)
* [[dbo].[mtpfn_predictProject]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_predictProject.md)
* [[dbo].[mtpfn_predictProject_draftPlan]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_predictProject_draftPlan.md)
* [[dbo].[mtpfn_ReviewProjects]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_ReviewProjects.md)
* [[dbo].[mtpfn_RevisionHistory]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_RevisionHistory.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

