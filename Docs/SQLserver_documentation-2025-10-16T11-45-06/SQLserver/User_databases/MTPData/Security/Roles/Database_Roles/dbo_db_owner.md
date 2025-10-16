#### 

[Project](../../../../../../index.md) > [SQLserver](../../../../../index.md) > [User databases](../../../../index.md) > [MTPData](../../../index.md) > Security > Roles > [Database Roles](Database_Roles.md) > db_owner

# ![Database Roles](../../../../../../Images/Role_Database32.png) db_owner

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Owner | [dbo](../../Users/_dbo.md) |


---

## <a name="#members"></a>Members

* [PSRC\\MKoch](../../Users/_PSRC_MKoch.md)
* [PSRC\\MStepleton](../../Users/_PSRC_MStepleton.md)


---

## <a name="#sqlscript"></a>SQL Script

```sql
ALTER ROLE [db_owner] ADD MEMBER [PSRC\\MKoch]
GO
ALTER ROLE [db_owner] ADD MEMBER [PSRC\\MStepleton]
GO

```


---

## <a name="#uses"></a>Uses

* [PSRC\\MKoch](../../Users/_PSRC_MKoch.md)
* [PSRC\\MStepleton](../../Users/_PSRC_MStepleton.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

