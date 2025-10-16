#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblProjEdition

# ![Tables](../../../../Images/Table32.png) [dbo].[tblProjEdition]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Heap | YES |
| Row Count (~) | 2386 |
| Created | 2:15:48 PM Friday, November 1, 2013 |
| Last Modified | 2:15:48 PM Friday, November 1, 2013 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|
| MTPID | int | 4 | NULL allowed |
| EditionID | smallint | 2 | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblProjEdition]
(
[MTPID] [int] NULL,
[EditionID] [smallint] NULL
) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewProjEdition]](../Views/dbo_viewProjEdition.md)
* [[dbo].[viewScopeElements]](../Views/dbo_viewScopeElements.md)
* [[dbo].[mtpsp_PostRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_PostRevision.md)
* [[dbo].[mtpsp_PostRevisionProj]](../Programmability/Stored_Procedures/dbo_mtpsp_PostRevisionProj.md)
* [[dbo].[mtpsp_PostToNewEdition]](../Programmability/Stored_Procedures/dbo_mtpsp_PostToNewEdition.md)
* [[dbo].[mtpsp_ProjectList]](../Programmability/Stored_Procedures/dbo_mtpsp_ProjectList.md)
* [[dbo].[mtpsp_projToRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_projToRevision.md)
* [[dbo].[mtpsp_StageToReviewProjEdition]](../Programmability/Stored_Procedures/dbo_mtpsp_StageToReviewProjEdition.md)
* [[dbo].[mtpfn_currentProjects]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_currentProjects.md)
* [[dbo].[mtpfn_predictProject]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_predictProject.md)
* [[dbo].[mtpfn_ProjectsForEdition]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_ProjectsForEdition.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

