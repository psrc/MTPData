#### 

[Project](../../../../../../index.md) > [SQLserver](../../../../../index.md) > [User databases](../../../../index.md) > [MTPData](../../../index.md) > Programmability > Functions > [Scalar-valued Functions](Scalar-valued_Functions.md) > dbo.mtpfn_CleanString

# ![Scalar-valued Functions](../../../../../../Images/Function_Scalar32.png) [dbo].[mtpfn_CleanString]

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
| @Temp | varchar(max) | max |


---

## <a name="#sqlscript"></a>SQL Script

```sql



CREATE Function [dbo].[mtpfn_CleanString](@Temp VarChar(max))
Returns NVarChar(max)
AS
Begin
	/*
		Returns a string stripped of characters below 32 on the ASCII table
		(i.e. new lines, carriage returns, tabs, etc)
		and of specific other characters that resolve poorly in the front-end (ASCII codes 160, 151, 150, etc)
	*/

    Declare @charindx as int
	select @charindx = 0

	while @charindx < 32 -- ASCII character 32 is the first printable character
	begin
		select @Temp = REPLACE(@Temp, char(@charindx),'')
		select @charindx = @charindx + 1
	end
	
	select @Temp = REPLACE(@Temp, char(34), char(96))
	select @Temp = REPLACE(@Temp, char(160),' ')
	select @Temp = REPLACE(@Temp, char(151),'--')
	select @Temp = REPLACE(@Temp, char(150),'-')
	select @Temp = REPLACE(@Temp, char(148), char(96))
	select @Temp = REPLACE(@Temp, char(147), char(96))
	select @Temp = REPLACE(@Temp, char(146), char(96))
	select @Temp = REPLACE(@Temp, char(145), char(96))

    Return @Temp
End


GO

```


---

## <a name="#usedby"></a>Used By

* [[dbo].[viewWebMapData_2014Current]](../../../Views/dbo_viewWebMapData_2014Current.md)
* [[dbo].[viewWebMapData_2018Update]](../../../Views/dbo_viewWebMapData_2018Update.md)
* [[dbo].[viewWebMapData_2018Update_posted]](../../../Views/dbo_viewWebMapData_2018Update_posted.md)
* [[dbo].[WebMapData_posted]](../../Stored_Procedures/dbo_WebMapData_posted.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

