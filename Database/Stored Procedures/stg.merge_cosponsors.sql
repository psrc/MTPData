SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [stg].[merge_cosponsors] @RevisionID smallint 
as 
;with cte as (
    select c.Appguid, 
        c.CosponsorNumber as AgencyNo
    from stg.cosponsors c 
        join tblReviewProject rp on c.Appguid = rp.AppGUID
    where rp.revisionid = @revisionID
)
merge dbo.tblReviewProjCosponsors as target 
using cte as source on source.AppGUID = target.AppGUID
    and source.AgencyNo = target.AgencyNo
when not matched then insert (AppGUID, AgencyNo)
values (source.AppGUID, source.AgencyNo);
GO
