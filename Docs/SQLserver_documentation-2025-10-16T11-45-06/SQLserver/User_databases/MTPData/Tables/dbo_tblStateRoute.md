#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblStateRoute

# ![Tables](../../../../Images/Table32.png) [dbo].[tblStateRoute]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Heap | YES |
| Row Count (~) | 10 |
| Created | 11:39:30 AM Friday, November 22, 2013 |
| Last Modified | 1:55:54 PM Friday, November 22, 2013 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|
| SRID | smallint | 2 | NULL allowed |
| SRFullName | nvarchar(100) | 200 | NULL allowed |
| SRShortName | nvarchar(10) | 20 | NULL allowed |
| SRNumeric | int | 4 | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblStateRoute]
(
[SRID] [smallint] NULL,
[SRFullName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SRShortName] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SRNumeric] [int] NULL
) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewProject]](../Views/dbo_viewProject.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

