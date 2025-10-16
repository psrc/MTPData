#### 

[Project](../../../../../../index.md) > [SQLserver](../../../../../index.md) > [User databases](../../../../index.md) > [MTPData](../../../index.md) > Programmability > Functions > [Table-valued Functions](Table-valued_Functions.md) > dbo.mtpfn_predictProjCharacteristics

# ![Table-valued Functions](../../../../../../Images/Function_Table32.png) [dbo].[mtpfn_predictProjCharacteristics]

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


CREATE function [dbo].[mtpfn_predictProjCharacteristics](@RevisionID int)
RETURNS TABLE
AS 
/*
	Return data from tblProjCharacteristics for all projects except those in 
	revision @RevisionID.  For those projects return the characteristics 
	as listed in the revision.
*/
RETURN

select *
from tblProjCharacteristics
where MTPID NOT IN (select distinct MTPID from tblReviewProject where RevisionID = @RevisionID)
UNION
SELECT a.MTPID,  b.CharacteristicID
FROM tblReviewProject a
	JOIN tblReviewProjCharacteristics b on a.AppGUID = b.APPGUID
where a.RevisionID = @RevisionID


GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblProjCharacteristics]](../../../Tables/dbo_tblProjCharacteristics.md)
* [[dbo].[tblReviewProjCharacteristics]](../../../Tables/dbo_tblReviewProjCharacteristics.md)
* [[dbo].[tblReviewProject]](../../../Tables/dbo_tblReviewProject.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

