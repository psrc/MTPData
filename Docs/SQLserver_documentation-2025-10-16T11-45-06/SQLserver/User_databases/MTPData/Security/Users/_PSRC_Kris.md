#### 

[Project](../../../../../index.md) > [SQLserver](../../../../index.md) > [User databases](../../../index.md) > [MTPData](../../index.md) > Security > [Users](Users.md) > PSRC\\Kris

# ![Users](../../../../../Images/User32.png) PSRC\\Kris

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Type | WindowsUser |
| Login Name | PSRC\\KOverby |
| Default Schema | dbo |


---

## <a name="#databaselevelpermissions"></a>Database Level Permissions

| Type | Action |
|---|---|
| CONNECT | Grant |


---

## <a name="#sqlscript"></a>SQL Script

```sql
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'PSRC\\KOverby')
CREATE LOGIN [PSRC\\KOverby] FROM WINDOWS
GO
CREATE USER [PSRC\\Kris] FOR LOGIN [PSRC\\KOverby]
GO

```


---

## <a name="#usedby"></a>Used By

* [mtpdb_Modeler](../Roles/Database_Roles/dbo_mtpdb_Modeler.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM

