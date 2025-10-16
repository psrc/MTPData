#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblReviewProj_ImpType

# ![Tables](../../../../Images/Table32.png) [dbo].[tblReviewProj_ImpType]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Heap | YES |
| Row Count (~) | 14068 |
| Created | 4:08:47 PM Thursday, September 18, 2014 |
| Last Modified | 4:08:17 PM Thursday, May 28, 2015 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability | Default |
|---|---|---|---|---|
| APPGUID | uniqueidentifier | 16 | NULL allowed |  |
| ImpTypeID | smallint | 2 | NULL allowed |  |
| isPrimary | bit | 1 | NULL allowed | ((0)) |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblReviewProj_ImpType]
(
[APPGUID] [uniqueidentifier] NULL,
[ImpTypeID] [smallint] NULL,
[isPrimary] [bit] NULL CONSTRAINT [DF_ReviewProj_ImpType_isPrimary] DEFAULT ((0))
) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewImprovementTypesRevisionData]](../Views/dbo_viewImprovementTypesRevisionData.md)
* [[dbo].[mtpfn_predictProj_ImpType]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_predictProj_ImpType.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

