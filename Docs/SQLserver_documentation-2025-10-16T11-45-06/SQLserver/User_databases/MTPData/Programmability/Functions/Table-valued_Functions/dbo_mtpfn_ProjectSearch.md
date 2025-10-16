#### 

[Project](../../../../../../index.md) > [SQLserver](../../../../../index.md) > [User databases](../../../../index.md) > [MTPData](../../../index.md) > Programmability > Functions > [Table-valued Functions](Table-valued_Functions.md) > dbo.mtpfn_ProjectSearch

# ![Table-valued Functions](../../../../../../Images/Function_Table32.png) [dbo].[mtpfn_ProjectSearch]

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
| @RevisionID | int | 4 |
| @DescText | varchar(50) | 50 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE function [dbo].[mtpfn_ProjectSearch](
	@RevisionID int = 0,
	@DescText varchar(50) = ''
)
returns table 
as 
return

	SELECT p.MTPID, p.Title
	FROM mtpfn_predictProject(@RevisionID) p
	where p.ProjDesc like '%' +  @DescText + '%'

GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[mtpfn_predictProject]](dbo_mtpfn_predictProject.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

