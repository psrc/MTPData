IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'PSRC\GSimonson')
CREATE LOGIN [PSRC\GSimonson] FROM WINDOWS
GO
CREATE USER [PSRC\GSimonson] FOR LOGIN [PSRC\GSimonson]
GO
