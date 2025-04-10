SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[mtpfn_currentProjects](@EditionID as int)
RETURNS TABLE 
AS
RETURN
SELECT '' as [RevisionName],
	null as AppGUID,
	null as revisionID,
	p.MTPID,
	p.Title,
	a.Place as Sponsor,
	a.PlaceShortName as SponsorShortName,
	p.ProjDesc,
	p.ProjectOn,
	p.ProjectFrom,
	p.ProjectTo,
	c.CountyName,
	i.ImpTypeName as PrimaryImpType,
	p.StartYear,
	p.CompletionYear,
	m.StatusName as MTPStatus,
	f.FCName,
	dbo.mtpfn_ScaleProjCost(p.EstCostYear, 
		cy.CostYear,
		cy.factor_set,
		p.TotProjCost) as ScaledCost,
	m.DisplayOrder, 
    ps.Score
from tblProject p
	join tblProjEdition pe ON p.MTPID = pe.MTPID
	LEFT JOIN tblAgency a ON p.Agency = a.AgencyNo
	LEFT JOIN tblMTPStatus m ON p.MTPStatus = m.MTPStatusID
	LEFT JOIN tblCounty c ON p.CountyID = c.CountyID
	LEFT JOIN tblFuncClass f on p.FuncClassID = f.FuncClassID
	LEFT JOIN tblImproveType i ON p.PrimaryImpType = i.ImpTypeID
	JOIN ( SELECT CostYear, factor_set from tblEdition where EditionID = @EditionID) cy on 1=1
    left join mtpfn_PrioritizationScoresByPostedProject() ps on p.MTPID = ps.mtpid
where pe.EditionID = @EditionID
	and p.MTPStatus not in ( -1, -3) -- status <> "Not in MTP" or "Cancelled"


GO
