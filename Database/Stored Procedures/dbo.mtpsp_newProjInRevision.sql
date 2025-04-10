SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[mtpsp_newProjInRevision]
	@mtpid  int, 
	@RevisionID int
as

BEGIN TRY

BEGIN TRAN

/*
DECLARE @RevisionID INT
SELECT @RevisionID = RevisionID 
FROM tblRevision
WHERE RevisionName = @Revision
*/

	If (
		select COUNT(*) from tblReviewProject 
		where  RevisionID = @RevisionID and MTPID = @mtpid
	) > 0 RAISERROR (
		'Project already exists in the destination revision',
		11, -- severity
		1 -- state
	)
	

declare @appguid uniqueidentifier
select @appguid = newid()

INSERT INTO tblReviewProject (AppGUID, RevisionID, MTPID, DateStamp, Edit, ReviewTypeID)
select @appguid, @RevisionID, @mtpid, GETDATE(),  1,1

/*
INSERT INTO tblReviewProj_ImpType
SELECT @appguid, ImpTypeID, isPrimary
FROM tblProj_ImpType
WHERE MTPID = @mtpid
*/

INSERT INTO tblReviewProjEdition (AppGUID, EditionID)
SELECT @appguid, EditionID
FROM tblRevision
where RevisionID = @RevisionID


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
GRANT EXECUTE ON  [dbo].[mtpsp_newProjInRevision] TO [db_spExecutor]
GO
