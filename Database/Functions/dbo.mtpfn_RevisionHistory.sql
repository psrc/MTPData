SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE function [dbo].[mtpfn_RevisionHistory] (@MTPID as int)
returns table
as 
RETURN
	SELECT rp.RevisionID, r.RevisionName
	FROM tblReviewProject rp
		join tblRevision r ON rp.RevisionID = r.RevisionID
	where rp.MTPID = @MTPID
		and r.Posted = 1
		and rp.Edit = 1
GO
