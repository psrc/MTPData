#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblFuncClass

# ![Tables](../../../../Images/Table32.png) [dbo].[tblFuncClass]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Heap | YES |
| Row Count (~) | 15 |
| Created | 11:42:15 AM Friday, November 22, 2013 |
| Last Modified | 11:42:15 AM Friday, November 22, 2013 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|
| FuncClassID | tinyint | 1 | NULL allowed |
| FCName | nvarchar(100) | 200 | NULL allowed |
| UrbanRural | nvarchar(2) | 4 | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblFuncClass]
(
[FuncClassID] [tinyint] NULL,
[FCName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UrbanRural] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewProject]](../Views/dbo_viewProject.md)
* [[dbo].[viewRevisionSummary]](../Views/dbo_viewRevisionSummary.md)
* [[dbo].[mtpfn_currentProjects]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_currentProjects.md)
* [[dbo].[mtpfn_predictProject]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_predictProject.md)
* [[dbo].[mtpfn_predictProject_draftPlan]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_predictProject_draftPlan.md)
* [[dbo].[mtpfn_ReviewProjects]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_ReviewProjects.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

