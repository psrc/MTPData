#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewProject

# ![Views](../../../../Images/View32.png) [dbo].[viewProject]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 11:49:27 AM Tuesday, November 5, 2013 |
| Last Modified | 12:30:16 PM Tuesday, October 18, 2016 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
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
| MTP_STatus | nvarchar(100) | 200 |
| ProjectOn | nvarchar(255) | 510 |
| ProjectFrom | nvarchar(255) | 510 |
| ProjectTo | nvarchar(255) | 510 |
| MilePostFrom | decimal(18,1) | 9 |
| MilePostTo | decimal(18,1) | 9 |
| CountyID | smallint | 2 |
| CountyName | nvarchar(200) | 400 |
| StateRouteID | smallint | 2 |
| SRShortName | nvarchar(10) | 20 |
| FuncClassID | tinyint | 1 |
| FCName | nvarchar(100) | 200 |
| StartYear | int | 4 |
| WebLinks | nvarchar(1000) | 2000 |


---

## <a name="#sqlscript"></a>SQL Script

```sql


CREATE VIEW [dbo].[viewProject]
as
SELECT p.MTPID, a.PlaceShortName as Sponsor, i.ImpTypeName as PrimaryImpType, p.Title,p.ProjDesc,
	p.TotProjCost,
	p.ContactName, p.ContactPhone, p.ContactEmail,
	p.EstCostYear, p.CompletionYear, m.StatusName as MTP_STatus,
	p.ProjectOn, p.ProjectFrom, p.ProjectTo,
	p.MilePostFrom, p.MilePostTo, p.CountyID, c.CountyName,
	p.StateRouteID, s.SRShortName,  p.FuncClassID, f.FCName,
	p.StartYear, p.WebLinks
FROM tblProject p
	LEFT JOIN tblAgency a ON p.Agency = a.AgencyNo
	LEFT JOIN tblMTPStatus m ON p.MTPStatus = m.MTPStatusID
	LEFT JOIN tblCounty c ON p.CountyID = c.CountyID
	LEFT JOIN tblStateRoute s ON p.StateRouteID = s.SRID
	LEFT JOIN tblFuncClass f on p.FuncClassID = f.FuncClassID
	LEFT JOIN tblImproveType i ON p.PrimaryImpType = i.ImpTypeID


GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblAgency]](../Tables/dbo_tblAgency.md)
* [[dbo].[tblCounty]](../Tables/dbo_tblCounty.md)
* [[dbo].[tblFuncClass]](../Tables/dbo_tblFuncClass.md)
* [[dbo].[tblImproveType]](../Tables/dbo_tblImproveType.md)
* [[dbo].[tblMTPStatus]](../Tables/dbo_tblMTPStatus.md)
* [[dbo].[tblProject]](../Tables/dbo_tblProject.md)
* [[dbo].[tblStateRoute]](../Tables/dbo_tblStateRoute.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewProjectForOutreachReport]](dbo_viewProjectForOutreachReport.md)
* [[dbo].[mtpsp_ProjectList]](../Programmability/Stored_Procedures/dbo_mtpsp_ProjectList.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

