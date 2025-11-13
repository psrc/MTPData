SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[mtpsp_projToRevision]
	@mtpid  INT, 
	@RevisionID NVARCHAR(100)
AS

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
	EstCostYear, CompletionYear, MTPStatus, ProjectOn, ProjectFrom, ProjectTo, MilePostFrom, MilePostTo, CountyID, StateRouteID, FuncClassID, 
	StartYear, WebLinks, PrimaryImpType, DatePosted, DateOverwritten, Edit, ReviewTypeID)
select @appguid, @RevisionID, GETDATE(), MTPID, Agency, Title, ProjDesc, TotProjCost, Contactname, ContactPhone, ContactEmail, 
	EstCostYear, CompletionYear, MTPStatus, ProjectOn, ProjectFrom, ProjectTo, MilePostFrom, MilePostTo, CountyID, StateRouteID, FuncClassID, 
	StartYear, WebLinks, PrimaryImpType, NULL, NULL, 1,1
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
WHERE MTPID = @mtpid

INSERT INTO tblReviewProjectLog (AppGUID, NoteDate, Author, Note, RevisionID, LogType)
SELECT @appguid,  NoteDate, Author, Note, RevisionID, LogType
FROM tblProjectLog
WHERE MTPID = @mtpid

INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
SELECT @appguid, mtpid, QuestionName, Response 
FROM tblPrioritization
WHERE MTPID = @mtpid

INSERT INTO tblReviewProjScores (AppGUID, MTPID, QuestionName, Response)
SELECT @AppGUID, mtpid, QuestionName, Response 
FROM tblProjScores 
WHERE MTPID = @mtpid

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
