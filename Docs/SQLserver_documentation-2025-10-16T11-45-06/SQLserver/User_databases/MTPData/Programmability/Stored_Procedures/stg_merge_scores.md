#### 

[Project](../../../../../index.md) > [SQLserver](../../../../index.md) > [User databases](../../../index.md) > [MTPData](../../index.md) > Programmability > [Stored Procedures](Stored_Procedures.md) > stg.merge_scores

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [stg].[merge_scores]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE procedure [stg].[merge_scores]
as
/*
    Merge consistency scores from stg.scores into tblReviewProjScores.
    Inserts them if the AppGUID-QuestionName combination doesn't exist 
        in the destination table, otherwise does nothing.
*/
;with cte as (
    select s.AppGUID, s.MTPID, q.QuestionName, s.Response
    from stg.scores s 
        join tblPrioritizationQuestions2025 q on s.WebappsID = q.WebappsID
)
merge tblReviewProjScores as target 
using cte as source on source.AppGUID = target.AppGUID
    and source.QuestionName = target.QuestionName
when not matched then insert (AppGUID, MTPID, QuestionName, Response)
values (Source.AppGUID, source.MTPID, source.QuestionName, source.Response);
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblPrioritizationQuestions2025]](../../Tables/dbo_tblPrioritizationQuestions2025.md)
* [[dbo].[tblReviewProjScores]](../../Tables/dbo_tblReviewProjScores.md)
* [[stg].[scores]](../../Tables/stg_scores.md)
* [stg](../../Security/Schemas/dbo_stg.md)


---

## <a name="#usedby"></a>Used By

* [[stg].[stage_to_revision]](stg_stage_to_revision.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

