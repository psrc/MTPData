#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewSecondaryImpTypesPivoted

# ![Views](../../../../Images/View32.png) [dbo].[viewSecondaryImpTypesPivoted]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 9:18:53 AM Friday, September 5, 2025 |
| Last Modified | 9:18:53 AM Friday, September 5, 2025 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| MTPID | int | 4 |
| New Facility-Road | int | 4 |
| Single Intersect | int | 4 |
| Multiple Intersects | int | 4 |
| Major Interchange-GP | int | 4 |
| Relocation-Road | int | 4 |
| Major Interchange-HOV | int | 4 |
| Minor Interchange-GP | int | 4 |
| Minor Interchange-HOV | int | 4 |
| Grade Separation | int | 4 |
| Direct Access - HOV or Tolled Lane | int | 4 |
| Implements HOT, tolling policy | int | 4 |
| Improvement-Road | int | 4 |
| Other-Road | int | 4 |
| New/Widen Bridge | int | 4 |
| Bridge Replace | int | 4 |
| Bridge Rehab | int | 4 |
| Safety-Road | int | 4 |
| Vehicle Expansion | int | 4 |
| P & R (new/expand spaces) | int | 4 |
| Transit Ctr (new/expand) | int | 4 |
| Transit Service Expansion | int | 4 |
| Major Widening-GP | int | 4 |
| Flyer Stop | int | 4 |
| Transit Infrastructure/Expansion - Bus | int | 4 |
| Transit Infrastructure/Expansion - HCT | int | 4 |
| Transit Ctr (maint) | int | 4 |
| Operations-Transit | int | 4 |
| Other-Transit | int | 4 |
| Transit ITS | int | 4 |
| Signal Coordination | int | 4 |
| Traffic Surveilance | int | 4 |
| ITS - Other | int | 4 |
| Operations - System Management | int | 4 |
| Lane Control | int | 4 |
| Incident Detection | int | 4 |
| Incident Response | int | 4 |
| Traveller Information - Other | int | 4 |
| TDM | int | 4 |
| Regional Trail (Sep.) | int | 4 |
| Local Trail | int | 4 |
| Sidewalk | int | 4 |
| On-Road Bike/Ped Facilities | int | 4 |
| Bike/Ped - supportive strategies | int | 4 |
| Other-Nonmotorized | int | 4 |
| Minor Widening | int | 4 |
| New/Reloc./Exp. Terminal | int | 4 |
| New ferry route | int | 4 |
| Service Exp-Ferry | int | 4 |
| Study/Planning Activity | int | 4 |
| Other-Special | int | 4 |
| Major Widening-HOV | int | 4 |
| Lane Conversions | int | 4 |
| Pres/Maint/Reconst | int | 4 |
| Transit Signal Priority | int | 4 |
| Integrated Corridor Management | int | 4 |
| New/Relocated Transit Alignment | int | 4 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
create view [dbo].[viewSecondaryImpTypesPivoted]
as
select 
        MTPID,
        [New Facility-Road] = ISNULL([New Facility-Road], 0),
        [Single Intersect] = ISNULL([Single Intersect], 0),
        [Multiple Intersects] = ISNULL([Multiple Intersects], 0),
        [Major Interchange-GP] = ISNULL([Major Interchange-GP], 0),
        [Relocation-Road] = ISNULL([Relocation-Road], 0),
        [Major Interchange-HOV] = ISNULL([Major Interchange-HOV], 0),
        [Minor Interchange-GP] = ISNULL([Minor Interchange-GP], 0),
        [Minor Interchange-HOV] = ISNULL([Minor Interchange-HOV], 0),
        [Grade Separation] = ISNULL([Grade Separation], 0),
        [Direct Access - HOV or Tolled Lane] = ISNULL([Direct Access - HOV or Tolled Lane], 0),
        [Implements HOT, tolling policy] = ISNULL([Implements HOT, tolling policy], 0),
        [Improvement-Road] = ISNULL([Improvement-Road], 0),
        [Other-Road] = ISNULL([Other-Road], 0),
        [New/Widen Bridge] = ISNULL([New/Widen Bridge], 0),
        [Bridge Replace] = ISNULL([Bridge Replace], 0),
        [Bridge Rehab] = ISNULL([Bridge Rehab], 0),
        [Safety-Road] = ISNULL([Safety-Road], 0),
        [Vehicle Expansion] = ISNULL([Vehicle Expansion], 0),
        [P & R (new/expand spaces)] = ISNULL([P & R (new/expand spaces)], 0),
        [Transit Ctr (new/expand)] = ISNULL([Transit Ctr (new/expand)], 0),
        [Transit Service Expansion] = ISNULL([Transit Service Expansion], 0),
        [Major Widening-GP] = ISNULL([Major Widening-GP], 0),
        [Flyer Stop] = ISNULL([Flyer Stop], 0),
        [Transit Infrastructure/Expansion - Bus] = ISNULL([Transit Infrastructure/Expansion - Bus], 0),
        [Transit Infrastructure/Expansion - HCT] = ISNULL([Transit Infrastructure/Expansion - HCT], 0),
        [Transit Ctr (maint)] = ISNULL([Transit Ctr (maint)], 0),
        [Operations-Transit] = ISNULL([Operations-Transit], 0),
        [Other-Transit] = ISNULL([Other-Transit], 0),
        [Transit ITS] = ISNULL([Transit ITS], 0),
        [Signal Coordination] = ISNULL([Signal Coordination], 0),
        [Traffic Surveilance] = ISNULL([Traffic Surveilance], 0),
        [ITS - Other] = ISNULL([ITS - Other], 0),
        [Operations - System Management] = ISNULL([Operations - System Management], 0),
        [Lane Control] = ISNULL([Lane Control], 0),
        [Incident Detection] = ISNULL([Incident Detection], 0),
        [Incident Response] = ISNULL([Incident Response], 0),
        [Traveller Information - Other] = ISNULL([Traveller Information - Other], 0),
        [TDM] = ISNULL([TDM], 0),
        [Regional Trail (Sep.)] = ISNULL([Regional Trail (Sep.)], 0),
        [Local Trail] = ISNULL([Local Trail], 0),
        [Sidewalk] = ISNULL([Sidewalk], 0),
        [On-Road Bike/Ped Facilities] = ISNULL([On-Road Bike/Ped Facilities], 0),
        [Bike/Ped - supportive strategies] = ISNULL([Bike/Ped - supportive strategies], 0),
        [Other-Nonmotorized] = ISNULL([Other-Nonmotorized], 0),
        [Minor Widening] = ISNULL([Minor Widening], 0),
        [New/Reloc./Exp. Terminal] = ISNULL([New/Reloc./Exp. Terminal], 0),
        [New ferry route] = ISNULL([New ferry route], 0),
        [Service Exp-Ferry] = ISNULL([Service Exp-Ferry], 0),
        [Study/Planning Activity] = ISNULL([Study/Planning Activity], 0),
        [Other-Special] = ISNULL([Other-Special], 0),
        [Major Widening-HOV] = ISNULL([Major Widening-HOV], 0),
        [Lane Conversions] = ISNULL([Lane Conversions], 0),
        [Pres/Maint/Reconst] = ISNULL([Pres/Maint/Reconst], 0),
        [Transit Signal Priority] = ISNULL([Transit Signal Priority], 0),
        [Integrated Corridor Management] = ISNULL([Integrated Corridor Management], 0),
        [New/Relocated Transit Alignment] = ISNULL([New/Relocated Transit Alignment], 0)
