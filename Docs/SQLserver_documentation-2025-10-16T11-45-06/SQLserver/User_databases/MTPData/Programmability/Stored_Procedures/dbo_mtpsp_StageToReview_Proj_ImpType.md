#### 

[Project](../../../../../index.md) > [SQLserver](../../../../index.md) > [User databases](../../../index.md) > [MTPData](../../index.md) > Programmability > [Stored Procedures](Stored_Procedures.md) > dbo.mtpsp_StageToReview_Proj_ImpType

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [dbo].[mtpsp_StageToReview_Proj_ImpType]

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


CREATE PROCEDURE [dbo].[mtpsp_StageToReview_Proj_ImpType]
as
INSERT INTO tblReviewProj_SecondaryImpType(AppGUID, ImpTypeiD)
SELECT p.AppGUID,
	a.ImpTypeID
FROM tblStageProj_SecondaryImpType a
	join tblStageProject p on a.MTPID = p.MTPID


INSERT INTO tblReviewProj_SecondaryImpType(AppGUID, ImpTypeiD)
SELECT P.AppGUID, a.ImpTypeID
FROM tblProj_SecondaryImpType a
	join tblStageProject p ON a.MTPID = P.MTPID
	left join tblReviewProj_SecondaryImpType rpi on p.AppGUID = rpi.APPGUID and a.ImpTypeID = rpi.ImpTypeID
WHERE rpi.APPGUID is null

GO
GRANT EXECUTE ON  [dbo].[mtpsp_StageToReview_Proj_ImpType] TO [db_spExecutor]
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblProj_SecondaryImpType]](../../Tables/dbo_tblProj_SecondaryImpType.md)
* [[dbo].[tblReviewProj_SecondaryImpType]](../../Tables/dbo_tblReviewProj_SecondaryImpType.md)
* [[dbo].[tblStageProj_SecondaryImpType]](../../Tables/dbo_tblStageProj_SecondaryImpType.md)
* [[dbo].[tblStageProject]](../../Tables/dbo_tblStageProject.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

