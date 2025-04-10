SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE view [dbo].[viewReviewPrimaryImpType]
as 
select APPGUID, PrimaryImpType
from tblReviewProject
GO
