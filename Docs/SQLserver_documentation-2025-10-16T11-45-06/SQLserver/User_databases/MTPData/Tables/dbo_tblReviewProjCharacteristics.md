#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblReviewProjCharacteristics

# ![Tables](../../../../Images/Table32.png) [dbo].[tblReviewProjCharacteristics]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Heap | YES |
| Row Count (~) | 42889 |
| Created | 4:14:57 PM Thursday, April 13, 2017 |
| Last Modified | 4:14:57 PM Thursday, April 13, 2017 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|
| AppGUID | uniqueidentifier | 16 | NULL allowed |
| CharacteristicID | int | 4 | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblReviewProjCharacteristics]
(
[AppGUID] [uniqueidentifier] NULL,
[CharacteristicID] [int] NULL
) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewReviewScopeElements]](../Views/dbo_viewReviewScopeElements.md)
* [[dbo].[mtpsp_DeleteProjRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_DeleteProjRevision.md)
* [[dbo].[mtpsp_PostRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_PostRevision.md)
* [[dbo].[mtpsp_PostRevisionProj]](../Programmability/Stored_Procedures/dbo_mtpsp_PostRevisionProj.md)
* [[dbo].[mtpsp_projToRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_projToRevision.md)
* [[dbo].[mtpsp_RevisionToRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_RevisionToRevision.md)
* [[stg].[merge_scope_elements]](../Programmability/Stored_Procedures/stg_merge_scope_elements.md)
* [[dbo].[mtpfn_predictProjCharacteristics]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_predictProjCharacteristics.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

