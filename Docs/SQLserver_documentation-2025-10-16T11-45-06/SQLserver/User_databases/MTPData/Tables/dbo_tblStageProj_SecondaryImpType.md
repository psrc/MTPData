#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblStageProj_SecondaryImpType

# ![Tables](../../../../Images/Table32.png) [dbo].[tblStageProj_SecondaryImpType]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Heap | YES |
| Row Count (~) | 0 |
| Created | 12:28:46 PM Tuesday, October 18, 2016 |
| Last Modified | 12:28:46 PM Tuesday, October 18, 2016 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|
| MTPID | int | 4 | NULL allowed |
| ImpTypeID | smallint | 2 | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblStageProj_SecondaryImpType]
(
[MTPID] [int] NULL,
[ImpTypeID] [smallint] NULL
) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[mtpsp_DeleteFromStagingTables]](../Programmability/Stored_Procedures/dbo_mtpsp_DeleteFromStagingTables.md)
* [[dbo].[mtpsp_StageToReview_Proj_ImpType]](../Programmability/Stored_Procedures/dbo_mtpsp_StageToReview_Proj_ImpType.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

