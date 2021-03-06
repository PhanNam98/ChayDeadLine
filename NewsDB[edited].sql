USE [master]
GO
/****** Object:  Database [NewsDB]    Script Date: 2019/04/19 11:23:41 ******/
CREATE DATABASE [NewsDB]
 CONTAINMENT = NONE
GO
ALTER DATABASE [NewsDB] SET COMPATIBILITY_LEVEL = 140
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
ALTER DATABASE [NewsDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NewsDB] SET  MULTI_USER 
GO
ALTER DATABASE [NewsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NewsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NewsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NewsDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NewsDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NewsDB] SET QUERY_STORE = OFF
GO
USE [NewsDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2019/04/19 11:23:41 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 2019/04/19 11:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](250) NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[UpdatedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 2019/04/19 11:23:41 ******/
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
	[CreatedDate] [datetime2](7) NULL,
	[UpdatedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190418030259_CreateDb', N'2.2.4-servicing-10062')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190418071548_account', N'2.2.4-servicing-10062')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190418072730_addAccount', N'2.2.4-servicing-10062')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190418142456_updateDB', N'2.2.4-servicing-10062')
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 
GO
INSERT [dbo].[Accounts] ([Id], [Username], [Password], [CreatedDate], [UpdatedDate]) VALUES (1, N'admin', N'$2a$10$SR3tKk3nSJkilv2Wpvoybe7r3dAW98qGOY5.Mh/9bebz0CKqv9cje', CAST(N'2019-04-18T21:42:54.3966667' AS DateTime2), CAST(N'2019-04-18T21:43:31.5366667' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 
GO
INSERT [dbo].[News] ([Id], [Title], [Id_Category], [UrlImage], [Content], [CreatedDate], [UpdatedDate]) VALUES (1, N'Chrome Extension Protects Against JavaScript-Based CPU Side-Channel Attacks', 1, N'/img/post-1.jpg', N'uuehopshbd', CAST(N'2019-04-18T21:41:20.6033333' AS DateTime2), NULL)
GO
INSERT [dbo].[News] ([Id], [Title], [Id_Category], [UrlImage], [Content], [CreatedDate], [UpdatedDate]) VALUES (2, N'Vài chiếc Galaxy Fold mới dùng 1 ngày đã hỏng màn hình', 1, N'/img/post-2.jpg', N'Trong bài viết của tác giả Dieter Bohn trên The Verge, anh chụp hình và mô tả chiếc Galaxy Fold mình đang sử dụng mới chỉ được 1 ngày đã xuất hiện một vết lồi ở đúng vị trí nếp gấp màn hình ở bản lề chiếc điện thoại màn gập. Bohn mô tả vết lồi này có thể sờ được bằng ngón tay, và đưa ra dự đoán rằng có thể đây là hệ quả của việc dị vật rơi vào bên trong khe màn hình dẻo và khiến nó bị biến dạng. Dị vật này cứng đến mức chọc xuyên vào màn hình và làm hỏng nó, để lại đường kẻ ngang và dọc khá vô duyên như trong hình, mà giao điểm chính là vết lồi trên màn hình', CAST(N'2019-04-18T21:41:20.6033333' AS DateTime2), CAST(N'2019-04-18T21:41:20.6066667' AS DateTime2))
GO
INSERT [dbo].[News] ([Id], [Title], [Id_Category], [UrlImage], [Content], [CreatedDate], [UpdatedDate]) VALUES (3, N'Pagedraw UI Builder Turns Your Website Design Mockup Into Code Automatically', 3, N'/img/post-3.jpg', N'Pagedraw UI Builder Turns Your Website Design Mockup Into Code Automatically', NULL, NULL)
GO
INSERT [dbo].[News] ([Id], [Title], [Id_Category], [UrlImage], [Content], [CreatedDate], [UpdatedDate]) VALUES (5, N'Ask HN: Does Anybody Still Use JQuery?', 2, N'/img/post-4.jpg', N'Do you like Cheese Whiz? Spray tan? Fake eyelashes? That''s what is Lorem Ipsum to many—it rubs them the wrong way, all the way. It''s unreal, uncanny, makes you wonder if something is wrong, it seems to seek your attention for all the wrong reasons. Usually, we prefer the real thing, wine without sulfur based preservatives, real butter, not margarine, and so we''d like our layouts and designs to be filled with real words, with thoughts that count, information that has value.The toppings you may chose for that TV dinner pizza slice when you forgot to shop for foods, the paint you may slap on your face to impress the new boss is your business. But what about your daily bread? Design comps, layouts, wireframes—will your clients accept that you go about things the facile way? Authorities in our business will tell in no uncertain terms that Lorem Ipsum is that huge, huge no no to forswear forever. Not so fast, I''d say, there are some redeeming factors in favor of greeking text, as its use is merely the symptom of a worse problem to take into consideration. You begin with a text, you sculpt information, you chisel away what''s not needed, you come to the point, make things clear, add value, you''re a content person, you like words. Design is no afterthought, far from it, but it comes in a deserved second. Anyway, you still use Lorem Ipsum and rightly so, as it will always have a place in the web workers toolbox, as things happen, not always the way you like it, not always in the preferred order. Even if your less into design and more into content strategy you may find some redeeming value with, wait for it, dummy copy, no less.There''s lot of hate out there for a text that amounts to little more than garbled words in an old language. The villagers are out there with a vengeance to get that Frankenstein, wielding torches and pitchforks, wanting to tar and feather it at the least, running it out of town in shame.One of the villagers, Kristina Halvorson from Adaptive Path, holds steadfastly to the notion that design can’t be tested without real content: I’ve heard the argument that “lorem ipsum” is effective in wireframing or design because it helps people focus on the actual layout, or color scheme, or whatever. What kills me here is that we’re talking about creating a user experience that will (whether we like it or not) be DRIVEN by words. The entire structure of the page or app flow is FOR THE WORDS.If that''s what you think how bout the other way around? How can you evaluate content without design? No typography, no colors, no layout, no styles, all those things that convey the important signals that go beyond the mere textual, hierarchies of information, weight, emphasis, oblique stresses, priorities, all those subtle cues that also have visual and emotional appeal to the reader. Rigid proponents of content strategy may shun the use of dummy copy but then designers might want to ask them to provide style sheets with the copy decks they supply that are in tune with the design direction they require.Summing up, if the copy is diverting attention from the design it’s because it’s not up to task.Typographers of yore didn''t come up with the concept of dummy copy because people thought that content is inconsequential window dressing, only there to be used by designers who can’t be bothered to read. Lorem Ipsum is needed because words matter, a lot. Just fill up a page with draft copy about the client’s business and they will actually read it and comment on it. They will be drawn to it, fiercely. Do it the wrong way and draft copy can derail your design review.', NULL, NULL)
GO
INSERT [dbo].[News] ([Id], [Title], [Id_Category], [UrlImage], [Content], [CreatedDate], [UpdatedDate]) VALUES (6, N'fnvjnv,c!!', 1, N'/img/post-5.jpg', N'<h3>adhashdkhjas</h3>', CAST(N'2019-04-19T01:18:21.1233333' AS DateTime2), CAST(N'2019-04-19T01:18:21.1233333' AS DateTime2))
GO
INSERT [dbo].[News] ([Id], [Title], [Id_Category], [UrlImage], [Content], [CreatedDate], [UpdatedDate]) VALUES (7, N'advbmmjh!!', 1, N'/img/post-6.jpg', N'2ee', CAST(N'2019-04-19T01:18:40.8933333' AS DateTime2), CAST(N'2019-04-19T01:18:40.8933333' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[News] OFF
GO
/****** Object:  Trigger [dbo].[tgr_Accounts_Insert]    Script Date: 2019/04/19 11:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Quoc Nguyen>
-- Create date: <Create Date,,>
-- Description:	<Add CreateDay after insert>
-- =============================================
CREATE TRIGGER [dbo].[tgr_Accounts_Insert] ON  [dbo].[Accounts]
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @acc_id int;

	SELECT @acc_id = i.Id FROM inserted i;


        UPDATE Accounts
		SET CreatedDate = GETDATE()
		WHERE Id = @acc_id

END
GO
ALTER TABLE [dbo].[Accounts] ENABLE TRIGGER [tgr_Accounts_Insert]
GO
/****** Object:  Trigger [dbo].[tgr_Accounts_Update]    Script Date: 2019/04/19 11:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Quoc Nguyen>
-- Create date: <Create Date,,>
-- Description:	<Add UpdatedDate after update>
-- =============================================
CREATE TRIGGER [dbo].[tgr_Accounts_Update] ON  [dbo].[Accounts]
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @acc_id int;

	SELECT @acc_id = i.Id FROM inserted i;


        UPDATE Accounts
		SET UpdatedDate = GETDATE()
		WHERE Id = @acc_id

END
GO
ALTER TABLE [dbo].[Accounts] ENABLE TRIGGER [tgr_Accounts_Update]
GO
/****** Object:  Trigger [dbo].[tgr_News_Insert]    Script Date: 2019/04/19 11:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Quoc Nguyen>
-- Create date: <Create Date,,>
-- Description:	<Add CreateDay after insert>
-- =============================================
CREATE TRIGGER [dbo].[tgr_News_Insert] ON  [dbo].[News]
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @news_id int;

	SELECT @news_id = i.Id FROM inserted i;


        UPDATE News
		SET CreatedDate = GETDATE()
		WHERE Id = @news_id

END
GO
ALTER TABLE [dbo].[News] ENABLE TRIGGER [tgr_News_Insert]
GO
/****** Object:  Trigger [dbo].[tgr_News_Update]    Script Date: 2019/04/19 11:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Quoc Nguyen>
-- Create date: <Create Date,,>
-- Description:	<Add UpdatedDay after insert>
-- =============================================
CREATE TRIGGER [dbo].[tgr_News_Update] ON  [dbo].[News]
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @news_id int;

	SELECT @news_id = i.Id FROM inserted i;


        UPDATE News
		SET UpdatedDate = GETDATE()
		WHERE Id = @news_id

END
GO
ALTER TABLE [dbo].[News] ENABLE TRIGGER [tgr_News_Update]
GO
USE [master]
GO
ALTER DATABASE [NewsDB] SET  READ_WRITE 
GO
