#### 

[Project](../../../../../../index.md) > [SQLserver](../../../../../index.md) > [User databases](../../../../index.md) > [MTPData](../../../index.md) > Programmability > Functions > [Table-valued Functions](Table-valued_Functions.md) > dbo.mtpfn_PrioritizationScoresByProject

# ![Table-valued Functions](../../../../../../Images/Function_Table32.png) [dbo].[mtpfn_PrioritizationScoresByProject]

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
CREATE function [dbo].[mtpfn_PrioritizationScoresByProject](@RevisionID int)
returns table 
as return

with scores_by_questiongroup as (
	select rp.MTPID, v.QuestionGroup,
		max(rp.Response * v.QuestionValue) as MinResponseVal
	from tblReviewPrioritization rp
		join tblPrioritizationVals v on rp.QuestionName = v.QuestionName
	where rp.AppGUID in (select distinct appguid from tblReviewProject where RevisionID = @RevisionID)
	group by rp.MTPID, v.QuestionGroup
), scores_by_project as (
    select MTPID, sum(MinResponseVal) as Score 
    from scores_by_questiongroup
    group by MTPID 
    having sum(MinResponseVal) > 0
)
select *
from scores_by_project
where mtpid not in (select distinct MTPID from dbo.retrofitted_prioritization_score_20250128)
UNION -- This second table lists some project-level scores that for some reason are missing in the normal table
select MTPID, Scores as Score
from dbo.retrofitted_prioritization_score_20250128

GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[retrofitted_prioritization_score_20250128]](../../../Tables/dbo_retrofitted_prioritization_score_20250128.md)
* [[dbo].[tblPrioritizationVals]](../../../Tables/dbo_tblPrioritizationVals.md)
* [[dbo].[tblReviewPrioritization]](../../../Tables/dbo_tblReviewPrioritization.md)
* [[dbo].[tblReviewProject]](../../../Tables/dbo_tblReviewProject.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[mtpfn_predictProject]](dbo_mtpfn_predictProject.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

