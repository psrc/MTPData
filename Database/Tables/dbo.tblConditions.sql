CREATE TABLE [dbo].[tblConditions]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[MTPID] [int] NULL,
[Condition] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Complete] [bit] NULL CONSTRAINT [DF__tblCondit__Compl__2645B050] DEFAULT ((0))
) ON [PRIMARY]
GO
