#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewPendingRevisions

# ![Views](../../../../Images/View32.png) [dbo].[viewPendingRevisions]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 9:55:17 AM Friday, November 15, 2013 |
| Last Modified | 10:19:29 AM Thursday, January 2, 2014 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Identity |
|---|---|---|---|
| RevisionID | int | 4 | 0 - 0 |
| RevisionName | nvarchar(100) | 200 |  |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE VIEW [dbo].[viewPendingRevisions]
as
SELECT DISTINCT RevisionID, RevisionName
from tblRevision
where Posted = 0
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblRevision]](../Tables/dbo_tblRevision.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

