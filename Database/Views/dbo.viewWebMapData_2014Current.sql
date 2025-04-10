SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE view [dbo].[viewWebMapData_2014Current]
as
select p.MTPID, cast(p.MTPID as varchar(5)) as strMTPID,
	p.Title, p.SponsorShortName as Sponsor, p.PrimaryImpType as Improvemen,
	dbo.mtpfn_CleanString(p.ProjDesc) as Descriptio,
	dbo.mtpfn_CleanString(p.ProjectOn) as Location,
	dbo.mtpfn_CleanString(p.ProjectFrom) as ProjectFrom,
	dbo.mtpfn_CleanString(p.ProjectTo) as ProjectTo, 
	p.CompletionYear as Completion,
	p.SponsorShortName + ' -- ' + p.Title as SponProjTi,
	p.MTPStatus as MTPStatus,
	p.ScaledCost as TotalCost
from mtpfn_currentProjects(4) p
GO
