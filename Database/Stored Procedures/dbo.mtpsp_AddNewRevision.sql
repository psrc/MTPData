SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[mtpsp_AddNewRevision]
	@RevisionName nvarchar(100),
	@intRevisionTypeID tinyint,
	@SourceEditionID smallint,
	@EditionID smallint
AS
INSERT INTO tblRevision (RevisionName, RevisionTypeID,  EditionID, SourceEditionID)
VALUES (@RevisionName, @intRevisionTypeID,  @EditionID, @SourceEditionID)
GO
GRANT EXECUTE ON  [dbo].[mtpsp_AddNewRevision] TO [db_spExecutor]
GO
