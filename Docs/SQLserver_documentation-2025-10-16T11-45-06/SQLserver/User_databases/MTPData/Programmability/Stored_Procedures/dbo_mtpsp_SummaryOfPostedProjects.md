#### 

[Project](../../../../../index.md) > [SQLserver](../../../../index.md) > [User databases](../../../index.md) > [MTPData](../../index.md) > Programmability > [Stored Procedures](Stored_Procedures.md) > dbo.mtpsp_SummaryOfPostedProjects

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [dbo].[mtpsp_SummaryOfPostedProjects]

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
| @EditionID | smallint | 2 |


---

## <a name="#permissions"></a>Permissions

| Type | Action | Owning Principal |
|---|---|---|
| Grant | EXECUTE | db_spExecutor |


---

## <a name="#sqlscript"></a>SQL Script

```sql
create procedure [dbo].[mtpsp_SummaryOfPostedProjects] @EditionID smallint
as

	select p.MTPStatus, count(*) as ProjectCount,
		dbo.fnCurrency(sum(p.ScaledCost)) as TotalScaledCost
	from dbo.mtpfn_currentProjects(@EditionID) p
	group by p.MTPStatus
GO
GRANT EXECUTE ON  [dbo].[mtpsp_SummaryOfPostedProjects] TO [db_spExecutor]
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[fnCurrency]](../Functions/Scalar-valued_Functions/dbo_fnCurrency.md)
* [[dbo].[mtpfn_currentProjects]](../Functions/Table-valued_Functions/dbo_mtpfn_currentProjects.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

