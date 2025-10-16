#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblProj_ImpType

# ![Tables](../../../../Images/Table32.png) [dbo].[tblProj_ImpType]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Row Count (~) | 1151 |
| Created | 2:59:17 PM Thursday, September 18, 2014 |
| Last Modified | 2:48:01 PM Wednesday, May 27, 2015 |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|---|
| [![Cluster Key IDX_Proj_ImpType_clustered: MTPID\ImpTypeID](../../../../Images/cluster.png)](#indexes)[![Indexes IDX_Proj_ImpType_MTPID](../../../../Images/Index.png)](#indexes) | MTPID | int | 4 | NULL allowed |
|  | isPrimary | bit | 1 | NULL allowed |
| [![Cluster Key IDX_Proj_ImpType_clustered: MTPID\ImpTypeID](../../../../Images/cluster.png)](#indexes)[![Indexes IDX_Proj_ImpType_ImpTypeID](../../../../Images/Index.png)](#indexes) | ImpTypeID | smallint | 2 | NULL allowed |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique |
|---|---|---|---|
| [![Cluster Key IDX_Proj_ImpType_clustered: MTPID\ImpTypeID](../../../../Images/cluster.png)](#indexes) | IDX_Proj_ImpType_clustered | MTPID, ImpTypeID | YES |
|  | IDX_Proj_ImpType_ImpTypeID | ImpTypeID |  |
|  | IDX_Proj_ImpType_MTPID | MTPID |  |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblProj_ImpType]
(
[MTPID] [int] NULL,
[isPrimary] [bit] NULL,
[ImpTypeID] [smallint] NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_Proj_ImpType_ImpTypeID] ON [dbo].[tblProj_ImpType] ([ImpTypeID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_Proj_ImpType_MTPID] ON [dbo].[tblProj_ImpType] ([MTPID]) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IDX_Proj_ImpType_clustered] ON [dbo].[tblProj_ImpType] ([MTPID], [ImpTypeID]) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[view_PrimaryImpType]](../Views/dbo_view_PrimaryImpType.md)
* [[dbo].[mtpfn_predictProj_ImpType]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_predictProj_ImpType.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

