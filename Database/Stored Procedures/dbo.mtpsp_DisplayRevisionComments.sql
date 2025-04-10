SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create PROCEDURE [dbo].[mtpsp_DisplayRevisionComments]
	@AppGUID uniqueidentifier

AS 

	DECLARE @LogType TINYINT

	SELECT @LogType = 2 -- 2 for revision comments, i.e. not project log


	SELECT *
	FROM tblReviewProjectLog
	WHERE AppGUID = @AppGUID
		and LogType = @LogType
	ORDER BY NoteDate desc
GO
GRANT EXECUTE ON  [dbo].[mtpsp_DisplayRevisionComments] TO [db_spExecutor]
GO
