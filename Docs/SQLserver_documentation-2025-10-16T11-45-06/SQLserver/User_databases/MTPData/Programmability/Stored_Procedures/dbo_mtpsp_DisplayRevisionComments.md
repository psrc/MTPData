#### 

[Project](../../../../../index.md) > [SQLserver](../../../../index.md) > [User databases](../../../index.md) > [MTPData](../../index.md) > Programmability > [Stored Procedures](Stored_Procedures.md) > dbo.mtpsp_DisplayRevisionComments

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [dbo].[mtpsp_DisplayRevisionComments]

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


---

## <a name="#permissions"></a>Permissions

| Type | Action | Owning Principal |
|---|---|---|
| Grant | EXECUTE | db_spExecutor |


---

## <a name="#sqlscript"></a>SQL Script

```sql

create PROCEDURE [dbo].[mtpsp_DisplayRevisionComments]
	@AppGUID uniqueidentifier

AS 

	DECLARE @LogType TINYINT

	SELECT @LogType = 2 -- 2 for revision comments, i.e. not project log


	SELECT *
	FROM tblReviewProjectLog
	WHERE AppGUID = @AppGUID
		and LogType = @LogType
	ORDER BY NoteDate desc
GO
GRANT EXECUTE ON  [dbo].[mtpsp_DisplayRevisionComments] TO [db_spExecutor]
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblReviewProjectLog]](../../Tables/dbo_tblReviewProjectLog.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

