SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE view [dbo].[viewRevisionScoresPivoted]
as 
/*
    Calculates Regional Transportation Plan Consistency scores for all projects in revisions.
    Returns one row per project per revision, with separate columns for each measure.  
    It also returns column "TotalScore" which is the sum of all the measure-specific scores for the project.
*/
    with section_scores as (
        select AppGUID, 
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
        from 
        (
            select ssp.AppGUID, ssp.MTPID, ssp.Section, ssp.Score 
            from viewRevisionScoresBySectionAndProject ssp 
        ) as qry 
        pivot 
        (
            max(Score) 
            for Section in ([Community Benefits], [Emissions], [Puget Sound Land and Water], [Safety & System Security], 
                            [Support for Centers], [Supporting Employment], [Supporting Freight Movement], [Transportation Alternatives], 
                            [Travel Reliability])
        ) as PivotTable
    )
    select s.RevisionID,  ss.*,  s.Score as TotalScore
    from section_scores ss 
        left join viewRevisionScoresByProject as s on ss.AppGUID = s.AppGUID
GO
