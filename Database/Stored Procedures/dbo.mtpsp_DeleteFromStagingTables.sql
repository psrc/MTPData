SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


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
