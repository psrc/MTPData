#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewWebMapData_2018Update_posted

# ![Views](../../../../Images/View32.png) [dbo].[viewWebMapData_2018Update_posted]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 11:36:25 AM Wednesday, September 4, 2019 |
| Last Modified | 11:36:25 AM Wednesday, September 4, 2019 |


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
| MTPStatus | nvarchar(100) | 200 |
| FundsCommitted | varchar(1) | 1 |
| PScore | int | 4 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE VIEW [dbo].[viewWebMapData_2018Update_posted]
as


select	
	cast(rp.MTPID as smallint) as intMTPID,
	cast(rp.MTPID as nvarchar(5)) as strMTPID,
	rp.Sponsor,
	rp.Sponsor + ': ' + dbo.mtpfn_CleanString(rp.Title) as SponProjTi,
	dbo.mtpfn_CleanString(rp.Title) as Title,
	cast((dbo.mtpfn_CleanString(rp.ProjDesc) + isnull(temp.DescAddendum,'')) as varchar(2000)) as ProjDesc,
	dbo.mtpfn_CleanString(rp.ProjectOn) as ProjectOn, 
	dbo.mtpfn_CleanString(rp.ProjectFrom) as ProjectFrom, 
	dbo.mtpfn_CleanString(rp.ProjectTo) as ProjectTo,
	dbo.fnCurrency(rp.ScaledCost) as TotalCost,
	rp.CompletionYear,
	rp.StartYear,
	rp.MTPStatus,
	'' as FundsCommitted,
	--case 
	--	when rp.FundsCommitted > 0 then 'Yes'
	--	else 'No'
	--end as FundsCommitted,
	--rp.ApplicationID,
	rs.PScore
from dbo.mtpfn_currentProjects(5) rp
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

GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[fnCurrency]](../Programmability/Functions/Scalar-valued_Functions/dbo_fnCurrency.md)
* [[dbo].[mtpfn_CleanString]](../Programmability/Functions/Scalar-valued_Functions/dbo_mtpfn_CleanString.md)
* [[dbo].[mtpfn_currentProjects]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_currentProjects.md)
* [[dbo].[mtpfn_ReviewPrioritizationScores]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_ReviewPrioritizationScores.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

