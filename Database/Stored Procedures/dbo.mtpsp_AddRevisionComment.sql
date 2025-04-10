SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[mtpsp_AddRevisionComment] (
	@AppGUID uniqueidentifier, 
	@Note nvarchar(4000)
)
as
DECLARE @LogType TINYINT
DECLARE @RevisionID INT

SELECT @LogType = 2 -- 2 for revision comments, i.e. not project log

SELECT @RevisionID = RevisionID
FROM tblReviewProject
WHERE AppGUID = @AppGUID

INSERT INTO  tblReviewProjectLog( AppGUID, NoteDate,  Note, RevisionID, LogType )
VALUES ( @AppGUID, getdate(), @Note, @RevisionID, @LogType)
GO
GRANT EXECUTE ON  [dbo].[mtpsp_AddRevisionComment] TO [db_spExecutor]
GO
