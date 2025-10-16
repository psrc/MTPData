#### 

[Project](../../../../../../index.md) > [SQLserver](../../../../../index.md) > [User databases](../../../../index.md) > [MTPData](../../../index.md) > Programmability > Functions > [Scalar-valued Functions](Scalar-valued_Functions.md) > dbo.mtpfn_ScaledProjCostFromAppGUID

# ![Scalar-valued Functions](../../../../../../Images/Function_Scalar32.png) [dbo].[mtpfn_ScaledProjCostFromAppGUID]

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
| @AppGUID | uniqueidentifier | 16 |
| @EditionID | smallint | 2 |


---

## <a name="#sqlscript"></a>SQL Script

```sql

CREATE FUNCTION [dbo].[mtpfn_ScaledProjCostFromAppGUID](
	@AppGUID UNIQUEIDENTIFIER, 
	@EditionID SMALLINT
)
RETURNS MONEY
AS 
BEGIN
	DECLARE @inProjCost MONEY
	DECLARE @inCostYear INT
	DECLARE @outCostYear INT
	DECLARE @outCost MONEY
	DECLARE @factorSet INT


	SELECT @inProjCost = TotProjCost
	FROM tblReviewProject
	WHERE AppGUID = @AppGUID

	SELECT @factorSet = factor_set
	FROM tblEdition 
	WHERE EditionID = @EditionID
	
	SELECT @inCostYear = EstCostYear
	FROM tblReviewProject
	WHERE AppGUID = @AppGUID

	SELECT @outCostYear = CostYear
	FROM tblEdition
	WHERE EditionID = @EditionID


	SELECT @outCost = dbo.mtpfn_ScaleProjCost(@inCostYear, @outCostYear, @factorSet, @inProjCost)

	RETURN @outCost
END

GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblEdition]](../../../Tables/dbo_tblEdition.md)
* [[dbo].[tblReviewProject]](../../../Tables/dbo_tblReviewProject.md)
* [[dbo].[mtpfn_ScaleProjCost]](dbo_mtpfn_ScaleProjCost.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[tblReviewProjEdition]](../../../Tables/dbo_tblReviewProjEdition.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

