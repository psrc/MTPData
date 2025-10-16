#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblReviewProjEdition

# ![Tables](../../../../Images/Table32.png) [dbo].[tblReviewProjEdition]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Heap | YES |
| Row Count (~) | 104357 |
| Created | 3:30:54 PM Friday, November 1, 2013 |
| Last Modified | 8:22:20 AM Monday, March 6, 2017 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Computed | Max Length (Bytes) | Nullability |
|---|---|---|---|---|
| APPGUID | uniqueidentifier |  | 16 | NULL allowed |
| EditionID | smallint |  | 2 | NULL allowed |
| CostYear | int | YES | 4 | NULL allowed |
| ScaledCost | money | YES | 8 | NULL allowed |


---

## <a name="#computedcolumns"></a>Computed columns

| Name | Column definition |
|---|---|
| CostYear | ([dbo].[mtpfn_CostYearFromEditionID]([EditionID])) |
| ScaledCost | ([dbo].[mtpfn_ScaledProjCostFromAppGUID]([AppGUID],[EditionID])) |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblReviewProjEdition]
(
[APPGUID] [uniqueidentifier] NULL,
[EditionID] [smallint] NULL,
[CostYear] AS ([dbo].[mtpfn_CostYearFromEditionID]([EditionID])),
[ScaledCost] AS ([dbo].[mtpfn_ScaledProjCostFromAppGUID]([AppGUID],[EditionID]))
) ON [PRIMARY]
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[mtpfn_CostYearFromEditionID]](../Programmability/Functions/Scalar-valued_Functions/dbo_mtpfn_CostYearFromEditionID.md)
* [[dbo].[mtpfn_ScaledProjCostFromAppGUID]](../Programmability/Functions/Scalar-valued_Functions/dbo_mtpfn_ScaledProjCostFromAppGUID.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewReviewProjEdition]](../Views/dbo_viewReviewProjEdition.md)
* [[dbo].[mtpsp_DeleteProjRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_DeleteProjRevision.md)
* [[dbo].[mtpsp_newProjInRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_newProjInRevision.md)
* [[dbo].[mtpsp_PostRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_PostRevision.md)
* [[dbo].[mtpsp_PostRevisionProj]](../Programmability/Stored_Procedures/dbo_mtpsp_PostRevisionProj.md)
* [[dbo].[mtpsp_projToRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_projToRevision.md)
* [[dbo].[mtpsp_RevisionToRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_RevisionToRevision.md)
* [[dbo].[mtpsp_StageToReviewProjEdition]](../Programmability/Stored_Procedures/dbo_mtpsp_StageToReviewProjEdition.md)
* [[stg].[merge_proj_edition]](../Programmability/Stored_Procedures/stg_merge_proj_edition.md)
* [[dbo].[mtpfn_predictProject]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_predictProject.md)
* [[dbo].[mtpfn_ReviewProjects]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_ReviewProjects.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

