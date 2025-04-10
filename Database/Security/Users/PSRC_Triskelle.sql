IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'PSRC\Triskelle')
CREATE LOGIN [PSRC\Triskelle] FROM WINDOWS
GO
CREATE USER [PSRC\Triskelle] FOR LOGIN [PSRC\Triskelle]
GO
