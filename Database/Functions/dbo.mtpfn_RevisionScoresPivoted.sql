SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE function [dbo].[mtpfn_RevisionScoresPivoted](@RevisionID smallint)
returns table 
as 
return 
(
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
            from mtpfn_RevisionScoresBySectionAndProject(@RevisionID) ssp 
        ) as qry 
        pivot 
        (
            max(Score) 
            for Section in ([Community Benefits], [Emissions], [Puget Sound Land and Water], [Safety & System Security], 
                            [Support for Centers], [Supporting Employment], [Supporting Freight Movement], [Transportation Alternatives], 
                            [Travel Reliability])
        ) as PivotTable
    )
    select ss.*, s.Score as TotalScore
    from section_scores ss 
        join dbo.mtpfn_RevisionScoresByProject(@RevisionID) as s ON ss.AppGUID = s.AppGUID
)
GO
