USE [bioseal] /******  写使用数据库的名称 ******/
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TiTle] [nvarchar](150) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[SubTitle] [nvarchar](500) COLLATE Chinese_PRC_CI_AS NULL CONSTRAINT [DF_News_SubTitle]  DEFAULT (N''),
	[CategoryId] [int] NOT NULL,
	/******  新闻不带分类属性时删除 ******/

	[ThumbnailURL] [varchar](200) COLLATE Chinese_PRC_CI_AS NULL,
	[Content] [nvarchar](max) COLLATE Chinese_PRC_CI_AS NULL,
	[DateTime] [datetime] NOT NULL CONSTRAINT [DF_News_DateTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [bioseal] /******  写使用数据库的名称 ******/
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_NewsAndCategory] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
/******  新闻不带分类属性时删除 ******/