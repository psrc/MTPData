SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE function [dbo].[mtpfn_PrioritizationScoresByPostedProject]()
returns table 
as return

select MTPID,  sum(MinResponseVal) as Score
from (
	select rp.MTPID, v.QuestionGroup,
		max(rp.Response * v.QuestionValue) as MinResponseVal
	from tblPrioritization rp
		join tblPrioritizationVals v on rp.QuestionName = v.QuestionName
	group by rp.MTPID, v.QuestionGroup
) a 
where MTPID not in (select distinct MTPID from dbo.retrofitted_prioritization_score_20250128)
group by MTPID
having sum(MinResponseVal) > 0
UNION -- This second table lists some project-level scores that for some reason are missing in the normal table
select MTPID, Scores as Score
from dbo.retrofitted_prioritization_score_20250128
GO
