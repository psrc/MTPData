IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'PSRC\JBarnes')
CREATE LOGIN [PSRC\JBarnes] FROM WINDOWS
GO
CREATE USER [PSRC\JBarnes] FOR LOGIN [PSRC\JBarnes]
GO
