#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblConditions

# ![Tables](../../../../Images/Table32.png) [dbo].[tblConditions]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Heap | YES |
| Row Count (~) | 0 |
| Created | 11:31:06 AM Tuesday, December 3, 2013 |
| Last Modified | 11:31:06 AM Tuesday, December 3, 2013 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability | Identity | Default |
|---|---|---|---|---|---|
| ID | int | 4 | NOT NULL | 1 - 1 |  |
| MTPID | int | 4 | NULL allowed |  |  |
| Condition | nvarchar(2000) | 4000 | NULL allowed |  |  |
| Complete | bit | 1 | NULL allowed |  | ((0)) |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblConditions]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[MTPID] [int] NULL,
[Condition] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Complete] [bit] NULL CONSTRAINT [DF__tblCondit__Compl__2645B050] DEFAULT ((0))
) ON [PRIMARY]
GO

```


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

