#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > stg.cpi

# ![Tables](../../../../Images/Table32.png) [stg].[cpi]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Row Count (~) | 76 |
| Created | 12:43:32 PM Monday, April 21, 2025 |
| Last Modified | 12:43:32 PM Monday, April 21, 2025 |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|---|
| [![Cluster Primary Key PK_cpi: Year](../../../../Images/pkcluster.png)](#indexes) | Year | smallint | 2 | NOT NULL |
|  | cpi | float | 8 | NULL allowed |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique |
|---|---|---|---|
| [![Cluster Primary Key PK_cpi: Year](../../../../Images/pkcluster.png)](#indexes) | PK_cpi | Year | YES |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [stg].[cpi]
(
[Year] [smallint] NOT NULL,
[cpi] [float] NULL
) ON [PRIMARY]
GO
ALTER TABLE [stg].[cpi] ADD CONSTRAINT [PK_cpi] PRIMARY KEY CLUSTERED ([Year]) ON [PRIMARY]
GO

```


---

## <a name="#uses"></a>Uses

* [stg](../Security/Schemas/dbo_stg.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

