#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblStageProj_ImpType

# ![Tables](../../../../Images/Table32.png) [dbo].[tblStageProj_ImpType]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Heap | YES |
| Row Count (~) | 1 |
| Created | 3:39:58 PM Thursday, April 16, 2015 |
| Last Modified | 3:39:58 PM Thursday, April 16, 2015 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|
| MTPID | int | 4 | NULL allowed |
| isPrimary | bit | 1 | NULL allowed |
| OldID | nvarchar(5) | 10 | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblStageProj_ImpType]
(
[MTPID] [int] NULL,
[isPrimary] [bit] NULL,
[OldID] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[mtpsp_ImportToStaging]](../Programmability/Stored_Procedures/dbo_mtpsp_ImportToStaging.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

