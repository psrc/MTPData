SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [stg].[merge_scope_elements] @RevisionID smallint
as
;with cte as (
    select se.Appguid, 
        se.ImprovementTypeNumber as CharacteristicID
    from stg.scope_elements se
        join tblReviewProject rp on se.Appguid = rp.AppGUID
    where rp.revisionid = @RevisionID
)
merge dbo.tblReviewProjCharacteristics as target 
using cte as source on source.AppGUID = target.AppGUID 
    and source.CharacteristicID = target.CharacteristicID
when not matched then insert (AppGUID, CharacteristicID)
values (source.AppGUID, source.CharacteristicID);
GO
