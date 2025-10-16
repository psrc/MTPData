#### 

[Project](../../../../../../index.md) > [SQLserver](../../../../../index.md) > [User databases](../../../../index.md) > [MTPData](../../../index.md) > Programmability > Functions > [Table-valued Functions](Table-valued_Functions.md) > dbo.mtpfn_ProjectsForEdition

# ![Table-valued Functions](../../../../../../Images/Function_Table32.png) [dbo].[mtpfn_ProjectsForEdition]

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
| @idEdition | int | 4 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
create function [dbo].[mtpfn_ProjectsForEdition](
	@idEdition int
)
RETURNS TABLE
AS 
RETURN
	select p.*
	from tblProjects p 
		join tblProjEdition pe on p.PK = pe.ProjPK
	where pe.EditionID = @idEdition
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblProjEdition]](../../../Tables/dbo_tblProjEdition.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

