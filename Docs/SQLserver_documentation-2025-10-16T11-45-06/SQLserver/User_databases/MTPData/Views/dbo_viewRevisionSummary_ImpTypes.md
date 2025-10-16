#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewRevisionSummary_ImpTypes

# ![Views](../../../../Images/View32.png) [dbo].[viewRevisionSummary_ImpTypes]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 2:48:06 PM Wednesday, May 27, 2015 |
| Last Modified | 12:30:45 PM Tuesday, October 18, 2016 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| mtpid | int | 4 |
| APPGUID | uniqueidentifier | 16 |
| RevisionID | int | 4 |
| RevisionName | nvarchar(100) | 200 |
| field | varchar(25) | 25 |
| posted_val | nvarchar(100) | 200 |
| revision_val | nvarchar(100) | 200 |


---

## <a name="#sqlscript"></a>SQL Script

```sql


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

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblImproveType]](../Tables/dbo_tblImproveType.md)
* [[dbo].[tblProj_SecondaryImpType]](../Tables/dbo_tblProj_SecondaryImpType.md)
* [[dbo].[tblReviewProj_SecondaryImpType]](../Tables/dbo_tblReviewProj_SecondaryImpType.md)
* [[dbo].[tblReviewProject]](../Tables/dbo_tblReviewProject.md)
* [[dbo].[tblRevision]](../Tables/dbo_tblRevision.md)
* [[dbo].[viewImprovementTypesRevisionData]](dbo_viewImprovementTypesRevisionData.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewRevisionSummary]](dbo_viewRevisionSummary.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

