CREATE TABLE [dbo].[MESLineInCountEquipmentUUIDValue]
(
[EquipmentUUID] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Value] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TimeStamp] [datetime] NOT NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Primary] ON [dbo].[MESLineInCountEquipmentUUIDValue] ([EquipmentUUID], [TimeStamp]) ON [PRIMARY]
GO
