#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblCharacteristics

# ![Tables](../../../../Images/Table32.png) [dbo].[tblCharacteristics]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Heap | YES |
| Row Count (~) | 37 |
| Created | 3:57:05 PM Thursday, April 13, 2017 |
| Last Modified | 3:57:05 PM Thursday, April 13, 2017 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|
| ID | int | 4 | NOT NULL |
| Name | varchar(100) | 100 | NULL allowed |
| Category | int | 4 | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblCharacteristics]
(
[ID] [int] NOT NULL,
[Name] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Category] [int] NULL
) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewProjCharacteristics]](../Views/dbo_viewProjCharacteristics.md)
* [[dbo].[viewReviewScopeElements]](../Views/dbo_viewReviewScopeElements.md)
* [[dbo].[viewScopeElements]](../Views/dbo_viewScopeElements.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

