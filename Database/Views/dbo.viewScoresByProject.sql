SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[viewScoresByProject]
AS 
/*
    Calculates the total Regional Transportation Plan Consistency scores 
       for all projects in revision @RevisionID.
    Returns one row per project.  
*/
    WITH scores_by_questiongroup AS (
        SELECT proj.MTPID, proj.Title, v.QuestionGroup,
            MAX(rp.Response * v.QuestionValue) AS MaxResponseVal
        FROM tblProjScores rp
            JOIN tblProject proj ON rp.MTPID = proj.MTPID
            JOIN tblPrioritizationQuestions2025 v ON rp.QuestionName = v.QuestionName
        -- where proj.RevisionID = @RevisionID
        GROUP BY proj.MTPID, proj.Title, v.QuestionGroup
    ), scores_by_project AS (
        SELECT s.MTPID, s.Title, SUM(MaxResponseVal) AS Score 
        FROM scores_by_questiongroup s
            --join projects p on s.AppGUID = p.AppGUID
        GROUP BY s.MTPID, s.Title
    )
    SELECT *
    FROM scores_by_project
GO
