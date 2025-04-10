SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE view [dbo].[viewProjectLog] 
as
select l.RecID, l.MTPID, l.NoteDate, l.Author, l.Note,
	r.RevisionName
from tblProjectLog l
	left join tblRevision r ON l.RevisionID = r.RevisionID
WHERE l.LogType = 1 -- log type = "log entry"
GO
