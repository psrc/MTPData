#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblReviewProj_SecondaryImpType

# ![Tables](../../../../Images/Table32.png) [dbo].[tblReviewProj_SecondaryImpType]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Row Count (~) | 15231 |
| Created | 12:28:37 PM Tuesday, October 18, 2016 |
| Last Modified | 2:51:38 PM Tuesday, October 18, 2016 |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|---|
| [![Cluster Primary Key PK_ReviewProj_SecondaryImpType: AppGUID\ImpTypeID](../../../../Images/pkcluster.png)](#indexes) | AppGUID | uniqueidentifier | 16 | NOT NULL |
| [![Cluster Primary Key PK_ReviewProj_SecondaryImpType: AppGUID\ImpTypeID](../../../../Images/pkcluster.png)](#indexes) | ImpTypeID | smallint | 2 | NOT NULL |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique |
|---|---|---|---|
| [![Cluster Primary Key PK_ReviewProj_SecondaryImpType: AppGUID\ImpTypeID](../../../../Images/pkcluster.png)](#indexes) | PK_ReviewProj_SecondaryImpType | AppGUID, ImpTypeID | YES |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblReviewProj_SecondaryImpType]
(
[AppGUID] [uniqueidentifier] NOT NULL,
[ImpTypeID] [smallint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblReviewProj_SecondaryImpType] ADD CONSTRAINT [PK_ReviewProj_SecondaryImpType] PRIMARY KEY CLUSTERED ([AppGUID], [ImpTypeID]) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewRevisionSummary_ImpTypes]](../Views/dbo_viewRevisionSummary_ImpTypes.md)
* [[dbo].[mtpsp_DeleteProjRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_DeleteProjRevision.md)
* [[dbo].[mtpsp_PostRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_PostRevision.md)
* [[dbo].[mtpsp_PostRevisionProj]](../Programmability/Stored_Procedures/dbo_mtpsp_PostRevisionProj.md)
* [[dbo].[mtpsp_projToRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_projToRevision.md)
* [[dbo].[mtpsp_StageToReview_Proj_ImpType]](../Programmability/Stored_Procedures/dbo_mtpsp_StageToReview_Proj_ImpType.md)
* [[dbo].[mtpfn_predictProj_SecondaryImpType]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_predictProj_SecondaryImpType.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

