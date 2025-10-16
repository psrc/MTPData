#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblReviewSecondaryImpType

# ![Tables](../../../../Images/Table32.png) [dbo].[tblReviewSecondaryImpType]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Heap | YES |
| Row Count (~) | 0 |
| Created | 3:27:09 PM Friday, November 1, 2013 |
| Last Modified | 3:27:09 PM Friday, November 1, 2013 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|
| APPGUID | uniqueidentifier | 16 | NULL allowed |
| ImpTypeID | smallint | 2 | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblReviewSecondaryImpType]
(
[APPGUID] [uniqueidentifier] NULL,
[ImpTypeID] [smallint] NULL
) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewReviewSecondaryImpType]](../Views/dbo_viewReviewSecondaryImpType.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

