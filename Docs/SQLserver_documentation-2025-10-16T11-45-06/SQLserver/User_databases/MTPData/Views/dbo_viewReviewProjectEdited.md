#### 

[Project](../../../../index.md) > [SQLserver](../../../index.md) > [User databases](../../index.md) > [MTPData](../index.md) > [Views](Views.md) > dbo.viewReviewProjectEdited

# ![Views](../../../../Images/View32.png) [dbo].[viewReviewProjectEdited]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 8:37:23 AM Wednesday, June 4, 2014 |
| Last Modified | 8:37:23 AM Wednesday, June 4, 2014 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| AppGUID | uniqueidentifier | 16 |
| RevisionID | int | 4 |
| DateStamp | datetime | 8 |
| MTPID | int | 4 |
| Agency | smallint | 2 |
| PrimaryImpType | int | 4 |
| Title | nvarchar(1000) | 2000 |
| ProjDesc | nvarchar(max) | max |
| TotProjCost | money | 8 |
| ContactName | nvarchar(50) | 100 |
| ContactPhone | nvarchar(100) | 200 |
| ContactEmail | nvarchar(100) | 200 |
| EstCostYear | int | 4 |
| CompletionYear | int | 4 |
| MTPStatus | int | 4 |
| ProjectOn | nvarchar(255) | 510 |
| ProjectFrom | nvarchar(255) | 510 |
| ProjectTo | nvarchar(255) | 510 |
| MilePostFrom | decimal(18,1) | 9 |
| MilePostTo | decimal(18,1) | 9 |
| CountyID | smallint | 2 |
| StateRouteID | smallint | 2 |
| FuncClassID | tinyint | 1 |
| StartYear | int | 4 |
| WebLinks | nvarchar(1000) | 2000 |
| DatePosted | datetime | 8 |
| DateOverwritten | datetime | 8 |
| Edit | bit | 1 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE VIEW [dbo].[viewReviewProjectEdited]
AS
SELECT *
FROM tblReviewProject 
WHERE Edit = 1
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblReviewProject]](../Tables/dbo_tblReviewProject.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

