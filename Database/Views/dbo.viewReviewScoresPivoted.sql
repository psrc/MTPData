SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
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
