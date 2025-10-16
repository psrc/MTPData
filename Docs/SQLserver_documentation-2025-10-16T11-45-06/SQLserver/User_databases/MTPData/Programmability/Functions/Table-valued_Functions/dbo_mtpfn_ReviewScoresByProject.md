#### 

[Project](../../../../../../index.md) > [SQLserver](../../../../../index.md) > [User databases](../../../../index.md) > [MTPData](../../../index.md) > Programmability > Functions > [Table-valued Functions](Table-valued_Functions.md) > dbo.mtpfn_ReviewScoresByProject

# ![Table-valued Functions](../../../../../../Images/Function_Table32.png) [dbo].[mtpfn_ReviewScoresByProject]

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
| @RevisionID | smallint | 2 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
create function [dbo].[mtpfn_ReviewScoresByProject](@RevisionID smallint)
returns table 
as 
return
with scores_by_questiongroup as (
	select s.AppGUID, v.QuestionGroup,
		max(s.Response * v.QuestionValue) as MaxResponseVal
	from tblReviewProjScores s
        join tblReviewProject rp on s.appguid = rp.AppGUID
		join tblPrioritizationQuestions2025 v on s.QuestionName = v.QuestionName
    where rp.RevisionID = @RevisionID
	group by s.AppGUID, v.QuestionGroup
), scores_by_project as (
    select p.MTPID, p.Title, sum(MaxResponseVal) as Score 
    from scores_by_questiongroup s
        join tblReviewProject p on s.AppGUID = p.AppGUID
    group by p.MTPID, p.Title
    --having sum(MaxResponseVal) > 0
)
select *
from scores_by_project
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblPrioritizationQuestions2025]](../../../Tables/dbo_tblPrioritizationQuestions2025.md)
* [[dbo].[tblReviewProject]](../../../Tables/dbo_tblReviewProject.md)
* [[dbo].[tblReviewProjScores]](../../../Tables/dbo_tblReviewProjScores.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

