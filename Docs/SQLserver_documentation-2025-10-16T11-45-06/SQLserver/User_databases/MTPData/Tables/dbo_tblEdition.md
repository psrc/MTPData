#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblEdition

# ![Tables](../../../../Images/Table32.png) [dbo].[tblEdition]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Row Count (~) | 7 |
| Created | 2:16:01 PM Friday, November 1, 2013 |
| Last Modified | 8:22:01 AM Monday, March 6, 2017 |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|---|
| [![Cluster Primary Key PK__tblEditi__C762234320C1E124: EditionID](../../../../Images/pkcluster.png)](#indexes) | EditionID | smallint | 2 | NOT NULL |
|  | EditionName | nvarchar(100) | 200 | NULL allowed |
|  | intDisplayOrder | int | 4 | NULL allowed |
|  | CostYear | int | 4 | NULL allowed |
|  | factor_set | int | 4 | NULL allowed |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique |
|---|---|---|---|
| [![Cluster Primary Key PK__tblEditi__C762234320C1E124: EditionID](../../../../Images/pkcluster.png)](#indexes) | PK__tblEditi__C762234320C1E124 | EditionID | YES |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblEdition]
(
[EditionID] [smallint] NOT NULL,
[EditionName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[intDisplayOrder] [int] NULL,
[CostYear] [int] NULL,
[factor_set] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblEdition] ADD CONSTRAINT [PK__tblEditi__C762234320C1E124] PRIMARY KEY CLUSTERED ([EditionID]) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewProjEdition]](../Views/dbo_viewProjEdition.md)
* [[dbo].[viewReviewProjectsArchive]](../Views/dbo_viewReviewProjectsArchive.md)
* [[dbo].[viewReviewProjEdition]](../Views/dbo_viewReviewProjEdition.md)
* [[dbo].[mtpfn_ControlTotals_ConstrainedPlan]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_ControlTotals_ConstrainedPlan.md)
* [[dbo].[mtpfn_CostYearFromEditionID]](../Programmability/Functions/Scalar-valued_Functions/dbo_mtpfn_CostYearFromEditionID.md)
* [[dbo].[mtpfn_currentProjects]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_currentProjects.md)
* [[dbo].[mtpfn_predictProject]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_predictProject.md)
* [[dbo].[mtpfn_predictProject_draftPlan]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_predictProject_draftPlan.md)
* [[dbo].[mtpfn_ReviewProjects]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_ReviewProjects.md)
* [[dbo].[mtpfn_ScaledProjCostFromAppGUID]](../Programmability/Functions/Scalar-valued_Functions/dbo_mtpfn_ScaledProjCostFromAppGUID.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

