SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






CREATE PROCEDURE [dbo].[mtpsp_predictProject]
	@RevisionID as int
AS

DECLARE @EditionID tinyint

IF @RevisionID > 0
	SELECT * FROM dbo.mtpfn_predictProject(@RevisionID)
ELSE
begin
	SELECT @EditionID = EditionID
	FROM tblRevision
	WHERE RevisionID = (select max(RevisionID) from tblRevision where Posted = 1)

	SELECT * FROM dbo.mtpfn_currentProjects(@EditionID)
end
GO
GRANT EXECUTE ON  [dbo].[mtpsp_predictProject] TO [db_spExecutor]
GO
