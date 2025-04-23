SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [stg].[merge_proj_edition] @RevisionID smallint
as 
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
