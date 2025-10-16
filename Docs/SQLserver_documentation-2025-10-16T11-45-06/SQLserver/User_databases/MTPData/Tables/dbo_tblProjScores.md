#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblProjScores

# ![Tables](../../../../Images/Table32.png) [dbo].[tblProjScores]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Row Count (~) | 0 |
| Created | 2:55:39 PM Tuesday, April 29, 2025 |
| Last Modified | 2:57:03 PM Tuesday, April 29, 2025 |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default |
|---|---|---|---|---|---|
|  | created_at | datetime2 | 8 | NULL allowed | (getdate()) |
|  | updated_at | datetime2 | 8 | NULL allowed | (getdate()) |
| [![Cluster Primary Key pk_tblProjScores: MTPID\QuestionName](../../../../Images/pkcluster.png)](#indexes) | MTPID | int | 4 | NOT NULL |  |
| [![Cluster Primary Key pk_tblProjScores: MTPID\QuestionName](../../../../Images/pkcluster.png)](#indexes) | QuestionName | nvarchar(10) | 20 | NOT NULL |  |
|  | Response | tinyint | 1 | NULL allowed |  |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique |
|---|---|---|---|
| [![Cluster Primary Key pk_tblProjScores: MTPID\QuestionName](../../../../Images/pkcluster.png)](#indexes) | pk_tblProjScores | MTPID, QuestionName | YES |


---

## <a name="#triggers"></a>Triggers

| Name | ANSI Nulls On | Quoted Identifier On | On |
|---|---|---|---|
| trigger_tblProjScores_updated_at | YES | YES | After Update |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblProjScores]
(
[created_at] [datetime2] NULL CONSTRAINT [DF__tblProjSc__creat__7B4643B2] DEFAULT (getdate()),
[updated_at] [datetime2] NULL CONSTRAINT [DF__tblProjSc__updat__7C3A67EB] DEFAULT (getdate()),
[MTPID] [int] NOT NULL,
[QuestionName] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Response] [tinyint] NULL
) ON [PRIMARY]
GO
CREATE TRIGGER [dbo].[trigger_tblProjScores_updated_at] on [dbo].[tblProjScores]
after update
as
begin
	UPDATE dbo.tblProjScores
	set updated_at = GETDATE()
    from dbo.tblProjScores s
        join Inserted i on s.[MTPID] = i.[MTPID] and s.[QuestionName] = i.[QuestionName]
end
GO
ALTER TABLE [dbo].[tblProjScores] ADD CONSTRAINT [pk_tblProjScores] PRIMARY KEY CLUSTERED ([MTPID], [QuestionName]) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewScoresByProject]](../Views/dbo_viewScoresByProject.md)
* [[dbo].[viewScoresBySectionAndProject]](../Views/dbo_viewScoresBySectionAndProject.md)
* [[dbo].[mtpsp_PostRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_PostRevision.md)
* [[dbo].[mtpsp_PostRevisionProj]](../Programmability/Stored_Procedures/dbo_mtpsp_PostRevisionProj.md)
* [[dbo].[mtpsp_projToRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_projToRevision.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

