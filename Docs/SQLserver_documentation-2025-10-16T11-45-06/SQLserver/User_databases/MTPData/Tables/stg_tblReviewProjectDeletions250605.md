#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > stg.tblReviewProjectDeletions250605

# ![Tables](../../../../Images/Table32.png) [stg].[tblReviewProjectDeletions250605]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Heap | YES |
| Row Count (~) | 1 |
| Created | 12:59:43 PM Thursday, June 5, 2025 |
| Last Modified | 12:59:43 PM Thursday, June 5, 2025 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|
| AppGUID | uniqueidentifier | 16 | NOT NULL |
| RevisionID | int | 4 | NULL allowed |
| DateStamp | datetime | 8 | NULL allowed |
| MTPID | int | 4 | NULL allowed |
| Agency | smallint | 2 | NULL allowed |
| Title | nvarchar(1000) | 2000 | NULL allowed |
| ProjDesc | nvarchar(max) | max | NULL allowed |
| TotProjCost | money | 8 | NULL allowed |
| ContactName | nvarchar(50) | 100 | NULL allowed |
| ContactPhone | nvarchar(100) | 200 | NULL allowed |
| ContactEmail | nvarchar(100) | 200 | NULL allowed |
| EstCostYear | int | 4 | NULL allowed |
| CompletionYear | int | 4 | NULL allowed |
| MTPStatus | int | 4 | NULL allowed |
| ProjectOn | nvarchar(255) | 510 | NULL allowed |
| ProjectFrom | nvarchar(255) | 510 | NULL allowed |
| ProjectTo | nvarchar(255) | 510 | NULL allowed |
| MilePostFrom | decimal(18,1) | 9 | NULL allowed |
| MilePostTo | decimal(18,1) | 9 | NULL allowed |
| CountyID | smallint | 2 | NULL allowed |
| StateRouteID | smallint | 2 | NULL allowed |
| FuncClassID | tinyint | 1 | NULL allowed |
| StartYear | int | 4 | NULL allowed |
| WebLinks | nvarchar(1000) | 2000 | NULL allowed |
| DatePosted | datetime | 8 | NULL allowed |
| DateOverwritten | datetime | 8 | NULL allowed |
| Edit | bit | 1 | NULL allowed |
| ReviewTypeID | int | 4 | NULL allowed |
| PrimaryImpType | smallint | 2 | NULL allowed |
| PlanningProcess | nvarchar(2000) | 4000 | NULL allowed |
| LettersOfConcurrence | nvarchar(2000) | 4000 | NULL allowed |
| FundsDescription | nvarchar(2000) | 4000 | NULL allowed |
| FundsCommitted | decimal(18,0) | 9 | NULL allowed |
| ApplicationID | int | 4 | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [stg].[tblReviewProjectDeletions250605]
(
[AppGUID] [uniqueidentifier] NOT NULL,
[RevisionID] [int] NULL,
[DateStamp] [datetime] NULL,
[MTPID] [int] NULL,
[Agency] [smallint] NULL,
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
[DatePosted] [datetime] NULL,
[DateOverwritten] [datetime] NULL,
[Edit] [bit] NULL,
[ReviewTypeID] [int] NULL,
[PrimaryImpType] [smallint] NULL,
[PlanningProcess] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LettersOfConcurrence] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FundsDescription] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FundsCommitted] [decimal] (18, 0) NULL,
[ApplicationID] [int] NULL
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

