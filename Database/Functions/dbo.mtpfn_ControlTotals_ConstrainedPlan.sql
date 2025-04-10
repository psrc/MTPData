SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[mtpfn_ControlTotals_ConstrainedPlan](@RevisionID tinyint)
RETURNS TABLE
AS
RETURN

	select 
		case MTPStatus
			when 'Unprogrammed' THEN 'unconstrained'
			ELSE 'constrained'
		end as Section,
		dbo.fnCurrency(sum(ScaledCost)) as SummedCost,
		e.CostYear
	from mtpfn_predictProject(@RevisionID) pp
		, tblRevision r join tblEdition e ON r.EditionID = e.EditionID
	where r.RevisionID = @RevisionID
	group by 
		case MTPStatus
			when 'Unprogrammed' THEN 'unconstrained'
			ELSE 'constrained'
		end
		,r.EditionID, e.CostYear
GO
