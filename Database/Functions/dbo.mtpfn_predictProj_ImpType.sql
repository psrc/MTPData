SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE function [dbo].[mtpfn_predictProj_ImpType](@RevisionID int)
RETURNS TABLE
AS 
RETURN

select *
from tblProj_ImpType 
where MTPID NOT IN (select distinct MTPID from tblReviewProject where RevisionID = @RevisionID)
UNION
SELECT a.MTPID, b.isPrimary, b.ImpTypeID
FROM tblReviewProject a
	JOIN tblReviewProj_ImpType b on a.AppGUID = b.APPGUID
where a.RevisionID = @RevisionID
GO
