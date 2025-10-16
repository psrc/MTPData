#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblProjectLog

# ![Tables](../../../../Images/Table32.png) [dbo].[tblProjectLog]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Heap | YES |
| Row Count (~) | 682 |
| Created | 10:13:11 AM Wednesday, November 13, 2013 |
| Last Modified | 1:18:06 PM Thursday, November 6, 2014 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability | Identity | Default |
|---|---|---|---|---|---|
| RecID | int | 4 | NOT NULL | 1 - 1 |  |
| MTPID | int | 4 | NULL allowed |  |  |
| NoteDate | datetime | 8 | NULL allowed |  | (getdate()) |
| Author | nvarchar(50) | 100 | NULL allowed |  | (substring(original_login(),charindex('\\',original_login())+(1),(20))) |
| Note | nvarchar(4000) | 8000 | NULL allowed |  |  |
| RevisionID | int | 4 | NULL allowed |  |  |
| LogType | tinyint | 1 | NULL allowed |  | ((1)) |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblProjectLog]
(
[RecID] [int] NOT NULL IDENTITY(1, 1),
[MTPID] [int] NULL,
[NoteDate] [datetime] NULL CONSTRAINT [DF__tblProjec__NoteD__75A278F5] DEFAULT (getdate()),
[Author] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__tblProjec__Autho__76969D2E] DEFAULT (substring(original_login(),charindex('\\',original_login())+(1),(20))),
[Note] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RevisionID] [int] NULL,
[LogType] [tinyint] NULL CONSTRAINT [df_LogType1] DEFAULT ((1))
) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewProjectLog]](../Views/dbo_viewProjectLog.md)
* [[dbo].[viewRevisionComment]](../Views/dbo_viewRevisionComment.md)
* [[dbo].[mtpsp_PostRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_PostRevision.md)
* [[dbo].[mtpsp_PostRevisionProj]](../Programmability/Stored_Procedures/dbo_mtpsp_PostRevisionProj.md)
* [[dbo].[mtpsp_projToRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_projToRevision.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

