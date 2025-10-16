#### 

[Project](../../../../../../index.md) > [SQLserver](../../../../../index.md) > [User databases](../../../../index.md) > [MTPData](../../../index.md) > Programmability > Functions > [Table-valued Functions](Table-valued_Functions.md) > dbo.mtpfn_ArchivedProject

# ![Table-valued Functions](../../../../../../Images/Function_Table32.png) [dbo].[mtpfn_ArchivedProject]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |


---

## <a name="#parameters"></a>Parameters

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| @MTPID | int | 4 |
| @RevisionID | int | 4 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE function [dbo].[mtpfn_ArchivedProject](@MTPID as int, @RevisionID as int)
returns table
as
return
	SELECT p.appGUID, p.RevisionID, r.RevisionName as Revision, p.MTPID, p.Agency, a.PlaceShortName as Sponsor, p.PrimaryImpType,
		p.Title,p.ProjDesc,
		p.TotProjCost, p.ContactName, p.ContactPhone, p.ContactEmail, 
		p.EstCostYear, p.CompletionYear, m.StatusName, p.MTPStatus,
		p.ProjectOn, p.ProjectFrom, p.ProjectTo, p.MilePostFrom,
		p.MilePostTo, p.CountyID, p.StateRouteID, p.FuncClassID, p.StartYear, p.WebLinks, 
		r.PolicyBoardApprovalDate,
		r.ExecBoardApprovalDate,
		p.ReviewTypeID
	FROM tblReviewProject p
		LEFT JOIN tblAgency a on p.Agency = a.AgencyNo
		LEFT JOIN tblMTPStatus m ON p.MTPStatus = m.MTPStatusID
		LEFT JOIN tblRevision r ON p.RevisionID = r.RevisionID
	WHERE p.MTPID = @MTPID 
		and p.RevisionID = @RevisionID

GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblAgency]](../../../Tables/dbo_tblAgency.md)
* [[dbo].[tblMTPStatus]](../../../Tables/dbo_tblMTPStatus.md)
* [[dbo].[tblReviewProject]](../../../Tables/dbo_tblReviewProject.md)
* [[dbo].[tblRevision]](../../../Tables/dbo_tblRevision.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

