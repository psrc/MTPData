#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewReviewProject

# ![Views](../../../../Images/View32.png) [dbo].[viewReviewProject]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 2:20:43 PM Thursday, November 7, 2013 |
| Last Modified | 10:05:38 AM Wednesday, July 18, 2018 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| appGUID | uniqueidentifier | 16 |
| textAppGUID | nvarchar(200) | 400 |
| RevisionID | int | 4 |
| Revision | nvarchar(100) | 200 |
| MTPID | int | 4 |
| Agency | smallint | 2 |
| Sponsor | nvarchar(100) | 200 |
| PrimaryImpType | smallint | 2 |
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
| PolicyBoardApprovalDate | datetime | 8 |
| ExecBoardApprovalDate | datetime | 8 |
| ReviewTypeID | int | 4 |
| ApplicationID | int | 4 |
| PlanningProcess | nvarchar(2000) | 4000 |
| LettersOfConcurrence | nvarchar(2000) | 4000 |
| FundsDescription | nvarchar(2000) | 4000 |
| Fundscommitted | decimal(18,0) | 9 |


---

## <a name="#sqlscript"></a>SQL Script

```sql




CREATE VIEW [dbo].[viewReviewProject]
as
SELECT p.appGUID, 
	cast(p.appGUID as nvarchar(200)) as textAppGUID,
	p.RevisionID, r.RevisionName as Revision, p.MTPID, p.Agency, a.PlaceShortName as Sponsor, p.PrimaryImpType,
	p.Title,p.ProjDesc,
	p.TotProjCost, p.ContactName, p.ContactPhone, p.ContactEmail, 
	p.EstCostYear, p.CompletionYear, m.StatusName, p.MTPStatus,
	p.ProjectOn, p.ProjectFrom, p.ProjectTo, p.MilePostFrom,
	p.MilePostTo, p.CountyID, p.StateRouteID, p.FuncClassID, p.StartYear, p.WebLinks, 
	r.PolicyBoardApprovalDate,
	r.ExecBoardApprovalDate,
	p.ReviewTypeID, 
	isnull(p.ApplicationID, 0) as ApplicationID,
	p.PlanningProcess, 
	p.LettersOfConcurrence,
	p.FundsDescription,
	p.Fundscommitted
FROM tblReviewProject p
	LEFT JOIN tblAgency a on p.Agency = a.AgencyNo
	LEFT JOIN tblMTPStatus m ON p.MTPStatus = m.MTPStatusID
	LEFT JOIN tblRevision r ON p.RevisionID = r.RevisionID
WHERE r.Posted = 0




GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblAgency]](../Tables/dbo_tblAgency.md)
* [[dbo].[tblMTPStatus]](../Tables/dbo_tblMTPStatus.md)
* [[dbo].[tblReviewProject]](../Tables/dbo_tblReviewProject.md)
* [[dbo].[tblRevision]](../Tables/dbo_tblRevision.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[mtpsp_PostRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_PostRevision.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

