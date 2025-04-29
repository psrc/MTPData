SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   PROCEDURE [dbo].[mtpsp_RevisionToRevision] 
	@MTPID int,
	@FromRevisionID INT,
	@ToRevisionID int
AS 
BEGIN TRY
/*
	Copy a project with MTPID = @MTPID from one revision (@FromRevisionID) to another revision (@ToRevisionID).
	This is useful when a project is undergoing changes in a pending revision and also needs to be included 
	in a different revision, as in 
*/

BEGIN TRAN

	
	
	If (
		select COUNT(*) from tblReviewProject 
		where  RevisionID = @ToRevisionID and MTPID = @MTPID
	) > 0 RAISERROR (
		'Project already exists in the destination amendment',
		11, -- severity
		1 -- state
	)
	
	If (
		select COUNT(*) from tblReviewProject 
		where  RevisionID = @FromRevisionID and MTPID = @MTPID
	) = 0 RAISERROR (
		'Project does not exist in the origin amendment',
		11, -- severity
		1 -- state
	)
		
	declare @ToAppGUID uniqueidentifier
	declare @FromAppGUID uniqueidentifier
	select @ToAppGUID = newid()
	select @FromAppGUID = AppGUID 
		FROM tblReviewProject 
		where MTPID = @MTPID AND RevisionID = @FromRevisionID
		
	INSERT INTO tblReviewProject 
		(AppGUID, RevisionID, DateStamp,  MTPID, Agency, PrimaryImpType, Title, ProjDesc, TotProjCost,  ContactName, 
		ContactPhone, ContactEmail,  EstCostYear, CompletionYear, MTPStatus, ProjectOn, ProjectFrom, ProjectTo)
	select @ToAppGUID, @ToRevisionID, GETDATE(),  
		MTPID, Agency, PrimaryImpType, Title, ProjDesc, TotProjCost, ContactName, 
		ContactPhone, ContactEmail,  EstCostYear, CompletionYear, MTPStatus, ProjectOn, ProjectFrom, ProjectTo
	from tblReviewProject
	where AppGUID = @FromAppGUID


	INSERT INTO tblReviewProjCharacteristics (AppGUID, CharacteristicID)
	SELECT @ToAppGUID, CharacteristicID
	FROM tblReviewProjCharacteristics
	WHERE APPGUID = @FromAppGUID

    INSERT INTO tblReviewPrioritization (AppGUID, MTPID, QuestionName, Response)
    SELECT @ToAppGUID, MTPID, QuestionName, Response 
    from tblReviewPrioritization
    where AppGUID = @FromAppGUID

    INSERT INTO tblReviewProjScores (AppGUID, MTPID, QuestionName, Response)
    SELECT @ToAppGUID, MTPID, QuestionName, Response 
    from tblReviewProjScores
    where AppGUID = @FromAppGUID

	INSERT INTO tblReviewProjEdition 
	SELECT @ToAppGUID, EditionID
	FROM tblReviewProjEdition
	WHERE APPGUID = @FromAppGUID

	INSERT INTO tblReviewProjectLog (AppGUID, NoteDate, Author, Note, RevisionID)
	SELECT @ToAppGUID,  NoteDate, Author, Note, RevisionID
	FROM tblReviewProjectLog
	WHERE APPGUID = @FromAppGUID
		AND LogType <> 2
	
	
	INSERT INTO tblReviewProjCosponsors (AppGUID, AgencyNo)
	SELECT @ToAppGUID, AgencyNo
	FROM tblReviewProjCosponsors
	WHERE AppGUID = @FromAppGUID

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
GRANT EXECUTE ON  [dbo].[mtpsp_RevisionToRevision] TO [db_spExecutor]
GO
