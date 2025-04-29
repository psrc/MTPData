SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[mtpsp_projToRevision]
	@mtpid  int, 
	@RevisionID nvarchar(100)
as

BEGIN TRY

BEGIN TRAN


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

INSERT INTO tblReviewProject ( AppGUID, RevisionID, DateStamp, MTPID, Agency, Title, ProjDesc, TotProjCost, Contactname, ContactPhone, ContactEmail, 
	EstCostYear, CompletionYear, MTPStatus, ProjectOn, ProjectFrom, ProjectTo, MilePostFrom, MilePostTo, CountyID, StateRouteID, FuncClassID, StartYear, WebLinks,
	PrimaryImpType, DatePosted, DateOverwritten, Edit, ReviewTypeID)
select @appguid, @RevisionID, GETDATE(), *, NULL, NULL, 1,1
from tblProject
where mtpid = @mtpid

INSERT INTO tblReviewProj_SecondaryImpType
SELECT @appguid, ImpTypeID
FROM tblProj_SecondaryImpType
WHERE MTPID = @mtpid

INSERT INTO tblReviewProjCharacteristics (AppGUID, CharacteristicID)
SELECT @appguid, CharacteristicID
from tblProjCharacteristics
WHERE mtpid = @mtpid

INSERT INTO tblReviewProjEdition
SELECT @appguid, EditionID
FROM tblProjEdition
where MTPID = @mtpid

INSERT INTO tblReviewProjectLog (AppGUID, NoteDate, Author, Note, RevisionID, LogType)
SELECT @appguid,  NoteDate, Author, Note, RevisionID, LogType
FROM tblProjectLog
WHERE MTPID = @mtpid

insert into tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
select @appguid, mtpid, QuestionName, Response 
from tblPrioritization
where MTPID = @mtpid

insert into tblReviewProjScores (AppGUID, MTPID, QuestionName, Response)
select @AppGUID, mtpid, QuestionName, Response 
from tblProjScores 
where MTPID = @mtpid

INSERT INTO tblReviewProjCosponsors (AppGUID, AgencyNo)
SELECT @appguid, AgencyNo
FROM tblProjCosponsors
WHERE MTPID = @mtpid

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
GRANT EXECUTE ON  [dbo].[mtpsp_projToRevision] TO [db_spExecutor]
GO
