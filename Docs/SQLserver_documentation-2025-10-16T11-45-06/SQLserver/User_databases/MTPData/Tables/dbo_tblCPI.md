#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Tables](Tables.md) > dbo.tblCPI

# ![Tables](../../../../Images/Table32.png) [dbo].[tblCPI]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Row Count (~) | 261 |
| Created | 10:28:29 AM Monday, December 2, 2013 |
| Last Modified | 8:21:55 AM Monday, March 6, 2017 |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|---|
| [![Cluster Primary Key PK_tblCPI: Year\factor_set](../../../../Images/pkcluster.png)](#indexes) | Year | int | 4 | NOT NULL |
|  | CPI | float | 8 | NULL allowed |
| [![Cluster Primary Key PK_tblCPI: Year\factor_set](../../../../Images/pkcluster.png)](#indexes) | factor_set | int | 4 | NOT NULL |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique |
|---|---|---|---|
| [![Cluster Primary Key PK_tblCPI: Year\factor_set](../../../../Images/pkcluster.png)](#indexes) | PK_tblCPI | Year, factor_set | YES |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [dbo].[tblCPI]
(
[Year] [int] NOT NULL,
[CPI] [float] NULL,
[factor_set] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCPI] ADD CONSTRAINT [PK_tblCPI] PRIMARY KEY CLUSTERED ([Year], [factor_set]) ON [PRIMARY]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[mtpfn_ScaleProjCost]](../Programmability/Functions/Scalar-valued_Functions/dbo_mtpfn_ScaleProjCost.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

