#### 

[Project](../../../../../index.md) > [SQLserver](../../../../index.md) > [User databases](../../../index.md) > [MTPData](../../index.md) > Programmability > [Stored Procedures](Stored_Procedures.md) > stg.merge_cosponsors

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [stg].[merge_cosponsors]

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
CREATE procedure [stg].[merge_cosponsors] @RevisionID smallint 
as 
/*
    Merge any cosponsrs in the staging table stg.cosponsors 
    into the revision defined by @RevisionID.
    Any cosponsors that arleady are listed for projects in the revision
      are ignored (they're not inserted a second time).
*/
;with cte as (
    select c.Appguid, 
        c.CosponsorNumber as AgencyNo
    from stg.cosponsors c 
        join tblReviewProject rp on c.Appguid = rp.AppGUID
    where rp.revisionid = @revisionID
)
merge dbo.tblReviewProjCosponsors as target 
using cte as source on source.AppGUID = target.AppGUID
    and source.AgencyNo = target.AgencyNo
when not matched then insert (AppGUID, AgencyNo)
values (source.AppGUID, source.AgencyNo);
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblReviewProjCosponsors]](../../Tables/dbo_tblReviewProjCosponsors.md)
* [[dbo].[tblReviewProject]](../../Tables/dbo_tblReviewProject.md)
* [[stg].[cosponsors]](../../Tables/stg_cosponsors.md)
* [stg](../../Security/Schemas/dbo_stg.md)


---

## <a name="#usedby"></a>Used By

* [[stg].[stage_to_revision]](stg_stage_to_revision.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

