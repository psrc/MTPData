CREATE TABLE [dbo].[tblImproveType]
(
[ImpTypeID] [smallint] NOT NULL,
[OldID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ImpTypeName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ImpTypeDesc] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ImpTypeGeneric1] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ImpTypeGeneric2] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
