SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[mtpfn_ScaledProjCostFromAppGUID](
	@AppGUID UNIQUEIDENTIFIER, 
	@EditionID SMALLINT
)
RETURNS MONEY
AS 
BEGIN
	DECLARE @inProjCost MONEY
	DECLARE @inCostYear INT
	DECLARE @outCostYear INT
	DECLARE @outCost MONEY
	DECLARE @factorSet INT


	SELECT @inProjCost = TotProjCost
	FROM tblReviewProject
	WHERE AppGUID = @AppGUID

	SELECT @factorSet = factor_set
	FROM tblEdition 
	WHERE EditionID = @EditionID
	
	SELECT @inCostYear = EstCostYear
	FROM tblReviewProject
	WHERE AppGUID = @AppGUID

	SELECT @outCostYear = CostYear
	FROM tblEdition
	WHERE EditionID = @EditionID


	SELECT @outCost = dbo.mtpfn_ScaleProjCost(@inCostYear, @outCostYear, @factorSet, @inProjCost)

	RETURN @outCost
END

GO
