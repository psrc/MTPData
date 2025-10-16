#### 

[Project](../../../../../../index.md) > [SQLserver](../../../../../index.md) > [User databases](../../../../index.md) > [MTPData](../../../index.md) > Programmability > Functions > [Table-valued Functions](Table-valued_Functions.md) > dbo.mtpfn_ControlTotals_ConstrainedPlan

# ![Table-valued Functions](../../../../../../Images/Function_Table32.png) [dbo].[mtpfn_ControlTotals_ConstrainedPlan]

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
| @RevisionID | tinyint | 1 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE FUNCTION [dbo].[mtpfn_ControlTotals_ConstrainedPlan](@RevisionID tinyint)
RETURNS TABLE
AS
RETURN

	select 
		case MTPStatus
			when 'Unprogrammed' THEN 'unconstrained'
			ELSE 'constrained'
		end as Section,
		dbo.fnCurrency(sum(ScaledCost)) as SummedCost,
		e.CostYear
	from mtpfn_predictProject(@RevisionID) pp
		, tblRevision r join tblEdition e ON r.EditionID = e.EditionID
	where r.RevisionID = @RevisionID
	group by 
		case MTPStatus
			when 'Unprogrammed' THEN 'unconstrained'
			ELSE 'constrained'
		end
		,r.EditionID, e.CostYear
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblEdition]](../../../Tables/dbo_tblEdition.md)
* [[dbo].[tblRevision]](../../../Tables/dbo_tblRevision.md)
* [[dbo].[fnCurrency]](../Scalar-valued_Functions/dbo_fnCurrency.md)
* [[dbo].[mtpfn_predictProject]](dbo_mtpfn_predictProject.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

