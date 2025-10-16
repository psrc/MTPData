#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewProjCosponsors

# ![Views](../../../../Images/View32.png) [dbo].[viewProjCosponsors]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 1:32:57 PM Wednesday, December 4, 2013 |
| Last Modified | 1:32:57 PM Wednesday, December 4, 2013 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| MTPID | int | 4 |
| AgencyNo | smallint | 2 |
| Place | nvarchar(100) | 200 |
| PlaceShortName | nvarchar(50) | 100 |
| AgencyType | tinyint | 1 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE VIEW [dbo].[viewProjCosponsors]
AS
SELECT pc.MTPID, PC.AgencyNo, a.Place, a.PlaceShortName, a.AgencyType
FROM tblProjCosponsors pc
	JOIN tblAgency a ON pc.AgencyNo = a.AgencyNo
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblAgency]](../Tables/dbo_tblAgency.md)
* [[dbo].[tblProjCosponsors]](../Tables/dbo_tblProjCosponsors.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

