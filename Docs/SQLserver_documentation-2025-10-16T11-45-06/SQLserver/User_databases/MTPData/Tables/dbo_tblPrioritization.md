#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblPrioritization

# ![Tables](../../../../Images/Table32.png) [dbo].[tblPrioritization]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Row Count (~) | 28150 |
| Created | 2:33:33 PM Thursday, March 7, 2024 |
| Last Modified | 2:33:33 PM Thursday, March 7, 2024 |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|---|
| [![Cluster Primary Key pk_tblPrioritization: MTPID\QuestionName](../../../../Images/pkcluster.png)](#indexes) | MTPID | int | 4 | NOT NULL |
| [![Cluster Primary Key pk_tblPrioritization: MTPID\QuestionName](../../../../Images/pkcluster.png)](#indexes) | QuestionName | nvarchar(10) | 20 | NOT NULL |
|  | Response | tinyint | 1 | NULL allowed |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique |
|---|---|---|---|
| [![Cluster Primary Key pk_tblPrioritization: MTPID\QuestionName](../../../../Images/pkcluster.png)](#indexes) | pk_tblPrioritization | MTPID, QuestionName | YES |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblPrioritization]
(
[MTPID] [int] NOT NULL,
[QuestionName] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Response] [tinyint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblPrioritization] ADD CONSTRAINT [pk_tblPrioritization] PRIMARY KEY CLUSTERED ([MTPID], [QuestionName]) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[mtpsp_PostRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_PostRevision.md)
* [[dbo].[mtpsp_PostRevisionProj]](../Programmability/Stored_Procedures/dbo_mtpsp_PostRevisionProj.md)
* [[dbo].[mtpsp_projToRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_projToRevision.md)
* [[dbo].[mtpfn_PrioritizationScoresByPostedProject]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_PrioritizationScoresByPostedProject.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

