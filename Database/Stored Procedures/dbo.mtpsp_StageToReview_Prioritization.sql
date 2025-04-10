SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[mtpsp_StageToReview_Prioritization] 
as
INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'a1a', b.a1a
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'a1b', b.a1b
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'a2a', b.a2a
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'a2b', b.a2b
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'a3', b.a3
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'a4', b.a4
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'c1a', b.c1a
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'c1b', b.c1b
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'c1c', b.c1c
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'c2a', b.c2a
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'c2b', b.c2b
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'c3', b.c3
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'c4', b.c4
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'c5', b.c5
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'f1', b.f1
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'f2', b.f2
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'f3', b.f3
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'f4a', b.f4a
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'f4b', b.f4b
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'f5', b.f5
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'f6', b.f6
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'j1a', b.j1a
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'j1b', b.j1b
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'j2', b.j2
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'j3', b.j3
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'j4', b.j4
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'm1', b.m1
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'm2', b.m2
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'm3', b.m3
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'm3a', b.m3a
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'm3b', b.m3b
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'm4', b.m4
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'm5', b.m5
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'm6', b.m6
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'm7', b.m7
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'm7a', b.m7a
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'm7b', b.m7b
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'o1', b.o1
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'o2a', b.o2a
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'o2b', b.o2b
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'o2c', b.o2c
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'o3a', b.o3a
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'o3b', b.o3b
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'o3c', b.o3c
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 's1a', b.s1a
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 's1b', b.s1b
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 's1c', b.s1c
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 's2', b.s2
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 't1', b.t1
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 't2', b.t2
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 't3', b.t3
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 't4', b.t4
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'w1a', b.w1a
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'w1b', b.w1b
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'w1c', b.w1c
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'w1d', b.w1d
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'w2', b.w2
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'w4a', b.w4a
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT a.AppGUID, a.MTPID, 'w4b', b.w4b
FROM tblStageProject a join tblStagePrioritization b ON a.MTPID = b.MTPID

GO
GRANT EXECUTE ON  [dbo].[mtpsp_StageToReview_Prioritization] TO [db_spExecutor]
GO
