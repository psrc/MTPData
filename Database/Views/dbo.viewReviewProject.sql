SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE VIEW [dbo].[viewReviewProject]
as
SELECT p.appGUID, 
	cast(p.appGUID as nvarchar(200)) as textAppGUID,
	p.RevisionID, r.RevisionName as Revision, p.MTPID, p.Agency, a.PlaceShortName as Sponsor, p.PrimaryImpType,
	p.Title,p.ProjDesc,
	p.TotProjCost, p.ContactName, p.ContactPhone, p.ContactEmail, 
	p.EstCostYear, p.CompletionYear, m.StatusName, p.MTPStatus,
	p.ProjectOn, p.ProjectFrom, p.ProjectTo, p.MilePostFrom,
	p.MilePostTo, p.CountyID, p.StateRouteID, p.FuncClassID, p.StartYear, p.WebLinks, 
	r.PolicyBoardApprovalDate,
	r.ExecBoardApprovalDate,
	p.ReviewTypeID, 
	isnull(p.ApplicationID, 0) as ApplicationID,
	p.PlanningProcess, 
	p.LettersOfConcurrence,
	p.FundsDescription,
	p.Fundscommitted
FROM tblReviewProject p
	LEFT JOIN tblAgency a on p.Agency = a.AgencyNo
	LEFT JOIN tblMTPStatus m ON p.MTPStatus = m.MTPStatusID
	LEFT JOIN tblRevision r ON p.RevisionID = r.RevisionID
WHERE r.Posted = 0




GO
