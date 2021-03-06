CREATE TABLE [dbo].[REC_Project]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[ProjectName] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ProjectUUID] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TimeStamp] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[REC_Project] ADD CONSTRAINT [PK__REC_Proj__3214EC2718D9770A] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Name] ON [dbo].[REC_Project] ([ProjectName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Lookup] ON [dbo].[REC_Project] ([ProjectUUID]) ON [PRIMARY]
GO
