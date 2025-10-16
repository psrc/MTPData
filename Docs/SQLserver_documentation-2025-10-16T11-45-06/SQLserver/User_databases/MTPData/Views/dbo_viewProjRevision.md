#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewProjRevision

# ![Views](../../../../Images/View32.png) [dbo].[viewProjRevision]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 9:58:46 AM Wednesday, November 13, 2013 |
| Last Modified | 2:12:06 PM Thursday, January 2, 2014 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| MTPID | int | 4 |
| RevisionName | nvarchar(100) | 200 |
| RevisionID | int | 4 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE view [dbo].[viewProjRevision]
as
SELECT DISTINCT MTPID,  r.RevisionName, r.RevisionID
from tblReviewProject rp
	JOIN tblRevision r on rp.RevisionID = r.RevisionID
where r.Posted = 0
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblReviewProject]](../Tables/dbo_tblReviewProject.md)
* [[dbo].[tblRevision]](../Tables/dbo_tblRevision.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

