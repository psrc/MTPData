CREATE TABLE [stg].[project]
(
[Id] [bigint] NULL,
[Appguid] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UserId] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Status] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedAt] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UpdatedAt] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SubmittedAt] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AcceptedAt] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NewProject] [bit] NULL,
[ModifyFromUnprogrammedToConstrained] [bit] NULL,
[ModifyConstrainedProjectDetails] [bit] NULL,
[ProjectId] [float] NULL,
[SponsoringAgencyId] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Title] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactFirstName] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactLastName] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactEmail] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactPhone] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MtpStatus] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PlanningProcess] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LettersOfConcurrence] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Location] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EndpointA] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EndpointB] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MilepostA] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MilepostB] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CountyId] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TotalCost] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ConstantDollarYear] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FundsDescription] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PrimaryImprovementTypeId] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StartYear] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CompletionYear] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FunctionalClass] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ChangeInProjectScope] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ChangeSponsoringAgency] [bit] NULL,
[ChangeTitle] [bit] NULL,
[ChangeDescription] [bit] NULL,
[ChangeLocationInformation] [bit] NULL,
[ChangeTotalCost] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ChangeConstantDollarYear] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ChangeCompletionYear] [bit] NULL,
[ChangeFunctionalClass] [bit] NULL,
[CurrentStep] [bigint] NULL,
[FundsCommitted] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Prepopulated] [bit] NULL,
[ChangeStartYear] [bit] NULL,
[OldTotalCost] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OldConstantDollarYear] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Contact2FirstName] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Contact2LastName] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Contact2Email] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Contact2Phone] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModifyComplete] [bit] NULL,
[UpdatedCostExplanation] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Cosponsors] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MtpImprovementTypes] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
