#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewProjectsPending

# ![Views](../../../../Images/View32.png) [dbo].[viewProjectsPending]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 12:49:54 PM Thursday, January 2, 2014 |
| Last Modified | 12:49:54 PM Thursday, January 2, 2014 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| MTPID | int | 4 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE VIEW [dbo].[viewProjectsPending]
AS
SELECT distinct rp.MTPID
FROM tblReviewProject rp	
	JOIN tblRevision r ON rp.RevisionID = r.RevisionID
WHERE r.Posted = 0
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

