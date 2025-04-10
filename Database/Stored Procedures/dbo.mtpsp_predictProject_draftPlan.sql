SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO







CREATE PROCEDURE [dbo].[mtpsp_predictProject_draftPlan]
	@RevisionID as int
AS

DECLARE @EditionID tinyint

IF @RevisionID > 0
	SELECT * FROM dbo.mtpfn_predictProject_draftPlan(@RevisionID)
ELSE
begin
	SELECT @EditionID = EditionID
	FROM tblRevision
	WHERE RevisionID = (select max(RevisionID) from tblRevision where Posted = 1)

	SELECT * FROM dbo.mtpfn_currentProjects(@EditionID)
end
GO
