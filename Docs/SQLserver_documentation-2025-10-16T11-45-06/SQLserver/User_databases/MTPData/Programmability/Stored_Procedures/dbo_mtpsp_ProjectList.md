#### 

[Project](../../../../../index.md) > [SQLserver](../../../../index.md) > [User databases](../../../index.md) > [MTPData](../../index.md) > Programmability > [Stored Procedures](Stored_Procedures.md) > dbo.mtpsp_ProjectList

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [dbo].[mtpsp_ProjectList]

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
CREATE PROCEDURE [dbo].[mtpsp_ProjectList] @EditionID smallint
AS
SELECT *
FROM viewProject p
WHERE p.MTPID in (select distinct MTPID from tblProjEdition where EditionID = @EditionID)
GO
GRANT EXECUTE ON  [dbo].[mtpsp_ProjectList] TO [db_spExecutor]
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblProjEdition]](../../Tables/dbo_tblProjEdition.md)
* [[dbo].[viewProject]](../../Views/dbo_viewProject.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

