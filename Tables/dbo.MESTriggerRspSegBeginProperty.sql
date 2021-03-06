CREATE TABLE [dbo].[MESTriggerRspSegBeginProperty]
(
[MESPropertyUUID] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MESObjectUUID] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Name] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Enable] [int] NOT NULL,
[Mode] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Auto] [int] NULL,
[PrecedingRefType] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PrecedingRefUUID] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomTriggerEvent] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[InitialDelay] [int] NOT NULL,
[RepeatMode] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[RepeatInterval] [int] NOT NULL,
[TimeStamp] [datetime] NOT NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_O_MESTriggerRspSegBeginProperty] ON [dbo].[MESTriggerRspSegBeginProperty] ([MESObjectUUID], [Name]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_P_MESTriggerRspSegBeginProperty] ON [dbo].[MESTriggerRspSegBeginProperty] ([MESPropertyUUID]) ON [PRIMARY]
GO
