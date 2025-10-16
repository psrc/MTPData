#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.RTP_scores

# ![Tables](../../../../Images/Table32.png) [dbo].[RTP_scores]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Row Count (~) | 45 |
| Created | 2:20:31 PM Tuesday, April 8, 2025 |
| Last Modified | 2:20:31 PM Tuesday, April 8, 2025 |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|---|
| [![Cluster Primary Key PK_RTP_scores: QuestionName](../../../../Images/pkcluster.png)](#indexes) | QuestionName | nvarchar(50) | 100 | NOT NULL |
|  | WebappsID | nvarchar(50) | 100 | NOT NULL |
|  | QuestionGroup | tinyint | 1 | NOT NULL |
|  | QuestionValue | tinyint | 1 | NOT NULL |
|  | MeasureID | nvarchar(50) | 100 | NOT NULL |
|  | Section | nvarchar(50) | 100 | NOT NULL |
|  | QuestionText | nvarchar(250) | 500 | NOT NULL |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique |
|---|---|---|---|
| [![Cluster Primary Key PK_RTP_scores: QuestionName](../../../../Images/pkcluster.png)](#indexes) | PK_RTP_scores | QuestionName | YES |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[RTP_scores]
(
[QuestionName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[WebappsID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[QuestionGroup] [tinyint] NOT NULL,
[QuestionValue] [tinyint] NOT NULL,
[MeasureID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Section] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[QuestionText] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RTP_scores] ADD CONSTRAINT [PK_RTP_scores] PRIMARY KEY CLUSTERED ([QuestionName]) ON [PRIMARY]
GO

```


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

