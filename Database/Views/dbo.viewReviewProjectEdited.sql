SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[viewReviewProjectEdited]
AS
SELECT *
FROM tblReviewProject 
WHERE Edit = 1
GO
