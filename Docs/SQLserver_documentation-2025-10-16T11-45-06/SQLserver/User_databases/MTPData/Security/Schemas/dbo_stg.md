#### 

[Project](../../../../../index.md) > [SQLserver](../../../../index.md) > [User databases](../../../index.md) > [MTPData](../../index.md) > Security > [Schemas](Schemas.md) > stg

# ![Schemas](../../../../../Images/Schema32.png) stg

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Owner | [dbo](../Users/_dbo.md) |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE SCHEMA [stg]
AUTHORIZATION [dbo]
GO

```


---

## <a name="#usedby"></a>Used By

* [[stg].[cosponsors]](../../Tables/stg_cosponsors.md)
* [[stg].[cpi]](../../Tables/stg_cpi.md)
* [[stg].[parsed_gplanes_scopelements]](../../Tables/stg_parsed_gplanes_scopelements.md)
* [[stg].[project]](../../Tables/stg_project.md)
* [[stg].[project_long_PlanningProcess_column]](../../Tables/stg_project_long_PlanningProcess_column.md)
* [[stg].[scope_elements]](../../Tables/stg_scope_elements.md)
* [[stg].[scores]](../../Tables/stg_scores.md)
* [[stg].[scores_submitted_250421]](../../Tables/stg_scores_submitted_250421.md)
* [[stg].[tblReviewProjectDeletions250603]](../../Tables/stg_tblReviewProjectDeletions250603.md)
* [[stg].[tblReviewProjectDeletions250605]](../../Tables/stg_tblReviewProjectDeletions250605.md)
* [[stg].[merge_cosponsors]](../../Programmability/Stored_Procedures/stg_merge_cosponsors.md)
* [[stg].[merge_proj_edition]](../../Programmability/Stored_Procedures/stg_merge_proj_edition.md)
* [[stg].[merge_scope_elements]](../../Programmability/Stored_Procedures/stg_merge_scope_elements.md)
* [[stg].[merge_scores]](../../Programmability/Stored_Procedures/stg_merge_scores.md)
* [[stg].[merge_stg_projects]](../../Programmability/Stored_Procedures/stg_merge_stg_projects.md)
* [[stg].[stage_to_revision]](../../Programmability/Stored_Procedures/stg_stage_to_revision.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

