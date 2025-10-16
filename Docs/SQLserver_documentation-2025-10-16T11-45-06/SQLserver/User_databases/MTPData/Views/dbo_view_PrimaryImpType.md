#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.view_PrimaryImpType

# ![Views](../../../../Images/View32.png) [dbo].[view_PrimaryImpType]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 3:39:44 PM Thursday, September 18, 2014 |
| Last Modified | 3:39:44 PM Thursday, September 18, 2014 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| MTPID | int | 4 |
| ImpTypeID | smallint | 2 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
create view [dbo].[view_PrimaryImpType]
as
select MTPID, ImpTypeID
from tblProj_ImpType
where isPrimary = 1
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblProj_ImpType]](../Tables/dbo_tblProj_ImpType.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

