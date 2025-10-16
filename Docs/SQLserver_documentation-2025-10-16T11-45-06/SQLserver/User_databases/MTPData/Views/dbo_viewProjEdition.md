#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewProjEdition

# ![Views](../../../../Images/View32.png) [dbo].[viewProjEdition]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 2:30:34 PM Tuesday, December 3, 2013 |
| Last Modified | 8:22:26 AM Monday, March 6, 2017 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| MTPID | int | 4 |
| EditionID | smallint | 2 |
| EditionName | nvarchar(100) | 200 |
| intDisplayOrder | int | 4 |
| CostYear | int | 4 |
| ScaledCost | money | 8 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE VIEW [dbo].[viewProjEdition]
as
SELECT pe.MTPID, e.EditionID, e.EditionName, e.intDisplayOrder,
	e.CostYear, 
	dbo.mtpfn_ScaleProjCost(p.EstCostYear, e.CostYear, e.factor_set, p.TotProjCost) as ScaledCost
FROM tblProjEdition pe 
	JOIN tblEdition e ON pe.EditionID = e.EditionID
	JOIN tblProject p ON pe.MTPID = p.MTPID

GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblEdition]](../Tables/dbo_tblEdition.md)
* [[dbo].[tblProject]](../Tables/dbo_tblProject.md)
* [[dbo].[tblProjEdition]](../Tables/dbo_tblProjEdition.md)
* [[dbo].[mtpfn_ScaleProjCost]](../Programmability/Functions/Scalar-valued_Functions/dbo_mtpfn_ScaleProjCost.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

