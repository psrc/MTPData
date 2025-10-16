#### 

[Project](../../../../../index.md) > [SQLserver](../../../../index.md) > [User databases](../../../index.md) > [MTPData](../../index.md) > Programmability > [Stored Procedures](Stored_Procedures.md) > dbo.mtpsp_AddNewRevision

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [dbo].[mtpsp_AddNewRevision]

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
| @RevisionName | nvarchar(100) | 200 |
| @intRevisionTypeID | tinyint | 1 |
| @SourceEditionID | smallint | 2 |
| @EditionID | smallint | 2 |


---

## <a name="#permissions"></a>Permissions

| Type | Action | Owning Principal |
|---|---|---|
| Grant | EXECUTE | db_spExecutor |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE PROCEDURE [dbo].[mtpsp_AddNewRevision]
	@RevisionName nvarchar(100),
	@intRevisionTypeID tinyint,
	@SourceEditionID smallint,
	@EditionID smallint
AS
INSERT INTO tblRevision (RevisionName, RevisionTypeID,  EditionID, SourceEditionID)
VALUES (@RevisionName, @intRevisionTypeID,  @EditionID, @SourceEditionID)
GO
GRANT EXECUTE ON  [dbo].[mtpsp_AddNewRevision] TO [db_spExecutor]
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblRevision]](../../Tables/dbo_tblRevision.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

