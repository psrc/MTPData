SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE function [dbo].[mtpfn_ProjectSearch](
	@RevisionID int = 0,
	@DescText varchar(50) = ''
)
returns table 
as 
return

	SELECT p.MTPID, p.Title
	FROM mtpfn_predictProject(@RevisionID) p
	where p.ProjDesc like '%' +  @DescText + '%'

GO
