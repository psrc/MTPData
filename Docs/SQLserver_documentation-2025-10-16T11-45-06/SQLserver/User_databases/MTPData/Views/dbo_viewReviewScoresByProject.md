#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewReviewScoresByProject

# ![Views](../../../../Images/View32.png) [dbo].[viewReviewScoresByProject]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 9:27:26 AM Tuesday, April 29, 2025 |
| Last Modified | 9:27:26 AM Tuesday, April 29, 2025 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| AppGUID | uniqueidentifier | 16 |
| RevisionID | int | 4 |
| MTPID | int | 4 |
| Title | nvarchar(1000) | 2000 |
| Score | int | 4 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE VIEW [dbo].[viewReviewScoresByProject]
AS 
/*
    Calculates the total Regional Transportation Plan Consistency scores 
       for all projects in revision @RevisionID.
    Returns one row per project.  
*/
    WITH scores_by_questiongroup AS (
        SELECT rp.AppGUID, proj.RevisionID, proj.MTPID, proj.Title, v.QuestionGroup,
            MAX(rp.Response * v.QuestionValue) AS MaxResponseVal
        FROM tblReviewProjScores rp
            JOIN tblReviewProject proj ON rp.AppGUID = proj.AppGUID
            JOIN tblPrioritizationQuestions2025 v ON rp.QuestionName = v.QuestionName
        -- where proj.RevisionID = @RevisionID
        GROUP BY rp.AppGUID, proj.RevisionID, proj.MTPID, proj.Title, v.QuestionGroup
    ), scores_by_project AS (
        SELECT s.AppGUID, s.RevisionID, s.MTPID, s.Title, SUM(MaxResponseVal) AS Score 
        FROM scores_by_questiongroup s
            --join projects p on s.AppGUID = p.AppGUID
        GROUP BY s.AppGUID, s.RevisionID, s.MTPID, s.Title
        --having sum(MaxResponseVal) > 0
    )
    SELECT *
    FROM scores_by_project
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblPrioritizationQuestions2025]](../Tables/dbo_tblPrioritizationQuestions2025.md)
* [[dbo].[tblReviewProject]](../Tables/dbo_tblReviewProject.md)
* [[dbo].[tblReviewProjScores]](../Tables/dbo_tblReviewProjScores.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewReviewScoresPivoted]](dbo_viewReviewScoresPivoted.md)
* [[dbo].[mtpfn_predictProject]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_predictProject.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

