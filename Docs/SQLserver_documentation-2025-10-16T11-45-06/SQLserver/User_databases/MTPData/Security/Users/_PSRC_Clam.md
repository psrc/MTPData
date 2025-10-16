#### 

[Project](../../../../../index.md) > [SQLserver](../../../../index.md) > [User databases](../../../index.md) > [MTPData](../../index.md) > Security > [Users](Users.md) > PSRC\\Clam

# ![Users](../../../../../Images/User32.png) PSRC\\Clam

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Type | WindowsUser |
| Login Name | PSRC\\Clam |
| Default Schema | dbo |


---

## <a name="#databaselevelpermissions"></a>Database Level Permissions

| Type | Action |
|---|---|
| CONNECT | Grant |


---

## <a name="#sqlscript"></a>SQL Script

```sql
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'PSRC\\Clam')
CREATE LOGIN [PSRC\\Clam] FROM WINDOWS
GO
CREATE USER [PSRC\\Clam] FOR LOGIN [PSRC\\Clam]
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

