SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[viewReviewProjEdition]
AS
SELECT pe.AppGUID, p.MTPID,   e.EditionID, e.EditionName, e.intDisplayOrder,
	e.CostYear, 
	dbo.mtpfn_ScaleProjCost(p.EstCostYear, e.CostYear, e.factor_set, p.TotProjCost) as ScaledCost
FROM tblReviewProjEdition pe 
	JOIN tblReviewProject p ON pe.AppGUID = p.AppGUID
	JOIN tblEdition e ON pe.EditionID = e.EditionID

GO
