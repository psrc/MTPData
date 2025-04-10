SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


create function [dbo].[mtpfn_ReviewPrioritizationScores](@revisionID int)
returns table
as
return
select MTPID,  sum(MinResponseVal) as PScore
from (
	select rp.MTPID, v.QuestionGroup,
		max(rp.Response * v.QuestionValue) as MinResponseVal
	from tblReviewPrioritization rp
		join tblPrioritizationVals v on rp.QuestionName = v.QuestionName
	where rp.AppGUID in (select distinct appguid from tblReviewProject where RevisionID = @revisionID)
	group by rp.MTPID, v.QuestionGroup
) a 
group by MTPID
having sum(MinResponseVal) > 0
GO
