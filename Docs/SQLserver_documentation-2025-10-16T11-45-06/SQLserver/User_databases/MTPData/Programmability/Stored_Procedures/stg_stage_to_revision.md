#### 

[Project](../../../../../index.md) > [SQLserver](../../../../index.md) > [User databases](../../../index.md) > [MTPData](../../index.md) > Programmability > [Stored Procedures](Stored_Procedures.md) > stg.stage_to_revision

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [stg].[stage_to_revision]

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
CREATE procedure [stg].[stage_to_revision] @RevisionID smallint 
as 
begin
    exec stg.merge_stg_projects @RevisionID
    exec stg.merge_cosponsors @RevisionID
    exec stg.merge_scope_elements @RevisionID
    exec stg.merge_proj_edition @RevisionID
    exec stg.merge_scores
end
GO

```


---

## <a name="#uses"></a>Uses

* [[stg].[merge_cosponsors]](stg_merge_cosponsors.md)
* [[stg].[merge_proj_edition]](stg_merge_proj_edition.md)
* [[stg].[merge_scope_elements]](stg_merge_scope_elements.md)
* [[stg].[merge_scores]](stg_merge_scores.md)
* [[stg].[merge_stg_projects]](stg_merge_stg_projects.md)
* [stg](../../Security/Schemas/dbo_stg.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

