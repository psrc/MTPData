CREATE TABLE [dbo].[tblReviewProjScores]
(
[AppGUID] [uniqueidentifier] NULL,
[MTPID] [int] NULL,
[QuestionName] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response] [tinyint] NULL
) ON [PRIMARY]
GO
