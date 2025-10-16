#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblImproveType

# ![Tables](../../../../Images/Table32.png) [dbo].[tblImproveType]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Heap | YES |
| Row Count (~) | 56 |
| Created | 2:02:58 PM Monday, December 2, 2013 |
| Last Modified | 2:02:58 PM Monday, December 2, 2013 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|
| ImpTypeID | smallint | 2 | NOT NULL |
| OldID | nvarchar(50) | 100 | NULL allowed |
| ImpTypeName | nvarchar(100) | 200 | NULL allowed |
| ImpTypeDesc | nvarchar(4000) | 8000 | NULL allowed |
| ImpTypeGeneric1 | nvarchar(10) | 20 | NULL allowed |
| ImpTypeGeneric2 | nvarchar(10) | 20 | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblImproveType]
(
[ImpTypeID] [smallint] NOT NULL,
[OldID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ImpTypeName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ImpTypeDesc] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ImpTypeGeneric1] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ImpTypeGeneric2] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewProject]](../Views/dbo_viewProject.md)
* [[dbo].[viewReviewProjectsArchive]](../Views/dbo_viewReviewProjectsArchive.md)
* [[dbo].[viewReviewSecondaryImpType]](../Views/dbo_viewReviewSecondaryImpType.md)
* [[dbo].[viewRevisionSummary]](../Views/dbo_viewRevisionSummary.md)
* [[dbo].[viewRevisionSummary_ImpTypes]](../Views/dbo_viewRevisionSummary_ImpTypes.md)
* [[dbo].[viewSecondaryImpType]](../Views/dbo_viewSecondaryImpType.md)
* [[dbo].[viewSecondaryImpTypesPivoted]](../Views/dbo_viewSecondaryImpTypesPivoted.md)
* [[dbo].[mtpfn_currentProjects]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_currentProjects.md)
* [[dbo].[mtpfn_predictProject]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_predictProject.md)
* [[dbo].[mtpfn_predictProject_draftPlan]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_predictProject_draftPlan.md)
* [[dbo].[mtpfn_ReviewProjects]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_ReviewProjects.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

