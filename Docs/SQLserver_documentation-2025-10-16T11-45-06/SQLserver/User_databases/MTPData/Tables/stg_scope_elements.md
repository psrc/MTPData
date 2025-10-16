#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > stg.scope_elements

# ![Tables](../../../../Images/Table32.png) [stg].[scope_elements]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Heap | YES |
| Row Count (~) | 89 |
| Created | 12:09:01 PM Friday, May 23, 2025 |
| Last Modified | 12:09:01 PM Friday, May 23, 2025 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|
| Appguid | varchar(max) | max | NULL allowed |
| ImprovementTypeNumber | bigint | 8 | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [stg].[scope_elements]
(
[Appguid] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ImprovementTypeNumber] [bigint] NULL
) ON [PRIMARY]
GO

```


---

## <a name="#uses"></a>Uses

* [stg](../Security/Schemas/dbo_stg.md)


---

## <a name="#usedby"></a>Used By

* [[stg].[merge_scope_elements]](../Programmability/Stored_Procedures/stg_merge_scope_elements.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

