SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE view [dbo].[viewRevisionScoresBySectionAndProject]
as 
/*
    Calculates Plan Consistency Scores for each project in the review tables
    Returns one row per project per revision per Plan Consistency Measure (aka "section").
*/
    with scores_by_questiongroup as (
        select rp.AppGUID, proj.RevisionID, proj.MTPID, proj.Title, v.QuestionGroup, v.Section,
            max(rp.Response * v.QuestionValue) as MaxResponseVal
        from tblReviewProjScores rp
            join tblReviewProject proj on rp.AppGUID = proj.AppGUID
            join tblPrioritizationQuestions2025 v on rp.QuestionName = v.QuestionName
        --where proj.RevisionID = @RevisionID
        group by rp.AppGUID, proj.RevisionID, proj.MTPID, proj.Title, v.QuestionGroup, v.Section
    ), scores_by_project as (
        select s.AppGUID, s.RevisionID, s.MTPID, s.Title, s.Section, sum(MaxResponseVal) as Score 
        from scores_by_questiongroup s
        group by s.AppGUID, s.RevisionID, s.MTPID, s.Title, s.Section
    )
    select  *
    from scores_by_project
GO
