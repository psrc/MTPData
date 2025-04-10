CREATE TABLE [dbo].[tblCPI]
(
[Year] [int] NOT NULL,
[CPI] [float] NULL,
[factor_set] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCPI] ADD CONSTRAINT [PK_tblCPI] PRIMARY KEY CLUSTERED ([Year], [factor_set]) ON [PRIMARY]
GO
