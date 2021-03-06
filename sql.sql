USE [master]
GO
/****** Object:  Database [TinTuc]    Script Date: 04/16/2019 00:49:15 ******/
CREATE DATABASE [TinTuc]
GO
ALTER DATABASE [TinTuc] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TinTuc].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TinTuc] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [TinTuc] SET ANSI_NULLS OFF
GO
ALTER DATABASE [TinTuc] SET ANSI_PADDING OFF
GO
ALTER DATABASE [TinTuc] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [TinTuc] SET ARITHABORT OFF
GO
ALTER DATABASE [TinTuc] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [TinTuc] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [TinTuc] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [TinTuc] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [TinTuc] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [TinTuc] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [TinTuc] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [TinTuc] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [TinTuc] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [TinTuc] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [TinTuc] SET  DISABLE_BROKER
GO
ALTER DATABASE [TinTuc] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [TinTuc] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [TinTuc] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [TinTuc] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [TinTuc] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [TinTuc] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [TinTuc] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [TinTuc] SET  READ_WRITE
GO
ALTER DATABASE [TinTuc] SET RECOVERY SIMPLE
GO
ALTER DATABASE [TinTuc] SET  MULTI_USER
GO
ALTER DATABASE [TinTuc] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [TinTuc] SET DB_CHAINING OFF
GO
USE [TinTuc]
GO
/****** Object:  Table [dbo].[Categorys]    Script Date: 04/16/2019 00:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorys](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](20) NULL,
 CONSTRAINT [PK_Categorys] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorys] ON
INSERT [dbo].[Categorys] ([category_id], [category_name]) VALUES (1, N'Công nghệ')
INSERT [dbo].[Categorys] ([category_id], [category_name]) VALUES (2, N'Giáo Dục')
INSERT [dbo].[Categorys] ([category_id], [category_name]) VALUES (3, N'Đời sống')
SET IDENTITY_INSERT [dbo].[Categorys] OFF
/****** Object:  Table [dbo].[Account]    Script Date: 04/16/2019 00:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] NOT NULL,
	[username] [nvarchar](10) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 04/16/2019 00:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[news_id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NOT NULL,
	[news_title] [nvarchar](100) NOT NULL,
	[news_image] [nvarchar](100) NOT NULL,
	[news_content] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[news_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[News] ON
INSERT [dbo].[News] ([news_id], [category_id], [news_title], [news_image], [news_content]) VALUES (2, 1, N'Visual Studio 2019', N'iamge', N'Tải đi')
INSERT [dbo].[News] ([news_id], [category_id], [news_title], [news_image], [news_content]) VALUES (3, 1, N'Nam Nghỉ COde', N'iamgfds', N'Tin đọng Trời')
SET IDENTITY_INSERT [dbo].[News] OFF
/****** Object:  ForeignKey [FK_News_Categorys]    Script Date: 04/16/2019 00:49:17 ******/
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_Categorys] FOREIGN KEY([category_id])
REFERENCES [dbo].[Categorys] ([category_id])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_Categorys]
GO
