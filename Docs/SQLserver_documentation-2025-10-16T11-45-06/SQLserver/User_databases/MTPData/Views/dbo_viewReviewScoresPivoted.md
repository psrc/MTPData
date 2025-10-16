#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewReviewScoresPivoted

# ![Views](../../../../Images/View32.png) [dbo].[viewReviewScoresPivoted]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 9:30:49 AM Tuesday, April 29, 2025 |
| Last Modified | 9:30:49 AM Tuesday, April 29, 2025 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| RevisionID | int | 4 |
| AppGUID | uniqueidentifier | 16 |
| MTPID | int | 4 |
| Supporting Freight Movement | int | 4 |
| Supporting Employment | int | 4 |
| Emissions | int | 4 |
| Puget Sound Land and Water | int | 4 |
| Transportation Alternatives | int | 4 |
| Travel Reliability | int | 4 |
| Support for Centers | int | 4 |
| Safety & System Security | int | 4 |
| Community Benefits | int | 4 |
| TotalScore | int | 4 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE VIEW [dbo].[viewReviewScoresPivoted]
AS 
/*
    Calculates Regional Transportation Plan Consistency scores for all projects in revisions.
    Returns one row per project per revision, with separate columns for each measure.  
    It also returns column "TotalScore" which is the sum of all the measure-specific scores for the project.
*/
    WITH section_scores AS (
        SELECT AppGUID, 
            MTPID, 
            [Supporting Freight Movement], 
            [Supporting Employment], 
            [Emissions], 
            [Puget Sound Land and Water], 
            [Transportation Alternatives], 
            [Travel Reliability],
            [Support for Centers], 
            [Safety & System Security], 
            [Community Benefits] 
        FROM 
        (
            SELECT ssp.AppGUID, ssp.MTPID, ssp.Section, ssp.Score 
            FROM viewReviewScoresBySectionAndProject ssp 
        ) AS qry 
        PIVOT 
        (
            MAX(Score) 
            FOR Section IN ([Community Benefits], [Emissions], [Puget Sound Land and Water], [Safety & System Security], 
                            [Support for Centers], [Supporting Employment], [Supporting Freight Movement], [Transportation Alternatives], 
                            [Travel Reliability])
        ) AS PivotTable
    )
    SELECT s.RevisionID,  ss.*,  s.Score AS TotalScore
    FROM section_scores ss 
        LEFT JOIN viewReviewScoresByProject AS s ON ss.AppGUID = s.AppGUID
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[viewReviewScoresByProject]](dbo_viewReviewScoresByProject.md)
* [[dbo].[viewReviewScoresBySectionAndProject]](dbo_viewReviewScoresBySectionAndProject.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[mtpfn_ReviewProjects]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_ReviewProjects.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

