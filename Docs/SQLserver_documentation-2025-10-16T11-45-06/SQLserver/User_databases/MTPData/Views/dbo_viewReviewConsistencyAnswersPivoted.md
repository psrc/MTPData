#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewReviewConsistencyAnswersPivoted

# ![Views](../../../../Images/View32.png) [dbo].[viewReviewConsistencyAnswersPivoted]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 1:38:47 PM Tuesday, May 6, 2025 |
| Last Modified | 9:43:59 AM Friday, May 9, 2025 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| AppGUID | uniqueidentifier | 16 |
| a1a | tinyint | 1 |
| a1b | tinyint | 1 |
| a2 | tinyint | 1 |
| a3 | tinyint | 1 |
| a4 | tinyint | 1 |
| c1a | tinyint | 1 |
| c1b | tinyint | 1 |
| c1c | tinyint | 1 |
| c2a | tinyint | 1 |
| c2b | tinyint | 1 |
| c3 | tinyint | 1 |
| e1a | tinyint | 1 |
| e1b | tinyint | 1 |
| e1c | tinyint | 1 |
| e2a | tinyint | 1 |
| e2b | tinyint | 1 |
| e2c | tinyint | 1 |
| f1 | tinyint | 1 |
| f2 | tinyint | 1 |
| f3a | tinyint | 1 |
| f3b | tinyint | 1 |
| f4 | tinyint | 1 |
| f5 | tinyint | 1 |
| j1a | tinyint | 1 |
| j1b | tinyint | 1 |
| j2 | tinyint | 1 |
| j3 | tinyint | 1 |
| m1 | tinyint | 1 |
| m2 | tinyint | 1 |
| m3 | tinyint | 1 |
| m4 | tinyint | 1 |
| s1a | tinyint | 1 |
| s1b | tinyint | 1 |
| s1c | tinyint | 1 |
| s2 | tinyint | 1 |
| t1 | tinyint | 1 |
| t2 | tinyint | 1 |
| t3 | tinyint | 1 |
| w1a | tinyint | 1 |
| w1b | tinyint | 1 |
| w1c | tinyint | 1 |
| w2 | tinyint | 1 |
| w3 | tinyint | 1 |
| w4a | tinyint | 1 |
| w4b | tinyint | 1 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE view [dbo].[viewReviewConsistencyAnswersPivoted]
as 
    SELECT AppGUID, 
        [a1a], [a1b], [a2], [a3], [a4], [c1a], [c1b], [c1c], [c2a], [c2b],
        [c3], [e1a], [e1b], [e1c], [e2a], [e2b], [e2c], [f1], [f2], [f3a],
        [f3b], [f4], [f5], [j1a], [j1b], [j2], [j3], [m1], [m2], [m3],
        [m4], [s1a], [s1b], [s1c], [s2], [t1], [t2], [t3], [w1a], [w1b],
        [w1c], [w2], [w3], [w4a], [w4b]
    FROM 
    (
        select AppGUID, ps.QuestionName, ps.Response
        from dbo.tblReviewProjScores  ps 
    ) as qry
    PIVOT 
    (
        MAX(Response) 
        FOR QuestionName IN (
            [a1a], [a1b], [a2], [a3], [a4], [c1a], [c1b], [c1c], [c2a], [c2b], 
            [c3], [e1a], [e1b], [e1c], [e2a], [e2b], [e2c], [f1], [f2], [f3a], 
            [f3b], [f4], [f5], [j1a], [j1b], [j2], [j3], [m1], [m2], [m3], 
            [m4], [s1a], [s1b], [s1c], [s2], [t1], [t2], [t3], [w1a], [w1b], 
            [w1c], [w2], [w3], [w4a], [w4b]
        )
    ) AS PivotTable
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblReviewProjScores]](../Tables/dbo_tblReviewProjScores.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

