SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create PROCEDURE [dbo].[mtpsp_StageToReviewProjEdition]
as

INSERT INTO tblReviewProjEdition(AppGUID, EditionID)
SELECT P.AppGUID, a.EditionID
FROM tblProjEdition a
	join tblStageProject p ON a.MTPID = P.MTPID


GO
GRANT EXECUTE ON  [dbo].[mtpsp_StageToReviewProjEdition] TO [db_spExecutor]
GO
