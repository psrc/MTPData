#### 

[Project](../../../../../../index.md) > [SQLserver](../../../../../index.md) > [User databases](../../../../index.md) > [MTPData](../../../index.md) > Programmability > Functions > [Table-valued Functions](Table-valued_Functions.md) > dbo.mtpfn_predictProject_draftPlan

# ![Table-valued Functions](../../../../../../Images/Function_Table32.png) [dbo].[mtpfn_predictProject_draftPlan]

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



CREATE FUNCTION [dbo].[mtpfn_predictProject_draftPlan](
	@RevisionID as int
)
RETURNS TABLE
AS
return

-- Get the projects that are in the revision of interest and in the edition
SELECT r.RevisionName, 
	rp.AppGUID,
	rp.RevisionID,
	rp.MTPID,
	rp.Title,
	a.PlaceShortName as Sponsor,
	rp.ProjDesc,
	rp.ProjectOn,
	rp.ProjectFrom,
	rp.ProjectTo,
	c.CountyName,
	rp.StartYear,
	rp.CompletionYear,
	f.FCName,
	dbo.mtpfn_ScaleProjCost(rp.EstCostYear, rev.CostYear, rev.factor_set, rp.TotProjCost) as ScaledCost,
	case rp.modify_from_unprogrammed_to_constrained
		when 1 then 'Financially Constrained'
		else 'Unprogrammed'
	end as [StatusRequest],
	s.StatusName as MTPStatus,
	score.PScore
FROM tblReviewProject rp
	join tblRevision r ON rp.RevisionID = r.RevisionID
	LEFT JOIN tblAgency a ON rp.Agency = a.AgencyNo
	LEFT JOIN tblCounty c ON rp.CountyID = c.CountyID
	LEFT JOIN tblFuncClass f on rp.FuncClassID = f.FuncClassID
	LEFT JOIN tblImproveType i ON rp.PrimaryImpType = i.ImpTypeID
	LEFT JOIN tblMTPStatus s ON rp.MTPStatus = s.MTPStatusID
	join (select r.SourceEditionID, e.CostYear, e.factor_set
		from tblRevision r
			join tblEdition e ON r.EditionID = e.EditionID
		where r.RevisionID = @RevisionID
	) as rev on 1=1
	left join (
		select MTPID,  sum(MinResponseVal) as PScore
		from (
			select rp.MTPID, v.QuestionGroup,
				max(rp.Response * v.QuestionValue) as MinResponseVal
			from tblReviewPrioritization rp
				join tblPrioritizationVals v on rp.QuestionName = v.QuestionName
			where rp.AppGUID in (select distinct appguid from tblReviewProject where RevisionID = 28)
			group by rp.MTPID, v.QuestionGroup
		) a 
		group by MTPID
	) as score ON rp.MTPID = score.MTPID
WHERE 
	rp.RevisionID = @RevisionID
	and rp.MTPStatus not in ( -1, -3) -- status <> "Not in MTP" or "Cancelled"




GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblAgency]](../../../Tables/dbo_tblAgency.md)
* [[dbo].[tblCounty]](../../../Tables/dbo_tblCounty.md)
* [[dbo].[tblEdition]](../../../Tables/dbo_tblEdition.md)
* [[dbo].[tblFuncClass]](../../../Tables/dbo_tblFuncClass.md)
* [[dbo].[tblImproveType]](../../../Tables/dbo_tblImproveType.md)
* [[dbo].[tblMTPStatus]](../../../Tables/dbo_tblMTPStatus.md)
* [[dbo].[tblPrioritizationVals]](../../../Tables/dbo_tblPrioritizationVals.md)
* [[dbo].[tblReviewPrioritization]](../../../Tables/dbo_tblReviewPrioritization.md)
* [[dbo].[tblReviewProject]](../../../Tables/dbo_tblReviewProject.md)
* [[dbo].[tblRevision]](../../../Tables/dbo_tblRevision.md)
* [[dbo].[mtpfn_ScaleProjCost]](../Scalar-valued_Functions/dbo_mtpfn_ScaleProjCost.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[mtpsp_predictProject_draftPlan]](../../Stored_Procedures/dbo_mtpsp_predictProject_draftPlan.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

