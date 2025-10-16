#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewSecondaryImpType

# ![Views](../../../../Images/View32.png) [dbo].[viewSecondaryImpType]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 1:22:35 PM Monday, December 2, 2013 |
| Last Modified | 12:30:51 PM Tuesday, October 18, 2016 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| MTPID | int | 4 |
| ImpTypeID | smallint | 2 |
| OldID | nvarchar(50) | 100 |
| ImpTypeName | nvarchar(100) | 200 |
| ImpTypeDesc | nvarchar(4000) | 8000 |
| ImpTypeGeneric1 | nvarchar(10) | 20 |
| ImpTypeGeneric2 | nvarchar(10) | 20 |


---

## <a name="#sqlscript"></a>SQL Script

```sql


CREATE VIEW [dbo].[viewSecondaryImpType]
AS
SELECT pit.MTPID, i.*	
FROM tblProj_SecondaryImptype pit
	join tblImproveType i on pit.ImpTypeID = i.ImpTypeID

GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblImproveType]](../Tables/dbo_tblImproveType.md)
* [[dbo].[tblProj_SecondaryImpType]](../Tables/dbo_tblProj_SecondaryImpType.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

