#### 

[Project](../../../../../../index.md) > [SQLserver](../../../../../index.md) > [User databases](../../../../index.md) > [MTPData](../../../index.md) > Programmability > Functions > [Scalar-valued Functions](Scalar-valued_Functions.md) > dbo.mtpfn_ScaleProjCost

# ![Scalar-valued Functions](../../../../../../Images/Function_Scalar32.png) [dbo].[mtpfn_ScaleProjCost]

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
| @inYear | int | 4 |
| @outYear | int | 4 |
| @factorSet | int | 4 |
| @inCost | money | 8 |


---

## <a name="#permissions"></a>Permissions

| Type | Action | Owning Principal |
|---|---|---|
| Grant | EXECUTE | db_fnExecutor |


---

## <a name="#sqlscript"></a>SQL Script

```sql

CREATE FUNCTION [dbo].[mtpfn_ScaleProjCost](
	@inYear int, 
	@outYear int, 
	@factorSet int,
	@inCost money
)
	RETURNS MONEY
	AS
	BEGIN
		
		DECLARE @outCost money
		DECLARE @inCPI float
		DECLARE @BaseYearCPI float
		
		SELECT @inCPI = CPI 
		from tblCPI 
		WHERE [Year] = @inYear and factor_set = @factorSet

		SELECT @BaseYearCPI = CPI 
		from tblCPI 
		WHERE [YEAR] = @outYear AND factor_set = @factorSet

		SELECT @outCost = @inCost * (@inCPI / nullif(@BaseYearCPI,0) )

		
	RETURN @outCost
	END


GO
GRANT EXECUTE ON  [dbo].[mtpfn_ScaleProjCost] TO [db_fnExecutor]
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblCPI]](../../../Tables/dbo_tblCPI.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewProjEdition]](../../../Views/dbo_viewProjEdition.md)
* [[dbo].[viewReviewProjectsArchive]](../../../Views/dbo_viewReviewProjectsArchive.md)
* [[dbo].[viewReviewProjEdition]](../../../Views/dbo_viewReviewProjEdition.md)
* [[dbo].[viewWebMapData_2018Update]](../../../Views/dbo_viewWebMapData_2018Update.md)
* [[dbo].[mtpfn_currentProjects]](../Table-valued_Functions/dbo_mtpfn_currentProjects.md)
* [[dbo].[mtpfn_predictProject]](../Table-valued_Functions/dbo_mtpfn_predictProject.md)
* [[dbo].[mtpfn_predictProject_draftPlan]](../Table-valued_Functions/dbo_mtpfn_predictProject_draftPlan.md)
* [[dbo].[mtpfn_ReviewProjects]](../Table-valued_Functions/dbo_mtpfn_ReviewProjects.md)
* [[dbo].[mtpfn_ScaledProjCostFromAppGUID]](dbo_mtpfn_ScaledProjCostFromAppGUID.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

