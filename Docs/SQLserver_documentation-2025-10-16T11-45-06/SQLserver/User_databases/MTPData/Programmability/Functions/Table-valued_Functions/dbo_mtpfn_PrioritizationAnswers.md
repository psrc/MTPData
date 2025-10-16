#### 

[Project](../../../../../../index.md) > [SQLserver](../../../../../index.md) > [User databases](../../../../index.md) > [MTPData](../../../index.md) > Programmability > Functions > [Table-valued Functions](Table-valued_Functions.md) > dbo.mtpfn_PrioritizationAnswers

# ![Table-valued Functions](../../../../../../Images/Function_Table32.png) [dbo].[mtpfn_PrioritizationAnswers]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |


---

## <a name="#parameters"></a>Parameters

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| @RevisionID | int | 4 |


---

## <a name="#sqlscript"></a>SQL Script

```sql

CREATE function [dbo].[mtpfn_PrioritizationAnswers](@RevisionID int)
returns table 
as return

select p.MTPID, p.Title, p.ProjDesc, q.Section, q.QuestionText, pri.QuestionName, pri.Response, v.QuestionValue,
	pri.Response * v.QuestionValue as PointsScored
from tblReviewProject p
	join tblReviewPrioritization pri on p.AppGUID = pri.AppGUID
	join tblPrioritizationQuestions q on pri.QuestionName = q.QuestionName
	left join tblPrioritizationVals v ON pri.QuestionName = v.QuestionName
	left join tblPrioritizationMeasures m ON v.MeasureID = m.ID
where p.RevisionID = @RevisionID


GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblPrioritizationMeasures]](../../../Tables/dbo_tblPrioritizationMeasures.md)
* [[dbo].[tblPrioritizationQuestions]](../../../Tables/dbo_tblPrioritizationQuestions.md)
* [[dbo].[tblPrioritizationVals]](../../../Tables/dbo_tblPrioritizationVals.md)
* [[dbo].[tblReviewPrioritization]](../../../Tables/dbo_tblReviewPrioritization.md)
* [[dbo].[tblReviewProject]](../../../Tables/dbo_tblReviewProject.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

