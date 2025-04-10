CREATE TABLE [dbo].[tblLogTypes]
(
[LogTypeID] [tinyint] NOT NULL,
[LogTypeName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLogTypes] ADD CONSTRAINT [PK__tblLogTy__AE9574B46CD828CA] PRIMARY KEY CLUSTERED ([LogTypeID]) ON [PRIMARY]
GO
