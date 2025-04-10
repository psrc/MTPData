SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE view [dbo].[viewRevisionSummary_ImpTypes]
as
--list projects in revision with imp types that don't exist for that project in posted data
	select rp.mtpid, r.APPGUID, rp.RevisionID, rv.RevisionName, 'SecondaryImprovement Type' as field,
	   '' as posted_val, i.ImpTypeName as revision_val 
	from tblReviewProj_SecondaryImpType r
		join tblReviewProject rp ON r.APPGUID = rp.AppGUID
		join tblRevision rv on rp.RevisionID = rv.RevisionID
		join tblImproveType i ON r.ImpTypeID = i.ImpTypeID
		left join (select * from tblProj_SecondaryImpType) c on rp.MTPID = c.MTPID and r.ImpTypeID = c.ImpTypeID
	where c.ImpTypeID is null
union
--list projects in posted data that have imp types that don't exist in the revision data
	SELECT a.MTPID, a.AppGUID, a.RevisionID, a.RevisionName,
		a.field, a.posted_val, '' as revision_val
	FROM 
		(
			select p.MTPID, rp.AppGUID, rp.RevisionID, r.RevisionName,
				 'SecondaryImprovement Type' as field,
				 i.ImpTypeName as posted_val, 
				 p.ImpTypeID
			from tblProj_SecondaryImpType p
				join tblReviewProject rp ON p.MTPID = rp.mtpid
				join tblRevision r ON rp.RevisionID = r.RevisionID
				left join tblImproveType i ON p.ImpTypeID = i.ImpTypeID
		) a 
		left join viewImprovementTypesRevisionData b ON a.mtpID = b.MTPID and a.ImpTypeID = b.ImpTypeID and a.RevisionID = b.RevisionID
	WHERE b.ImpTypeID is null
GO
