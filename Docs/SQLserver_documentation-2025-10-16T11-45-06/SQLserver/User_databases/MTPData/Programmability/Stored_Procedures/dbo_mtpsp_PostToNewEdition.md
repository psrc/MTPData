#### 

[Project](../../../../../index.md) > [SQLserver](../../../../index.md) > [User databases](../../../index.md) > [MTPData](../../index.md) > Programmability > [Stored Procedures](Stored_Procedures.md) > dbo.mtpsp_PostToNewEdition

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [dbo].[mtpsp_PostToNewEdition]

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
| @OldEditionID | int | 4 |
| @NewEditionID | int | 4 |
| @RevisionID | int | 4 |


---

## <a name="#permissions"></a>Permissions

| Type | Action | Owning Principal |
|---|---|---|
| Grant | EXECUTE | db_spExecutor |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE PROCEDURE [dbo].[mtpsp_PostToNewEdition] 
	@OldEditionID int,
	@NewEditionID int,
	@RevisionID int
AS
BEGIN TRY
BEGIN TRAN

-- Tag any project in the "old edition" but not in revision @RevisionID as belonging to @NewEdition:  
INSERT INTO tblProjEdition (MTPID, EditionID)
SELECT MTPID, @NewEditionID
FROM tblProjEdition
WHERE EditionID = @OldEditionID
	AND MTPID NOT IN (
		SELECT DISTINCT MTPID
		FROM tblReviewProject	
		WHERE RevisionID = @RevisionID
	)

-- Post the revision, which should add any more projects therein to the new edition 
EXEC mtpsp_PostRevision @RevisionID

COMMIT TRAN
END TRY

BEGIN CATCH

    SELECT 
        ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
        
      ROLLBACK TRANSACTION;
     
END CATCH;
GO
GRANT EXECUTE ON  [dbo].[mtpsp_PostToNewEdition] TO [db_spExecutor]
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblProjEdition]](../../Tables/dbo_tblProjEdition.md)
* [[dbo].[tblReviewProject]](../../Tables/dbo_tblReviewProject.md)
* [[dbo].[mtpsp_PostRevision]](dbo_mtpsp_PostRevision.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

