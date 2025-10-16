#### 

[Project](../../../../../../index.md) > [SQLserver](../../../../../index.md) > [User databases](../../../../index.md) > [MTPData](../../../index.md) > Programmability > Functions > [Table-valued Functions](Table-valued_Functions.md) > dbo.mtpfn_ReviewPrioritizationScores

# ![Table-valued Functions](../../../../../../Images/Function_Table32.png) [dbo].[mtpfn_ReviewPrioritizationScores]

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
| @revisionID | int | 4 |


---

## <a name="#sqlscript"></a>SQL Script

```sql


create function [dbo].[mtpfn_ReviewPrioritizationScores](@revisionID int)
returns table
as
return
select MTPID,  sum(MinResponseVal) as PScore
from (
	select rp.MTPID, v.QuestionGroup,
		max(rp.Response * v.QuestionValue) as MinResponseVal
	from tblReviewPrioritization rp
		join tblPrioritizationVals v on rp.QuestionName = v.QuestionName
	where rp.AppGUID in (select distinct appguid from tblReviewProject where RevisionID = @revisionID)
	group by rp.MTPID, v.QuestionGroup
) a 
group by MTPID
having sum(MinResponseVal) > 0
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblPrioritizationVals]](../../../Tables/dbo_tblPrioritizationVals.md)
* [[dbo].[tblReviewPrioritization]](../../../Tables/dbo_tblReviewPrioritization.md)
* [[dbo].[tblReviewProject]](../../../Tables/dbo_tblReviewProject.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewWebMapData_2018Update]](../../../Views/dbo_viewWebMapData_2018Update.md)
* [[dbo].[viewWebMapData_2018Update_posted]](../../../Views/dbo_viewWebMapData_2018Update_posted.md)
* [[dbo].[WebMapData_posted]](../../Stored_Procedures/dbo_WebMapData_posted.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

