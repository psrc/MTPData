#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewProjectLog

# ![Views](../../../../Images/View32.png) [dbo].[viewProjectLog]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 3:59:30 PM Tuesday, October 14, 2014 |
| Last Modified | 1:20:01 PM Thursday, November 6, 2014 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| RecID | int | 4 |
| MTPID | int | 4 |
| NoteDate | datetime | 8 |
| Author | nvarchar(50) | 100 |
| Note | nvarchar(4000) | 8000 |
| RevisionName | nvarchar(100) | 200 |


---

## <a name="#sqlscript"></a>SQL Script

```sql

CREATE view [dbo].[viewProjectLog] 
as
select l.RecID, l.MTPID, l.NoteDate, l.Author, l.Note,
	r.RevisionName
from tblProjectLog l
	left join tblRevision r ON l.RevisionID = r.RevisionID
WHERE l.LogType = 1 -- log type = "log entry"
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblProjectLog]](../Tables/dbo_tblProjectLog.md)
* [[dbo].[tblRevision]](../Tables/dbo_tblRevision.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

