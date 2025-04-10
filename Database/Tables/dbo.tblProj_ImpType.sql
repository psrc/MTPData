CREATE TABLE [dbo].[tblProj_ImpType]
(
[MTPID] [int] NULL,
[isPrimary] [bit] NULL,
[ImpTypeID] [smallint] NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_Proj_ImpType_ImpTypeID] ON [dbo].[tblProj_ImpType] ([ImpTypeID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_Proj_ImpType_MTPID] ON [dbo].[tblProj_ImpType] ([MTPID]) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IDX_Proj_ImpType_clustered] ON [dbo].[tblProj_ImpType] ([MTPID], [ImpTypeID]) ON [PRIMARY]
GO
