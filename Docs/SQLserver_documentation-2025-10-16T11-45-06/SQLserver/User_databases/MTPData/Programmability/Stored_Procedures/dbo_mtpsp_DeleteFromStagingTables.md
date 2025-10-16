#### 

[Project](../../../../../index.md) > [SQLserver](../../../../index.md) > [User databases](../../../index.md) > [MTPData](../../index.md) > Programmability > [Stored Procedures](Stored_Procedures.md) > dbo.mtpsp_DeleteFromStagingTables

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [dbo].[mtpsp_DeleteFromStagingTables]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |


---

## <a name="#sqlscript"></a>SQL Script

```sql


CREATE PROCEDURE [dbo].[mtpsp_DeleteFromStagingTables]
AS

BEGIN TRY
BEGIN TRAN

	DELETE FROM tblStagePrioritization
	DELETE FROM tblStageProject
	DELETE FROM tblStageProj_SecondaryImpType
	DELETE FROM tblStageProjCharacteristics


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

END CATCH

GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblStagePrioritization]](../../Tables/dbo_tblStagePrioritization.md)
* [[dbo].[tblStageProj_SecondaryImpType]](../../Tables/dbo_tblStageProj_SecondaryImpType.md)
* [[dbo].[tblStageProjCharacteristics]](../../Tables/dbo_tblStageProjCharacteristics.md)
* [[dbo].[tblStageProject]](../../Tables/dbo_tblStageProject.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

