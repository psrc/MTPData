SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create view [dbo].[viewProjCharacteristics]
as
select pc.MTPID, c.Name as CharacteristicName
from tblProjCharacteristics pc 
    join tblCharacteristics c on pc.CharacteristicID = c.ID
GO
