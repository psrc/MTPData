SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






CREATE VIEW [dbo].[viewRevisionSummary]
as
	select review_proj.mtpid, review_proj.AppGUID, review_proj.RevisionID, r.RevisionName,
		coalesce(c.human_name, review_proj.field) as field,
		'' + proj.val as posted_val,
		'' + review_proj.val as revision_val
	FROM
	(
		select mtpid, field, val
		from
		(
			select mtpid
				, ISNULL(CAST(a.Place AS NVARCHAR(1000)),'') AS Agency
				, ISNULL(CAST(Title AS NVARCHAR(1000)),'') AS Title
				, ISNULL(CAST(ProjDesc AS NVARCHAR(1000)),'') AS ProjDesc
				, ISNULL(CAST(dbo.fnCurrency(TotProjCost) as NVARCHAR(1000)),'') AS TotProjCost
				, ISNULL(CAST(ContactName AS NVARCHAR(1000)),'') AS ContactName
				, ISNULL(CAST(ContactPhone AS NVARCHAR(1000)),'') AS ContactPhone
				, ISNULL(CAST(ContactEmail AS NVARCHAR(1000)),'') AS ContactEmail
				, ISNULL(CAST(EstCostYear AS NVARCHAR(1000)),'') AS EstCostYear
				, ISNULL(CAST(CompletionYear AS NVARCHAR(1000)),'') AS CompletionYear
				, ISNULL(CAST(s.StatusName AS NVARCHAR(1000)),'') AS MTPStatus
				, ISNULL(CAST(ProjectOn AS NVARCHAR(1000)),'') AS ProjectOn
				, ISNULL(CAST(ProjectFrom AS NVARCHAR(1000)),'') AS ProjectFrom
				, ISNULL(CAST(ProjectTo AS NVARCHAR(1000)),'') AS ProjectTo
				, ISNULL(CAST(MilePostFrom AS NVARCHAR(1000)),'') AS MilePostFrom
				, ISNULL(CAST(MilePostTo AS NVARCHAR(1000)),'') AS MilePostTo
				, ISNULL(CAST(CountyID AS NVARCHAR(1000)),'') AS CountyID
				, ISNULL(CAST(StateRouteID AS NVARCHAR(1000)),'') AS StateRouteID
				, ISNULL(CAST(f.FCName AS NVARCHAR(1000)),'') AS FuncClassID
				, ISNULL(CAST(StartYear AS NVARCHAR(1000)),'') AS StartYear
				, ISNULL(CAST(WebLinks AS NVARCHAR(1000)),'') AS WebLinks
				, ISNULL(CAST(t2.ImpTypeName AS NVARCHAR(1000)),'') AS PrimaryImpType
			from tblProject t1
				left join tblImproveType t2 ON t1.PrimaryImpType = t2.ImpTypeID
				left join tblMTPStatus s ON t1.MTPStatus = s.MTPStatusID
				left join tblAgency a ON t1.Agency = a.AgencyNo
				left join tblFuncClass f ON t1.FuncClassID = f.FuncClassID
		) p
		UNPIVOT
			(val FOR field in (Agency, Title, ProjDesc, TotProjCost, ContactName, ContactPhone, ContactEmail, 
				EstCostYear, CompletionYear, MTPStatus, ProjectOn, ProjectFrom, ProjectTo, MilePostFrom, 
				MilePostTo, CountyID, StateRouteID, FuncClassID, StartYear, WebLinks, PrimaryImpType)
			) as unpiv
	) as proj
	right join 
	(
		select mtpid, RevisionID, AppGUID,  field, val
		from
		(
			select mtpid, RevisionID, AppGUID
				, ISNULL(CAST(a.Place AS NVARCHAR(1000)),'') AS Agency
				, ISNULL(CAST(Title AS NVARCHAR(1000)),'') AS Title
				, ISNULL(CAST(ProjDesc AS NVARCHAR(1000)),'') AS ProjDesc
				, ISNULL(CAST(dbo.fnCurrency(TotProjCost) as NVARCHAR(1000)),'') AS TotProjCost
				, ISNULL(CAST(ContactName AS NVARCHAR(1000)),'') AS ContactName
				, ISNULL(CAST(ContactPhone AS NVARCHAR(1000)),'') AS ContactPhone
				, ISNULL(CAST(ContactEmail AS NVARCHAR(1000)),'') AS ContactEmail
				, ISNULL(CAST(EstCostYear AS NVARCHAR(1000)),'') AS EstCostYear
				, ISNULL(CAST(CompletionYear AS NVARCHAR(1000)),'') AS CompletionYear
				, ISNULL(CAST(s.StatusName AS NVARCHAR(1000)),'') AS MTPStatus
				, ISNULL(CAST(ProjectOn AS NVARCHAR(1000)),'') AS ProjectOn
				, ISNULL(CAST(ProjectFrom AS NVARCHAR(1000)),'') AS ProjectFrom
				, ISNULL(CAST(ProjectTo AS NVARCHAR(1000)),'') AS ProjectTo
				, ISNULL(CAST(MilePostFrom AS NVARCHAR(1000)),'') AS MilePostFrom
				, ISNULL(CAST(MilePostTo AS NVARCHAR(1000)),'') AS MilePostTo
				, ISNULL(CAST(CountyID AS NVARCHAR(1000)),'') AS CountyID
				, ISNULL(CAST(StateRouteID AS NVARCHAR(1000)),'') AS StateRouteID
				, ISNULL(CAST(f.FCName AS NVARCHAR(1000)),'') AS FuncClassID
				, ISNULL(CAST(StartYear AS NVARCHAR(1000)),'') AS StartYear
				, ISNULL(CAST(WebLinks AS NVARCHAR(1000)),'') AS WebLinks
				, ISNULL(CAST(t2.ImpTypeName AS NVARCHAR(1000)),'') AS PrimaryImpType
			from tblReviewProject t1
				left join tblImproveType t2 ON t1.PrimaryImpType = t2.ImpTypeID
				left join tblMTPStatus s ON t1.MTPStatus = s.MTPStatusID
				left join tblAgency a ON t1.Agency = a.AgencyNo
				left join tblFuncClass f ON t1.FuncClassID = f.FuncClassID
		) p
		UNPIVOT
			(val FOR field in (Agency, Title, ProjDesc, TotProjCost, ContactName, ContactPhone, ContactEmail, 
				EstCostYear, CompletionYear, MTPStatus, ProjectOn, ProjectFrom, ProjectTo, MilePostFrom, 
				MilePostTo, CountyID, StateRouteID, FuncClassID, StartYear, WebLinks, PrimaryImpType)
			) as unpiv
	) as review_proj on proj.mtpid = review_proj.mtpid and proj.field = review_proj.field
	left join tblColumnNames c ON review_proj.field = c.system_name
	left join tblRevision r ON review_proj.RevisionID = r.RevisionID
	where ISNULL(proj.val,'') <> review_proj.val
union
	select * from viewRevisionSummary_ImpTypes




GO
