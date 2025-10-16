#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblColumnNames

# ![Tables](../../../../Images/Table32.png) [dbo].[tblColumnNames]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Heap | YES |
| Row Count (~) | 6 |
| Created | 10:29:17 AM Tuesday, May 12, 2015 |
| Last Modified | 10:29:17 AM Tuesday, May 12, 2015 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|
| system_name | nvarchar(50) | 100 | NULL allowed |
| human_name | nvarchar(50) | 100 | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblColumnNames]
(
[system_name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[human_name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewRevisionSummary]](../Views/dbo_viewRevisionSummary.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

