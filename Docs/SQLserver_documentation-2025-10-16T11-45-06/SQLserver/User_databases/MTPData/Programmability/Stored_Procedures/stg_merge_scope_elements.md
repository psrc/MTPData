#### 

[Project](../../../../../index.md) > [SQLserver](../../../../index.md) > [User databases](../../../index.md) > [MTPData](../../index.md) > Programmability > [Stored Procedures](Stored_Procedures.md) > stg.merge_scope_elements

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [stg].[merge_scope_elements]

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
| @RevisionID | smallint | 2 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE procedure [stg].[merge_scope_elements] @RevisionID smallint
as
/*
    Merge scope element data from the staging table stg.scope_elements 
     into the revision table tblReviewProjCharacteristics.
    Inserts rows if the AppGUID-CharacteristicID does not yet exist in the target table,
    otherwise does nothing. 
*/
;with cte as (
    select se.Appguid, 
        se.ImprovementTypeNumber as CharacteristicID
    from stg.scope_elements se
        join tblReviewProject rp on se.Appguid = rp.AppGUID
    where rp.revisionid = @RevisionID
)
merge dbo.tblReviewProjCharacteristics as target 
using cte as source on source.AppGUID = target.AppGUID 
    and source.CharacteristicID = target.CharacteristicID
when not matched then insert (AppGUID, CharacteristicID)
values (source.AppGUID, source.CharacteristicID);
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblReviewProjCharacteristics]](../../Tables/dbo_tblReviewProjCharacteristics.md)
* [[dbo].[tblReviewProject]](../../Tables/dbo_tblReviewProject.md)
* [[stg].[scope_elements]](../../Tables/stg_scope_elements.md)
* [stg](../../Security/Schemas/dbo_stg.md)


---

## <a name="#usedby"></a>Used By

* [[stg].[stage_to_revision]](stg_stage_to_revision.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

