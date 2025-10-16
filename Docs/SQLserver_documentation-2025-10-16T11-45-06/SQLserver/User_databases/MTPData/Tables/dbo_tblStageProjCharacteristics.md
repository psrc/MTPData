#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblStageProjCharacteristics

# ![Tables](../../../../Images/Table32.png) [dbo].[tblStageProjCharacteristics]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Heap | YES |
| Row Count (~) | 0 |
| Created | 4:16:02 PM Thursday, April 13, 2017 |
| Last Modified | 4:12:22 PM Monday, April 17, 2017 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|
| MTPID | int | 4 | NULL allowed |
| CharacteristicID | int | 4 | NULL allowed |
| AppID | int | 4 | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblStageProjCharacteristics]
(
[MTPID] [int] NULL,
[CharacteristicID] [int] NULL,
[AppID] [int] NULL
) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[mtpsp_DeleteFromStagingTables]](../Programmability/Stored_Procedures/dbo_mtpsp_DeleteFromStagingTables.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

