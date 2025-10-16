#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewScoresBySectionAndProject

# ![Views](../../../../Images/View32.png) [dbo].[viewScoresBySectionAndProject]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 10:29:24 AM Friday, May 23, 2025 |
| Last Modified | 10:29:24 AM Friday, May 23, 2025 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| MTPID | int | 4 |
| Title | nvarchar(1000) | 2000 |
| Section | nvarchar(50) | 100 |
| Score | int | 4 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
create view [dbo].[viewScoresBySectionAndProject] 
as
    WITH scores_by_questiongroup AS (
        SELECT rp.MTPID, proj.Title, v.QuestionGroup, v.Section,
            MAX(rp.Response * v.QuestionValue) AS MaxResponseVal
        FROM tblProjScores rp
            JOIN tblProject proj ON rp.MTPID = proj.MTPID
            JOIN tblPrioritizationQuestions2025 v ON rp.QuestionName = v.QuestionName
        --where proj.RevisionID = @RevisionID
        GROUP BY rp.MTPID,  proj.Title, v.QuestionGroup, v.Section
    ), scores_by_project AS (
        SELECT  s.MTPID, s.Title, s.Section, SUM(MaxResponseVal) AS Score 
        FROM scores_by_questiongroup s
        GROUP BY  s.MTPID, s.Title, s.Section
    )
    SELECT  *
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

* [[dbo].[viewScoresBySectionAndProjectPivoted]](dbo_viewScoresBySectionAndProjectPivoted.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

