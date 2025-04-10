SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[viewReviewProjectsArchive]
as
SELECT p.appGUID, p.RevisionID, r.RevisionName as Revision, p.MTPID, a.PlaceShortName as Sponsor, i.ImpTypeName as PrimaryImpType, p.Title,p.ProjDesc,
	p.TotProjCost, p.ContactName, p.ContactPhone, p.ContactEmail, 
	p.EstCostYear, p.CompletionYear, m.StatusName, p.MTPStatus,
	p.ProjectOn, p.ProjectFrom, p.ProjectTo, p.MilePostFrom,
	p.MilePostTo, p.CountyID, p.StateRouteID, p.FuncClassID, p.StartYear, p.WebLinks,
	e.CostYear,
	dbo.mtpfn_ScaleProjCost(
		p.EstCostYear, 
		e.CostYear,	
		e.factor_set,
		p.TotProjCost		
	) as ScaledCost,
	r.PolicyBoardApprovalDate,
	r.ExecBoardApprovalDate,
	p.DatePosted,
	p.DateOverwritten,
	p.Edit
FROM tblReviewProject p
	LEFT JOIN tblAgency a on p.Agency = a.AgencyNo
	LEFT JOIN tblImproveType i ON p.PrimaryImpType = i.ImpTypeID
	LEFT JOIN tblMTPStatus m ON p.MTPStatus = m.MTPStatusID
	LEFT JOIN tblRevision r ON p.RevisionID = r.RevisionID
	LEFT JOIN tblEdition e ON r.EditionID = e.EditionID
WHERE r.Posted = 1

GO
