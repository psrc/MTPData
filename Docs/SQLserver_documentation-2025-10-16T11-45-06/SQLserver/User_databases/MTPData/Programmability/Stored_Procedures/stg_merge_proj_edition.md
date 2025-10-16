#### 

[Project](../../../../../index.md) > [SQLserver](../../../../index.md) > [User databases](../../../index.md) > [MTPData](../../index.md) > Programmability > [Stored Procedures](Stored_Procedures.md) > stg.merge_proj_edition

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [stg].[merge_proj_edition]

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
CREATE procedure [stg].[merge_proj_edition] @RevisionID smallint
as 
/*
    Assigns all projects in a revision defined by @RevisionID 
    to the edition defined for that revision.  
    The edition is defined by tblRevision.EditionID.
    Any projects in the revision that are already assigned to the edition 
      are not changed.  
*/
;with cte as (
    select p.AppGUID as AppGUID, r.EditionID
    from stg.project p
        join tblRevision r on r.RevisionID = @RevisionID
)
merge dbo.tblReviewProjEdition as TARGET
using cte as source on source.appGUID = target.AppGUID 
when not matched then insert (AppGUID, EditionID)
values (source.AppGUID, source.EditionID);
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblReviewProjEdition]](../../Tables/dbo_tblReviewProjEdition.md)
* [[dbo].[tblRevision]](../../Tables/dbo_tblRevision.md)
* [[stg].[project]](../../Tables/stg_project.md)
* [stg](../../Security/Schemas/dbo_stg.md)


---

## <a name="#usedby"></a>Used By

* [[stg].[stage_to_revision]](stg_stage_to_revision.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

