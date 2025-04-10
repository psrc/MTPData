IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'PSRC\KMcgourty')
CREATE LOGIN [PSRC\KMcgourty] FROM WINDOWS
GO
CREATE USER [PSRC\Kelly] FOR LOGIN [PSRC\KMcgourty]
GO
