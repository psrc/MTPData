SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
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
