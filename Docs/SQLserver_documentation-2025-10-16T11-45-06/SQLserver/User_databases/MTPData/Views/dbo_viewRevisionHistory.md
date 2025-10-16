#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewRevisionHistory

# ![Views](../../../../Images/View32.png) [dbo].[viewRevisionHistory]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 10:18:17 AM Tuesday, July 14, 2015 |
| Last Modified | 10:18:17 AM Tuesday, July 14, 2015 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| RevisionID | int | 4 |
| RevisionName | nvarchar(100) | 200 |
| MTPID | int | 4 |
| DatePosted | datetime | 8 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE view [dbo].[viewRevisionHistory]
as
select r.RevisionID, r.RevisionName, rp.MTPID, rp.DatePosted
from tblReviewProject rp
	join tblRevision r ON rp.RevisionID = r.RevisionID
	join (
		select distinct MTPID, RevisionID from tblRevisionSummary 
	) rs ON rp.MTPID = rs.MTPID and rp.RevisionID = rs.RevisionID
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblReviewProject]](../Tables/dbo_tblReviewProject.md)
* [[dbo].[tblRevision]](../Tables/dbo_tblRevision.md)
* [[dbo].[tblRevisionSummary]](../Tables/dbo_tblRevisionSummary.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

