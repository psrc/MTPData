SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   procedure [dbo].[mtpsp_PostRevisionProj]
	@MTPID int,
	@Revision int
as

BEGIN TRY

BEGIN TRAN

DELETE FROM tblProject
where MTPID = @MTPID 

DELETE FROM tblProj_SecondaryImpType 
where MTPID = @MTPID 

DELETE FROM tblProjCharacteristics
where MTPID = @MTPID

DELETE FROM tblPrioritization 
where MTPID = @MTPID

DELETE FROM tblProjEdition 
where MTPID = @MTPID 

DELETE FROM tblProjectLog
where MTPID = @MTPID 

INSERT INTO tblProject
SELECT MTPID, Agency,  Title, ProjDesc, TotProjCost,
	ContactName, ContactPhone, ContactEmail,
	EstCostYear, CompletionYear, MTPStatus, ProjectOn,
	ProjectFrom, ProjectTo, MilePostFrom, MilePostTo, CountyID,
	StateRouteID, FuncClassID, StartYear, WebLinks, PrimaryImpType
FROM tblReviewProject
WHERE RevisionID = @Revision AND MTPID = @MTPID

INSERT INTO tblProj_SecondaryImpType
SELECT r.MTPID, s.ImpTypeID
FROM tblReviewProject r
	JOIN tblReviewProj_SecondaryImpType s on r.AppGUID = s.AppGUID
WHERE r.RevisionID = @Revision AND r.MTPID = @MTPID

INSERT INTO tblProjCharacteristics (MTPID, CharacteristicID)
SELECT r.MTPID, c.CharacteristicID
FROM tblReviewProject r
	JOIN tblReviewProjCharacteristics c ON r.AppGUID = c.AppGUID
WHERE r.RevisionID = @Revision AND r.MTPID = @MTPID

INSERT INTO tblProjEdition
SELECT p.MTPID, pe.EditionID
FROM tblReviewProject p
	join tblReviewProjEdition pe on p.APPGUID = pe.APPGUID
where p.RevisionID = @Revision AND p.MTPID = @MTPID

INSERT INTO tblPrioritization (MTPID, QuestionName, Response)
SELECT p.MTPID, pe.QuestionName, pe.Response
FROM tblReviewProject p
	join tblReviewPrioritization pe on p.APPGUID = pe.APPGUID
where p.RevisionID = @Revision AND p.MTPID = @MTPID

INSERT INTO tblProjScores (MTPID, QuestionName, Response)
SELECT p.MTPID, pe.QuestionName, pe.Response
FROM tblReviewProject p
	join tblReviewProjScores pe on p.APPGUID = pe.APPGUID
where p.RevisionID = @Revision AND p.MTPID = @MTPID

INSERT INTO tblProjectLog (MTPID, RevisionID, NoteDate, Author, Note) 
SELECT p.MTPID, isnull(pl.RevisionID, p.RevisionID), NoteDate, Author, Note
FROM tblReviewProject p
	join tblReviewProjectLog pl on p.APPGUID = pl.AppGUID
WHERE p.RevisionID = @Revision AND p.MTPID = @MTPID

UPDATE tblReviewProject
SET DatePosted = getdate()
WHERE RevisionID = @Revision AND MTPID = @MTPID

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
GRANT EXECUTE ON  [dbo].[mtpsp_PostRevisionProj] TO [db_spExecutor]
GO
