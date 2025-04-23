CREATE ROLE [db_spExecutor]
AUTHORIZATION [dbo]
EXEC sp_addrolemember N'db_spExecutor', N'PSRC\CHelmann'

EXEC sp_addrolemember N'db_spExecutor', N'PSRC\Clam'

GO
ALTER ROLE [db_spExecutor] ADD MEMBER [PSRC\JBarnes]
GO
ALTER ROLE [db_spExecutor] ADD MEMBER [PSRC\JQuick]
GO
ALTER ROLE [db_spExecutor] ADD MEMBER [PSRC\Kelly]
GO
ALTER ROLE [db_spExecutor] ADD MEMBER [PSRC\KThomas]
GO
ALTER ROLE [db_spExecutor] ADD MEMBER [PSRC\MKoch]
GO
ALTER ROLE [db_spExecutor] ADD MEMBER [PSRC\MStepleton]
GO
ALTER ROLE [db_spExecutor] ADD MEMBER [PSRC\Triskelle]
GO
ALTER ROLE [db_spExecutor] ADD MEMBER [Triskelle]
GO
