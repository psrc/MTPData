SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





CREATE PROCEDURE [dbo].[mtpsp_DeleteProjRevision]
	@mtpid  int, 
	@RevisionID int
as

BEGIN TRY

BEGIN TRAN


	If (
		select COUNT(*) from tblReviewProject 
		where  RevisionID = @RevisionID and MTPID = @mtpid
	) =  0 RAISERROR (
		'Project does not exist in the destination revision',
		11, -- severity
		1 -- state
	)

	If (
		select COUNT(*) from tblReviewProject 
		where  RevisionID = @RevisionID and MTPID = @mtpid and DatePosted IS NOT NULL
	) >  0 RAISERROR (
		'The project has already been posted.  Cannot delete from revision tables.',
		11, -- severity
		1 -- state
	)


delete i
from tblReviewProject p
	join tblReviewProj_SecondaryImpType i on p.APPGUID = i.APPGUID
where p.MTPID = @mtpid and p.RevisionID = @RevisionID

delete c
from tblReviewProject p
	join tblReviewProjCharacteristics c on p.APPGUID = c.APPGUID
where p.MTPID = @mtpid and p.RevisionID = @RevisionID

delete e
from tblReviewProject p
	join tblReviewProjEdition e on p.APPGUID = e.APPGUID
where p.MTPID = @mtpid and p.RevisionID = @RevisionID

delete l
from tblReviewProject p
	join tblReviewProjectLog l on p.APPGUID = l.APPGUID
where p.MTPID = @mtpid and p.RevisionID = @RevisionID

DELETE pc
FROM tblReviewProject p
	join tblReviewProjCosponsors pc on p.APPGUID = pc.APPGUID
WHERE p.MTPID = @mtpid and p.RevisionID = @RevisionID

delete from tblReviewProject
where MTPID = @mtpid AND RevisionID = @RevisionID

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
GRANT EXECUTE ON  [dbo].[mtpsp_DeleteProjRevision] TO [db_spExecutor]
GO
