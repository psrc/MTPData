CREATE TABLE [dbo].[tblAgency]
(
[AgencyNo] [smallint] NOT NULL,
[Place] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PlaceShortName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AgencyType] [tinyint] NULL,
[WebAppUserID] [smallint] NULL,
[WebAppAgencyID] [smallint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAgency] ADD CONSTRAINT [PK__tblAgenc__95C0E84B5D95E53A] PRIMARY KEY CLUSTERED ([AgencyNo]) ON [PRIMARY]
GO