from (
    SELECT pit.MTPID, i.ImpTypeName
    FROM tblProj_SecondaryImptype pit
        join tblImproveType i on pit.ImpTypeID = i.ImpTypeID
) as qry  
PIVOT (
    count(ImpTypeName)
    for ImpTypeName in (
        [New Facility-Road],
        [Single Intersect],
        [Multiple Intersects],
        [Major Interchange-GP],
        [Relocation-Road],
        [Major Interchange-HOV],
        [Minor Interchange-GP],
        [Minor Interchange-HOV],
        [Grade Separation],
        [Direct Access - HOV or Tolled Lane],
        [Implements HOT, tolling policy],
        [Improvement-Road],
        [Other-Road],
        [New/Widen Bridge],
        [Bridge Replace],
        [Bridge Rehab],
        [Safety-Road],
        [Vehicle Expansion],
        [P & R (new/expand spaces)],
        [Transit Ctr (new/expand)],
        [Transit Service Expansion],
        [Major Widening-GP],
        [Flyer Stop],
        [Transit Infrastructure/Expansion - Bus],
        [Transit Infrastructure/Expansion - HCT],
        [Transit Ctr (maint)],
        [Operations-Transit],
        [Other-Transit],
        [Transit ITS],
        [Signal Coordination],
        [Traffic Surveilance],
        [ITS - Other],
        [Operations - System Management],
        [Lane Control],
        [Incident Detection],
        [Incident Response],
        [Traveller Information - Other],
        [TDM],
        [Regional Trail (Sep.)],
        [Local Trail],
        [Sidewalk],
        [On-Road Bike/Ped Facilities],
        [Bike/Ped - supportive strategies],
        [Other-Nonmotorized],
        [Minor Widening],
        [New/Reloc./Exp. Terminal],
        [New ferry route],
        [Service Exp-Ferry],
        [Study/Planning Activity],
        [Other-Special],
        [Major Widening-HOV],
        [Lane Conversions],
        [Pres/Maint/Reconst],
        [Transit Signal Priority],
        [Integrated Corridor Management],
        [New/Relocated Transit Alignment]        
    )
    ) as PivotTable
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblImproveType]](../Tables/dbo_tblImproveType.md)
* [[dbo].[tblProj_SecondaryImpType]](../Tables/dbo_tblProj_SecondaryImpType.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

