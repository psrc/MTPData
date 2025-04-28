SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [stg].[stage_to_revision] @RevisionID smallint 
as 
begin
    exec stg.merge_stg_projects @RevisionID
    exec stg.merge_cosponsors @RevisionID
    exec stg.merge_scope_elements @RevisionID
    exec stg.merge_proj_edition @RevisionID
    exec stg.merge_scores
end
GO
