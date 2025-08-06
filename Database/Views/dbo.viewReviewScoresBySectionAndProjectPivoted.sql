SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create view [dbo].[viewReviewScoresBySectionAndProjectPivoted] 
as
select AppGUID, RevisionID, MTPID, 
        [Community Benefits],
        [Emissions],
        [Puget Sound Land and Water],
        [Safety & System Security],
        [Support for Centers],
        [Supporting Employment],
        [Supporting Freight Movement],
        [Transportation Alternatives],
        [Travel Reliability]
from 
(
    select AppGUID, RevisionID, MTPID, Section, Score
    from dbo.viewReviewScoresBySectionAndProject
) as qry 
pivot 
(
    max(Score)
    for Section in (
        [Community Benefits],
        [Emissions],
        [Puget Sound Land and Water],
        [Safety & System Security],
        [Support for Centers],
        [Supporting Employment],
        [Supporting Freight Movement],
        [Transportation Alternatives],
        [Travel Reliability]
    )
) as PivotTable
GO
