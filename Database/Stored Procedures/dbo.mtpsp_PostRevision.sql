SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE   procedure [dbo].[mtpsp_PostRevision]
	@RevisionID INT
as

BEGIN TRY

BEGIN TRAN

/*
CHECK THAT THE REVISION HAS NOT YET BEEN POSTED.  IF IT HAS, ERROR OUT
*/
--Check that all projects are flagged with ReviewType of "OK"
IF  (
	SELECT count(*) 
	FROM viewReviewProject p
		left join tblRevisionReviewTypes rt ON p.ReviewTypeID = rt.ReviewTypeID
	WHERE p.RevisionID = @RevisionID
		AND rt.ReviewTypeName <> 'OK'
	) > 0 RAISERROR('Some projects are not yet OK`d', 11,1)


DECLARE @now as datetime
DECLARE @appguid as uniqueidentifier

SELECT @now = getdate()
SELECT @appguid = newid()

-- Archive the changes in this revision per viewRevisionSummary
INSERT INTO tblRevisionSummary (MTPID, RevisionID, Field, PostedVal, RevisionVal)
SELECT MTPID, RevisionID, Field, Posted_val, revision_val 
FROM viewRevisionSummary
WHERE RevisionID = @RevisionID

-- mark outgoing records as overwritten
UPDATE tblReviewProject
SET DateOverwritten = @now
WHERE DatePosted IS NOT NULL
	and DateOverwritten IS NULL

-- add any projects from the current MTP that are not yet part of the revision.  In this way, tblReviewProject
--   will become an archive of the entire suite of projects for each revision
INSERT INTO tblReviewProject (AppGUID, RevisionID, DateStamp, 
	MTPID, Agency, Title,  ProjDesc, TotProjCost, ContactName, ContactPhone, ContactEmail, EstCostYear,
	CompletionYear, MTPStatus, ProjectOn, ProjectFrom, ProjectTo, MilePostFrom, MilePostTo, CountyID, StateRouteID, 
	FuncClassID, STartYear, WebLinks,  DatePosted, DateOverwritten,  [Edit], ReviewTypeID, PrimaryImpType)
select NEWID(), @RevisionID, GETDATE(), 
	MTPID, Agency, Title, ProjDesc, TotProjCost, ContactName, ContactPhone, ContactEmail, EstCostYear,
	CompletionYear, MTPStatus, ProjectOn, ProjectFrom, ProjectTo, MilePostFrom, MilePostTo, CountyID, StateRouteID, 
	FuncClassID, STartYear, WebLinks,  NULL, NULL,  0, 1, PrimaryImpType
from tblProject
where mtpid not in (SELECT DISTINCT mtpid from tblReviewProject WHERE RevisionID = @RevisionID)

INSERT INTO tblReviewProj_SecondaryImpType
SELECT p.AppGUID, s.ImpTypeID
FROM tblProj_SecondaryImpType s 
	JOIN tblReviewProject p ON s.MTPID = p.MTPID
WHERE p.RevisionID = @RevisionID AND p.Edit = 0

INSERT INTO tblReviewProjCharacteristics(AppGUID, CharacteristicID)
SELECT p.AppGUID, c.CharacteristicID
FROM tblProjCharacteristics c
	JOIN tblReviewProject p ON c.MTPID = p.MTPID
WHERE p.RevisionID = @RevisionID AND p.Edit = 0

INSERT INTO tblReviewPrioritization(AppGUID, MTPID, QuestionName, Response)
SELECT p.AppGUID, p.MTPID, pr.QuestionName, pr.Response
FROM tblPrioritization pr
	JOIN tblReviewProject p ON pr.MTPID = p.MTPID
WHERE p.RevisionID = @RevisionID AND p.Edit = 0

INSERT INTO tblReviewProjScores(AppGUID, MTPID, QuestionName, Response)
SELECT p.AppGUID, p.MTPID, pr.QuestionName, pr.Response
FROM tblProjScores pr
	JOIN tblReviewProject p ON pr.MTPID = p.MTPID
WHERE p.RevisionID = @RevisionID AND p.Edit = 0

-- Add in current & historical Edition info
-- This doesn't roll any projects forward into a new edition
INSERT INTO tblReviewProjEdition
SELECT p.AppGUID, pe.EditionID
FROM tblProjEdition pe
	JOIN tblReviewProject p ON pe.MTPID = p.MTPID
WHERE p.RevisionID = @RevisionID AND p.Edit = 0

INSERT INTO tblReviewProjectLog ( AppGUID, NoteDate, Author, Note, RevisionID)
SELECT p.AppGUID, l.NoteDate, l.Author, l.Note, l.RevisionID
FROM tblProjectLog l
	JOIN tblReviewProject p ON l.MTPID = p.MTPID
WHERE p.RevisionID = @RevisionID 
	AND p.Edit = 0

INSERT INTO tblReviewProjCosponsors (AppGUID, AgencyNo)
SELECT p.AppGUID, AgencyNo
FROM tblProjCosponsors c
	JOIN tblReviewProject p ON c.MTPID = p.MTPID
WHERE p.RevisionID = @RevisionID AND p.Edit = 0

-- clean out the posted data tables
DELETE FROM tblProject
where MTPID in (
	select distinct MTPID 
	from tblReviewProject rp
	where rp.RevisionID = @RevisionID
)

DELETE FROM tblProj_SecondaryImptype 
where MTPID in (
	select distinct MTPID 
	from tblReviewProject rp
	where rp.RevisionID = @RevisionID
)

