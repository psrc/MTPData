SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [dbo].[viewSecondaryImpType]
AS
SELECT pit.MTPID, i.*	
FROM tblProj_SecondaryImptype pit
	join tblImproveType i on pit.ImpTypeID = i.ImpTypeID

GO
