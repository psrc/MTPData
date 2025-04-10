SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create function [dbo].[mtpfn_ProjectsForGruop](
	@idGroup int
)
RETURNS TABLE
AS 
RETURN
	select p.*
	from tblProjects p 
		join tblProjGroup pg on p.PK = pg.ProjPK
	where pg.GroupID = @idGroup
GO
