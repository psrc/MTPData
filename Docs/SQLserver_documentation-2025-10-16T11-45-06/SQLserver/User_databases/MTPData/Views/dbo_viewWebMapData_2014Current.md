#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewWebMapData_2014Current

# ![Views](../../../../Images/View32.png) [dbo].[viewWebMapData_2014Current]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 12:39:39 PM Friday, July 7, 2017 |
| Last Modified | 2:37:14 PM Friday, July 7, 2017 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| MTPID | int | 4 |
| strMTPID | varchar(5) | 5 |
| Title | nvarchar(1000) | 2000 |
| Sponsor | nvarchar(100) | 200 |
| Improvemen | nvarchar(100) | 200 |
| Descriptio | nvarchar(max) | max |
| Location | nvarchar(max) | max |
| ProjectFrom | nvarchar(max) | max |
| ProjectTo | nvarchar(max) | max |
| Completion | int | 4 |
| SponProjTi | nvarchar(1104) | 2208 |
| MTPStatus | nvarchar(100) | 200 |
| TotalCost | money | 8 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE view [dbo].[viewWebMapData_2014Current]
as
select p.MTPID, cast(p.MTPID as varchar(5)) as strMTPID,
	p.Title, p.SponsorShortName as Sponsor, p.PrimaryImpType as Improvemen,
	dbo.mtpfn_CleanString(p.ProjDesc) as Descriptio,
	dbo.mtpfn_CleanString(p.ProjectOn) as Location,
	dbo.mtpfn_CleanString(p.ProjectFrom) as ProjectFrom,
	dbo.mtpfn_CleanString(p.ProjectTo) as ProjectTo, 
	p.CompletionYear as Completion,
	p.SponsorShortName + ' -- ' + p.Title as SponProjTi,
	p.MTPStatus as MTPStatus,
	p.ScaledCost as TotalCost
from mtpfn_currentProjects(4) p
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[mtpfn_CleanString]](../Programmability/Functions/Scalar-valued_Functions/dbo_mtpfn_CleanString.md)
* [[dbo].[mtpfn_currentProjects]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_currentProjects.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