DELETE FROM tblProjEdition 
where MTPID in (
	select distinct MTPID 
	from tblReviewProject rp
	where rp.RevisionID = @RevisionID
)

DELETE FROM tblProjectLog
where MTPID in (
	select distinct MTPID 
	from tblReviewProject rp
	where rp.RevisionID = @RevisionID
)

DELETE FROM tblProjCosponsors
WHERE MTPID IN (
	select distinct MTPID 
	from tblReviewProject rp
	where rp.RevisionID = @RevisionID
)

DELETE FROM tblProjCharacteristics
WHERE mtpid in (
	select distinct MTPID 
	from tblReviewProject rp
	where rp.RevisionID = @RevisionID
)

DELETE FROM tblPrioritization
WHERE mtpid in (
	select distinct MTPID 
	from tblReviewProject rp
	where rp.RevisionID = @RevisionID
)


DELETE FROM tblProjScores
WHERE MTPID IN (
	select distinct MTPID 
	from tblReviewProject rp
	where rp.RevisionID = @RevisionID
)

-- add the new projects to the posted tables
INSERT INTO tblProject (
	MTPID, Agency, Title, ProjDesc, TotProjCost,
	ContactName, ContactPhone, ContactEmail,
	 EstCostYear, CompletionYear, MTPStatus, ProjectOn,
	ProjectFrom, ProjectTo, MilePostFrom, MilePostTo,  CountyID, 
	StateRouteID, FuncClassID,	StartYear, WebLinks, PrimaryImpType
)
SELECT MTPID, Agency, Title, ProjDesc, TotProjCost,
	ContactName, ContactPhone, ContactEmail,
	 EstCostYear, CompletionYear, MTPStatus, ProjectOn,
	ProjectFrom, ProjectTo, MilePostFrom, MilePostTo,  CountyID, 
	StateRouteID, FuncClassID,	StartYear, WebLinks, PrimaryImpType
FROM tblReviewProject rp
WHERE RevisionID = @RevisionID


INSERT INTO tblProj_SecondaryImpType
SELECT rp.MTPID, s.ImpTypeID
FROM tblReviewProject rp
	JOIN tblReviewProj_SecondaryImpType s on rp.AppGUID = s.AppGUID
where rp.RevisionID = @RevisionID

INSERT INTO tblProjCharacteristics (MTPID, CharacteristicID)
SELECT rp.MTPID, c.CharacteristicID
FROM tblReviewProject rp
	JOIN tblReviewProjCharacteristics c ON rp.AppGUID = c.AppGUID
where rp.RevisionID = @RevisionID

-- Insert rows into tblProjEdition as they exist in the projects in the revision
-- All revision projecs should already have current and historical edition data before this point.
INSERT INTO tblProjEdition
SELECT rp.MTPID, pe.EditionID
FROM tblReviewProject rp
	join tblReviewProjEdition pe on rp.APPGUID = pe.APPGUID
where rp.RevisionID = @RevisionID

INSERT INTO tblPrioritization (MTPID, QuestionName, Response)
SELECT rp.MTPID, pr.QuestionName, pr.Response
FROM tblReviewProject as rp 
    join tblReviewPrioritization as pr on rp.AppGUID = pr.AppGUID 
where rp.RevisionID = @RevisionID 

INSERT INTO tblProjScores (MTPID, QuestionName, Response)
SELECT ps.MTPID, ps.QuestionName, ps.Response
from tblReviewProject rp 
    join tblReviewProjScores ps on rp.AppGUID = ps.AppGUID
where rp.RevisionID = @RevisionID

-- Add the new Edition associated with the revision to all projects in the revision
--  except those with MTPStatus = "Not in MTP" or MTPStatus = "Cancelled"
INSERT INTO tblProjEdition(MTPID, EditionID)
SELECT rp.MTPID, r.EditionID
FROM tblReviewProject rp
	join tblReviewProjEdition pe on rp.AppGUID = pe.AppGUID	
	JOIN tblRevision r ON rp.RevisionID = r.RevisionID and pe.EditionID = r.SourceEditionID
	JOIN tblRevisionType rt ON r.RevisionTypeID = rt.RevisionTypeID
	LEFT JOIN tblReviewProjEdition rpe ON rp.AppGUID = rpe.AppGUID and rpe.EditionID = r.EditionID
WHERE rp.RevisionID = @RevisionID
	and rpe.APPGUID is null
	and rt.RevisionTypeName not in ('Update')
	and rp.MTPStatus not in ( -1, -3 )



INSERT INTO tblProjectLog
SELECT p.MTPID,  NoteDate, Author, Note, isnull(pl.RevisionID, @RevisionID), pl.LogType
FROM tblReviewProject p
	join tblReviewProjectLog pl on p.APPGUID = pl.AppGUID
WHERE p.RevisionID = @RevisionID
	AND pl.LogType <> 2 -- don't post revision review comments

INSERT INTO tblProjCosponsors (MTPID, AgencyNo)
SELECT p.MTPID, pc.AgencyNo
FROM tblReviewProject p
	JOIN tblReviewProjCosponsors pc on p.AppGUID = pc.AppGUID
WHERE p.RevisionID = @RevisionID

-- now we need to flag the newly-posted projects with a DatePosted value
UPDATE tblReviewProject
Set DatePosted = @now
WHERE RevisionID = @RevisionID


UPDATE tblRevision
SET Posted = 1
WHERE RevisionID = @RevisionID

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
GRANT EXECUTE ON  [dbo].[mtpsp_PostRevision] TO [db_spExecutor]
GO
