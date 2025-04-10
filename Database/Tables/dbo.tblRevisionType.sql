CREATE TABLE [dbo].[tblRevisionType]
(
[RevisionTypeID] [tinyint] NOT NULL,
[RevisionTypeName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblRevisionType] ADD CONSTRAINT [PK_tblRevisionType_RevisionTypeID] PRIMARY KEY CLUSTERED ([RevisionTypeID]) ON [PRIMARY]
GO
