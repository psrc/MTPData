#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblModelNotes

# ![Tables](../../../../Images/Table32.png) [dbo].[tblModelNotes]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Row Count (~) | 0 |
| Created | 11:43:54 AM Wednesday, April 29, 2015 |
| Last Modified | 11:43:58 AM Wednesday, April 29, 2015 |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Identity | Default |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK__tblModel__3214EC270E391C95: ID](../../../../Images/pkcluster.png)](#indexes) | ID | int | 4 | NOT NULL | 1 - 1 |  |
|  | MTPID | int | 4 | NULL allowed |  |  |
|  | ProjVersion | int | 4 | NULL allowed |  |  |
|  | Note | nvarchar(max) | max | NULL allowed |  |  |
|  | DateCreated | datetime | 8 | NULL allowed |  | (getdate()) |
|  | DateUpdated | datetime | 8 | NULL allowed |  | (getdate()) |
|  | Author | nvarchar(50) | 100 | NULL allowed |  | (substring(original_login(),charindex('\\',original_login())+(1),(20))) |
|  | LastEditor | nvarchar(50) | 100 | NULL allowed |  | (substring(original_login(),charindex('\\',original_login())+(1),(20))) |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique |
|---|---|---|---|
| [![Cluster Primary Key PK__tblModel__3214EC270E391C95: ID](../../../../Images/pkcluster.png)](#indexes) | PK__tblModel__3214EC270E391C95 | ID | YES |


---

## <a name="#triggers"></a>Triggers

| Name | ANSI Nulls On | Quoted Identifier On | On |
|---|---|---|---|
| Upd | YES | YES | After Update |


---

## <a name="#permissions"></a>Permissions

| Type | Action | Owning Principal |
|---|---|---|
| Grant | DELETE | mtpdb_Modeler |
| Grant | INSERT | mtpdb_Modeler |
| Grant | UPDATE | mtpdb_Modeler |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblModelNotes]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[MTPID] [int] NULL,
[ProjVersion] [int] NULL,
[Note] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateCreated] [datetime] NULL CONSTRAINT [DF__tblModelN__DateC__10216507] DEFAULT (getdate()),
[DateUpdated] [datetime] NULL CONSTRAINT [DF__tblModelN__DateU__11158940] DEFAULT (getdate()),
[Author] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__tblModelN__Autho__1209AD79] DEFAULT (substring(original_login(),charindex('\\',original_login())+(1),(20))),
[LastEditor] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__tblModelN__LastE__12FDD1B2] DEFAULT (substring(original_login(),charindex('\\',original_login())+(1),(20)))
) ON [PRIMARY]
GO
CREATE TRIGGER [dbo].[Upd] ON [dbo].[tblModelNotes]
AFTER UPDATE
AS 
UPDATE tblModelNotes
SET DateUpdated = GetDate(),
	LastEditor = substring(original_login(),charindex('\\',original_login())+(1),(20))
FROM tblModelNotes n 
	join inserted i ON n.ID = i.ID

GO
ALTER TABLE [dbo].[tblModelNotes] ADD CONSTRAINT [PK__tblModel__3214EC270E391C95] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[tblModelNotes] TO [mtpdb_Modeler]
GO
GRANT INSERT ON  [dbo].[tblModelNotes] TO [mtpdb_Modeler]
GO
GRANT UPDATE ON  [dbo].[tblModelNotes] TO [mtpdb_Modeler]
GO

```


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

