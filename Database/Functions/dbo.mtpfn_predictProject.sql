SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[mtpfn_predictProject](
	@RevisionID as int
)
RETURNS TABLE
AS
return

select '' as [RevisionName],
	null as AppGUID,
	null as revisionID,
	p.MTPID,
	p.Title,
	a.Place as Sponsor,
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
	ps.Score,
	dbo.mtpfn_ScaleProjCost(p.EstCostYear, rev.CostYear, rev.factor_set, p.TotProjCost) as ScaledCost
from tblProject p
	join tblProjEdition pe ON p.MTPID = pe.MTPID
	LEFT JOIN tblAgency a ON p.Agency = a.AgencyNo
	LEFT JOIN tblMTPStatus m ON p.MTPStatus = m.MTPStatusID
	LEFT JOIN tblCounty c ON p.CountyID = c.CountyID
	LEFT JOIN tblFuncClass f on p.FuncClassID = f.FuncClassID
	LEFT JOIN tblImproveType i ON p.PrimaryImpType = i.ImpTypeID
	left join mtpfn_PrioritizationScoresByProject(@revisionID) ps ON p.mtpid = ps.MTPID
	join (select r.SourceEditionID, e.CostYear, e.factor_set
		from tblRevision r
			join tblEdition e ON r.EditionID = e.EditionID
		where r.RevisionID = @RevisionID
	) as rev on 1=1
where pe.EditionID = rev.SourceEditionID
	and p.mtpid not in (
		SELECT DISTINCT MTPID
		FROM tblReviewProject rp
		where rp.RevisionID = @RevisionID
	)
	and p.MTPStatus not in ( -1, -3) -- status <> "Not in MTP" or "Cancelled"
UNION 
-- Get the projects that ARE in the revision of interest and in the edition
SELECT r.RevisionName, 
	rp.AppGUID,
	rp.RevisionID,
	rp.MTPID,
	rp.Title,
	a.Place as Sponsor,
	rp.ProjDesc,
	rp.ProjectOn,
	rp.ProjectFrom,
	rp.ProjectTo,
	c.CountyName,
	i.ImpTypeName as PrimaryImptype,
	rp.StartYear,
	rp.CompletionYear,
	m.StatusName as MTPStatus,
	f.FCName,
	ps.Score,
	dbo.mtpfn_ScaleProjCost(rp.EstCostYear, rev.CostYear, rev.factor_set, rp.TotProjCost) as ScaledCost
FROM tblReviewProject rp
	join tblReviewProjEdition pe ON rp.AppGUID = pe.APPGUID
	join tblRevision r ON rp.RevisionID = r.RevisionID
	LEFT JOIN tblAgency a ON rp.Agency = a.AgencyNo
	LEFT JOIN tblMTPStatus m ON rp.MTPStatus = m.MTPStatusID
	LEFT JOIN tblCounty c ON rp.CountyID = c.CountyID
	LEFT JOIN tblFuncClass f on rp.FuncClassID = f.FuncClassID
	LEFT JOIN tblImproveType i ON rp.PrimaryImpType = i.ImpTypeID
	left join mtpfn_PrioritizationScoresByProject(@revisionID) ps ON rp.mtpid = ps.MTPID
	join (select r.SourceEditionID, e.CostYear, e.factor_set
		from tblRevision r
			join tblEdition e ON r.EditionID = e.EditionID
		where r.RevisionID = @RevisionID
	) as rev on 1=1
WHERE 
	rp.RevisionID = @RevisionID
	and rp.MTPStatus not in ( -1, -3) -- status <> "Not in MTP" or "Cancelled"
GO
