SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[viewReviewSecondaryImpType]
AS	
SELECT s.AppGUID, i.*	
FROM tblReviewSecondaryImpType s
	join tblImproveType i on s.ImpTypeID = i.ImpTypeID
GO
