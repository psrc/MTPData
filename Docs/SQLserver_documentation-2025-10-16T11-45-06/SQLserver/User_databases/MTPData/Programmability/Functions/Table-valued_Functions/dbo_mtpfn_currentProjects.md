#### 

[Project](../../../../../../index.md) > [SQLserver](../../../../../index.md) > [User databases](../../../../index.md) > [MTPData](../../../index.md) > Programmability > Functions > [Table-valued Functions](Table-valued_Functions.md) > dbo.mtpfn_currentProjects

# ![Table-valued Functions](../../../../../../Images/Function_Table32.png) [dbo].[mtpfn_currentProjects]

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
| @EditionID | int | 4 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
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
    ps.Score,
    sbp.Score as ConsistencyScore,
    pvt.[Community Benefits],
    pvt.[Emissions],
    pvt.[Puget Sound Land and Water],
    pvt.[Safety & System Security],
    pvt.[Support for Centers],
    pvt.[Supporting Employment],
    pvt.[Supporting Freight Movement],
    pvt.[Transportation Alternatives],
    pvt.[Travel Reliability]
from tblProject p
	join tblProjEdition pe ON p.MTPID = pe.MTPID
	LEFT JOIN tblAgency a ON p.Agency = a.AgencyNo
	LEFT JOIN tblMTPStatus m ON p.MTPStatus = m.MTPStatusID
	LEFT JOIN tblCounty c ON p.CountyID = c.CountyID
	LEFT JOIN tblFuncClass f on p.FuncClassID = f.FuncClassID
	LEFT JOIN tblImproveType i ON p.PrimaryImpType = i.ImpTypeID
	JOIN ( SELECT CostYear, factor_set from tblEdition where EditionID = @EditionID) cy on 1=1
    left join mtpfn_PrioritizationScoresByPostedProject() ps on p.MTPID = ps.mtpid
    left join viewScoresBySectionAndProjectPivoted pvt on p.MTPID = pvt.MTPID
    left join viewScoresByProject sbp on p.MTPID = sbp.MTPID
where pe.EditionID = @EditionID
	and p.MTPStatus not in ( -1, -3) -- status <> "Not in MTP" or "Cancelled"
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
* [[dbo].[viewScoresByProject]](../../../Views/dbo_viewScoresByProject.md)
* [[dbo].[viewScoresBySectionAndProjectPivoted]](../../../Views/dbo_viewScoresBySectionAndProjectPivoted.md)
* [[dbo].[mtpfn_PrioritizationScoresByPostedProject]](dbo_mtpfn_PrioritizationScoresByPostedProject.md)
* [[dbo].[mtpfn_ScaleProjCost]](../Scalar-valued_Functions/dbo_mtpfn_ScaleProjCost.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewWebMapData_2014Current]](../../../Views/dbo_viewWebMapData_2014Current.md)
* [[dbo].[viewWebMapData_2018Update_posted]](../../../Views/dbo_viewWebMapData_2018Update_posted.md)
* [[dbo].[mtpsp_predictProject]](../../Stored_Procedures/dbo_mtpsp_predictProject.md)
* [[dbo].[mtpsp_predictProject_draftPlan]](../../Stored_Procedures/dbo_mtpsp_predictProject_draftPlan.md)
* [[dbo].[mtpsp_SummaryOfPostedProjects]](../../Stored_Procedures/dbo_mtpsp_SummaryOfPostedProjects.md)
* [[dbo].[WebMapData_posted]](../../Stored_Procedures/dbo_WebMapData_posted.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

