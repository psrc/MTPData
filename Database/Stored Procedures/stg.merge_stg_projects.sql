SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [stg].[merge_stg_projects] @RevisionID smallint
as
    /*
        Merge data from stg.project and dbo.tblProject into a revision (in tblReviewProject).
        When a project in the staging table also exists as a posted table, any data that 
          was in the newly-submitted version is used, but any fields that were submitted as null
          values default to that field in the posted data.  
        Inserts the record if the AppGUID doesn't exist in the table yet, otherwise does nothing.
    */
;with cte as (
    select 
        AppGUID,
        @RevisionID as RevisionID,
        getdate() DateStamp,
        ProjectId as MTPID,
        isnull(sp.SponsoringAgencyId, p.Agency) as Agency,
        isnull(sp.Title, p.Title) as Title,
        isnull(sp.[Description], p.ProjDesc) as ProjDesc,
        isnull(sp.TotalCost, p.TotProjCost) as TotProjCost,
        concat(ContactFirstName, ' ', ContactLastName) as ContactName,
        isnull(sp.ContactPhone, p.ContactPhone) as ContactPhone,
        isnull(sp.ContactEmail, p.ContactEmail) as ContactEmail,
        isnull(year(sp.ConstantDollarYear), p.EstCostYear) as EstCostYear,
        isnull(year(sp.CompletionYear), p.CompletionYear) as CompletionYear,
        isnull(p.MTPStatus, 1) as MTPStatus, -- 1='candidate'
        isnull(sp.[Location], p.ProjectOn) as ProjectOn,
        isnull(sp.EndpointA, p.ProjectFrom) as ProjectFrom,
        isnull(sp.EndpointB, p.ProjectTo) as ProjectTo,
        isnull(sp.MilepostA, p.MilePostFrom) as MilePostFrom,
        isnull(sp.MilepostB, p.MilePostTo) as MilePostTo,
        isnull(sp.CountyID, p.CountyID) as CountyID,
        p.StateRouteID,
        isnull(sp.FunctionalClass, p.FuncClassID) as FuncClassID,
        isnull(year(sp.StartYear), p.StartYear) as StartYear,
        p.WebLinks,
        -- DatePosted,
        -- DateOverwritten,
        -- Edit,
        -- ReviewTypeID,
        -- PrimaryImpType,
        isnull(sp.PlanningProcess, null) as PlanningProcess,
        isnull(sp.LettersOfConcurrence, null) as LettersOfConcurrence,
        isnull(sp.FundsDescription, null) as FundsDescription,
        isnull(sp.FundsCommitted, null) as FundsCommitted,
        isnull([Id], 0) as ApplicationID
    from stg.project sp
        left join dbo.tblProject p on sp.ProjectId = p.MTPID
)
merge dbo.tblReviewProject as target 
using cte as source ON source.RevisionID = target.RevisionID and source.MTPID = target.MTPID
when not matched then insert (
    AppGUID,
    RevisionID,
    DateStamp,
    MTPID,
    Agency,
    Title,
    ProjDesc,
    TotProjCost,
    ContactName,
    ContactPhone,
    ContactEmail,
    EstCostYear,
    CompletionYear,
    MTPStatus,
    ProjectOn,
    ProjectFrom,
    ProjectTo,
    MilePostFrom,
    MilePostTo,
    CountyID,
    StateRouteID,
    FuncClassID,
    StartYear,
    WebLinks,
    -- DatePosted,
    -- DateOverwritten,
    -- Edit,
    -- ReviewTypeID,
    -- PrimaryImpType,
    PlanningProcess,
    LettersOfConcurrence,
    FundsDescription,
    FundsCommitted,
    ApplicationID
) values (
    source.AppGUID,
    source.RevisionID,
    source.DateStamp,
    source.MTPID,
    source.Agency,
    source.Title,
    source.ProjDesc,
    source.TotProjCost,
    source.ContactName,
    source.ContactPhone,
    source.ContactEmail,
    source.EstCostYear,
    source.CompletionYear,
    source.MTPStatus,
    source.ProjectOn,
    source.ProjectFrom,
    source.ProjectTo,
    source.MilePostFrom,
    source.MilePostTo,
    source.CountyID,
    source.StateRouteID,
    source.FuncClassID,
    source.StartYear,
    source.WebLinks,
    -- source.DatePosted,
    -- source.DateOverwritten,
    -- source.Edit,
    -- source.ReviewTypeID,
    -- source.PrimaryImpType,
    source.PlanningProcess,
    source.LettersOfConcurrence,
    source.FundsDescription,
    source.FundsCommitted,
    source.ApplicationID
);

GO
