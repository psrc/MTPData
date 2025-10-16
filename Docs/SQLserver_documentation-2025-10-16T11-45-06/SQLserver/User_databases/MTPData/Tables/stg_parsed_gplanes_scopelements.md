#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > stg.parsed_gplanes_scopelements

# ![Tables](../../../../Images/Table32.png) [stg].[parsed_gplanes_scopelements]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Heap | YES |
| Row Count (~) | 98 |
| Created | 5:27:08 PM Thursday, May 15, 2025 |
| Last Modified | 5:27:08 PM Thursday, May 15, 2025 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|
| MTPID | bigint | 8 | NULL allowed |
| Response | bigint | 8 | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [stg].[parsed_gplanes_scopelements]
(
[MTPID] [bigint] NULL,
[Response] [bigint] NULL
) ON [PRIMARY]
GO

```


---

## <a name="#uses"></a>Uses

* [stg](../Security/Schemas/dbo_stg.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

