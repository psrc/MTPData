SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [stg].[merge_scores]
as
/*
    Merge consistency scores from stg.scores into tblReviewProjScores.
    Inserts them if the AppGUID-QuestionName combination doesn't exist 
        in the destination table, otherwise does nothing.
*/
;with cte as (
    select s.AppGUID, s.MTPID, q.QuestionName, s.Response
    from stg.scores s 
        join tblPrioritizationQuestions2025 q on s.WebappsID = q.WebappsID
)
merge tblReviewProjScores as target 
using cte as source on source.AppGUID = target.AppGUID
    and source.QuestionName = target.QuestionName
when not matched then insert (AppGUID, MTPID, QuestionName, Response)
values (Source.AppGUID, source.MTPID, source.QuestionName, source.Response);
GO
