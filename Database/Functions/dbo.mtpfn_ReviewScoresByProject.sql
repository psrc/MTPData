SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create function [dbo].[mtpfn_ReviewScoresByProject](@RevisionID smallint)
returns table 
as 
return
with scores_by_questiongroup as (
	select s.AppGUID, v.QuestionGroup,
		max(s.Response * v.QuestionValue) as MaxResponseVal
	from tblReviewProjScores s
        join tblReviewProject rp on s.appguid = rp.AppGUID
		join tblPrioritizationQuestions2025 v on s.QuestionName = v.QuestionName
    where rp.RevisionID = @RevisionID
	group by s.AppGUID, v.QuestionGroup
), scores_by_project as (
    select p.MTPID, p.Title, sum(MaxResponseVal) as Score 
    from scores_by_questiongroup s
        join tblReviewProject p on s.AppGUID = p.AppGUID
    group by p.MTPID, p.Title
    --having sum(MaxResponseVal) > 0
)
select *
from scores_by_project
GO
