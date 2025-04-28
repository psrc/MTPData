SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [stg].[merge_proj_edition] @RevisionID smallint
as 
/*
    Assigns all projects in a revision defined by @RevisionID 
    to the edition defined for that revision.  
    The edition is defined by tblRevision.EditionID.
    Any projects in the revision that are already assigned to the edition 
      are not changed.  
*/
;with cte as (
    select p.AppGUID as AppGUID, r.EditionID
    from stg.project p
        join tblRevision r on r.RevisionID = @RevisionID
)
merge dbo.tblReviewProjEdition as TARGET
using cte as source on source.appGUID = target.AppGUID 
when not matched then insert (AppGUID, EditionID)
values (source.AppGUID, source.EditionID);
GO
