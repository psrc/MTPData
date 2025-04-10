SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE view [dbo].[viewPrimaryImpType]
as
select MTPID, PrimaryImpType
from tblProject

GO
