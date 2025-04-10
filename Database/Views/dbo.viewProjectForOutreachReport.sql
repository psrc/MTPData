SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[viewProjectForOutreachReport]
AS
-- This returns data to be viewed in an Access report to support Josh Brown's Outreach meetings
--  with external agencies.
	SELECT 'Unprogrammed Projects' AS [Section], 
		p.MTPID,  
		p.Sponsor, 
		p.Title, 
		p.CompletionYear, 
		round(p.ScaledCost,0) AS CostIn08Dollars, 
		p.ProjDesc
	FROM viewProject AS p
	WHERE P.MTP_Status in ('Unprogrammed')
UNION
	SELECT 'Projects in fiscally constrained project list' AS [Section], 
		p.MTPID,  
		p.Sponsor, 
		p.Title, 
		p.CompletionYear, 
		round(p.ScaledCost,0) AS CostIn08Dollars, 
		p.ProjDesc
	FROM viewProject AS p
	WHERE P.MTP_Status in ('Approved', 'Candidate', 'ROW Conditionally Approved', 'Conditionally Approved')

GO
