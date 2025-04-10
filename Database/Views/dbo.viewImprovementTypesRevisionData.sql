SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create view [dbo].[viewImprovementTypesRevisionData]
WITH SCHEMABINDING
as 
select rp.mtpid, rp.RevisionID, r.ImpTypeID, r.isPrimary 
from dbo.tblReviewProj_ImpType r
	join dbo.tblReviewProject rp ON r.APPGUID = rp.AppGUID
GO
