#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > stg.scores_submitted_250421

# ![Tables](../../../../Images/Table32.png) [stg].[scores_submitted_250421]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Heap | YES |
| Row Count (~) | 15000 |
| Created | 9:17:27 AM Monday, April 21, 2025 |
| Last Modified | 9:17:27 AM Monday, April 21, 2025 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|
| ID | bigint | 8 | NULL allowed |
| AppGUID | varchar(max) | max | NULL allowed |
| MTPID | float | 8 | NULL allowed |
| WebappsID | varchar(max) | max | NULL allowed |
| Response | bigint | 8 | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [stg].[scores_submitted_250421]
(
[ID] [bigint] NULL,
[AppGUID] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MTPID] [float] NULL,
[WebappsID] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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

