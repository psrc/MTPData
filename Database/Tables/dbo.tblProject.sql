CREATE TABLE [dbo].[tblProject]
(
[MTPID] [int] NOT NULL,
[Agency] [smallint] NULL,
[Title] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProjDesc] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TotProjCost] [money] NULL CONSTRAINT [DF__tblProjec__TotPr__3B40CD36] DEFAULT ((0)),
[ContactName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactPhone] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactEmail] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EstCostYear] [int] NULL,
[CompletionYear] [int] NULL,
[MTPStatus] [int] NULL,
[ProjectOn] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProjectFrom] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProjectTo] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MilePostFrom] [decimal] (18, 1) NULL,
[MilePostTo] [decimal] (18, 1) NULL,
[CountyID] [smallint] NULL,
[StateRouteID] [smallint] NULL,
[FuncClassID] [tinyint] NULL,
[StartYear] [int] NULL,
[WebLinks] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PrimaryImpType] [smallint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblProject] ADD CONSTRAINT [pk_tblProject_MTPID] PRIMARY KEY CLUSTERED ([MTPID]) ON [PRIMARY]
GO
