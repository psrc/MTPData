#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewImprovementTypesRevisionData

# ![Views](../../../../Images/View32.png) [dbo].[viewImprovementTypesRevisionData]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Schema Bound | YES |
| Created | 2:47:54 PM Wednesday, May 27, 2015 |
| Last Modified | 4:08:17 PM Thursday, May 28, 2015 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| mtpid | int | 4 |
| RevisionID | int | 4 |
| ImpTypeID | smallint | 2 |
| isPrimary | bit | 1 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
create view [dbo].[viewImprovementTypesRevisionData]
WITH SCHEMABINDING
as 
select rp.mtpid, rp.RevisionID, r.ImpTypeID, r.isPrimary 
from dbo.tblReviewProj_ImpType r
	join dbo.tblReviewProject rp ON r.APPGUID = rp.AppGUID
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblReviewProj_ImpType]](../Tables/dbo_tblReviewProj_ImpType.md)
* [[dbo].[tblReviewProject]](../Tables/dbo_tblReviewProject.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewRevisionSummary_ImpTypes]](dbo_viewRevisionSummary_ImpTypes.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

