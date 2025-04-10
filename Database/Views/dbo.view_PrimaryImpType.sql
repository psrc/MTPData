SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create view [dbo].[view_PrimaryImpType]
as
select MTPID, ImpTypeID
from tblProj_ImpType
where isPrimary = 1
GO
