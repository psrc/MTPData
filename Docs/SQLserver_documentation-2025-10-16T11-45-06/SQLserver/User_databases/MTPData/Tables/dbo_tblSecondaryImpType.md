#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblSecondaryImpType

# ![Tables](../../../../Images/Table32.png) [dbo].[tblSecondaryImpType]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Heap | YES |
| Row Count (~) | 408 |
| Created | 2:22:00 PM Friday, November 1, 2013 |
| Last Modified | 2:22:00 PM Friday, November 1, 2013 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|
| MTPID | int | 4 | NULL allowed |
| ImpTypeID | smallint | 2 | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblSecondaryImpType]
(
[MTPID] [int] NULL,
[ImpTypeID] [smallint] NULL
) ON [PRIMARY]
GO

```


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

