#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblPrioritizationMeasures

# ![Tables](../../../../Images/Table32.png) [dbo].[tblPrioritizationMeasures]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Heap | YES |
| Row Count (~) | 9 |
| Created | 3:41:00 PM Thursday, April 16, 2015 |
| Last Modified | 10:23:28 AM Wednesday, April 12, 2017 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|
| ID | nvarchar(1) | 2 | NULL allowed |
| Name | nvarchar(30) | 60 | NULL allowed |
| MeasureOrder | int | 4 | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblPrioritizationMeasures]
(
[ID] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Name] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MeasureOrder] [int] NULL
) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[mtpfn_PrioritizationAnswers]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_PrioritizationAnswers.md)
* [[dbo].[mtpfn_PrioritizationScoresByMeasure]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_PrioritizationScoresByMeasure.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

