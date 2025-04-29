SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[viewReviewScoresByProject]
AS 
/*
    Calculates the total Regional Transportation Plan Consistency scores 
       for all projects in revision @RevisionID.
    Returns one row per project.  
*/
    WITH scores_by_questiongroup AS (
        SELECT rp.AppGUID, proj.RevisionID, proj.MTPID, proj.Title, v.QuestionGroup,
            MAX(rp.Response * v.QuestionValue) AS MaxResponseVal
        FROM tblReviewProjScores rp
            JOIN tblReviewProject proj ON rp.AppGUID = proj.AppGUID
            JOIN tblPrioritizationQuestions2025 v ON rp.QuestionName = v.QuestionName
        -- where proj.RevisionID = @RevisionID
        GROUP BY rp.AppGUID, proj.RevisionID, proj.MTPID, proj.Title, v.QuestionGroup
    ), scores_by_project AS (
        SELECT s.AppGUID, s.RevisionID, s.MTPID, s.Title, SUM(MaxResponseVal) AS Score 
        FROM scores_by_questiongroup s
            --join projects p on s.AppGUID = p.AppGUID
        GROUP BY s.AppGUID, s.RevisionID, s.MTPID, s.Title
        --having sum(MaxResponseVal) > 0
    )
    SELECT *
    FROM scores_by_project
GO
