#### 

[Project](../../../../../index.md) > [SQLserver](../../../../index.md) > [User databases](../../../index.md) > [MTPData](../../index.md) > Programmability > [Stored Procedures](Stored_Procedures.md) > dbo.mtpsp_AddRevisionComment

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [dbo].[mtpsp_AddRevisionComment]

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
| @AppGUID | uniqueidentifier | 16 |
| @Note | nvarchar(4000) | 8000 |


---

## <a name="#permissions"></a>Permissions

| Type | Action | Owning Principal |
|---|---|---|
| Grant | EXECUTE | db_spExecutor |


---

## <a name="#sqlscript"></a>SQL Script

```sql

CREATE PROCEDURE [dbo].[mtpsp_AddRevisionComment] (
	@AppGUID uniqueidentifier, 
	@Note nvarchar(4000)
)
as
DECLARE @LogType TINYINT
DECLARE @RevisionID INT

SELECT @LogType = 2 -- 2 for revision comments, i.e. not project log

SELECT @RevisionID = RevisionID
FROM tblReviewProject
WHERE AppGUID = @AppGUID

INSERT INTO  tblReviewProjectLog( AppGUID, NoteDate,  Note, RevisionID, LogType )
VALUES ( @AppGUID, getdate(), @Note, @RevisionID, @LogType)
GO
GRANT EXECUTE ON  [dbo].[mtpsp_AddRevisionComment] TO [db_spExecutor]
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblReviewProject]](../../Tables/dbo_tblReviewProject.md)
* [[dbo].[tblReviewProjectLog]](../../Tables/dbo_tblReviewProjectLog.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

