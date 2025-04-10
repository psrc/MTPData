SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
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
