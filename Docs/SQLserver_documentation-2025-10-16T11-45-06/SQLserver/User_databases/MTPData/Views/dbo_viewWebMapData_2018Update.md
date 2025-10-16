#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewWebMapData_2018Update

# ![Views](../../../../Images/View32.png) [dbo].[viewWebMapData_2018Update]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 1:52:21 PM Thursday, April 27, 2017 |
| Last Modified | 3:53:35 PM Thursday, April 19, 2018 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| intMTPID | smallint | 2 |
| strMTPID | nvarchar(5) | 10 |
| Sponsor | nvarchar(100) | 200 |
| SponProjTi | nvarchar(max) | max |
| Title | nvarchar(max) | max |
| ProjDesc | varchar(2000) | 2000 |
| ProjectOn | nvarchar(max) | max |
| ProjectFrom | nvarchar(max) | max |
| ProjectTo | nvarchar(max) | max |
| TotalCost | varchar(25) | 25 |
| CompletionYear | int | 4 |
| StartYear | int | 4 |
| StatusRequest | nvarchar(100) | 200 |
| FundsCommitted | varchar(3) | 3 |
| ApplicationID | int | 4 |
| PScore | int | 4 |


---

## <a name="#sqlscript"></a>SQL Script

```sql



-- Get Project Data for use in T2040 update webmap.
CREATE view [dbo].[viewWebMapData_2018Update]
as


select	
	cast(rp.MTPID as smallint) as intMTPID,
	cast(rp.MTPID as nvarchar(5)) as strMTPID,
	 a.PlaceShortName as Sponsor, 
	a.PlaceShortName + ': ' + dbo.mtpfn_CleanString(rp.Title) as SponProjTi,
	dbo.mtpfn_CleanString(rp.Title) as Title,
	cast((dbo.mtpfn_CleanString(rp.ProjDesc) + isnull(temp.DescAddendum,'')) as varchar(2000)) as ProjDesc,
	dbo.mtpfn_CleanString(rp.ProjectOn) as ProjectOn, 
	dbo.mtpfn_CleanString(rp.ProjectFrom) as ProjectFrom, 
	dbo.mtpfn_CleanString(rp.ProjectTo) as ProjectTo,
	dbo.fnCurrency(dbo.mtpfn_ScaleProjCost(rp.estCostYear, 2018, 2, rp.TotProjCost)) as TotalCost,
	rp.CompletionYear,
	rp.StartYear,
	ms.StatusName as StatusRequest, 
	case 
		when rp.FundsCommitted > 0 then 'Yes'
		else 'No'
	end as FundsCommitted,
	rp.ApplicationID,
	rs.PScore
from tblReviewProject rp
	join tblAgency a on rp.Agency = a.AgencyNo
	join tblMTPStatus ms ON rp.MTPStatus = ms.MTPStatusID
	left join mtpfn_ReviewPrioritizationScores(28) rs on rp.MTPID = rs.mtpid
	left join (select tempTable.* -- construct text to add onto project descriptions for webmap only.
		from ( values
			(4092 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5073 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5075 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5079 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5088 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5091 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5095 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5097 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5141 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5152 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5156 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5164 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5165 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5173 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5177 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5218 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5219 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5682 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5683 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5684 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5312 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5331 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5332 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5334 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5335 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5466 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5671 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5672 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5673 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5674 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5675 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5676 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5677 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5690 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5691 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5692 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5693 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5694 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5695 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5696 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5697 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5698 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5318 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(3311 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(4073 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(4075 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' ),
			(5319 , ' Representative alignment for mapping purposes. Final alignment has yet to be determined.' )
		) tempTable (MTPID, DescAddendum)
	) as temp on rp.MTPID = temp.MTPID
where rp.RevisionID = 28




GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblAgency]](../Tables/dbo_tblAgency.md)
* [[dbo].[tblMTPStatus]](../Tables/dbo_tblMTPStatus.md)
* [[dbo].[tblReviewProject]](../Tables/dbo_tblReviewProject.md)
* [[dbo].[fnCurrency]](../Programmability/Functions/Scalar-valued_Functions/dbo_fnCurrency.md)
* [[dbo].[mtpfn_CleanString]](../Programmability/Functions/Scalar-valued_Functions/dbo_mtpfn_CleanString.md)
* [[dbo].[mtpfn_ReviewPrioritizationScores]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_ReviewPrioritizationScores.md)
* [[dbo].[mtpfn_ScaleProjCost]](../Programmability/Functions/Scalar-valued_Functions/dbo_mtpfn_ScaleProjCost.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

