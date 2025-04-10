CREATE TABLE [dbo].[tblPrioritization]
(
[MTPID] [int] NOT NULL,
[QuestionName] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Response] [tinyint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblPrioritization] ADD CONSTRAINT [pk_tblPrioritization] PRIMARY KEY CLUSTERED ([MTPID], [QuestionName]) ON [PRIMARY]
GO
