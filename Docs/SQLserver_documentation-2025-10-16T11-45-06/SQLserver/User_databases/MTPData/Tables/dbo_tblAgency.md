#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblAgency

# ![Tables](../../../../Images/Table32.png) [dbo].[tblAgency]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Row Count (~) | 160 |
| Created | 4:21:19 PM Monday, September 15, 2014 |
| Last Modified | 2:27:34 PM Tuesday, November 1, 2016 |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|---|
| [![Cluster Primary Key PK__tblAgenc__95C0E84B5D95E53A: AgencyNo](../../../../Images/pkcluster.png)](#indexes) | AgencyNo | smallint | 2 | NOT NULL |
|  | Place | nvarchar(100) | 200 | NULL allowed |
|  | PlaceShortName | nvarchar(100) | 200 | NULL allowed |
|  | AgencyType | tinyint | 1 | NULL allowed |
|  | WebAppUserID | smallint | 2 | NULL allowed |
|  | WebAppAgencyID | smallint | 2 | NULL allowed |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique |
|---|---|---|---|
| [![Cluster Primary Key PK__tblAgenc__95C0E84B5D95E53A: AgencyNo](../../../../Images/pkcluster.png)](#indexes) | PK__tblAgenc__95C0E84B5D95E53A | AgencyNo | YES |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblAgency]
(
[AgencyNo] [smallint] NOT NULL,
[Place] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PlaceShortName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AgencyType] [tinyint] NULL,
[WebAppUserID] [smallint] NULL,
[WebAppAgencyID] [smallint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAgency] ADD CONSTRAINT [PK__tblAgenc__95C0E84B5D95E53A] PRIMARY KEY CLUSTERED ([AgencyNo]) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewProjCosponsors]](../Views/dbo_viewProjCosponsors.md)
* [[dbo].[viewProject]](../Views/dbo_viewProject.md)
* [[dbo].[viewReviewProject]](../Views/dbo_viewReviewProject.md)
* [[dbo].[viewReviewProjectsArchive]](../Views/dbo_viewReviewProjectsArchive.md)
* [[dbo].[viewRevisionSummary]](../Views/dbo_viewRevisionSummary.md)
* [[dbo].[viewWebMapData_2018Update]](../Views/dbo_viewWebMapData_2018Update.md)
* [[dbo].[mtpfn_ArchivedProject]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_ArchivedProject.md)
* [[dbo].[mtpfn_currentProjects]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_currentProjects.md)
* [[dbo].[mtpfn_predictProject]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_predictProject.md)
* [[dbo].[mtpfn_predictProject_draftPlan]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_predictProject_draftPlan.md)
* [[dbo].[mtpfn_ReviewProjects]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_ReviewProjects.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

