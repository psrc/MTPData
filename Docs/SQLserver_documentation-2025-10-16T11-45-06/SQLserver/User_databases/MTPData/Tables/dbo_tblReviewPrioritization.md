#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblReviewPrioritization

# ![Tables](../../../../Images/Table32.png) [dbo].[tblReviewPrioritization]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Heap | YES |
| Row Count (~) | 254333 |
| Created | 3:40:16 PM Thursday, April 16, 2015 |
| Last Modified | 3:40:16 PM Thursday, April 16, 2015 |


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
CREATE TABLE [dbo].[tblReviewPrioritization]
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

* [[dbo].[viewPrioritizationResponses]](../Views/dbo_viewPrioritizationResponses.md)
* [[dbo].[mtpsp_PostRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_PostRevision.md)
* [[dbo].[mtpsp_PostRevisionProj]](../Programmability/Stored_Procedures/dbo_mtpsp_PostRevisionProj.md)
* [[dbo].[mtpsp_projToRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_projToRevision.md)
* [[dbo].[mtpsp_RevisionToRevision]](../Programmability/Stored_Procedures/dbo_mtpsp_RevisionToRevision.md)
* [[dbo].[mtpsp_StageToReview_Prioritization]](../Programmability/Stored_Procedures/dbo_mtpsp_StageToReview_Prioritization.md)
* [[dbo].[mtpfn_predictProject_draftPlan]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_predictProject_draftPlan.md)
* [[dbo].[mtpfn_PrioritizationAnswers]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_PrioritizationAnswers.md)
* [[dbo].[mtpfn_PrioritizationScoresByMeasure]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_PrioritizationScoresByMeasure.md)
* [[dbo].[mtpfn_PrioritizationScoresByProject]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_PrioritizationScoresByProject.md)
* [[dbo].[mtpfn_ReviewPrioritizationScores]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_ReviewPrioritizationScores.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

