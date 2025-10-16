#### 

[Project](../../../../../../index.md) > [SQLserver](../../../../../index.md) > [User databases](../../../../index.md) > [MTPData](../../../index.md) > Security > Roles > [Database Roles](Database_Roles.md) > mtpdb_Modeler

# ![Database Roles](../../../../../../Images/Role_Database32.png) mtpdb_Modeler

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Owner | [dbo](../../Users/_dbo.md) |


---

## <a name="#members"></a>Members

* [PSRC\\Kris](../../Users/_PSRC_Kris.md)


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE ROLE [mtpdb_Modeler]
AUTHORIZATION [dbo]
GO
ALTER ROLE [mtpdb_Modeler] ADD MEMBER [PSRC\\Kris]
GO

```


---

## <a name="#uses"></a>Uses

* [PSRC\\Kris](../../Users/_PSRC_Kris.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

