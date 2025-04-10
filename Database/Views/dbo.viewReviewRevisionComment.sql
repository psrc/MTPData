SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[viewReviewRevisionComment]
as
SELECT RecID, AppGUID, NoteDate, Author, Note, RevisionID
FROM tblReviewProjectLog 
WHERE LogType = 2
GO
