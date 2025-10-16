#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewRevision

# ![Views](../../../../Images/View32.png) [dbo].[viewRevision]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 1:01:42 PM Tuesday, December 31, 2013 |
| Last Modified | 1:01:42 PM Tuesday, December 31, 2013 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| RevisionID | int | 4 |
| RevisionName | nvarchar(100) | 200 |
| ExecBoardApprovalDate | datetime | 8 |
| PolicyBoardApprovalDate | datetime | 8 |
| EditionID | smallint | 2 |
| Posted | bit | 1 |
| RevisionTypeName | nvarchar(100) | 200 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE VIEW [dbo].[viewRevision]
AS
SELECT r.RevisionID, r.RevisionName,r.ExecBoardApprovalDate, 
	r.PolicyBoardApprovalDate,r.EditionID,
	r.Posted,   rt.RevisionTypeName
FROM tblRevision r	
	join tblRevisionType rt on r.RevisionTypeID = rt.RevisionTypeID
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblRevision]](../Tables/dbo_tblRevision.md)
* [[dbo].[tblRevisionType]](../Tables/dbo_tblRevisionType.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

