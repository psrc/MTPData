#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblPrioritizationQuestions

# ![Tables](../../../../Images/Table32.png) [dbo].[tblPrioritizationQuestions]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Heap | YES |
| Row Count (~) | 59 |
| Created | 12:00:58 PM Wednesday, May 20, 2015 |
| Last Modified | 12:00:58 PM Wednesday, May 20, 2015 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|
| Section | nvarchar(50) | 100 | NULL allowed |
| QuestionName | nvarchar(10) | 20 | NULL allowed |
| QuestionText | nvarchar(2000) | 4000 | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblPrioritizationQuestions]
(
[Section] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QuestionName] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QuestionText] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewPrioritizationResponses]](../Views/dbo_viewPrioritizationResponses.md)
* [[dbo].[mtpfn_PrioritizationAnswers]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_PrioritizationAnswers.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

