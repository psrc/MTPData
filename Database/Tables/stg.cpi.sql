CREATE TABLE [stg].[cpi]
(
[Year] [smallint] NOT NULL,
[cpi] [float] NULL
) ON [PRIMARY]
GO
ALTER TABLE [stg].[cpi] ADD CONSTRAINT [PK_cpi] PRIMARY KEY CLUSTERED ([Year]) ON [PRIMARY]
GO
