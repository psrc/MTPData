#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewScoresBySectionAndProjectPivoted

# ![Views](../../../../Images/View32.png) [dbo].[viewScoresBySectionAndProjectPivoted]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 10:31:06 AM Friday, May 23, 2025 |
| Last Modified | 10:31:06 AM Friday, May 23, 2025 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| MTPID | int | 4 |
| Community Benefits | int | 4 |
| Emissions | int | 4 |
| Puget Sound Land and Water | int | 4 |
| Safety & System Security | int | 4 |
| Support for Centers | int | 4 |
| Supporting Employment | int | 4 |
| Supporting Freight Movement | int | 4 |
| Transportation Alternatives | int | 4 |
| Travel Reliability | int | 4 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
create view [dbo].[viewScoresBySectionAndProjectPivoted] 
as
select  MTPID, 
        [Community Benefits],
        [Emissions],
        [Puget Sound Land and Water],
        [Safety & System Security],
        [Support for Centers],
        [Supporting Employment],
        [Supporting Freight Movement],
        [Transportation Alternatives],
        [Travel Reliability]
from 
(
    select  MTPID, Section, Score
    from dbo.viewScoresBySectionAndProject
) as qry 
pivot 
(
    max(Score)
    for Section in (
        [Community Benefits],
        [Emissions],
        [Puget Sound Land and Water],
        [Safety & System Security],
        [Support for Centers],
        [Supporting Employment],
        [Supporting Freight Movement],
        [Transportation Alternatives],
        [Travel Reliability]
    )
) as PivotTable
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[viewScoresBySectionAndProject]](dbo_viewScoresBySectionAndProject.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[mtpfn_currentProjects]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_currentProjects.md)
* [[dbo].[mtpfn_predictProject]](../Programmability/Functions/Table-valued_Functions/dbo_mtpfn_predictProject.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

