SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [dbo].[mtpsp_StageToReview] @Revision int
AS

/*
BEGIN TRY
BEGIN TRAN
*/
	EXEC mtpsp_StageToReview_Project @Revision

	EXEC mtpsp_StageToReview_Prioritization

	--EXEC mtpsp_StageToReview_Proj_ImpType

	EXEC mtpsp_StageToReviewProjEdition


GO
GRANT EXECUTE ON  [dbo].[mtpsp_StageToReview] TO [db_spExecutor]
GO
