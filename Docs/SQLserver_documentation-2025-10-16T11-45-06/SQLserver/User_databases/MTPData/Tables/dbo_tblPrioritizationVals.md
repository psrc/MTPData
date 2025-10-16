#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblPrioritizationVals

# ![Tables](../../../../Images/Table32.png) [dbo].[tblPrioritizationVals]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Heap | YES |
| Row Count (~) | 59 |
| Created | 3:41:00 PM Thursday, April 16, 2015 |
| Last Modified | 3:41:00 PM Thursday, April 16, 2015 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|
| QuestionName | nvarchar(10) | 20 | NULL allowed |
| QuestionGroup | int | 4 | NULL allowed |
| QuestionValue | int | 4 | NULL allowed |
| MeasureID | nvarchar(1) | 2 | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblPrioritizationVals]
(
[QuestionName] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QuestionGroup] [int] NULL,
[QuestionValue] [int] NULL,
[MeasureID] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewPrioritizationResponses]](../Views/dbo_viewPrioritizationResponses.md)
* [[dbo].[mtpfn_predictProject_draftPlan]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_predictProject_draftPlan.md)
* [[dbo].[mtpfn_PrioritizationAnswers]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_PrioritizationAnswers.md)
* [[dbo].[mtpfn_PrioritizationScoresByMeasure]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_PrioritizationScoresByMeasure.md)
* [[dbo].[mtpfn_PrioritizationScoresByPostedProject]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_PrioritizationScoresByPostedProject.md)
* [[dbo].[mtpfn_PrioritizationScoresByProject]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_PrioritizationScoresByProject.md)
* [[dbo].[mtpfn_ReviewPrioritizationScores]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_ReviewPrioritizationScores.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

