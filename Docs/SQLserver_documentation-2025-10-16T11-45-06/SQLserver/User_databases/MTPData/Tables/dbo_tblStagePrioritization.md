#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblStagePrioritization

# ![Tables](../../../../Images/Table32.png) [dbo].[tblStagePrioritization]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Heap | YES |
| Row Count (~) | 1 |
| Created | 3:40:07 PM Thursday, April 16, 2015 |
| Last Modified | 9:03:37 AM Friday, March 3, 2017 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|
| MTPID | int | 4 | NULL allowed |
| a1a | bit | 1 | NULL allowed |
| a1b | bit | 1 | NULL allowed |
| a2a | bit | 1 | NULL allowed |
| a2b | bit | 1 | NULL allowed |
| a3 | bit | 1 | NULL allowed |
| a4 | bit | 1 | NULL allowed |
| a4contintued | nvarchar(200) | 400 | NULL allowed |
| c1a | bit | 1 | NULL allowed |
| c1b | bit | 1 | NULL allowed |
| c1c | bit | 1 | NULL allowed |
| c2a | bit | 1 | NULL allowed |
| c2b | bit | 1 | NULL allowed |
| c3 | bit | 1 | NULL allowed |
| c4 | bit | 1 | NULL allowed |
| c5 | bit | 1 | NULL allowed |
| f1 | bit | 1 | NULL allowed |
| f2 | bit | 1 | NULL allowed |
| f3 | bit | 1 | NULL allowed |
| f4a | bit | 1 | NULL allowed |
| f4b | bit | 1 | NULL allowed |
| f5 | bit | 1 | NULL allowed |
| f6 | bit | 1 | NULL allowed |
| j1a | bit | 1 | NULL allowed |
| j1b | bit | 1 | NULL allowed |
| j2 | bit | 1 | NULL allowed |
| j3 | bit | 1 | NULL allowed |
| j4 | bit | 1 | NULL allowed |
| m1 | bit | 1 | NULL allowed |
| m2 | bit | 1 | NULL allowed |
| m3 | bit | 1 | NULL allowed |
| m4 | bit | 1 | NULL allowed |
| m5 | bit | 1 | NULL allowed |
| m6 | bit | 1 | NULL allowed |
| m7 | bit | 1 | NULL allowed |
| o1 | bit | 1 | NULL allowed |
| o2a | bit | 1 | NULL allowed |
| o2b | bit | 1 | NULL allowed |
| o2c | bit | 1 | NULL allowed |
| o3a | bit | 1 | NULL allowed |
| o3b | bit | 1 | NULL allowed |
| o3c | bit | 1 | NULL allowed |
| s1a | bit | 1 | NULL allowed |
| s1b | bit | 1 | NULL allowed |
| s1c | bit | 1 | NULL allowed |
| s2 | bit | 1 | NULL allowed |
| t1 | bit | 1 | NULL allowed |
| t2 | bit | 1 | NULL allowed |
| t3 | bit | 1 | NULL allowed |
| t4 | bit | 1 | NULL allowed |
| w1a | bit | 1 | NULL allowed |
| w1b | bit | 1 | NULL allowed |
| w1c | bit | 1 | NULL allowed |
| w1d | bit | 1 | NULL allowed |
| w2 | bit | 1 | NULL allowed |
| w4a | bit | 1 | NULL allowed |
| w4b | bit | 1 | NULL allowed |
| m3a | bit | 1 | NULL allowed |
| m3b | bit | 1 | NULL allowed |
| m7a | bit | 1 | NULL allowed |
| m7b | bit | 1 | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblStagePrioritization]
(
[MTPID] [int] NULL,
[a1a] [bit] NULL,
[a1b] [bit] NULL,
[a2a] [bit] NULL,
[a2b] [bit] NULL,
[a3] [bit] NULL,
[a4] [bit] NULL,
[a4contintued] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[c1a] [bit] NULL,
[c1b] [bit] NULL,
[c1c] [bit] NULL,
[c2a] [bit] NULL,
[c2b] [bit] NULL,
[c3] [bit] NULL,
[c4] [bit] NULL,
[c5] [bit] NULL,
[f1] [bit] NULL,
[f2] [bit] NULL,
[f3] [bit] NULL,
[f4a] [bit] NULL,
[f4b] [bit] NULL,
[f5] [bit] NULL,
[f6] [bit] NULL,
[j1a] [bit] NULL,
[j1b] [bit] NULL,
[j2] [bit] NULL,
[j3] [bit] NULL,
[j4] [bit] NULL,
[m1] [bit] NULL,
[m2] [bit] NULL,
[m3] [bit] NULL,
[m4] [bit] NULL,
[m5] [bit] NULL,
[m6] [bit] NULL,
[m7] [bit] NULL,
[o1] [bit] NULL,
[o2a] [bit] NULL,
[o2b] [bit] NULL,
[o2c] [bit] NULL,
[o3a] [bit] NULL,
[o3b] [bit] NULL,
[o3c] [bit] NULL,
[s1a] [bit] NULL,
[s1b] [bit] NULL,
[s1c] [bit] NULL,
[s2] [bit] NULL,
[t1] [bit] NULL,
[t2] [bit] NULL,
[t3] [bit] NULL,
[t4] [bit] NULL,
[w1a] [bit] NULL,
[w1b] [bit] NULL,
[w1c] [bit] NULL,
[w1d] [bit] NULL,
[w2] [bit] NULL,
[w4a] [bit] NULL,
[w4b] [bit] NULL,
[m3a] [bit] NULL,
[m3b] [bit] NULL,
[m7a] [bit] NULL,
[m7b] [bit] NULL
) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[mtpsp_DeleteFromStagingTables]](../Programmability/Stored_Procedures/dbo_mtpsp_DeleteFromStagingTables.md)
* [[dbo].[mtpsp_ImportToStaging]](../Programmability/Stored_Procedures/dbo_mtpsp_ImportToStaging.md)
* [[dbo].[mtpsp_StageToReview_Prioritization]](../Programmability/Stored_Procedures/dbo_mtpsp_StageToReview_Prioritization.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

