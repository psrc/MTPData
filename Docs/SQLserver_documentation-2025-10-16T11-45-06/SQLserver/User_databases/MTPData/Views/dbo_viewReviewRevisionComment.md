#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewReviewRevisionComment

# ![Views](../../../../Images/View32.png) [dbo].[viewReviewRevisionComment]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 1:18:24 PM Thursday, November 6, 2014 |
| Last Modified | 1:18:24 PM Thursday, November 6, 2014 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Identity |
|---|---|---|---|
| RecID | int | 4 | 0 - 0 |
| AppGUID | uniqueidentifier | 16 |  |
| NoteDate | datetime | 8 |  |
| Author | nvarchar(50) | 100 |  |
| Note | nvarchar(4000) | 8000 |  |
| RevisionID | int | 4 |  |


---

## <a name="#sqlscript"></a>SQL Script

```sql

CREATE VIEW [dbo].[viewReviewRevisionComment]
as
SELECT RecID, AppGUID, NoteDate, Author, Note, RevisionID
FROM tblReviewProjectLog 
WHERE LogType = 2
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblReviewProjectLog]](../Tables/dbo_tblReviewProjectLog.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

