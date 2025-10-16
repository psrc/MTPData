#### 

[Project](../../../../../../index.md) > [SQLserver](../../../../../index.md) > [User databases](../../../../index.md) > [MTPData](../../../index.md) > Programmability > Functions > [Scalar-valued Functions](Scalar-valued_Functions.md) > dbo.fnCurrency

# ![Scalar-valued Functions](../../../../../../Images/Function_Scalar32.png) [dbo].[fnCurrency]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |


---

## <a name="#parameters"></a>Parameters

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| @Money | money | 8 |


---

## <a name="#permissions"></a>Permissions

| Type | Action | Owning Principal |
|---|---|---|
| Grant | EXECUTE | db_fnExecutor |


---

## <a name="#sqlscript"></a>SQL Script

```sql

CREATE FUNCTION [dbo].[fnCurrency] (@Money MONEY)
RETURNS VARCHAR(25)
AS 
BEGIN
DECLARE @inputAsStr varchar(25)
SELECT @inputAsStr = CONVERT(VARCHAR(25), @MONEY, 1)

RETURN '$' + REPLACE(@inputAsStr,'.00','')
END
GO
GRANT EXECUTE ON  [dbo].[fnCurrency] TO [db_fnExecutor]
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewRevisionSummary]](../../../Views/dbo_viewRevisionSummary.md)
* [[dbo].[viewWebMapData_2018Update]](../../../Views/dbo_viewWebMapData_2018Update.md)
* [[dbo].[viewWebMapData_2018Update_posted]](../../../Views/dbo_viewWebMapData_2018Update_posted.md)
* [[dbo].[mtpsp_SummaryOfPostedProjects]](../../Stored_Procedures/dbo_mtpsp_SummaryOfPostedProjects.md)
* [[dbo].[mtpfn_ControlTotals_ConstrainedPlan]](../Table-valued_Functions/dbo_mtpfn_ControlTotals_ConstrainedPlan.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

