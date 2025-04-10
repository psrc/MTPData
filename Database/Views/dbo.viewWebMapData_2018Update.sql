SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



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
