CREATE TABLE [dbo].[REC_ProdItem]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[ProdItemUUID] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ProjectUUID] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ItemPath] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SubProductCodeMask] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EditNo] [int] NOT NULL,
[Deleted] [int] NOT NULL,
[TimeStamp] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[REC_ProdItem] ADD CONSTRAINT [PK__REC_Prod__3214EC279A9252E7] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Lookup] ON [dbo].[REC_ProdItem] ([ProdItemUUID], [ItemPath]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Project] ON [dbo].[REC_ProdItem] ([ProjectUUID], [ItemPath]) ON [PRIMARY]
GO
