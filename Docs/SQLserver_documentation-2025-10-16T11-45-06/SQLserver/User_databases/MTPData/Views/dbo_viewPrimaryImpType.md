#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewPrimaryImpType

# ![Views](../../../../Images/View32.png) [dbo].[viewPrimaryImpType]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 4:10:23 PM Thursday, September 18, 2014 |
| Last Modified | 12:30:11 PM Tuesday, October 18, 2016 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| MTPID | int | 4 |
| PrimaryImpType | smallint | 2 |


---

## <a name="#sqlscript"></a>SQL Script

```sql


CREATE view [dbo].[viewPrimaryImpType]
as
select MTPID, PrimaryImpType
from tblProject

GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblProject]](../Tables/dbo_tblProject.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

