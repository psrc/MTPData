#### 

[Project](../../../../../index.md) > [SQLserver](../../../../index.md) > [User databases](../../../index.md) > [MTPData](../../index.md) > Programmability > [Stored Procedures](Stored_Procedures.md) > dbo.mtpsp_StageToReview

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [dbo].[mtpsp_StageToReview]

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
| @Revision | int | 4 |


---

## <a name="#permissions"></a>Permissions

| Type | Action | Owning Principal |
|---|---|---|
| Grant | EXECUTE | db_spExecutor |


---

## <a name="#sqlscript"></a>SQL Script

```sql



CREATE PROCEDURE [dbo].[mtpsp_StageToReview] @Revision int
AS

/*
BEGIN TRY
BEGIN TRAN
*/
	EXEC mtpsp_StageToReview_Project @Revision

	EXEC mtpsp_StageToReview_Prioritization

	--EXEC mtpsp_StageToReview_Proj_ImpType

	EXEC mtpsp_StageToReviewProjEdition


GO
GRANT EXECUTE ON  [dbo].[mtpsp_StageToReview] TO [db_spExecutor]
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[mtpsp_StageToReview_Prioritization]](dbo_mtpsp_StageToReview_Prioritization.md)
* [[dbo].[mtpsp_StageToReview_Project]](dbo_mtpsp_StageToReview_Project.md)
* [[dbo].[mtpsp_StageToReviewProjEdition]](dbo_mtpsp_StageToReviewProjEdition.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

