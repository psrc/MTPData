SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create function [dbo].[mtpfn_ProjectsForEdition](
	@idEdition int
)
RETURNS TABLE
AS 
RETURN
	select p.*
	from tblProjects p 
		join tblProjEdition pe on p.PK = pe.ProjPK
	where pe.EditionID = @idEdition
GO
