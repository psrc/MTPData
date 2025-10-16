#### 

[Project](../../../../../../index.md) > [SQLserver](../../../../../index.md) > [User databases](../../../../index.md) > [MTPData](../../../index.md) > Programmability > Functions > [Table-valued Functions](Table-valued_Functions.md) > dbo.mtpfn_ReviewProjects

# ![Table-valued Functions](../../../../../../Images/Function_Table32.png) [dbo].[mtpfn_ReviewProjects]

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
| @RevisionID | tinyint | 1 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE FUNCTION [dbo].[mtpfn_ReviewProjects](@RevisionID TINYINT)
RETURNS TABLE 
AS
/*
    Returns a list of attributes for each project in revision @RevisionID.
    Includes total consistency score, as well as scores broken out by measure.
    Includes scope element columns for all possible scope elements as of the 2026 Plan.
*/
RETURN
(
    SELECT r.RevisionName, 
        --rp.AppGUID,
        --rp.RevisionID,
        rp.DateStamp as DateLastEdited,
        rp.MTPID,
        rp.Title,
        a.Place AS Sponsor,
        rp.ProjDesc,
        rp.ProjectOn,
        rp.ProjectFrom,
        rp.ProjectTo,
        c.CountyName,
        --i.ImpTypeName as PrimaryImptype,
        rp.StartYear,
        rp.CompletionYear,
        m.StatusName AS MTPStatus,
        f.FCName,
        rp.contactName,
        rp.ContactPhone,
        rp.ContactEmail,
        --ps.Score,
        rp.TotProjCost AS ReportedCost,
        rp.EstCostYear AS CostYear,
        dbo.mtpfn_ScaleProjCost(rp.EstCostYear, rev.CostYear, rev.factor_set, rp.TotProjCost) AS ScaledCost,
        rp.FundsCommitted,
        rp.FundsDescription as CommittedFundSources,
        se.[New Roadway Facility],
        se.[Roadway Relocation],
        se.[Add or Remove General Purpose Capacity Lanes],
        se.[Add General Purpose Capacity Lanes],
        se.[Remove General Purpose Capacity Lanes],
        se.[Change Roadway Usage/Operations],
        se.[Add or Remove Business Access Transit Lanes],
        se.[Add or Remove High Occupancy Vehicle Lanes],
        se.[New Interchange],
        se.[Interchange Improvements],
        se.[Intersection Improvements],
        se.[Road Resurfacing/Rehabilitation],
        se.[Grade Separation],
        se.[Bridge Replacement or Rehabiltation],
        se.[New or Widened Bridge],
        se.[Park & Ride],
        se.[New or Relocated Transit Center or Station],
        se.[Transit Center or Station Improvement],
        se.[New High Capacity Transit Alignment],
        se.[Interstate Bus Flyer Stop],
        se.[Transit Amenities],
        se.[Transit Maintenance and Operation Base],
        se.[Vehicle Purchase],
        se.[New Ferry Route],
        se.[Change to Existing Ferry Service],
        se.[New or Relocated Ferry Terminal],
        se.[Ferry terminal improvement],
        se.[Ferry vessel purchase or maintenance],
        se.[Bike/Pedestrian Trail or Path],
        se.[Other Bike/Pedestrian Path],
        se.[Bike Lane],
        se.[Sidewalk],
        se.[Bike/Pedestrian Bridge],
        se.[Other Bicycle/Pedestrian Improvements],
        se.[Intelligent Transportation System],
        se.[Transportation Demand Management],
        se.[Other Preservation/Maintenance], 
        ssp.[TotalScore] AS TotalConsistencyScore,
        ssp.[Supporting Freight Movement] AS [FreightMovementScore],
        ssp.[Supporting Employment] AS EmploymentScore,
        ssp.[Emissions] AS EmissionsScore,
        ssp.[Puget Sound Land and Water] AS PugetSoundLandAndWaterScore,
        ssp.[Transportation Alternatives] AS TransportationAltenativesScore,
        ssp.[Travel Reliability] AS TravelReliabilityScore,
        ssp.[Support for Centers] AS SupportForCentersScore,
        ssp.[Safety & System Security] AS SafetyScore,
        ssp.[Community Benefits] AS CommunityBenefitsScore
    FROM tblReviewProject rp
        JOIN tblReviewProjEdition pe ON rp.AppGUID = pe.APPGUID
        JOIN tblRevision r ON rp.RevisionID = r.RevisionID
        --join dbo.mtpfn_RevisionScopeElements(@RevisionID) as se on rp.AppGUID = se.AppGUID
        JOIN viewReviewScopeElements AS se ON rp.AppGUID = se.AppGUID
        -- join dbo.mtpfn_RevisionScoresPivoted(@RevisionID) ssp on rp.AppGUID = ssp.AppGUID
        JOIN dbo.viewReviewScoresPivoted ssp ON rp.AppGUID = ssp.AppGUID
        LEFT JOIN tblAgency a ON rp.Agency = a.AgencyNo
        LEFT JOIN tblMTPStatus m ON rp.MTPStatus = m.MTPStatusID
        LEFT JOIN tblCounty c ON rp.CountyID = c.CountyID
        LEFT JOIN tblFuncClass f ON rp.FuncClassID = f.FuncClassID
        LEFT JOIN tblImproveType i ON rp.PrimaryImpType = i.ImpTypeID
        JOIN (SELECT r.SourceEditionID, e.CostYear, e.factor_set
            FROM tblRevision r
                JOIN tblEdition e ON r.EditionID = e.EditionID WHERE r.RevisionID = @RevisionID
        ) AS rev ON 1=1
    WHERE 
        rp.RevisionID = @RevisionID
        AND rp.MTPStatus NOT IN ( -1, -3) -- status <> "Not in MTP" or "Cancelled"
)
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
* [[dbo].[tblReviewProject]](../../../Tables/dbo_tblReviewProject.md)
* [[dbo].[tblReviewProjEdition]](../../../Tables/dbo_tblReviewProjEdition.md)
* [[dbo].[tblRevision]](../../../Tables/dbo_tblRevision.md)
* [[dbo].[viewReviewScopeElements]](../../../Views/dbo_viewReviewScopeElements.md)
* [[dbo].[viewReviewScoresPivoted]](../../../Views/dbo_viewReviewScoresPivoted.md)
* [[dbo].[mtpfn_ScaleProjCost]](../Scalar-valued_Functions/dbo_mtpfn_ScaleProjCost.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

