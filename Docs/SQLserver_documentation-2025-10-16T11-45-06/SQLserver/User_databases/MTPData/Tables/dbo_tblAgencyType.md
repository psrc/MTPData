#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblAgencyType

# ![Tables](../../../../Images/Table32.png) [dbo].[tblAgencyType]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Row Count (~) | 8 |
| Created | 2:11:51 PM Friday, November 1, 2013 |
| Last Modified | 2:11:51 PM Friday, November 1, 2013 |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|---|
| [![Cluster Primary Key PK__tblAgenc__3BB8BBD11A14E395: AgencyType](../../../../Images/pkcluster.png)](#indexes) | AgencyType | tinyint | 1 | NOT NULL |
|  | strAgencyType | varchar(30) | 30 | NULL allowed |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique |
|---|---|---|---|
| [![Cluster Primary Key PK__tblAgenc__3BB8BBD11A14E395: AgencyType](../../../../Images/pkcluster.png)](#indexes) | PK__tblAgenc__3BB8BBD11A14E395 | AgencyType | YES |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblAgencyType]
(
[AgencyType] [tinyint] NOT NULL,
[strAgencyType] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAgencyType] ADD CONSTRAINT [PK__tblAgenc__3BB8BBD11A14E395] PRIMARY KEY CLUSTERED ([AgencyType]) ON [PRIMARY]
GO

```


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

