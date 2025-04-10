CREATE TABLE [dbo].[tblModelNotes]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[MTPID] [int] NULL,
[ProjVersion] [int] NULL,
[Note] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateCreated] [datetime] NULL CONSTRAINT [DF__tblModelN__DateC__10216507] DEFAULT (getdate()),
[DateUpdated] [datetime] NULL CONSTRAINT [DF__tblModelN__DateU__11158940] DEFAULT (getdate()),
[Author] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__tblModelN__Autho__1209AD79] DEFAULT (substring(original_login(),charindex('\',original_login())+(1),(20))),
[LastEditor] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__tblModelN__LastE__12FDD1B2] DEFAULT (substring(original_login(),charindex('\',original_login())+(1),(20)))
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[Upd] ON [dbo].[tblModelNotes]
AFTER UPDATE
AS 
UPDATE tblModelNotes
SET DateUpdated = GetDate(),
	LastEditor = substring(original_login(),charindex('\',original_login())+(1),(20))
FROM tblModelNotes n 
	join inserted i ON n.ID = i.ID

GO
ALTER TABLE [dbo].[tblModelNotes] ADD CONSTRAINT [PK__tblModel__3214EC270E391C95] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[tblModelNotes] TO [mtpdb_Modeler]
GO
GRANT INSERT ON  [dbo].[tblModelNotes] TO [mtpdb_Modeler]
GO
GRANT UPDATE ON  [dbo].[tblModelNotes] TO [mtpdb_Modeler]
GO
