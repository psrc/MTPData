SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create view [dbo].[viewScoresBySectionAndProjectPivoted] 
as
select  MTPID, 
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
    select  MTPID, Section, Score
    from dbo.viewScoresBySectionAndProject
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
