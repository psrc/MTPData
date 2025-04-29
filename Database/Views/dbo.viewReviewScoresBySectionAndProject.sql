SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[viewReviewScoresBySectionAndProject]
AS 
/*
    Calculates Plan Consistency Scores for each project in the review tables
    Returns one row per project per revision per Plan Consistency Measure (aka "section").
*/
    WITH scores_by_questiongroup AS (
        SELECT rp.AppGUID, proj.RevisionID, proj.MTPID, proj.Title, v.QuestionGroup, v.Section,
            MAX(rp.Response * v.QuestionValue) AS MaxResponseVal
        FROM tblReviewProjScores rp
            JOIN tblReviewProject proj ON rp.AppGUID = proj.AppGUID
            JOIN tblPrioritizationQuestions2025 v ON rp.QuestionName = v.QuestionName
        --where proj.RevisionID = @RevisionID
        GROUP BY rp.AppGUID, proj.RevisionID, proj.MTPID, proj.Title, v.QuestionGroup, v.Section
    ), scores_by_project AS (
        SELECT s.AppGUID, s.RevisionID, s.MTPID, s.Title, s.Section, SUM(MaxResponseVal) AS Score 
        FROM scores_by_questiongroup s
        GROUP BY s.AppGUID, s.RevisionID, s.MTPID, s.Title, s.Section
    )
    SELECT  *
    FROM scores_by_project
GO
