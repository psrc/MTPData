#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewTIPConnections

# ![Views](../../../../Images/View32.png) [dbo].[viewTIPConnections]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 12:41:00 PM Monday, February 9, 2015 |
| Last Modified | 12:55:57 PM Monday, February 9, 2015 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| MTPID | int | 4 |
| TIPID | nvarchar(20) | 40 |
| strMTPStatus | nvarchar(50) | 100 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE view [dbo].[viewTIPConnections]
as
select cast(m.MTP_Ref as int) as MTPID,
	m.ProjNo as TIPID,
	s.strMTPStatus
from RTIPDataSQL.dbo.tblProjMTP m
	join RTIPDataSQL.dbo.tblRTIP r ON m.ProjNo = r.ProjNo
	join RTIPDataSQL.dbo.tblMTP_Status s on r.intMTPStatus = s.intMTPStatus
where m.MTP_Ref not like '%[^0-9]%'
GO

```


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

