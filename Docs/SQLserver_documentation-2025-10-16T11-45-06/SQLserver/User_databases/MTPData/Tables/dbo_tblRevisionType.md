#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblRevisionType

# ![Tables](../../../../Images/Table32.png) [dbo].[tblRevisionType]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Row Count (~) | 4 |
| Created | 10:58:08 AM Tuesday, December 31, 2013 |
| Last Modified | 10:58:08 AM Tuesday, December 31, 2013 |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|---|
| [![Cluster Primary Key PK_tblRevisionType_RevisionTypeID: RevisionTypeID](../../../../Images/pkcluster.png)](#indexes) | RevisionTypeID | tinyint | 1 | NOT NULL |
|  | RevisionTypeName | nvarchar(100) | 200 | NULL allowed |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique |
|---|---|---|---|
| [![Cluster Primary Key PK_tblRevisionType_RevisionTypeID: RevisionTypeID](../../../../Images/pkcluster.png)](#indexes) | PK_tblRevisionType_RevisionTypeID | RevisionTypeID | YES |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblRevisionType]
(
[RevisionTypeID] [tinyint] NOT NULL,
[RevisionTypeName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblRevisionType] ADD CONSTRAINT [PK_tblRevisionType_RevisionTypeID] PRIMARY KEY CLUSTERED ([RevisionTypeID]) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewRevision]](../Views/dbo_viewRevision.md)
* [[dbo].[mtpsp_PostRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_PostRevision.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

