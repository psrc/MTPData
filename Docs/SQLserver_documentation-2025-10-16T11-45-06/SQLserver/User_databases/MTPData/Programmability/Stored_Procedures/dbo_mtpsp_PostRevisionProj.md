#### 

[Project](../../../../../index.md) > [SQLserver](../../../../index.md) > [User databases](../../../index.md) > [MTPData](../../index.md) > Programmability > [Stored Procedures](Stored_Procedures.md) > dbo.mtpsp_PostRevisionProj

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [dbo].[mtpsp_PostRevisionProj]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |


---

## <a name="#parameters"></a>Parameters

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| @MTPID | int | 4 |
| @Revision | int | 4 |


---

## <a name="#permissions"></a>Permissions

| Type | Action | Owning Principal |
|---|---|---|
| Grant | EXECUTE | db_spExecutor |


---

## <a name="#sqlscript"></a>SQL Script

```sql
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

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblPrioritization]](../../Tables/dbo_tblPrioritization.md)
* [[dbo].[tblProj_SecondaryImpType]](../../Tables/dbo_tblProj_SecondaryImpType.md)
* [[dbo].[tblProjCharacteristics]](../../Tables/dbo_tblProjCharacteristics.md)
* [[dbo].[tblProject]](../../Tables/dbo_tblProject.md)
* [[dbo].[tblProjectLog]](../../Tables/dbo_tblProjectLog.md)
* [[dbo].[tblProjEdition]](../../Tables/dbo_tblProjEdition.md)
* [[dbo].[tblProjScores]](../../Tables/dbo_tblProjScores.md)
* [[dbo].[tblReviewPrioritization]](../../Tables/dbo_tblReviewPrioritization.md)
* [[dbo].[tblReviewProj_SecondaryImpType]](../../Tables/dbo_tblReviewProj_SecondaryImpType.md)
* [[dbo].[tblReviewProjCharacteristics]](../../Tables/dbo_tblReviewProjCharacteristics.md)
* [[dbo].[tblReviewProject]](../../Tables/dbo_tblReviewProject.md)
* [[dbo].[tblReviewProjectLog]](../../Tables/dbo_tblReviewProjectLog.md)
* [[dbo].[tblReviewProjEdition]](../../Tables/dbo_tblReviewProjEdition.md)
* [[dbo].[tblReviewProjScores]](../../Tables/dbo_tblReviewProjScores.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

