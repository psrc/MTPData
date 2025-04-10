SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [dbo].[viewProject]
as
SELECT p.MTPID, a.PlaceShortName as Sponsor, i.ImpTypeName as PrimaryImpType, p.Title,p.ProjDesc,
	p.TotProjCost,
	p.ContactName, p.ContactPhone, p.ContactEmail,
	p.EstCostYear, p.CompletionYear, m.StatusName as MTP_STatus,
	p.ProjectOn, p.ProjectFrom, p.ProjectTo,
	p.MilePostFrom, p.MilePostTo, p.CountyID, c.CountyName,
	p.StateRouteID, s.SRShortName,  p.FuncClassID, f.FCName,
	p.StartYear, p.WebLinks
FROM tblProject p
	LEFT JOIN tblAgency a ON p.Agency = a.AgencyNo
	LEFT JOIN tblMTPStatus m ON p.MTPStatus = m.MTPStatusID
	LEFT JOIN tblCounty c ON p.CountyID = c.CountyID
	LEFT JOIN tblStateRoute s ON p.StateRouteID = s.SRID
	LEFT JOIN tblFuncClass f on p.FuncClassID = f.FuncClassID
	LEFT JOIN tblImproveType i ON p.PrimaryImpType = i.ImpTypeID


GO
