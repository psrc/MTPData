CREATE TABLE [dbo].[tblProjScores]
(
[created_at] [datetime2] NULL CONSTRAINT [DF__tblProjSc__creat__7B4643B2] DEFAULT (getdate()),
[updated_at] [datetime2] NULL CONSTRAINT [DF__tblProjSc__updat__7C3A67EB] DEFAULT (getdate()),
[MTPID] [int] NOT NULL,
[QuestionName] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Response] [tinyint] NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[trigger_tblProjScores_updated_at] on [dbo].[tblProjScores]
after update
as
begin
	UPDATE dbo.tblProjScores
	set updated_at = GETDATE()
    from dbo.tblProjScores s
        join Inserted i on s.[MTPID] = i.[MTPID] and s.[QuestionName] = i.[QuestionName]
end
GO
ALTER TABLE [dbo].[tblProjScores] ADD CONSTRAINT [pk_tblProjScores] PRIMARY KEY CLUSTERED ([MTPID], [QuestionName]) ON [PRIMARY]
GO
