CREATE TABLE [dbo].[tblReviewProjectLog]
(
[RecID] [int] NOT NULL IDENTITY(1, 1),
[AppGUID] [uniqueidentifier] NULL,
[NoteDate] [datetime] NULL CONSTRAINT [DF__tblReview__NoteD__797309D9] DEFAULT (getdate()),
[Author] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__tblReview__Autho__7A672E12] DEFAULT (substring(original_login(),charindex('\',original_login())+(1),(20))),
[Note] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RevisionID] [int] NULL,
[LogType] [tinyint] NULL CONSTRAINT [df_ReviewProjectLog_LogType1] DEFAULT ((1))
) ON [PRIMARY]
GO
