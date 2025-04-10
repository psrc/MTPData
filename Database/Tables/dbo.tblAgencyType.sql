CREATE TABLE [dbo].[tblAgencyType]
(
[AgencyType] [tinyint] NOT NULL,
[strAgencyType] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAgencyType] ADD CONSTRAINT [PK__tblAgenc__3BB8BBD11A14E395] PRIMARY KEY CLUSTERED ([AgencyType]) ON [PRIMARY]
GO
