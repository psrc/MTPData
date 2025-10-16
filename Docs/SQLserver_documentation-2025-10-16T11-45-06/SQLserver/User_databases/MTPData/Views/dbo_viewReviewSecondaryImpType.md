#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewReviewSecondaryImpType

# ![Views](../../../../Images/View32.png) [dbo].[viewReviewSecondaryImpType]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 1:24:03 PM Monday, December 2, 2013 |
| Last Modified | 2:04:35 PM Monday, December 2, 2013 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| AppGUID | uniqueidentifier | 16 |
| ImpTypeID | smallint | 2 |
| OldID | nvarchar(50) | 100 |
| ImpTypeName | nvarchar(100) | 200 |
| ImpTypeDesc | nvarchar(4000) | 8000 |
| ImpTypeGeneric1 | nvarchar(10) | 20 |
| ImpTypeGeneric2 | nvarchar(10) | 20 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE VIEW [dbo].[viewReviewSecondaryImpType]
AS	
SELECT s.AppGUID, i.*	
FROM tblReviewSecondaryImpType s
	join tblImproveType i on s.ImpTypeID = i.ImpTypeID
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblImproveType]](../Tables/dbo_tblImproveType.md)
* [[dbo].[tblReviewSecondaryImpType]](../Tables/dbo_tblReviewSecondaryImpType.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

