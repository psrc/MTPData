CREATE TABLE [dbo].[tblEdition]
(
[EditionID] [smallint] NOT NULL,
[EditionName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[intDisplayOrder] [int] NULL,
[CostYear] [int] NULL,
[factor_set] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblEdition] ADD CONSTRAINT [PK__tblEditi__C762234320C1E124] PRIMARY KEY CLUSTERED ([EditionID]) ON [PRIMARY]
GO
