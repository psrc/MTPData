SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE function [dbo].[mtpfn_RevisionProjects](@RevisionID tinyint)
returns table 
as
/*
    Returns a list of attributes for each project in revision @RevisionID.
    Includes total consistency score, as well as scores broken out by measure.
    Includes scope element columns for all possible scope elements as of the 2026 Plan.
*/
return
(
    SELECT r.RevisionName, 
        --rp.AppGUID,
        --rp.RevisionID,
        rp.MTPID,
        rp.Title,
        a.Place as Sponsor,
        rp.ProjDesc,
        rp.ProjectOn,
        rp.ProjectFrom,
        rp.ProjectTo,
        c.CountyName,
        --i.ImpTypeName as PrimaryImptype,
        rp.StartYear,
        rp.CompletionYear,
        m.StatusName as MTPStatus,
        f.FCName,
        rp.contactName,
        rp.ContactPhone,
        rp.ContactEmail,
        --ps.Score,
        rp.TotProjCost as ReportedCost,
        rp.EstCostYear as CostYear,
        dbo.mtpfn_ScaleProjCost(rp.EstCostYear, rev.CostYear, rev.factor_set, rp.TotProjCost) as ScaledCost,
        se.[New Roadway Facility],
        se.[Roadway Relocation],
        se.[Add or Remove General Purpose Capacity Lanes],
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
        ssp.[TotalScore] as TotalConsistencyScore,
        ssp.[Supporting Freight Movement] as [FreightMovementScore],
        ssp.[Supporting Employment] as EmploymentScore,
        ssp.[Emissions] as EmissionsScore,
        ssp.[Puget Sound Land and Water] as PugetSoundLandAndWaterScore,
        ssp.[Transportation Alternatives] as TransportationAltenativesScore,
        ssp.[Travel Reliability] as TravelReliabilityScore,
        ssp.[Support for Centers] as SupportForCentersScore,
        ssp.[Safety & System Security] as SafetyScore,
        ssp.[Community Benefits] as CommunityBenefitsScore
    FROM tblReviewProject rp
        join tblReviewProjEdition pe ON rp.AppGUID = pe.APPGUID
        join tblRevision r ON rp.RevisionID = r.RevisionID
        --join dbo.mtpfn_RevisionScopeElements(@RevisionID) as se on rp.AppGUID = se.AppGUID
        join viewRevisionScopeElements as se on rp.AppGUID = se.AppGUID
        -- join dbo.mtpfn_RevisionScoresPivoted(@RevisionID) ssp on rp.AppGUID = ssp.AppGUID
        join dbo.viewRevisionScoresPivoted ssp on rp.AppGUID = ssp.AppGUID
        LEFT JOIN tblAgency a ON rp.Agency = a.AgencyNo
        LEFT JOIN tblMTPStatus m ON rp.MTPStatus = m.MTPStatusID
        LEFT JOIN tblCounty c ON rp.CountyID = c.CountyID
        LEFT JOIN tblFuncClass f on rp.FuncClassID = f.FuncClassID
        LEFT JOIN tblImproveType i ON rp.PrimaryImpType = i.ImpTypeID
        join (select r.SourceEditionID, e.CostYear, e.factor_set
            from tblRevision r
                join tblEdition e ON r.EditionID = e.EditionID where r.RevisionID = @RevisionID
        ) as rev on 1=1
    WHERE 
        rp.RevisionID = @RevisionID
        and rp.MTPStatus not in ( -1, -3) -- status <> "Not in MTP" or "Cancelled"
)
GO
