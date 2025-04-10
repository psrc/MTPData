SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[viewRevisionComment]
as
SELECT RecID, MTPID, NoteDate, Author, Note, RevisionID
FROM tblProjectLog 
WHERE LogType = 2
GO
