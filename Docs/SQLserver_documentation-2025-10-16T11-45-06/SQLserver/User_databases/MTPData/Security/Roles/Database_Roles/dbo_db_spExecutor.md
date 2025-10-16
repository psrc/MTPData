#### 

[Project](../../../../../../index.md) > [SQLserver](../../../../../index.md) > [User databases](../../../../index.md) > [MTPData](../../../index.md) > Security > Roles > [Database Roles](Database_Roles.md) > db_spExecutor

# ![Database Roles](../../../../../../Images/Role_Database32.png) db_spExecutor

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Owner | [dbo](../../Users/_dbo.md) |


---

## <a name="#members"></a>Members

* [PSRC\\CHelmann](../../Users/_PSRC_CHelmann.md)
* [PSRC\\Clam](../../Users/_PSRC_Clam.md)
* [PSRC\\JBarnes](../../Users/_PSRC_JBarnes.md)
* [PSRC\\JQuick](../../Users/_PSRC_JQuick.md)
* [PSRC\\Kelly](../../Users/_PSRC_Kelly.md)
* [PSRC\\KThomas](../../Users/_PSRC_KThomas.md)
* [PSRC\\MKoch](../../Users/_PSRC_MKoch.md)
* [PSRC\\MStepleton](../../Users/_PSRC_MStepleton.md)
* [PSRC\\Triskelle](../../Users/_PSRC_Triskelle.md)
* [Triskelle](../../Users/_Triskelle.md)


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE ROLE [db_spExecutor]
AUTHORIZATION [dbo]
GO
ALTER ROLE [db_spExecutor] ADD MEMBER [PSRC\\CHelmann]
GO
ALTER ROLE [db_spExecutor] ADD MEMBER [PSRC\\Clam]
GO
ALTER ROLE [db_spExecutor] ADD MEMBER [PSRC\\JBarnes]
GO
ALTER ROLE [db_spExecutor] ADD MEMBER [PSRC\\JQuick]
GO
ALTER ROLE [db_spExecutor] ADD MEMBER [PSRC\\Kelly]
GO
ALTER ROLE [db_spExecutor] ADD MEMBER [PSRC\\KThomas]
GO
ALTER ROLE [db_spExecutor] ADD MEMBER [PSRC\\MKoch]
GO
ALTER ROLE [db_spExecutor] ADD MEMBER [PSRC\\MStepleton]
GO
ALTER ROLE [db_spExecutor] ADD MEMBER [PSRC\\Triskelle]
GO
ALTER ROLE [db_spExecutor] ADD MEMBER [Triskelle]
GO

```


---

## <a name="#uses"></a>Uses

* [PSRC\\CHelmann](../../Users/_PSRC_CHelmann.md)
* [PSRC\\Clam](../../Users/_PSRC_Clam.md)
* [PSRC\\JBarnes](../../Users/_PSRC_JBarnes.md)
* [PSRC\\JQuick](../../Users/_PSRC_JQuick.md)
* [PSRC\\Kelly](../../Users/_PSRC_Kelly.md)
* [PSRC\\KThomas](../../Users/_PSRC_KThomas.md)
* [PSRC\\MKoch](../../Users/_PSRC_MKoch.md)
* [PSRC\\MStepleton](../../Users/_PSRC_MStepleton.md)
* [PSRC\\Triskelle](../../Users/_PSRC_Triskelle.md)
* [Triskelle](../../Users/_Triskelle.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

