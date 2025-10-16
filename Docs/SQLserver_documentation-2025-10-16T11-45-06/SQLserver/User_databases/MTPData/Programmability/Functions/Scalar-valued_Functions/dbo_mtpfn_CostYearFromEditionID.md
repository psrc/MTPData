#### 

[Project](../../../../../../index.md) > [SQLserver](../../../../../index.md) > [User databases](../../../../index.md) > [MTPData](../../../index.md) > Programmability > Functions > [Scalar-valued Functions](Scalar-valued_Functions.md) > dbo.mtpfn_CostYearFromEditionID

# ![Scalar-valued Functions](../../../../../../Images/Function_Scalar32.png) [dbo].[mtpfn_CostYearFromEditionID]

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
| @EditionID | int | 4 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE FUNCTION [dbo].[mtpfn_CostYearFromEditionID](@EditionID INT)
RETURNS int
AS 
BEGIN
	DECLARE @CostYear INT
	
	SELECT @CostYear = CostYear
	FROM tblEdition 
	WHERE EditionID = @EditionID

	RETURN @CostYear
END
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblEdition]](../../../Tables/dbo_tblEdition.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[tblReviewProjEdition]](../../../Tables/dbo_tblReviewProjEdition.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

