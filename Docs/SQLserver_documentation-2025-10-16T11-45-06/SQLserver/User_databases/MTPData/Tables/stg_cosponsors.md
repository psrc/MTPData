#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > stg.cosponsors

# ![Tables](../../../../Images/Table32.png) [stg].[cosponsors]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Heap | YES |
| Row Count (~) | 0 |
| Created | 12:08:58 PM Friday, May 23, 2025 |
| Last Modified | 12:08:58 PM Friday, May 23, 2025 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|
| Appguid | varchar(max) | max | NULL allowed |
| CosponsorNumber | varchar(max) | max | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [stg].[cosponsors]
(
[Appguid] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CosponsorNumber] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO

```


---

## <a name="#uses"></a>Uses

* [stg](../Security/Schemas/dbo_stg.md)


---

## <a name="#usedby"></a>Used By

* [[stg].[merge_cosponsors]](../Programmability/Stored_Procedures/stg_merge_cosponsors.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

