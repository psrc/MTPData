SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[mtpsp_StageToReview_Proj_ImpType]
as
INSERT INTO tblReviewProj_SecondaryImpType(AppGUID, ImpTypeiD)
SELECT p.AppGUID,
	a.ImpTypeID
FROM tblStageProj_SecondaryImpType a
	join tblStageProject p on a.MTPID = p.MTPID


INSERT INTO tblReviewProj_SecondaryImpType(AppGUID, ImpTypeiD)
SELECT P.AppGUID, a.ImpTypeID
FROM tblProj_SecondaryImpType a
	join tblStageProject p ON a.MTPID = P.MTPID
	left join tblReviewProj_SecondaryImpType rpi on p.AppGUID = rpi.APPGUID and a.ImpTypeID = rpi.ImpTypeID
WHERE rpi.APPGUID is null

GO
GRANT EXECUTE ON  [dbo].[mtpsp_StageToReview_Proj_ImpType] TO [db_spExecutor]
GO
