#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblReviewProjectLog

# ![Tables](../../../../Images/Table32.png) [dbo].[tblReviewProjectLog]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Heap | YES |
| Row Count (~) | 44460 |
| Created | 3:35:47 PM Thursday, November 14, 2013 |
| Last Modified | 1:18:10 PM Thursday, November 6, 2014 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability | Identity | Default |
|---|---|---|---|---|---|
| RecID | int | 4 | NOT NULL | 1 - 1 |  |
| AppGUID | uniqueidentifier | 16 | NULL allowed |  |  |
| NoteDate | datetime | 8 | NULL allowed |  | (getdate()) |
| Author | nvarchar(50) | 100 | NULL allowed |  | (substring(original_login(),charindex('\\',original_login())+(1),(20))) |
| Note | nvarchar(4000) | 8000 | NULL allowed |  |  |
| RevisionID | int | 4 | NULL allowed |  |  |
| LogType | tinyint | 1 | NULL allowed |  | ((1)) |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblReviewProjectLog]
(
[RecID] [int] NOT NULL IDENTITY(1, 1),
[AppGUID] [uniqueidentifier] NULL,
[NoteDate] [datetime] NULL CONSTRAINT [DF__tblReview__NoteD__797309D9] DEFAULT (getdate()),
[Author] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__tblReview__Autho__7A672E12] DEFAULT (substring(original_login(),charindex('\\',original_login())+(1),(20))),
[Note] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RevisionID] [int] NULL,
[LogType] [tinyint] NULL CONSTRAINT [df_ReviewProjectLog_LogType1] DEFAULT ((1))
) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewReviewRevisionComment]](../Views/dbo_viewReviewRevisionComment.md)
* [[dbo].[mtpsp_AddRevisionComment]](../Programmability/Stored_Procedures/dbo_mtpsp_AddRevisionComment.md)
* [[dbo].[mtpsp_DeleteProjRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_DeleteProjRevision.md)
* [[dbo].[mtpsp_DisplayRevisionComments]](../Programmability/Stored_Procedures/dbo_mtpsp_DisplayRevisionComments.md)
* [[dbo].[mtpsp_PostRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_PostRevision.md)
* [[dbo].[mtpsp_PostRevisionProj]](../Programmability/Stored_Procedures/dbo_mtpsp_PostRevisionProj.md)
* [[dbo].[mtpsp_projToRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_projToRevision.md)
* [[dbo].[mtpsp_RevisionToRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_RevisionToRevision.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

