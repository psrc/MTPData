SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create procedure [dbo].[mtpsp_RevisionSummary] @RevisionID int
as
select * 
from viewRevisionSummary
where RevisionID = @RevisionID
GO
GRANT EXECUTE ON  [dbo].[mtpsp_RevisionSummary] TO [db_spExecutor]
GO
