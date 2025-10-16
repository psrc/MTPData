#### 

[Project](../../../../../../index.md) > [SQLserver](../../../../../index.md) > [User databases](../../../../index.md) > [MTPData](../../../index.md) > Programmability > Functions > [Table-valued Functions](Table-valued_Functions.md) > dbo.mtpfn_PrioritizationScoresByPostedProject

# ![Table-valued Functions](../../../../../../Images/Function_Table32.png) [dbo].[mtpfn_PrioritizationScoresByPostedProject]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE function [dbo].[mtpfn_PrioritizationScoresByPostedProject]()
returns table 
as return

select MTPID,  sum(MinResponseVal) as Score
from (
	select rp.MTPID, v.QuestionGroup,
		max(rp.Response * v.QuestionValue) as MinResponseVal
	from tblPrioritization rp
		join tblPrioritizationVals v on rp.QuestionName = v.QuestionName
	group by rp.MTPID, v.QuestionGroup
) a 
where MTPID not in (select distinct MTPID from dbo.retrofitted_prioritization_score_20250128)
group by MTPID
having sum(MinResponseVal) > 0
UNION -- This second table lists some project-level scores that for some reason are missing in the normal table
select MTPID, Scores as Score
from dbo.retrofitted_prioritization_score_20250128
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[retrofitted_prioritization_score_20250128]](../../../Tables/dbo_retrofitted_prioritization_score_20250128.md)
* [[dbo].[tblPrioritization]](../../../Tables/dbo_tblPrioritization.md)
* [[dbo].[tblPrioritizationVals]](../../../Tables/dbo_tblPrioritizationVals.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[mtpfn_currentProjects]](dbo_mtpfn_currentProjects.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

