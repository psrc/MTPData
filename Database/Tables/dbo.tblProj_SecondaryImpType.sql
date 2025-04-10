CREATE TABLE [dbo].[tblProj_SecondaryImpType]
(
[MTPID] [int] NULL,
[ImpTypeID] [smallint] NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_Proj_SecondaryImpType_MTPID] ON [dbo].[tblProj_SecondaryImpType] ([MTPID]) ON [PRIMARY]
GO
