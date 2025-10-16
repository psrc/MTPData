#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewScoresByProject

# ![Views](../../../../Images/View32.png) [dbo].[viewScoresByProject]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 11:00:54 AM Friday, May 23, 2025 |
| Last Modified | 11:00:54 AM Friday, May 23, 2025 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| MTPID | int | 4 |
| Title | nvarchar(1000) | 2000 |
| Score | int | 4 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE VIEW [dbo].[viewScoresByProject]
AS 
/*
    Calculates the total Regional Transportation Plan Consistency scores 
       for all projects in revision @RevisionID.
    Returns one row per project.  
*/
    WITH scores_by_questiongroup AS (
        SELECT proj.MTPID, proj.Title, v.QuestionGroup,
            MAX(rp.Response * v.QuestionValue) AS MaxResponseVal
        FROM tblProjScores rp
            JOIN tblProject proj ON rp.MTPID = proj.MTPID
            JOIN tblPrioritizationQuestions2025 v ON rp.QuestionName = v.QuestionName
        -- where proj.RevisionID = @RevisionID
        GROUP BY proj.MTPID, proj.Title, v.QuestionGroup
    ), scores_by_project AS (
        SELECT s.MTPID, s.Title, SUM(MaxResponseVal) AS Score 
        FROM scores_by_questiongroup s
            --join projects p on s.AppGUID = p.AppGUID
        GROUP BY s.MTPID, s.Title
    )
    SELECT *
    FROM scores_by_project
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblPrioritizationQuestions2025]](../Tables/dbo_tblPrioritizationQuestions2025.md)
* [[dbo].[tblProject]](../Tables/dbo_tblProject.md)
* [[dbo].[tblProjScores]](../Tables/dbo_tblProjScores.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[mtpfn_currentProjects]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_currentProjects.md)
* [[dbo].[mtpfn_predictProject]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_predictProject.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

