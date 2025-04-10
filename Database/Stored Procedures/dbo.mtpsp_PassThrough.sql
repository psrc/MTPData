SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[mtpsp_PassThrough] @sql as varchar(max)
as
exec (@sql)
GO
GRANT EXECUTE ON  [dbo].[mtpsp_PassThrough] TO [db_spExecutor]
GO
