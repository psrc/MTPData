SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create function [dbo].[mtpfn_PrioritizationScoresByMeasure](@RevisionID int)
returns table 
as return


select MTPID,  Measure, sum(MinResponseVal) as Score
from (
	select rp.MTPID, m.Name as Measure, m.MeasureOrder, v.QuestionGroup,
		max(rp.Response * v.QuestionValue) as MinResponseVal
	from tblReviewPrioritization rp
		join tblPrioritizationVals v on rp.QuestionName = v.QuestionName
		join tblPrioritizationMeasures m on v.MeasureID = m.[ID]
	where rp.AppGUID in (select distinct appguid from tblReviewProject where RevisionID = @RevisionID)
	group by rp.MTPID, m.[Name], m.MeasureOrder, v.QuestionGroup
) a 
where a.MTPID in (
	select MTPID
	from (
		select rp.MTPID, v.QuestionGroup,
			max(rp.Response * v.QuestionValue) as MinResponseVal
		from tblReviewPrioritization rp
			join tblPrioritizationVals v on rp.QuestionName = v.QuestionName
		group by rp.MTPID, v.QuestionGroup
	) a 
	group by MTPID
	having sum(MinResponseVal) > 0
)
group by MTPID, Measure, MeasureOrder
GO
