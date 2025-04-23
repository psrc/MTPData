
EXEC sp_addrolemember N'db_datareader', N'PSRC\CHelmann'

EXEC sp_addrolemember N'db_datareader', N'PSRC\Clam'
ALTER ROLE [db_datareader] ADD MEMBER [PSRC\JBarnes]
GO
ALTER ROLE [db_datareader] ADD MEMBER [PSRC\JQuick]
GO
ALTER ROLE [db_datareader] ADD MEMBER [PSRC\Kelly]
GO
ALTER ROLE [db_datareader] ADD MEMBER [PSRC\Kris]
GO
ALTER ROLE [db_datareader] ADD MEMBER [PSRC\KThomas]
GO
ALTER ROLE [db_datareader] ADD MEMBER [PSRC\MKoch]
GO
ALTER ROLE [db_datareader] ADD MEMBER [PSRC\MStepleton]
GO
ALTER ROLE [db_datareader] ADD MEMBER [PSRC\Triskelle]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Triskelle]
GO
