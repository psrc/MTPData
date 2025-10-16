#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblMTPStatus

# ![Tables](../../../../Images/Table32.png) [dbo].[tblMTPStatus]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Heap | YES |
| Row Count (~) | 14 |
| Created | 2:24:34 PM Friday, November 1, 2013 |
| Last Modified | 1:31:07 PM Monday, December 5, 2016 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|
| MTPStatusID | int | 4 | NOT NULL |
| StatusName | nvarchar(100) | 200 | NULL allowed |
| DisplayOrder | int | 4 | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblMTPStatus]
(
[MTPStatusID] [int] NOT NULL,
[StatusName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DisplayOrder] [int] NULL
) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewProject]](../Views/dbo_viewProject.md)
* [[dbo].[viewReviewProject]](../Views/dbo_viewReviewProject.md)
* [[dbo].[viewReviewProjectsArchive]](../Views/dbo_viewReviewProjectsArchive.md)
* [[dbo].[viewRevisionSummary]](../Views/dbo_viewRevisionSummary.md)
* [[dbo].[viewWebMapData_2018Update]](../Views/dbo_viewWebMapData_2018Update.md)
* [[dbo].[mtpfn_ArchivedProject]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_ArchivedProject.md)
* [[dbo].[mtpfn_currentProjects]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_currentProjects.md)
* [[dbo].[mtpfn_predictProject]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_predictProject.md)
* [[dbo].[mtpfn_predictProject_draftPlan]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_predictProject_draftPlan.md)
* [[dbo].[mtpfn_ReviewProjects]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_ReviewProjects.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

