#### 

[Project](../../../../../../index.md) > [SQLserver](../../../../../index.md) > [User databases](../../../../index.md) > [MTPData](../../../index.md) > Programmability > Functions > [Table-valued Functions](Table-valued_Functions.md) > dbo.mtpfn_RevisionHistory

# ![Table-valued Functions](../../../../../../Images/Function_Table32.png) [dbo].[mtpfn_RevisionHistory]

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
| @MTPID | int | 4 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE function [dbo].[mtpfn_RevisionHistory] (@MTPID as int)
returns table
as 
RETURN
	SELECT rp.RevisionID, r.RevisionName
	FROM tblReviewProject rp
		join tblRevision r ON rp.RevisionID = r.RevisionID
	where rp.MTPID = @MTPID
		and r.Posted = 1
		and rp.Edit = 1
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblReviewProject]](../../../Tables/dbo_tblReviewProject.md)
* [[dbo].[tblRevision]](../../../Tables/dbo_tblRevision.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

