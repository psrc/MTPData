SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE function [dbo].[mtpfn_PrioritizationScoresByProject](@RevisionID int)
returns table 
as return

with scores_by_questiongroup as (
	select rp.MTPID, v.QuestionGroup,
		max(rp.Response * v.QuestionValue) as MinResponseVal
	from tblReviewPrioritization rp
		join tblPrioritizationVals v on rp.QuestionName = v.QuestionName
	where rp.AppGUID in (select distinct appguid from tblReviewProject where RevisionID = @RevisionID)
	group by rp.MTPID, v.QuestionGroup
), scores_by_project as (
    select MTPID, sum(MinResponseVal) as Score 
    from scores_by_questiongroup
    group by MTPID 
    having sum(MinResponseVal) > 0
)
select *
from scores_by_project
where mtpid not in (select distinct MTPID from dbo.retrofitted_prioritization_score_20250128)
UNION -- This second table lists some project-level scores that for some reason are missing in the normal table
select MTPID, Scores as Score
from dbo.retrofitted_prioritization_score_20250128

GO
