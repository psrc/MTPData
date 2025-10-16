#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.retrofitted_prioritization_score_20250128

# ![Tables](../../../../Images/Table32.png) [dbo].[retrofitted_prioritization_score_20250128]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Heap | YES |
| Row Count (~) | 24 |
| Created | 1:00:43 PM Tuesday, January 28, 2025 |
| Last Modified | 1:00:43 PM Tuesday, January 28, 2025 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|
| MTPID | smallint | 2 | NOT NULL |
| Sponsor | nvarchar(50) | 100 | NOT NULL |
| Title | nvarchar(100) | 200 | NOT NULL |
| Scores | tinyint | 1 | NOT NULL |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[retrofitted_prioritization_score_20250128]
(
[MTPID] [smallint] NOT NULL,
[Sponsor] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Title] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Scores] [tinyint] NOT NULL
) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[mtpfn_PrioritizationScoresByPostedProject]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_PrioritizationScoresByPostedProject.md)
* [[dbo].[mtpfn_PrioritizationScoresByProject]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_PrioritizationScoresByProject.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

