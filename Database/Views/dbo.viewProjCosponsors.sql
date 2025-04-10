SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[viewProjCosponsors]
AS
SELECT pc.MTPID, PC.AgencyNo, a.Place, a.PlaceShortName, a.AgencyType
FROM tblProjCosponsors pc
	JOIN tblAgency a ON pc.AgencyNo = a.AgencyNo
GO
