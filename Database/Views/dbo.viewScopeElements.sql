SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[viewScopeElements]
AS 
/*
    Returns a list of scope elements chosen for each project in revisions 
        per the table tblReviewProjCharacteristics.  
    Returns one row per project per revision, with each scope element expressed as a column
      populated by 0's and 1's.  
    1 = the scope element was chosen for the project
    0 = the scope element was not chosen for the project
*/
        SELECT MTPID, 
            [New Roadway Facility] = ISNULL([New Roadway Facility], 0),
            [Roadway Relocation] = ISNULL([Roadway Relocation], 0),
            [Add or Remove General Purpose Capacity Lanes] = ISNULL([Add or Remove General Purpose Capacity Lanes], 0),
            [Add General Purpose Capacity Lanes] = ISNULL([Add General Purpose Capacity Lanes], 0),
            [Remove General Purpose Capacity Lanes] = ISNULL([Remove General Purpose Capacity Lanes], 0),
            [Change Roadway Usage/Operations] = ISNULL([Change Roadway Usage/Operations], 0),
            [Add or Remove Business Access Transit Lanes] = ISNULL([Add or Remove Business Access Transit Lanes], 0),
            [Add or Remove High Occupancy Vehicle Lanes] = ISNULL([Add or Remove High Occupancy Vehicle Lanes], 0),
            [New Interchange] = ISNULL([New Interchange], 0),
            [Interchange Improvements] = ISNULL([Interchange Improvements], 0),
            [Intersection Improvements] = ISNULL([Intersection Improvements], 0),
            [Road Resurfacing/Rehabilitation] = ISNULL([Road Resurfacing/Rehabilitation], 0),
            [Grade Separation] = ISNULL([Grade Separation], 0),
            [Bridge Replacement or Rehabiltation] = ISNULL([Bridge Replacement or Rehabiltation], 0),
            [New or Widened Bridge] = ISNULL([New or Widened Bridge], 0),
            [Park & Ride] = ISNULL([Park & Ride], 0),
            [New or Relocated Transit Center or Station] = ISNULL([New or Relocated Transit Center or Station], 0),
            [Transit Center or Station Improvement] = ISNULL([Transit Center or Station Improvement], 0),
            [New High Capacity Transit Alignment] = ISNULL([New High Capacity Transit Alignment], 0),
            [Interstate Bus Flyer Stop] = ISNULL([Interstate Bus Flyer Stop], 0),
            [Transit Amenities] = ISNULL([Transit Amenities], 0),
            [Transit Maintenance and Operation Base] = ISNULL([Transit Maintenance and Operation Base], 0),
            [Vehicle Purchase] = ISNULL([Vehicle Purchase], 0),
            [New Ferry Route] = ISNULL([New Ferry Route], 0),
            [Change to Existing Ferry Service] = ISNULL([Change to Existing Ferry Service], 0),
            [New or Relocated Ferry Terminal] = ISNULL([New or Relocated Ferry Terminal], 0),
            [Ferry terminal improvement] = ISNULL([Ferry terminal improvement], 0),
            [Ferry vessel purchase or maintenance] = ISNULL([Ferry vessel purchase or maintenance], 0),
            [Bike/Pedestrian Trail or Path] = ISNULL([Bike/Pedestrian Trail or Path], 0),
            [Other Bike/Pedestrian Path] = ISNULL([Other Bike/Pedestrian Path], 0),
            [Bike Lane] = ISNULL([Bike Lane], 0),
            [Sidewalk] = ISNULL([Sidewalk], 0),
            [Bike/Pedestrian Bridge] = ISNULL([Bike/Pedestrian Bridge], 0),
            [Other Bicycle/Pedestrian Improvements] = ISNULL([Other Bicycle/Pedestrian Improvements], 0),
            [Intelligent Transportation System] = ISNULL([Intelligent Transportation System], 0),
            [Transportation Demand Management] = ISNULL([Transportation Demand Management], 0),
            [Other Preservation/Maintenance] = ISNULL([Other Preservation/Maintenance], 0)
        FROM 
        (
            SELECT rp.MTPID,  c.[Name] AS ScopeElement
            FROM tblProject rp 
                join tblProjEdition pe on rp.MTPID = pe.MTPID
                left join  tblProjCharacteristics pc  on rp.mtpid = pc.MTPID
                left JOIN tblCharacteristics c ON pc.CharacteristicID = c.[ID]
            where pe.EditionID = 6
        ) AS qry
        PIVOT 
        (
            COUNT([ScopeElement])
            FOR ScopeElement IN 
            (
                [New Roadway Facility],
        [Roadway Relocation],
        [Add or Remove General Purpose Capacity Lanes],
        [Add General Purpose Capacity Lanes],
        [Remove General Purpose Capacity Lanes],
        [Change Roadway Usage/Operations],
        [Add or Remove Business Access Transit Lanes],
        [Add or Remove High Occupancy Vehicle Lanes],
        [New Interchange],
        [Interchange Improvements],
        [Intersection Improvements],
        [Road Resurfacing/Rehabilitation],
        [Grade Separation],
        [Bridge Replacement or Rehabiltation],
        [New or Widened Bridge],
        [Park & Ride],
        [New or Relocated Transit Center or Station],
        [Transit Center or Station Improvement],
        [New High Capacity Transit Alignment],
        [Interstate Bus Flyer Stop],
        [Transit Amenities],
        [Transit Maintenance and Operation Base],
        [Vehicle Purchase],
        [New Ferry Route],
        [Change to Existing Ferry Service],
        [New or Relocated Ferry Terminal],
        [Ferry terminal improvement],
        [Ferry vessel purchase or maintenance],
        [Bike/Pedestrian Trail or Path],
        [Other Bike/Pedestrian Path],
        [Bike Lane],
        [Sidewalk],
        [Bike/Pedestrian Bridge],
        [Other Bicycle/Pedestrian Improvements],
        [Intelligent Transportation System],
        [Transportation Demand Management],
        [Other Preservation/Maintenance]
            )
        ) AS PivotTable
GO
