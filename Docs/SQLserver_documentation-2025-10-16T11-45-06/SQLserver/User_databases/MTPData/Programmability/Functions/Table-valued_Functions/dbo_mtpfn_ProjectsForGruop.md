#### 

[Project](../../../../../../index.md) > [SQLserver](../../../../../index.md) > [User databases](../../../../index.md) > [MTPData](../../../index.md) > Programmability > Functions > [Table-valued Functions](Table-valued_Functions.md) > dbo.mtpfn_ProjectsForGruop

# ![Table-valued Functions](../../../../../../Images/Function_Table32.png) [dbo].[mtpfn_ProjectsForGruop]

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
| @idGroup | int | 4 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
create function [dbo].[mtpfn_ProjectsForGruop](
	@idGroup int
)
RETURNS TABLE
AS 
RETURN
	select p.*
	from tblProjects p 
		join tblProjGroup pg on p.PK = pg.ProjPK
	where pg.GroupID = @idGroup
GO

```


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

