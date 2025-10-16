#### 

[Project](../../../../../index.md) > [SQLserver](../../../../index.md) > [User databases](../../../index.md) > [MTPData](../../index.md) > Programmability > [Stored Procedures](Stored_Procedures.md) > dbo.mtpsp_StageToReviewProjEdition

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [dbo].[mtpsp_StageToReviewProjEdition]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |


---

## <a name="#permissions"></a>Permissions

| Type | Action | Owning Principal |
|---|---|---|
| Grant | EXECUTE | db_spExecutor |


---

## <a name="#sqlscript"></a>SQL Script

```sql
create PROCEDURE [dbo].[mtpsp_StageToReviewProjEdition]
as

INSERT INTO tblReviewProjEdition(AppGUID, EditionID)
SELECT P.AppGUID, a.EditionID
FROM tblProjEdition a
	join tblStageProject p ON a.MTPID = P.MTPID


GO
GRANT EXECUTE ON  [dbo].[mtpsp_StageToReviewProjEdition] TO [db_spExecutor]
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblProjEdition]](../../Tables/dbo_tblProjEdition.md)
* [[dbo].[tblReviewProjEdition]](../../Tables/dbo_tblReviewProjEdition.md)
* [[dbo].[tblStageProject]](../../Tables/dbo_tblStageProject.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[mtpsp_StageToReview]](dbo_mtpsp_StageToReview.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

