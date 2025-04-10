SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[viewRevision]
AS
SELECT r.RevisionID, r.RevisionName,r.ExecBoardApprovalDate, 
	r.PolicyBoardApprovalDate,r.EditionID,
	r.Posted,   rt.RevisionTypeName
FROM tblRevision r	
	join tblRevisionType rt on r.RevisionTypeID = rt.RevisionTypeID
GO
