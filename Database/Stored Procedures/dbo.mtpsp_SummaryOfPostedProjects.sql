SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[mtpsp_SummaryOfPostedProjects] @EditionID smallint
as

	select p.MTPStatus, count(*) as ProjectCount,
		dbo.fnCurrency(sum(p.ScaledCost)) as TotalScaledCost
	from dbo.mtpfn_currentProjects(@EditionID) p
	group by p.MTPStatus
GO
GRANT EXECUTE ON  [dbo].[mtpsp_SummaryOfPostedProjects] TO [db_spExecutor]
GO
