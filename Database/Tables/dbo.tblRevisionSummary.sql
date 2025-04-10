CREATE TABLE [dbo].[tblRevisionSummary]
(
[MTPID] [int] NULL,
[RevisionID] [int] NULL,
[Field] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PostedVal] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RevisionVal] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
