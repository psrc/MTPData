#### 

[Project](../../../../../../index.md) > [SQLserver](../../../../../index.md) > [User databases](../../../../index.md) > [MTPData](../../../index.md) > Programmability > Functions > [Scalar-valued Functions](Scalar-valued_Functions.md) > dbo.fnCurrencyNoDollarSign

# ![Scalar-valued Functions](../../../../../../Images/Function_Scalar32.png) [dbo].[fnCurrencyNoDollarSign]

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

## <a name="#sqlscript"></a>SQL Script

```sql


CREATE FUNCTION [dbo].[fnCurrencyNoDollarSign] (@Money MONEY)
RETURNS VARCHAR(25)
AS 
BEGIN
DECLARE @inputAsStr varchar(25)
SELECT @inputAsStr = CONVERT(VARCHAR(25), @MONEY, 1)

RETURN  REPLACE(@inputAsStr,'.00','')
END
GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[WebMapData_posted]](../../Stored_Procedures/dbo_WebMapData_posted.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

