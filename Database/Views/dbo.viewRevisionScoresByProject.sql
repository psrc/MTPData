SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE view [dbo].[viewRevisionScoresByProject]
as 
/*
    Calculates the total Regional Transportation Plan Consistency scores 
       for all projects in revision @RevisionID.
    Returns one row per project.  
*/
    with scores_by_questiongroup as (
        select rp.AppGUID, proj.RevisionID, proj.MTPID, proj.Title, v.QuestionGroup,
            max(rp.Response * v.QuestionValue) as MaxResponseVal
        from tblReviewProjScores rp
            join tblReviewProject proj on rp.AppGUID = proj.AppGUID
            join tblPrioritizationQuestions2025 v on rp.QuestionName = v.QuestionName
        -- where proj.RevisionID = @RevisionID
        group by rp.AppGUID, proj.RevisionID, proj.MTPID, proj.Title, v.QuestionGroup
    ), scores_by_project as (
        select s.AppGUID, s.RevisionID, s.MTPID, s.Title, sum(MaxResponseVal) as Score 
        from scores_by_questiongroup s
            --join projects p on s.AppGUID = p.AppGUID
        group by s.AppGUID, s.RevisionID, s.MTPID, s.Title
        --having sum(MaxResponseVal) > 0
    )
    select *
    from scores_by_project
GO
