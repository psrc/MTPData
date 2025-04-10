SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[viewProjectsPending]
AS
SELECT distinct rp.MTPID
FROM tblReviewProject rp	
	JOIN tblRevision r ON rp.RevisionID = r.RevisionID
WHERE r.Posted = 0
GO
