CREATE TABLE [dbo].[tblRevision]
(
[RevisionID] [int] NOT NULL IDENTITY(1, 1),
[RevisionName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RevisionTypeID] [tinyint] NULL,
[ExecBoardApprovalDate] [datetime] NULL,
[PolicyBoardApprovalDate] [datetime] NULL,
[EditionID] [smallint] NULL,
[Posted] [tinyint] NULL CONSTRAINT [DF__tblRevisi__Poste__5224328E] DEFAULT ((0)),
[SourceEditionID] [smallint] NULL
) ON [PRIMARY]
GO
