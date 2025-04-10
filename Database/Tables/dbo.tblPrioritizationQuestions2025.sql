CREATE TABLE [dbo].[tblPrioritizationQuestions2025]
(
[QuestionName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[WebappsID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[QuestionGroup] [tinyint] NOT NULL,
[QuestionValue] [tinyint] NOT NULL,
[MeasureID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Section] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[QuestionText] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblPrioritizationQuestions2025] ADD CONSTRAINT [PK_tblPrioritizationQuestions2025] PRIMARY KEY CLUSTERED ([QuestionName]) ON [PRIMARY]
GO
