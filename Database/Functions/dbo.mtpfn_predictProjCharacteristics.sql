SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE function [dbo].[mtpfn_predictProjCharacteristics](@RevisionID int)
RETURNS TABLE
AS 
/*
	Return data from tblProjCharacteristics for all projects except those in 
	revision @RevisionID.  For those projects return the characteristics 
	as listed in the revision.
*/
RETURN

select *
from tblProjCharacteristics
where MTPID NOT IN (select distinct MTPID from tblReviewProject where RevisionID = @RevisionID)
UNION
SELECT a.MTPID,  b.CharacteristicID
FROM tblReviewProject a
	JOIN tblReviewProjCharacteristics b on a.AppGUID = b.APPGUID
where a.RevisionID = @RevisionID


GO
