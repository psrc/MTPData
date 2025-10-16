#### 

[Project](../../../../../index.md) > [SQLserver](../../../../index.md) > [User databases](../../../index.md) > [MTPData](../../index.md) > Programmability > [Stored Procedures](Stored_Procedures.md) > dbo.mtpsp_projToRevision

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [dbo].[mtpsp_projToRevision]

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
| @mtpid | int | 4 |
| @RevisionID | nvarchar(100) | 200 |


---

## <a name="#permissions"></a>Permissions

| Type | Action | Owning Principal |
|---|---|---|
| Grant | EXECUTE | db_spExecutor |


---

## <a name="#sqlscript"></a>SQL Script

```sql


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

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblPrioritization]](../../Tables/dbo_tblPrioritization.md)
* [[dbo].[tblProj_SecondaryImpType]](../../Tables/dbo_tblProj_SecondaryImpType.md)
* [[dbo].[tblProjCharacteristics]](../../Tables/dbo_tblProjCharacteristics.md)
* [[dbo].[tblProjCosponsors]](../../Tables/dbo_tblProjCosponsors.md)
* [[dbo].[tblProject]](../../Tables/dbo_tblProject.md)
* [[dbo].[tblProjectLog]](../../Tables/dbo_tblProjectLog.md)
* [[dbo].[tblProjEdition]](../../Tables/dbo_tblProjEdition.md)
* [[dbo].[tblProjScores]](../../Tables/dbo_tblProjScores.md)
* [[dbo].[tblReviewPrioritization]](../../Tables/dbo_tblReviewPrioritization.md)
* [[dbo].[tblReviewProj_SecondaryImpType]](../../Tables/dbo_tblReviewProj_SecondaryImpType.md)
* [[dbo].[tblReviewProjCharacteristics]](../../Tables/dbo_tblReviewProjCharacteristics.md)
* [[dbo].[tblReviewProjCosponsors]](../../Tables/dbo_tblReviewProjCosponsors.md)
* [[dbo].[tblReviewProject]](../../Tables/dbo_tblReviewProject.md)
* [[dbo].[tblReviewProjectLog]](../../Tables/dbo_tblReviewProjectLog.md)
* [[dbo].[tblReviewProjEdition]](../../Tables/dbo_tblReviewProjEdition.md)
* [[dbo].[tblReviewProjScores]](../../Tables/dbo_tblReviewProjScores.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

