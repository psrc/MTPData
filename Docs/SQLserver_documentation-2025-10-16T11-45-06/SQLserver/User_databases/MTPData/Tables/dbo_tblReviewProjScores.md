#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblReviewProjScores

# ![Tables](../../../../Images/Table32.png) [dbo].[tblReviewProjScores]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Heap | YES |
| Row Count (~) | 20790 |
| Created | 5:00:17 PM Wednesday, April 16, 2025 |
| Last Modified | 5:00:17 PM Wednesday, April 16, 2025 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|
| AppGUID | uniqueidentifier | 16 | NULL allowed |
| MTPID | int | 4 | NULL allowed |
| QuestionName | nvarchar(10) | 20 | NULL allowed |
| Response | tinyint | 1 | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblReviewProjScores]
(
[AppGUID] [uniqueidentifier] NULL,
[MTPID] [int] NULL,
[QuestionName] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response] [tinyint] NULL
) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewReviewConsistencyAnswersPivoted]](../Views/dbo_viewReviewConsistencyAnswersPivoted.md)
* [[dbo].[viewReviewScoresByProject]](../Views/dbo_viewReviewScoresByProject.md)
* [[dbo].[viewReviewScoresBySectionAndProject]](../Views/dbo_viewReviewScoresBySectionAndProject.md)
* [[dbo].[mtpsp_PostRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_PostRevision.md)
* [[dbo].[mtpsp_PostRevisionProj]](../Programmability/Stored_Procedures/dbo_mtpsp_PostRevisionProj.md)
* [[dbo].[mtpsp_projToRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_projToRevision.md)
* [[dbo].[mtpsp_RevisionToRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_RevisionToRevision.md)
* [[stg].[merge_scores]](../Programmability/Stored_Procedures/stg_merge_scores.md)
* [[dbo].[mtpfn_ReviewScoresByProject]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_ReviewScoresByProject.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

