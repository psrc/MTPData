SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE view [dbo].[viewTIPConnections]
as
select cast(m.MTP_Ref as int) as MTPID,
	m.ProjNo as TIPID,
	s.strMTPStatus
from RTIPDataSQL.dbo.tblProjMTP m
	join RTIPDataSQL.dbo.tblRTIP r ON m.ProjNo = r.ProjNo
	join RTIPDataSQL.dbo.tblMTP_Status s on r.intMTPStatus = s.intMTPStatus
where m.MTP_Ref not like '%[^0-9]%'
GO
