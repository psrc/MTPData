SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE PROCEDURE [dbo].[mtpsp_StageToReview_Project] @Revision smallint
as

INSERT INTO tblReviewProject (AppGUID, RevisionID, MTPID, Agency,  PrimaryImpType,
	Title, ProjDesc, TotProjCost, ContactName, ContactPhone, ContactEmail,
	EstCostYear, CompletionYear, MTPStatus, ProjectOn, ProjectFrom, ProjectTo,
	MilePostFrom, MilePostTo, CountyID, StateRouteID, FuncClassID, StartYear,
	PlanningProcess, LettersOfConcurrence, FundsDescription, FundsCommitted, ApplicationID)
SELECT
	sp.AppGUID,
	@Revision,
	sp.MTPID,
	ISNULL(sp.Agency, p.Agency) AS Agency,
	ISNULL(sp.PrimaryImpType, p.PrimaryImpType ) AS PrimaryImpType,
	ISNULL(NULLIF(sp.Title,''), p.Title) AS Title,
	isnull(NULLIF(sp.ProjDesc,''), p.ProjDesc) as ProjDesc,
	ISNULL(NULLIF(sp.TotProjCost,0), p.TotProjCost) AS TotProjCost,
	ISNULL(NULLIF(sp.ContactName,''), p.ContactName) AS ContactName,
	ISNULL(NULLIF(sp.ContactPhone,''), p.ContactPhone) AS ContactPhone,
	ISNULL(NULLIF(sp.ContactEmail,''), p.ContactEmail) AS ContactEmail,
	ISNULL(sp.EstCostYear, p.EstCostYear) AS EstCostYear,
	ISNULL(sp.CompletionYear, p.CompletionYear) AS CompletionYear,
	ISNULL(sp.MTPStatus, p.MTPStatus) AS MTPStatus,
	ISNULL(NULLIF(sp.ProjectOn,''), p.ProjectOn) AS ProjectOn,
	ISNULL(NULLIF(sp.ProjectFrom,''), p.ProjectFrom) AS ProjectFrom,
	ISNULL(NULLIF(sp.ProjectTo,''), p.ProjectTo) AS ProjectTo,
	ISNULL(sp.MilePostFrom, p.MilePostFrom) AS MilePostFrom,
	ISNULL(sp.MilePostTo, p.MilePostTo) AS MilePostTo,
	ISNULL(sp.CountyID, p.CountyID) AS CountyID,
	ISNULL(sp.StateRouteID, p.StateRouteID) AS StateRouteID,
	ISNULL(sp.FuncClassID, p.FuncClassID) AS FuncClassID,
	ISNULL(sp.StartYear, p.StartYear) AS StartYear,
	sp.planning_process,
	sp.letters_of_concurrence,
	sp.funds_description,
	sp.funds_committed,
	isnull(sp.application_id, 0)
FROM tblStageProject sp 
	left join tblProject p ON sp.MTPID = p.MTPID
WHERE isnull(sp.modify_complete,0) = 0
order by mtpid



GO
GRANT EXECUTE ON  [dbo].[mtpsp_StageToReview_Project] TO [db_spExecutor]
GO
