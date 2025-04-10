CREATE TABLE [dbo].[tblReviewProj_SecondaryImpType]
(
[AppGUID] [uniqueidentifier] NOT NULL,
[ImpTypeID] [smallint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblReviewProj_SecondaryImpType] ADD CONSTRAINT [PK_ReviewProj_SecondaryImpType] PRIMARY KEY CLUSTERED ([AppGUID], [ImpTypeID]) ON [PRIMARY]
GO
