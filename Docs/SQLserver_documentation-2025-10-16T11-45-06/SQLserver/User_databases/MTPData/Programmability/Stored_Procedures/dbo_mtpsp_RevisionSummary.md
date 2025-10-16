#### 

[Project](../../../../../index.md) > [SQLserver](../../../../index.md) > [User databases](../../../index.md) > [MTPData](../../index.md) > Programmability > [Stored Procedures](Stored_Procedures.md) > dbo.mtpsp_RevisionSummary

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [dbo].[mtpsp_RevisionSummary]

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
| @RevisionID | int | 4 |


---

## <a name="#permissions"></a>Permissions

| Type | Action | Owning Principal |
|---|---|---|
| Grant | EXECUTE | db_spExecutor |


---

## <a name="#sqlscript"></a>SQL Script

```sql

create procedure [dbo].[mtpsp_RevisionSummary] @RevisionID int
as
select * 
from viewRevisionSummary
where RevisionID = @RevisionID
GO
GRANT EXECUTE ON  [dbo].[mtpsp_RevisionSummary] TO [db_spExecutor]
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[viewRevisionSummary]](../../Views/dbo_viewRevisionSummary.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

