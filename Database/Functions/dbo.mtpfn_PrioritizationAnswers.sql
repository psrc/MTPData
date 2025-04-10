SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE function [dbo].[mtpfn_PrioritizationAnswers](@RevisionID int)
returns table 
as return

select p.MTPID, p.Title, p.ProjDesc, q.Section, q.QuestionText, pri.QuestionName, pri.Response, v.QuestionValue,
	pri.Response * v.QuestionValue as PointsScored
from tblReviewProject p
	join tblReviewPrioritization pri on p.AppGUID = pri.AppGUID
	join tblPrioritizationQuestions q on pri.QuestionName = q.QuestionName
	left join tblPrioritizationVals v ON pri.QuestionName = v.QuestionName
	left join tblPrioritizationMeasures m ON v.MeasureID = m.ID
where p.RevisionID = @RevisionID


GO
