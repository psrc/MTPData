#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewProjectForOutreachReport

# ![Views](../../../../Images/View32.png) [dbo].[viewProjectForOutreachReport]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 11:48:52 AM Tuesday, April 21, 2015 |
| Last Modified | 12:29:31 PM Tuesday, April 21, 2015 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| Section | varchar(45) | 45 |
| MTPID | int | 4 |
| Sponsor | nvarchar(100) | 200 |
| Title | nvarchar(1000) | 2000 |
| CompletionYear | int | 4 |
| CostIn08Dollars | money | 8 |
| ProjDesc | nvarchar(max) | max |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE VIEW [dbo].[viewProjectForOutreachReport]
AS
-- This returns data to be viewed in an Access report to support Josh Brown's Outreach meetings
--  with external agencies.
	SELECT 'Unprogrammed Projects' AS [Section], 
		p.MTPID,  
		p.Sponsor, 
		p.Title, 
		p.CompletionYear, 
		round(p.ScaledCost,0) AS CostIn08Dollars, 
		p.ProjDesc
	FROM viewProject AS p
	WHERE P.MTP_Status in ('Unprogrammed')
UNION
	SELECT 'Projects in fiscally constrained project list' AS [Section], 
		p.MTPID,  
		p.Sponsor, 
		p.Title, 
		p.CompletionYear, 
		round(p.ScaledCost,0) AS CostIn08Dollars, 
		p.ProjDesc
	FROM viewProject AS p
	WHERE P.MTP_Status in ('Approved', 'Candidate', 'ROW Conditionally Approved', 'Conditionally Approved')

GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[viewProject]](dbo_viewProject.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

