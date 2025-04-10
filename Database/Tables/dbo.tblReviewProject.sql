CREATE TABLE [dbo].[tblReviewProject]
(
[AppGUID] [uniqueidentifier] NOT NULL,
[RevisionID] [int] NULL,
[DateStamp] [datetime] NULL,
[MTPID] [int] NULL,
[Agency] [smallint] NULL,
[Title] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProjDesc] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TotProjCost] [money] NULL CONSTRAINT [DF__tblReview__TotPr__55009F39] DEFAULT ((0)),
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
[DatePosted] [datetime] NULL,
[DateOverwritten] [datetime] NULL,
[Edit] [bit] NULL,
[ReviewTypeID] [int] NULL CONSTRAINT [df_tblReviewProject_ReviewType] DEFAULT ((1)),
[PrimaryImpType] [smallint] NULL,
[PlanningProcess] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LettersOfConcurrence] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FundsDescription] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FundsCommitted] [decimal] (18, 0) NULL,
[ApplicationID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblReviewProject] ADD CONSTRAINT [pk_tblProject_APPGUID] PRIMARY KEY CLUSTERED ([AppGUID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_ReviewProject_MTPID] ON [dbo].[tblReviewProject] ([MTPID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_ReviewProject_RevisionID] ON [dbo].[tblReviewProject] ([RevisionID]) ON [PRIMARY]
GO
