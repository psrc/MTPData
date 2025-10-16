#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewProjCharacteristics

# ![Views](../../../../Images/View32.png) [dbo].[viewProjCharacteristics]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 4:10:32 PM Monday, April 14, 2025 |
| Last Modified | 4:10:32 PM Monday, April 14, 2025 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| MTPID | int | 4 |
| CharacteristicName | varchar(100) | 100 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
create view [dbo].[viewProjCharacteristics]
as
select pc.MTPID, c.Name as CharacteristicName
from tblProjCharacteristics pc 
    join tblCharacteristics c on pc.CharacteristicID = c.ID
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblCharacteristics]](../Tables/dbo_tblCharacteristics.md)
* [[dbo].[tblProjCharacteristics]](../Tables/dbo_tblProjCharacteristics.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

