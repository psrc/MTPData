#### 

[Project](../../../../../../index.md) > [SQLserver](../../../../../index.md) > [User databases](../../../../index.md) > [MTPData](../../../index.md) > Programmability > Functions > [Table-valued Functions](Table-valued_Functions.md) > dbo.mtpfn_predictProj_ImpType

# ![Table-valued Functions](../../../../../../Images/Function_Table32.png) [dbo].[mtpfn_predictProj_ImpType]

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
| @RevisionID | int | 4 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE function [dbo].[mtpfn_predictProj_ImpType](@RevisionID int)
RETURNS TABLE
AS 
RETURN

select *
from tblProj_ImpType 
where MTPID NOT IN (select distinct MTPID from tblReviewProject where RevisionID = @RevisionID)
UNION
SELECT a.MTPID, b.isPrimary, b.ImpTypeID
FROM tblReviewProject a
	JOIN tblReviewProj_ImpType b on a.AppGUID = b.APPGUID
where a.RevisionID = @RevisionID
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblProj_ImpType]](../../../Tables/dbo_tblProj_ImpType.md)
* [[dbo].[tblReviewProj_ImpType]](../../../Tables/dbo_tblReviewProj_ImpType.md)
* [[dbo].[tblReviewProject]](../../../Tables/dbo_tblReviewProject.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

