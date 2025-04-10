CREATE TABLE [dbo].[tblReviewProjEdition]
(
[APPGUID] [uniqueidentifier] NULL,
[EditionID] [smallint] NULL,
[CostYear] AS ([dbo].[mtpfn_CostYearFromEditionID]([EditionID])),
[ScaledCost] AS ([dbo].[mtpfn_ScaledProjCostFromAppGUID]([AppGUID],[EditionID]))
) ON [PRIMARY]
GO
