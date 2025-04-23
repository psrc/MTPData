SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE function [dbo].[mtpfn_RevisionScoresBySectionAndProject](@RevisionID int)
returns table 
as 
/*
    Calculates Plan Consistency Scores for each project in revision @RevisionID.  
    Returns one row per project per Plan Consistency Measure (aka "section").
*/
return (
    with scores_by_questiongroup as (
        select rp.AppGUID, proj.MTPID, proj.Title, v.QuestionGroup, v.Section,
            max(rp.Response * v.QuestionValue) as MaxResponseVal
        from tblReviewProjScores rp
            join tblReviewProject proj on rp.AppGUID = proj.AppGUID
            join tblPrioritizationQuestions2025 v on rp.QuestionName = v.QuestionName
        where proj.RevisionID = @RevisionID
        group by rp.AppGUID, proj.MTPID, proj.Title, v.QuestionGroup, v.Section
    ), scores_by_project as (
        select s.AppGUID, s.MTPID, s.Title, s.Section, sum(MaxResponseVal) as Score 
        from scores_by_questiongroup s
        group by s.AppGUID, s.MTPID, s.Title, s.Section
    )
    select  *
    from scores_by_project
);
GO
