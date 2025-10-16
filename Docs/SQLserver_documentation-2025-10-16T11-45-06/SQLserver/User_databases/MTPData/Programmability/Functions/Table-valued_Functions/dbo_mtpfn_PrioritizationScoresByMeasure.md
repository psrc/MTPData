#### 

[Project](../../../../../../index.md) > [SQLserver](../../../../../index.md) > [User databases](../../../../index.md) > [MTPData](../../../index.md) > Programmability > Functions > [Table-valued Functions](Table-valued_Functions.md) > dbo.mtpfn_PrioritizationScoresByMeasure

# ![Table-valued Functions](../../../../../../Images/Function_Table32.png) [dbo].[mtpfn_PrioritizationScoresByMeasure]

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
create function [dbo].[mtpfn_PrioritizationScoresByMeasure](@RevisionID int)
returns table 
as return


select MTPID,  Measure, sum(MinResponseVal) as Score
from (
	select rp.MTPID, m.Name as Measure, m.MeasureOrder, v.QuestionGroup,
		max(rp.Response * v.QuestionValue) as MinResponseVal
	from tblReviewPrioritization rp
		join tblPrioritizationVals v on rp.QuestionName = v.QuestionName
		join tblPrioritizationMeasures m on v.MeasureID = m.[ID]
	where rp.AppGUID in (select distinct appguid from tblReviewProject where RevisionID = @RevisionID)
	group by rp.MTPID, m.[Name], m.MeasureOrder, v.QuestionGroup
) a 
where a.MTPID in (
	select MTPID
	from (
		select rp.MTPID, v.QuestionGroup,
			max(rp.Response * v.QuestionValue) as MinResponseVal
		from tblReviewPrioritization rp
			join tblPrioritizationVals v on rp.QuestionName = v.QuestionName
		group by rp.MTPID, v.QuestionGroup
	) a 
	group by MTPID
	having sum(MinResponseVal) > 0
)
group by MTPID, Measure, MeasureOrder
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblPrioritizationMeasures]](../../../Tables/dbo_tblPrioritizationMeasures.md)
* [[dbo].[tblPrioritizationVals]](../../../Tables/dbo_tblPrioritizationVals.md)
* [[dbo].[tblReviewPrioritization]](../../../Tables/dbo_tblReviewPrioritization.md)
* [[dbo].[tblReviewProject]](../../../Tables/dbo_tblReviewProject.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

