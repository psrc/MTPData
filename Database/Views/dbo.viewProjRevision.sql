SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE view [dbo].[viewProjRevision]
as
SELECT DISTINCT MTPID,  r.RevisionName, r.RevisionID
from tblReviewProject rp
	JOIN tblRevision r on rp.RevisionID = r.RevisionID
where r.Posted = 0
GO
