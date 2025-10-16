#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblProjCharacteristics

# ![Tables](../../../../Images/Table32.png) [dbo].[tblProjCharacteristics]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Heap | YES |
| Row Count (~) | 247 |
| Created | 4:14:16 PM Thursday, April 13, 2017 |
| Last Modified | 4:14:16 PM Thursday, April 13, 2017 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|
| MTPID | int | 4 | NOT NULL |
| CharacteristicID | int | 4 | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblProjCharacteristics]
(
[MTPID] [int] NOT NULL,
[CharacteristicID] [int] NULL
) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewProjCharacteristics]](../Views/dbo_viewProjCharacteristics.md)
* [[dbo].[viewScopeElements]](../Views/dbo_viewScopeElements.md)
* [[dbo].[mtpsp_PostRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_PostRevision.md)
* [[dbo].[mtpsp_PostRevisionProj]](../Programmability/Stored_Procedures/dbo_mtpsp_PostRevisionProj.md)
* [[dbo].[mtpsp_projToRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_projToRevision.md)
* [[dbo].[mtpfn_predictProjCharacteristics]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_predictProjCharacteristics.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

