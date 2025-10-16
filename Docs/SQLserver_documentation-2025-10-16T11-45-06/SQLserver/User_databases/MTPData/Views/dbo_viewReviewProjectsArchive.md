#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewReviewProjectsArchive

# ![Views](../../../../Images/View32.png) [dbo].[viewReviewProjectsArchive]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 9:31:54 AM Wednesday, June 4, 2014 |
| Last Modified | 8:23:00 AM Monday, March 6, 2017 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| appGUID | uniqueidentifier | 16 |
| RevisionID | int | 4 |
| Revision | nvarchar(100) | 200 |
| MTPID | int | 4 |
| Sponsor | nvarchar(100) | 200 |
| PrimaryImpType | nvarchar(100) | 200 |
| Title | nvarchar(1000) | 2000 |
| ProjDesc | nvarchar(max) | max |
| TotProjCost | money | 8 |
| ContactName | nvarchar(50) | 100 |
| ContactPhone | nvarchar(100) | 200 |
| ContactEmail | nvarchar(100) | 200 |
| EstCostYear | int | 4 |
| CompletionYear | int | 4 |
| StatusName | nvarchar(100) | 200 |
| MTPStatus | int | 4 |
| ProjectOn | nvarchar(255) | 510 |
| ProjectFrom | nvarchar(255) | 510 |
| ProjectTo | nvarchar(255) | 510 |
| MilePostFrom | decimal(18,1) | 9 |
| MilePostTo | decimal(18,1) | 9 |
| CountyID | smallint | 2 |
| StateRouteID | smallint | 2 |
| FuncClassID | tinyint | 1 |
| StartYear | int | 4 |
| WebLinks | nvarchar(1000) | 2000 |
| CostYear | int | 4 |
| ScaledCost | money | 8 |
| PolicyBoardApprovalDate | datetime | 8 |
| ExecBoardApprovalDate | datetime | 8 |
| DatePosted | datetime | 8 |
| DateOverwritten | datetime | 8 |
| Edit | bit | 1 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE VIEW [dbo].[viewReviewProjectsArchive]
as
SELECT p.appGUID, p.RevisionID, r.RevisionName as Revision, p.MTPID, a.PlaceShortName as Sponsor, i.ImpTypeName as PrimaryImpType, p.Title,p.ProjDesc,
	p.TotProjCost, p.ContactName, p.ContactPhone, p.ContactEmail, 
	p.EstCostYear, p.CompletionYear, m.StatusName, p.MTPStatus,
	p.ProjectOn, p.ProjectFrom, p.ProjectTo, p.MilePostFrom,
	p.MilePostTo, p.CountyID, p.StateRouteID, p.FuncClassID, p.StartYear, p.WebLinks,
	e.CostYear,
	dbo.mtpfn_ScaleProjCost(
		p.EstCostYear, 
		e.CostYear,	
		e.factor_set,
		p.TotProjCost		
	) as ScaledCost,
	r.PolicyBoardApprovalDate,
	r.ExecBoardApprovalDate,
	p.DatePosted,
	p.DateOverwritten,
	p.Edit
FROM tblReviewProject p
	LEFT JOIN tblAgency a on p.Agency = a.AgencyNo
	LEFT JOIN tblImproveType i ON p.PrimaryImpType = i.ImpTypeID
	LEFT JOIN tblMTPStatus m ON p.MTPStatus = m.MTPStatusID
	LEFT JOIN tblRevision r ON p.RevisionID = r.RevisionID
	LEFT JOIN tblEdition e ON r.EditionID = e.EditionID
WHERE r.Posted = 1

GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblAgency]](../Tables/dbo_tblAgency.md)
* [[dbo].[tblEdition]](../Tables/dbo_tblEdition.md)
* [[dbo].[tblImproveType]](../Tables/dbo_tblImproveType.md)
* [[dbo].[tblMTPStatus]](../Tables/dbo_tblMTPStatus.md)
* [[dbo].[tblReviewProject]](../Tables/dbo_tblReviewProject.md)
* [[dbo].[tblRevision]](../Tables/dbo_tblRevision.md)
* [[dbo].[mtpfn_ScaleProjCost]](../Programmability/Functions/Scalar-valued_Functions/dbo_mtpfn_ScaleProjCost.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

