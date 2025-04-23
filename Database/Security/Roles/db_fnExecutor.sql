CREATE ROLE [db_fnExecutor]
AUTHORIZATION [dbo]
EXEC sp_addrolemember N'db_fnExecutor', N'PSRC\CHelmann'

EXEC sp_addrolemember N'db_fnExecutor', N'PSRC\Clam'

GO
ALTER ROLE [db_fnExecutor] ADD MEMBER [PSRC\JBarnes]
GO
ALTER ROLE [db_fnExecutor] ADD MEMBER [PSRC\JQuick]
GO
ALTER ROLE [db_fnExecutor] ADD MEMBER [PSRC\Kelly]
GO
ALTER ROLE [db_fnExecutor] ADD MEMBER [PSRC\KThomas]
GO
ALTER ROLE [db_fnExecutor] ADD MEMBER [PSRC\MKoch]
GO
ALTER ROLE [db_fnExecutor] ADD MEMBER [PSRC\MStepleton]
GO
ALTER ROLE [db_fnExecutor] ADD MEMBER [PSRC\Triskelle]
GO
ALTER ROLE [db_fnExecutor] ADD MEMBER [Triskelle]
GO
