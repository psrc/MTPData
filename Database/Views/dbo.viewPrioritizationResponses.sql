SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE view [dbo].[viewPrioritizationResponses]
as
/*
Returns responses to prioritization questions for all projects
that answered the prioritization questions.  Ignores the rest. 
*/
select rp.MTPID, 
	q.section as Measure,
	v.QuestionValue,
	v.QuestionGroup,
	q.QuestionName,
	rp.Response, 
	q.QuestionText
from tblReviewPrioritization rp
	join tblPrioritizationVals v on rp.QuestionName = v.QuestionName
	join tblPrioritizationQuestions q ON rp.QuestionName = q.QuestionName
where rp.AppGUID in (
	select rp.AppGUID from tblReviewPrioritization rp
	group by rp.AppGUID having sum(rp.Response) > 0
)
GO
