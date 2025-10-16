#### 

[Project](../../../../../index.md) > [SQLserver](../../../../index.md) > [User databases](../../../index.md) > [MTPData](../../index.md) > Programmability > [Stored Procedures](Stored_Procedures.md) > dbo.mtpsp_predictProject

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [dbo].[mtpsp_predictProject]

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






CREATE PROCEDURE [dbo].[mtpsp_predictProject]
	@RevisionID as int
AS

DECLARE @EditionID tinyint

IF @RevisionID > 0
	SELECT * FROM dbo.mtpfn_predictProject(@RevisionID)
ELSE
begin
	SELECT @EditionID = EditionID
	FROM tblRevision
	WHERE RevisionID = (select max(RevisionID) from tblRevision where Posted = 1)

	SELECT * FROM dbo.mtpfn_currentProjects(@EditionID)
end
GO
GRANT EXECUTE ON  [dbo].[mtpsp_predictProject] TO [db_spExecutor]
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblRevision]](../../Tables/dbo_tblRevision.md)
* [[dbo].[mtpfn_currentProjects]](../Functions/Table-valued_Functions/dbo_mtpfn_currentProjects.md)
* [[dbo].[mtpfn_predictProject]](../Functions/Table-valued_Functions/dbo_mtpfn_predictProject.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

