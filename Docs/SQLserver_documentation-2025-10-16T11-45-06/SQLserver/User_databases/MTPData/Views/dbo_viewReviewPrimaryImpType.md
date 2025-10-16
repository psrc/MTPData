#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewReviewPrimaryImpType

# ![Views](../../../../Images/View32.png) [dbo].[viewReviewPrimaryImpType]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 4:10:06 PM Thursday, September 18, 2014 |
| Last Modified | 12:30:21 PM Tuesday, October 18, 2016 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| APPGUID | uniqueidentifier | 16 |
| PrimaryImpType | smallint | 2 |


---

## <a name="#sqlscript"></a>SQL Script

```sql

CREATE view [dbo].[viewReviewPrimaryImpType]
as 
select APPGUID, PrimaryImpType
from tblReviewProject
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblReviewProject]](../Tables/dbo_tblReviewProject.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

