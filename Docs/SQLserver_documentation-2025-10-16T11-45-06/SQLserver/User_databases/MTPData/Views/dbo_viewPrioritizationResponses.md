#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewPrioritizationResponses

# ![Views](../../../../Images/View32.png) [dbo].[viewPrioritizationResponses]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 12:50:30 PM Wednesday, May 20, 2015 |
| Last Modified | 12:58:37 PM Wednesday, May 20, 2015 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| MTPID | int | 4 |
| Measure | nvarchar(50) | 100 |
| QuestionValue | int | 4 |
| QuestionGroup | int | 4 |
| QuestionName | nvarchar(10) | 20 |
| Response | tinyint | 1 |
| QuestionText | nvarchar(2000) | 4000 |


---

## <a name="#sqlscript"></a>SQL Script

```sql

CREATE view [dbo].[viewPrioritizationResponses]
as
/*
Returns responses to prioritization questions for all projects
that answered the prioritization questions.  Ignores the rest. 
*/
select rp.MTPID, 
	q.section as Measure,
	v.QuestionValue,
	v.QuestionGroup,
	q.QuestionName,
	rp.Response, 
	q.QuestionText
from tblReviewPrioritization rp
	join tblPrioritizationVals v on rp.QuestionName = v.QuestionName
	join tblPrioritizationQuestions q ON rp.QuestionName = q.QuestionName
where rp.AppGUID in (
	select rp.AppGUID from tblReviewPrioritization rp
	group by rp.AppGUID having sum(rp.Response) > 0
)
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblPrioritizationQuestions]](../Tables/dbo_tblPrioritizationQuestions.md)
* [[dbo].[tblPrioritizationVals]](../Tables/dbo_tblPrioritizationVals.md)
* [[dbo].[tblReviewPrioritization]](../Tables/dbo_tblReviewPrioritization.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

