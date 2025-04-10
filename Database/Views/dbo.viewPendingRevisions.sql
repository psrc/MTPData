SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[viewPendingRevisions]
as
SELECT DISTINCT RevisionID, RevisionName
from tblRevision
where Posted = 0
GO
