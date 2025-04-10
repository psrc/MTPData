SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[viewProjEdition]
as
SELECT pe.MTPID, e.EditionID, e.EditionName, e.intDisplayOrder,
	e.CostYear, 
	dbo.mtpfn_ScaleProjCost(p.EstCostYear, e.CostYear, e.factor_set, p.TotProjCost) as ScaledCost
FROM tblProjEdition pe 
	JOIN tblEdition e ON pe.EditionID = e.EditionID
	JOIN tblProject p ON pe.MTPID = p.MTPID

GO
