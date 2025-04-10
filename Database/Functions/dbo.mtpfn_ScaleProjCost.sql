SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[mtpfn_ScaleProjCost](
	@inYear int, 
	@outYear int, 
	@factorSet int,
	@inCost money
)
	RETURNS MONEY
	AS
	BEGIN
		
		DECLARE @outCost money
		DECLARE @inCPI float
		DECLARE @BaseYearCPI float
		
		SELECT @inCPI = CPI 
		from tblCPI 
		WHERE [Year] = @inYear and factor_set = @factorSet

		SELECT @BaseYearCPI = CPI 
		from tblCPI 
		WHERE [YEAR] = @outYear AND factor_set = @factorSet

		SELECT @outCost = @inCost * (@inCPI / nullif(@BaseYearCPI,0) )

		
	RETURN @outCost
	END


GO
GRANT EXECUTE ON  [dbo].[mtpfn_ScaleProjCost] TO [db_fnExecutor]
GO
