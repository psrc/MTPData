#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblLogTypes

# ![Tables](../../../../Images/Table32.png) [dbo].[tblLogTypes]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Row Count (~) | 2 |
| Created | 1:18:14 PM Thursday, November 6, 2014 |
| Last Modified | 1:18:14 PM Thursday, November 6, 2014 |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|---|
| [![Cluster Primary Key PK__tblLogTy__AE9574B46CD828CA: LogTypeID](../../../../Images/pkcluster.png)](#indexes) | LogTypeID | tinyint | 1 | NOT NULL |
|  | LogTypeName | nvarchar(100) | 200 | NULL allowed |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique |
|---|---|---|---|
| [![Cluster Primary Key PK__tblLogTy__AE9574B46CD828CA: LogTypeID](../../../../Images/pkcluster.png)](#indexes) | PK__tblLogTy__AE9574B46CD828CA | LogTypeID | YES |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblLogTypes]
(
[LogTypeID] [tinyint] NOT NULL,
[LogTypeName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLogTypes] ADD CONSTRAINT [PK__tblLogTy__AE9574B46CD828CA] PRIMARY KEY CLUSTERED ([LogTypeID]) ON [PRIMARY]
GO

```


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

