USE [master]
GO
/****** Object:  Database [NewsDB]    Script Date: 04/18/2019 10:58:13 ******/
CREATE DATABASE [NewsDB]
GO
ALTER DATABASE [NewsDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NewsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NewsDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [NewsDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [NewsDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [NewsDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [NewsDB] SET ARITHABORT OFF
GO
ALTER DATABASE [NewsDB] SET AUTO_CLOSE ON
GO
ALTER DATABASE [NewsDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [NewsDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [NewsDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [NewsDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [NewsDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [NewsDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [NewsDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [NewsDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [NewsDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [NewsDB] SET  ENABLE_BROKER
GO
ALTER DATABASE [NewsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [NewsDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [NewsDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [NewsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [NewsDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [NewsDB] SET READ_COMMITTED_SNAPSHOT ON
GO
ALTER DATABASE [NewsDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [NewsDB] SET  READ_WRITE
GO
ALTER DATABASE [NewsDB] SET RECOVERY SIMPLE
GO
ALTER DATABASE [NewsDB] SET  MULTI_USER
GO
ALTER DATABASE [NewsDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [NewsDB] SET DB_CHAINING OFF
GO
USE [NewsDB]
GO
/****** Object:  Table [dbo].[News]    Script Date: 04/18/2019 10:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Id_Category] [int] NOT NULL,
	[UrlImage] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[News] ON
INSERT [dbo].[News] ([Id], [Title], [Id_Category], [UrlImage], [Content]) VALUES (1, N'Vài chiếc Galaxy Fold mới dùng 1 ngày đã hỏng màn hình', 1, NULL, N'Trong bài viết của tác giả Dieter Bohn trên The Verge, anh chụp hình và mô tả chiếc Galaxy Fold mình đang sử dụng mới chỉ được 1 ngày đã xuất hiện một vết lồi ở đúng vị trí nếp gấp màn hình ở bản lề chiếc điện thoại màn gập. Bohn mô tả vết lồi này có thể sờ được bằng ngón tay, và đưa ra dự đoán rằng có thể đây là hệ quả của việc dị vật rơi vào bên trong khe màn hình dẻo và khiến nó bị biến dạng. Dị vật này cứng đến mức chọc xuyên vào màn hình và làm hỏng nó, để lại đường kẻ ngang và dọc khá vô duyên như trong hình, mà giao điểm chính là vết lồi trên màn hình')
SET IDENTITY_INSERT [dbo].[News] OFF
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 04/18/2019 10:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190418030259_CreateDb', N'2.2.4-servicing-10062')
