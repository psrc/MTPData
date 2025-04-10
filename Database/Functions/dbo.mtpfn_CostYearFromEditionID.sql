SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[mtpfn_CostYearFromEditionID](@EditionID INT)
RETURNS int
AS 
BEGIN
	DECLARE @CostYear INT
	
	SELECT @CostYear = CostYear
	FROM tblEdition 
	WHERE EditionID = @EditionID

	RETURN @CostYear
END
GO
