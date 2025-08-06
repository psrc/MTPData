SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create view [dbo].[viewScoresBySectionAndProject] 
as
    WITH scores_by_questiongroup AS (
        SELECT rp.MTPID, proj.Title, v.QuestionGroup, v.Section,
            MAX(rp.Response * v.QuestionValue) AS MaxResponseVal
        FROM tblProjScores rp
            JOIN tblProject proj ON rp.MTPID = proj.MTPID
            JOIN tblPrioritizationQuestions2025 v ON rp.QuestionName = v.QuestionName
        --where proj.RevisionID = @RevisionID
        GROUP BY rp.MTPID,  proj.Title, v.QuestionGroup, v.Section
    ), scores_by_project AS (
        SELECT  s.MTPID, s.Title, s.Section, SUM(MaxResponseVal) AS Score 
        FROM scores_by_questiongroup s
        GROUP BY  s.MTPID, s.Title, s.Section
    )
    SELECT  *
    FROM scores_by_project
GO
