#### 

[Project](../../../../../../index.md) > [SQLserver](../../../../../index.md) > [User databases](../../../../index.md) > [MTPData](../../../index.md) > Programmability > Functions > [Table-valued Functions](Table-valued_Functions.md) > dbo.mtpfn_predictProject

# ![Table-valued Functions](../../../../../../Images/Function_Table32.png) [dbo].[mtpfn_predictProject]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |


---

## <a name="#parameters"></a>Parameters

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| @RevisionID | int | 4 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
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
    sbp.Score as ConsistencyScore,
    sbp.Score / 90.000 as ConsistencyScorePct,
    pvt.[Community Benefits],
    pvt.[Community Benefits] / 10.0 as CommunityBenefitsPct,
    pvt.[Emissions] ,
    pvt.[Emissions] / 10.0 as EmissionsPct,
    pvt.[Puget Sound Land and Water],
    pvt.[Puget Sound Land and Water] / 10.0 as PSLWPct,
    pvt.[Safety & System Security],
    pvt.[Safety & System Security] / 10.0 as SSSPct,
    pvt.[Support for Centers],
    pvt.[Support for Centers] / 10.0 as SupportForCentersPct,
    pvt.[Supporting Employment],
    pvt.[Supporting Employment] / 10.0 as SupportingEmploymentPct,
    pvt.[Supporting Freight Movement],
    pvt.[Supporting Freight Movement] / 10.0 as SupportingFreightMovementPct,
    pvt.[Transportation Alternatives],
    pvt.[Transportation Alternatives] / 10.0 as TransportationAlternativesPct,
    pvt.[Travel Reliability],
    pvt.[Travel Reliability] / 10.0 as TravelReliabilityPct,
	dbo.mtpfn_ScaleProjCost(p.EstCostYear, rev.CostYear, rev.factor_set, p.TotProjCost) as ScaledCost
from tblProject p
	join tblProjEdition pe ON p.MTPID = pe.MTPID
	LEFT JOIN tblAgency a ON p.Agency = a.AgencyNo
	LEFT JOIN tblMTPStatus m ON p.MTPStatus = m.MTPStatusID
	LEFT JOIN tblCounty c ON p.CountyID = c.CountyID
	LEFT JOIN tblFuncClass f on p.FuncClassID = f.FuncClassID
	LEFT JOIN tblImproveType i ON p.PrimaryImpType = i.ImpTypeID
	left join mtpfn_PrioritizationScoresByProject(@revisionID) ps ON p.mtpid = ps.MTPID
    left join viewScoresBySectionAndProjectPivoted pvt on p.MTPID = pvt.MTPID
    left join viewScoresByProject sbp on p.MTPID = sbp.MTPID
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
    sbp.Score as ConsistencyScore,
    sbp.Score / 90.000 as ConsistencyScorePct,
    pvt.[Community Benefits],
    pvt.[Community Benefits] / 10.0 as CommunityBenefitsPct,
    pvt.[Emissions] ,
    pvt.[Emissions] / 10.0 as EmissionsPct,
    pvt.[Puget Sound Land and Water],
    pvt.[Puget Sound Land and Water] / 10.0 as PSLWPct,
    pvt.[Safety & System Security],
    pvt.[Safety & System Security] / 10.0 as SSSPct,
    pvt.[Support for Centers],
    pvt.[Support for Centers] / 10.0 as SupportForCentersPct,
    pvt.[Supporting Employment],
    pvt.[Supporting Employment] / 10.0 as SupportingEmploymentPct,
    pvt.[Supporting Freight Movement],
    pvt.[Supporting Freight Movement] / 10.0 as SupportingFreightMovementPct,
    pvt.[Transportation Alternatives],
    pvt.[Transportation Alternatives] / 10.0 as TransportationAlternativesPct,
    pvt.[Travel Reliability],
    pvt.[Travel Reliability] / 10.0 as TravelReliabilityPct,
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
    left join viewReviewScoresBySectionAndProjectPivoted pvt on rp.AppGUID = pvt.AppGUID
    left join viewReviewScoresByProject sbp on rp.AppGUID = sbp.AppGUID
	join (select r.SourceEditionID, e.CostYear, e.factor_set
		from tblRevision r
			join tblEdition e ON r.EditionID = e.EditionID
		where r.RevisionID = @RevisionID
	) as rev on 1=1
WHERE 
	rp.RevisionID = @RevisionID
	and rp.MTPStatus not in ( -1, -3) -- status <> "Not in MTP" or "Cancelled"
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblAgency]](../../../Tables/dbo_tblAgency.md)
* [[dbo].[tblCounty]](../../../Tables/dbo_tblCounty.md)
* [[dbo].[tblEdition]](../../../Tables/dbo_tblEdition.md)
* [[dbo].[tblFuncClass]](../../../Tables/dbo_tblFuncClass.md)
* [[dbo].[tblImproveType]](../../../Tables/dbo_tblImproveType.md)
* [[dbo].[tblMTPStatus]](../../../Tables/dbo_tblMTPStatus.md)
* [[dbo].[tblProject]](../../../Tables/dbo_tblProject.md)
* [[dbo].[tblProjEdition]](../../../Tables/dbo_tblProjEdition.md)
* [[dbo].[tblReviewProject]](../../../Tables/dbo_tblReviewProject.md)
* [[dbo].[tblReviewProjEdition]](../../../Tables/dbo_tblReviewProjEdition.md)
* [[dbo].[tblRevision]](../../../Tables/dbo_tblRevision.md)
* [[dbo].[viewReviewScoresByProject]](../../../Views/dbo_viewReviewScoresByProject.md)
* [[dbo].[viewReviewScoresBySectionAndProjectPivoted]](../../../Views/dbo_viewReviewScoresBySectionAndProjectPivoted.md)
* [[dbo].[viewScoresByProject]](../../../Views/dbo_viewScoresByProject.md)
* [[dbo].[viewScoresBySectionAndProjectPivoted]](../../../Views/dbo_viewScoresBySectionAndProjectPivoted.md)
* [[dbo].[mtpfn_PrioritizationScoresByProject]](dbo_mtpfn_PrioritizationScoresByProject.md)
* [[dbo].[mtpfn_ScaleProjCost]](../Scalar-valued_Functions/dbo_mtpfn_ScaleProjCost.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[mtpsp_predictProject]](../../Stored_Procedures/dbo_mtpsp_predictProject.md)
* [[dbo].[mtpfn_ControlTotals_ConstrainedPlan]](dbo_mtpfn_ControlTotals_ConstrainedPlan.md)
* [[dbo].[mtpfn_ProjectSearch]](dbo_mtpfn_ProjectSearch.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

