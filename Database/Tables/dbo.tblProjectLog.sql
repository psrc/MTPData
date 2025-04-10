CREATE TABLE [dbo].[tblProjectLog]
(
[RecID] [int] NOT NULL IDENTITY(1, 1),
[MTPID] [int] NULL,
[NoteDate] [datetime] NULL CONSTRAINT [DF__tblProjec__NoteD__75A278F5] DEFAULT (getdate()),
[Author] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__tblProjec__Autho__76969D2E] DEFAULT (substring(original_login(),charindex('\',original_login())+(1),(20))),
[Note] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RevisionID] [int] NULL,
[LogType] [tinyint] NULL CONSTRAINT [df_LogType1] DEFAULT ((1))
) ON [PRIMARY]
GO
