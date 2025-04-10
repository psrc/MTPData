CREATE TABLE [dbo].[tblStageProject]
(
[AppGUID] [uniqueidentifier] NULL CONSTRAINT [def_guid] DEFAULT (newid()),
[MTPID] [int] NOT NULL,
[Agency] [smallint] NULL,
[PrimaryImpType] [int] NULL,
[Title] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProjDesc] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TotProjCost] [money] NULL,
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
[planning_process] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[letters_of_concurrence] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[funds_description] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[funds_committed] [decimal] (18, 0) NULL,
[id] [int] NULL,
[new_project] [bit] NULL,
[sponsor_name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[status] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[modify_from_unprogrammed_to_constrained] [bit] NULL,
[modify_constrained_project_details] [bit] NULL,
[modify_complete] [bit] NULL,
[change_title] [bit] NULL,
[change_description] [bit] NULL,
[change_sponsoring_agency] [bit] NULL,
[change_start_year] [bit] NULL,
[change_location_information] [bit] NULL,
[change_total_cost] [bit] NULL,
[change_constant_dollar_year] [bit] NULL,
[change_completion_year] [bit] NULL,
[change_functional_class] [bit] NULL,
[prepopulated] [bit] NULL,
[contact_2_first_name] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[contact_2_last_name] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[contact_2_email] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[contact_2_phone] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[application_id] [int] NULL
) ON [PRIMARY]
GO
