#### 

[Project](../../../../../index.md) > [SQLserver](../../../../index.md) > [User databases](../../../index.md) > [MTPData](../../index.md) > Security > [Users](Users.md) > PSRC\\KThomas

# ![Users](../../../../../Images/User32.png) PSRC\\KThomas

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Type | WindowsUser |
| Login Name | PSRC\\KThomas |
| Default Schema | dbo |


---

## <a name="#databaselevelpermissions"></a>Database Level Permissions

| Type | Action |
|---|---|
| CONNECT | Grant |


---

## <a name="#sqlscript"></a>SQL Script

```sql
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'PSRC\\KThomas')
CREATE LOGIN [PSRC\\KThomas] FROM WINDOWS
GO
CREATE USER [PSRC\\KThomas] FOR LOGIN [PSRC\\KThomas]
GO

```


---

## <a name="#usedby"></a>Used By

* [db_fnExecutor](../Roles/Database_Roles/dbo_db_fnExecutor.md)
* [db_spExecutor](../Roles/Database_Roles/dbo_db_spExecutor.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

