SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE view [dbo].[viewRevisionHistory]
as
select r.RevisionID, r.RevisionName, rp.MTPID, rp.DatePosted
from tblReviewProject rp
	join tblRevision r ON rp.RevisionID = r.RevisionID
	join (
		select distinct MTPID, RevisionID from tblRevisionSummary 
	) rs ON rp.MTPID = rs.MTPID and rp.RevisionID = rs.RevisionID
GO
