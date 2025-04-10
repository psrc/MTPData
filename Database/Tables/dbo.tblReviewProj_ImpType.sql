CREATE TABLE [dbo].[tblReviewProj_ImpType]
(
[APPGUID] [uniqueidentifier] NULL,
[ImpTypeID] [smallint] NULL,
[isPrimary] [bit] NULL CONSTRAINT [DF_ReviewProj_ImpType_isPrimary] DEFAULT ((0))
) ON [PRIMARY]
GO
