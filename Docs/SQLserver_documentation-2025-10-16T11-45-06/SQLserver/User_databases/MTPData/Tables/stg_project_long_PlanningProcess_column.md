#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > stg.project_long_PlanningProcess_column

# ![Tables](../../../../Images/Table32.png) [stg].[project_long_PlanningProcess_column]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Heap | YES |
| Row Count (~) | 3 |
| Created | 8:26:46 AM Monday, April 21, 2025 |
| Last Modified | 8:26:46 AM Monday, April 21, 2025 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|
| Id | bigint | 8 | NULL allowed |
| Appguid | varchar(max) | max | NULL allowed |
| UserId | varchar(max) | max | NULL allowed |
| Status | varchar(max) | max | NULL allowed |
| CreatedAt | varchar(max) | max | NULL allowed |
| UpdatedAt | varchar(max) | max | NULL allowed |
| SubmittedAt | varchar(max) | max | NULL allowed |
| AcceptedAt | varchar(max) | max | NULL allowed |
| NewProject | bit | 1 | NULL allowed |
| ModifyFromUnprogrammedToConstrained | varchar(max) | max | NULL allowed |
| ModifyConstrainedProjectDetails | varchar(max) | max | NULL allowed |
| ProjectId | float | 8 | NULL allowed |
| SponsoringAgencyId | varchar(max) | max | NULL allowed |
| Title | varchar(max) | max | NULL allowed |
| ContactFirstName | varchar(max) | max | NULL allowed |
| ContactLastName | varchar(max) | max | NULL allowed |
| ContactEmail | varchar(max) | max | NULL allowed |
| ContactPhone | varchar(max) | max | NULL allowed |
| MtpStatus | varchar(max) | max | NULL allowed |
| Description | varchar(max) | max | NULL allowed |
| PlanningProcess | varchar(max) | max | NULL allowed |
| LettersOfConcurrence | varchar(max) | max | NULL allowed |
| Location | varchar(max) | max | NULL allowed |
| EndpointA | varchar(max) | max | NULL allowed |
| EndpointB | varchar(max) | max | NULL allowed |
| MilepostA | varchar(max) | max | NULL allowed |
| MilepostB | varchar(max) | max | NULL allowed |
| CountyId | varchar(max) | max | NULL allowed |
| TotalCost | varchar(max) | max | NULL allowed |
| ConstantDollarYear | varchar(max) | max | NULL allowed |
| FundsDescription | varchar(max) | max | NULL allowed |
| PrimaryImprovementTypeId | varchar(max) | max | NULL allowed |
| StartYear | varchar(max) | max | NULL allowed |
| CompletionYear | varchar(max) | max | NULL allowed |
| FunctionalClass | varchar(max) | max | NULL allowed |
| ChangeInProjectScope | varchar(max) | max | NULL allowed |
| ChangeSponsoringAgency | varchar(max) | max | NULL allowed |
| ChangeTitle | varchar(max) | max | NULL allowed |
| ChangeDescription | varchar(max) | max | NULL allowed |
| ChangeLocationInformation | varchar(max) | max | NULL allowed |
| ChangeTotalCost | varchar(max) | max | NULL allowed |
| ChangeConstantDollarYear | varchar(max) | max | NULL allowed |
| ChangeCompletionYear | varchar(max) | max | NULL allowed |
| ChangeFunctionalClass | varchar(max) | max | NULL allowed |
| CurrentStep | bigint | 8 | NULL allowed |
| FundsCommitted | varchar(max) | max | NULL allowed |
| Prepopulated | varchar(max) | max | NULL allowed |
| ChangeStartYear | varchar(max) | max | NULL allowed |
| OldTotalCost | varchar(max) | max | NULL allowed |
| OldConstantDollarYear | varchar(max) | max | NULL allowed |
| Contact2FirstName | varchar(max) | max | NULL allowed |
| Contact2LastName | varchar(max) | max | NULL allowed |
| Contact2Email | varchar(max) | max | NULL allowed |
| Contact2Phone | varchar(max) | max | NULL allowed |
| ModifyComplete | varchar(max) | max | NULL allowed |
| UpdatedCostExplanation | varchar(max) | max | NULL allowed |
| Cosponsors | varchar(max) | max | NULL allowed |
| MtpImprovementTypes | varchar(max) | max | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [stg].[project_long_PlanningProcess_column]
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
[ModifyFromUnprogrammedToConstrained] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModifyConstrainedProjectDetails] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
[ChangeSponsoringAgency] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ChangeTitle] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ChangeDescription] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ChangeLocationInformation] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ChangeTotalCost] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ChangeConstantDollarYear] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ChangeCompletionYear] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ChangeFunctionalClass] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CurrentStep] [bigint] NULL,
[FundsCommitted] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Prepopulated] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ChangeStartYear] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OldTotalCost] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OldConstantDollarYear] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Contact2FirstName] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Contact2LastName] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Contact2Email] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Contact2Phone] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModifyComplete] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UpdatedCostExplanation] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Cosponsors] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MtpImprovementTypes] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO

```


---

## <a name="#uses"></a>Uses

* [stg](../Security/Schemas/dbo_stg.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

