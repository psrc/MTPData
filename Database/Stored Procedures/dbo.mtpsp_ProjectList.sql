SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[mtpsp_ProjectList] @EditionID smallint
AS
SELECT *
FROM viewProject p
WHERE p.MTPID in (select distinct MTPID from tblProjEdition where EditionID = @EditionID)
GO
GRANT EXECUTE ON  [dbo].[mtpsp_ProjectList] TO [db_spExecutor]
GO
