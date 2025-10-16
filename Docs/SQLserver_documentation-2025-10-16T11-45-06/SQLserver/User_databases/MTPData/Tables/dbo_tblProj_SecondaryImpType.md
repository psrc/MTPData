#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblProj_SecondaryImpType

# ![Tables](../../../../Images/Table32.png) [dbo].[tblProj_SecondaryImpType]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Heap | YES |
| Row Count (~) | 223 |
| Created | 12:28:23 PM Tuesday, October 18, 2016 |
| Last Modified | 12:28:26 PM Tuesday, October 18, 2016 |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|---|
| [![Indexes IDX_Proj_SecondaryImpType_MTPID](../../../../Images/Index.png)](#indexes) | MTPID | int | 4 | NULL allowed |
|  | ImpTypeID | smallint | 2 | NULL allowed |


---

## <a name="#indexes"></a>Indexes

| Name | Key Columns |
|---|---|
| IDX_Proj_SecondaryImpType_MTPID | MTPID |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblProj_SecondaryImpType]
(
[MTPID] [int] NULL,
[ImpTypeID] [smallint] NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_Proj_SecondaryImpType_MTPID] ON [dbo].[tblProj_SecondaryImpType] ([MTPID]) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewRevisionSummary_ImpTypes]](../Views/dbo_viewRevisionSummary_ImpTypes.md)
* [[dbo].[viewSecondaryImpType]](../Views/dbo_viewSecondaryImpType.md)
* [[dbo].[viewSecondaryImpTypesPivoted]](../Views/dbo_viewSecondaryImpTypesPivoted.md)
* [[dbo].[mtpsp_PostRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_PostRevision.md)
* [[dbo].[mtpsp_PostRevisionProj]](../Programmability/Stored_Procedures/dbo_mtpsp_PostRevisionProj.md)
* [[dbo].[mtpsp_projToRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_projToRevision.md)
* [[dbo].[mtpsp_StageToReview_Proj_ImpType]](../Programmability/Stored_Procedures/dbo_mtpsp_StageToReview_Proj_ImpType.md)
* [[dbo].[mtpfn_predictProj_SecondaryImpType]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_predictProj_SecondaryImpType.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

