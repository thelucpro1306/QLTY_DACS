USE [master]
GO
/****** Object:  Database [OnlineShop123]    Script Date: 6/10/2022 12:54:26 AM ******/
CREATE DATABASE [OnlineShop123]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineShop123', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\OnlineShop123.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineShop123_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\OnlineShop123_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [OnlineShop123] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineShop123].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineShop123] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineShop123] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineShop123] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineShop123] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineShop123] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineShop123] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineShop123] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineShop123] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineShop123] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineShop123] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineShop123] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineShop123] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineShop123] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineShop123] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineShop123] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineShop123] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineShop123] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineShop123] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineShop123] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineShop123] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineShop123] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineShop123] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineShop123] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OnlineShop123] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineShop123] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineShop123] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineShop123] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineShop123] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineShop123] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OnlineShop123] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [OnlineShop123] SET QUERY_STORE = OFF
GO
USE [OnlineShop123]
GO
/****** Object:  Table [dbo].[About]    Script Date: 6/10/2022 12:54:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [varchar](50) NULL,
	[Detail] [ntext] NULL,
	[Warranty] [int] NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [nvarchar](250) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](250) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Apointment]    Script Date: 6/10/2022 12:54:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apointment](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BookingDate] [datetime] NOT NULL,
	[BookingTime] [bigint] NULL,
	[ServicesId] [bigint] NULL,
	[Note] [ntext] NULL,
	[ClientID] [bigint] NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Userid] [bigint] NULL,
	[Email] [varchar](50) NULL,
	[status] [int] NULL,
	[DateCreate] [datetime] NULL,
 CONSTRAINT [PK_Apointment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/10/2022 12:54:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [nvarchar](250) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](250) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[ShowOnHome] [bit] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 6/10/2022 12:54:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[dob] [datetime] NULL,
	[gender] [bit] NOT NULL,
	[email] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[UserId] [bigint] NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 6/10/2022 12:54:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Content]    Script Date: 6/10/2022 12:54:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Content](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Images] [nvarchar](250) NULL,
	[CategoryID] [bigint] NULL,
	[Detail] [ntext] NULL,
	[Warranty] [int] NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [nvarchar](250) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](250) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[TopHot] [datetime] NULL,
	[ViewCount] [int] NULL,
	[Tags] [nvarchar](500) NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentTag]    Script Date: 6/10/2022 12:54:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentTag](
	[ContentID] [bigint] NOT NULL,
	[TagID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ContentTag] PRIMARY KEY CLUSTERED 
(
	[ContentID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credential]    Script Date: 6/10/2022 12:54:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credential](
	[UserGroupID] [varchar](50) NOT NULL,
	[RoleID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Credential] PRIMARY KEY CLUSTERED 
(
	[UserGroupID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeltailsMedicalForm]    Script Date: 6/10/2022 12:54:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeltailsMedicalForm](
	[id_Form] [bigint] NOT NULL,
	[id_ill] [bigint] NOT NULL,
	[Symptom] [nvarchar](120) NULL,
	[Diagnose] [nvarchar](150) NULL,
	[id_Doctor] [bigint] NULL,
 CONSTRAINT [PK_DeltailsMedicalForm] PRIMARY KEY CLUSTERED 
(
	[id_Form] ASC,
	[id_ill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 6/10/2022 12:54:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Gender] [bit] NULL,
	[Phone] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[FacultyId] [bigint] NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 6/10/2022 12:54:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculty](
	[FacultyId] [bigint] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Faculty] PRIMARY KEY CLUSTERED 
(
	[FacultyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 6/10/2022 12:54:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[EntityID] [int] NULL,
	[Serviced_Id] [bigint] NULL,
	[text] [nvarchar](250) NULL,
	[User_id] [bigint] NULL,
	[RecordID] [bigint] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Footer]    Script Date: 6/10/2022 12:54:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footer](
	[ID] [varchar](50) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Footer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[illness]    Script Date: 6/10/2022 12:54:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[illness](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[illName] [nvarchar](250) NULL,
 CONSTRAINT [PK_illness] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalExaminationForm]    Script Date: 6/10/2022 12:54:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalExaminationForm](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[PetName] [varchar](50) NULL,
	[Weight] [float] NULL,
	[HairColor] [varchar](50) NULL,
	[Species] [varchar](50) NULL,
	[PetGender] [bit] NULL,
	[CreateDate] [datetime] NULL,
	[ClientId] [bigint] NULL,
	[Image] [varchar](max) NULL,
	[id_Appointment] [bigint] NULL,
 CONSTRAINT [PK_MedicalExaminationForm] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 6/10/2022 12:54:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NULL,
	[Link] [nvarchar](50) NULL,
	[DisplayOrder] [int] NULL,
	[Target] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[TypeID] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuType]    Script Date: 6/10/2022 12:54:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
 CONSTRAINT [PK_MenuType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/10/2022 12:54:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [varchar](20) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Images] [nvarchar](250) NULL,
	[MoreImage] [xml] NULL,
	[Price] [decimal](18, 0) NULL,
	[PromotionPrice] [decimal](18, 0) NULL,
	[IncludeVAT] [bit] NULL,
	[Quatity] [int] NOT NULL,
	[CategoryID] [bigint] NULL,
	[Detail] [ntext] NULL,
	[Warranty] [int] NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [nvarchar](250) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](250) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[TopHot] [datetime] NULL,
	[ViewCount] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 6/10/2022 12:54:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [nvarchar](250) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](250) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[ShowOnHome] [bit] NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/10/2022 12:54:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicess]    Script Date: 6/10/2022 12:54:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicess](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Cost] [int] NULL,
	[Description] [ntext] NULL,
	[Image] [varchar](50) NULL,
 CONSTRAINT [PK_Servicess] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 6/10/2022 12:54:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Link] [varchar](250) NULL,
	[Description] [nvarchar](250) NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [nvarchar](250) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemConfig]    Script Date: 6/10/2022 12:54:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemConfig](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Style] [nvarchar](50) NULL,
	[Value] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_SystemConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 6/10/2022 12:54:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/10/2022 12:54:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NULL,
	[GroupID] [varchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [nvarchar](250) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](250) NULL,
	[Status] [bit] NOT NULL,
	[Phone] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 6/10/2022 12:54:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Apointment] ON 

INSERT [dbo].[Apointment] ([Id], [BookingDate], [BookingTime], [ServicesId], [Note], [ClientID], [Name], [Phone], [Userid], [Email], [status], [DateCreate]) VALUES (20033, CAST(N'2022-06-02T00:00:00.000' AS DateTime), 2, 2, N'Tiêm ngừa', 1, N'LucLuong', N'012312312', NULL, N'theluc13@gmail.com', 1, CAST(N'2022-05-31T23:29:50.673' AS DateTime))
INSERT [dbo].[Apointment] ([Id], [BookingDate], [BookingTime], [ServicesId], [Note], [ClientID], [Name], [Phone], [Userid], [Email], [status], [DateCreate]) VALUES (20034, CAST(N'2022-06-07T00:00:00.000' AS DateTime), 3, 3, NULL, 10014, N'tài khoản', N'1231231', NULL, N'taikhoan@taikhoan.com', -1, CAST(N'2022-06-02T22:34:16.553' AS DateTime))
INSERT [dbo].[Apointment] ([Id], [BookingDate], [BookingTime], [ServicesId], [Note], [ClientID], [Name], [Phone], [Userid], [Email], [status], [DateCreate]) VALUES (20035, CAST(N'2022-06-10T00:00:00.000' AS DateTime), 1, 4, NULL, 10014, N'tài khoản', N'1231231', NULL, N'taikhoan@taikhoan.com', -1, CAST(N'2022-05-31T23:31:36.830' AS DateTime))
INSERT [dbo].[Apointment] ([Id], [BookingDate], [BookingTime], [ServicesId], [Note], [ClientID], [Name], [Phone], [Userid], [Email], [status], [DateCreate]) VALUES (20036, CAST(N'2022-06-02T00:00:00.000' AS DateTime), 1, 6, NULL, 10014, N'tài khoản', N'1231231', NULL, N'taikhoan@taikhoan.com', -1, CAST(N'2022-05-31T23:31:55.000' AS DateTime))
INSERT [dbo].[Apointment] ([Id], [BookingDate], [BookingTime], [ServicesId], [Note], [ClientID], [Name], [Phone], [Userid], [Email], [status], [DateCreate]) VALUES (20037, CAST(N'2022-06-01T00:00:00.000' AS DateTime), 2, 1, N'ádasdasdasd', 1, N'LucLuong', N'012312312', NULL, N'theluc13@gmail.com', -1, CAST(N'2022-05-31T23:55:10.737' AS DateTime))
INSERT [dbo].[Apointment] ([Id], [BookingDate], [BookingTime], [ServicesId], [Note], [ClientID], [Name], [Phone], [Userid], [Email], [status], [DateCreate]) VALUES (20038, CAST(N'2022-06-02T00:00:00.000' AS DateTime), 3, 7, N'asdasdasd', 1, N'LucLuong', N'012312312', NULL, N'theluc13@gmail.com', -1, CAST(N'2022-05-31T23:59:43.993' AS DateTime))
INSERT [dbo].[Apointment] ([Id], [BookingDate], [BookingTime], [ServicesId], [Note], [ClientID], [Name], [Phone], [Userid], [Email], [status], [DateCreate]) VALUES (20039, CAST(N'2022-06-16T00:00:00.000' AS DateTime), 1, 4, N'làm đẹp cho chó của tôi', 1, N'Lực Lương', N'012312312', NULL, N'theluc13@gmail.com', -1, CAST(N'2022-06-01T00:02:08.427' AS DateTime))
INSERT [dbo].[Apointment] ([Id], [BookingDate], [BookingTime], [ServicesId], [Note], [ClientID], [Name], [Phone], [Userid], [Email], [status], [DateCreate]) VALUES (20040, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 1, 3, NULL, 1, N'LucLuong', N'012312312', NULL, N'theluc13@gmail.com', -1, CAST(N'2022-06-01T00:11:24.750' AS DateTime))
INSERT [dbo].[Apointment] ([Id], [BookingDate], [BookingTime], [ServicesId], [Note], [ClientID], [Name], [Phone], [Userid], [Email], [status], [DateCreate]) VALUES (30029, CAST(N'2022-06-17T00:00:00.000' AS DateTime), 1, 2, N'dsadasdasd', 1, N'LucLuong', N'012312312', NULL, N'theluc13@gmail.com', -1, CAST(N'2022-06-05T22:06:56.583' AS DateTime))
INSERT [dbo].[Apointment] ([Id], [BookingDate], [BookingTime], [ServicesId], [Note], [ClientID], [Name], [Phone], [Userid], [Email], [status], [DateCreate]) VALUES (30030, CAST(N'2022-06-08T00:00:00.000' AS DateTime), 1, 2, NULL, 1, N'LucLuong', N'012312312', NULL, N'theluc13@gmail.com', -1, CAST(N'2022-06-06T20:09:23.580' AS DateTime))
INSERT [dbo].[Apointment] ([Id], [BookingDate], [BookingTime], [ServicesId], [Note], [ClientID], [Name], [Phone], [Userid], [Email], [status], [DateCreate]) VALUES (30031, CAST(N'2022-06-16T00:00:00.000' AS DateTime), 3, 1, N'Chào bạn tân :v', 1, N'Mạnh Tân', N'0963236305', NULL, N'Manhtanqhp@gmail.com', -1, CAST(N'2022-06-06T23:46:20.687' AS DateTime))
INSERT [dbo].[Apointment] ([Id], [BookingDate], [BookingTime], [ServicesId], [Note], [ClientID], [Name], [Phone], [Userid], [Email], [status], [DateCreate]) VALUES (30032, CAST(N'2022-06-24T00:00:00.000' AS DateTime), 3, 1, NULL, 1, N'LucLuong', N'012312312', NULL, N'thelucpro1306@gmail.com', -1, CAST(N'2022-06-09T15:16:25.630' AS DateTime))
INSERT [dbo].[Apointment] ([Id], [BookingDate], [BookingTime], [ServicesId], [Note], [ClientID], [Name], [Phone], [Userid], [Email], [status], [DateCreate]) VALUES (30033, CAST(N'2022-06-23T00:00:00.000' AS DateTime), 3, 6, NULL, 1, N'Luong The Luc', N'+10963236305', NULL, N'thelucpro1306@gmail.com', -1, CAST(N'2022-06-09T15:20:52.930' AS DateTime))
SET IDENTITY_INSERT [dbo].[Apointment] OFF
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([id], [Name], [dob], [gender], [email], [Phone], [Address], [UserId]) VALUES (1, N'Dang Duy Nhat', CAST(N'2022-05-13T00:00:00.000' AS DateTime), 0, N'nhatdang261@gmail.com', N'0353830837', N'72 Tân Lập 2 Phường Hiệp phú Thành phố Thủ Đức', 1)
INSERT [dbo].[Client] ([id], [Name], [dob], [gender], [email], [Phone], [Address], [UserId]) VALUES (2, N'Luong The Luc', CAST(N'2022-05-21T00:00:00.000' AS DateTime), 1, N'thelucpro1306@gmail.com', N'+10963236305', N'1', 3)
INSERT [dbo].[Client] ([id], [Name], [dob], [gender], [email], [Phone], [Address], [UserId]) VALUES (3, N'Luong The Luc', CAST(N'2022-05-20T00:00:00.000' AS DateTime), 0, N'thelucpro1306@gmail.com', N'+10963236305', N'1', NULL)
INSERT [dbo].[Client] ([id], [Name], [dob], [gender], [email], [Phone], [Address], [UserId]) VALUES (4, N'Dang Duy Nhata', CAST(N'2022-05-13T00:00:00.000' AS DateTime), 0, N'nhatdang261@gmail.com', N'0353830837', N'24/4 ?p Hoà Bình, Xã Giang Ði?n , Huy?n Tr?ng Bom', 9)
INSERT [dbo].[Client] ([id], [Name], [dob], [gender], [email], [Phone], [Address], [UserId]) VALUES (5, N'Dang Duy Nhata', CAST(N'2022-05-13T00:00:00.000' AS DateTime), 0, N'nhatdang261@gmail.com', N'03538308371', N'24/4 ?p Hoà Bình, Xã Giang Ði?n , Huy?n Tr?ng Bom', 7)
INSERT [dbo].[Client] ([id], [Name], [dob], [gender], [email], [Phone], [Address], [UserId]) VALUES (6, N'Dang Duy Nhat', CAST(N'2022-05-13T00:00:00.000' AS DateTime), 1, N'nhatdang261@gmail.com', N'03538308', N'1233333333333', NULL)
INSERT [dbo].[Client] ([id], [Name], [dob], [gender], [email], [Phone], [Address], [UserId]) VALUES (7, N'Dang Duy Nhata', CAST(N'2022-05-13T00:00:00.000' AS DateTime), 0, N'nhatdang261@gmail.com', N'0353830837', N'24/4 ?p Hoà Bình, Xã Giang Ði?n , Huy?n Tr?ng Bom', NULL)
INSERT [dbo].[Client] ([id], [Name], [dob], [gender], [email], [Phone], [Address], [UserId]) VALUES (8, N'Nguyen Van Hiep 12344664', CAST(N'2022-05-21T00:00:00.000' AS DateTime), 1, N'h@a.com', N'123123123', N'123123123123', NULL)
INSERT [dbo].[Client] ([id], [Name], [dob], [gender], [email], [Phone], [Address], [UserId]) VALUES (11, N'Luong The Luc', CAST(N'2022-05-23T22:43:54.067' AS DateTime), 0, N'hdslad@faf.com', NULL, NULL, NULL)
INSERT [dbo].[Client] ([id], [Name], [dob], [gender], [email], [Phone], [Address], [UserId]) VALUES (12, N'phu ha', CAST(N'2022-05-23T22:49:01.387' AS DateTime), 0, N'thdas@ha.com', NULL, NULL, NULL)
INSERT [dbo].[Client] ([id], [Name], [dob], [gender], [email], [Phone], [Address], [UserId]) VALUES (13, N'hdffsafg sfdsdsdf ', CAST(N'2022-05-23T22:52:31.327' AS DateTime), 0, N'haphu@phuha.com', NULL, NULL, NULL)
INSERT [dbo].[Client] ([id], [Name], [dob], [gender], [email], [Phone], [Address], [UserId]) VALUES (10012, N'luc luong 123', CAST(N'2022-05-28T23:06:19.623' AS DateTime), 0, N'123@123.com', NULL, NULL, 10021)
INSERT [dbo].[Client] ([id], [Name], [dob], [gender], [email], [Phone], [Address], [UserId]) VALUES (10014, N'tài kho?n', CAST(N'2022-05-31T23:04:55.807' AS DateTime), 0, N'taikhoan@taikhoan.com', N'1231231', NULL, 20022)
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
INSERT [dbo].[DeltailsMedicalForm] ([id_Form], [id_ill], [Symptom], [Diagnose], [id_Doctor]) VALUES (1, 1, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Doctor] ON 

INSERT [dbo].[Doctor] ([Id], [Name], [Address], [Gender], [Phone], [Email], [FacultyId]) VALUES (1, N'Nguyễn Xuân Trường', N'227 Thiên Đức', 1, N'0987.389.898', N'a@gmail.com', 1)
INSERT [dbo].[Doctor] ([Id], [Name], [Address], [Gender], [Phone], [Email], [FacultyId]) VALUES (2, N'Quách Thị Huệ', N'20 Hoàng Quốc Việt', 0, N'0378.574.337', N'a@gmail.com', 2)
INSERT [dbo].[Doctor] ([Id], [Name], [Address], [Gender], [Phone], [Email], [FacultyId]) VALUES (3, N'Nguyễn Thị Bích Hằng', N'496 Nguyễn Trãi', 0, N'0966.595.695', N'a@gmail.com', 3)
INSERT [dbo].[Doctor] ([Id], [Name], [Address], [Gender], [Phone], [Email], [FacultyId]) VALUES (4, N'A', N'A', 1, N'123', N'a@gmail.com', 2)
SET IDENTITY_INSERT [dbo].[Doctor] OFF
GO
INSERT [dbo].[Faculty] ([FacultyId], [Name]) VALUES (1, N'Khoa Ngoại Chấn thương chỉnh hình')
INSERT [dbo].[Faculty] ([FacultyId], [Name]) VALUES (2, N'Khoa Ngoại Thần kinh')
INSERT [dbo].[Faculty] ([FacultyId], [Name]) VALUES (3, N'Khoa Khám bệnh')
INSERT [dbo].[Faculty] ([FacultyId], [Name]) VALUES (4, N'Khoa Giải phẫu bệnh')
INSERT [dbo].[Faculty] ([FacultyId], [Name]) VALUES (5, N'Khoa Xét nghiệm')
INSERT [dbo].[Faculty] ([FacultyId], [Name]) VALUES (6, N'Khoa Dược')
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([ID], [CreateTime], [EntityID], [Serviced_Id], [text], [User_id], [RecordID]) VALUES (25, CAST(N'2022-06-10T00:29:43.977' AS DateTime), 0, 2, NULL, 1, NULL)
INSERT [dbo].[Feedback] ([ID], [CreateTime], [EntityID], [Serviced_Id], [text], [User_id], [RecordID]) VALUES (26, CAST(N'2022-06-10T00:34:50.610' AS DateTime), 0, 2, N'đá ád á ads ád ád á', 1, NULL)
INSERT [dbo].[Feedback] ([ID], [CreateTime], [EntityID], [Serviced_Id], [text], [User_id], [RecordID]) VALUES (27, CAST(N'2022-06-10T00:36:08.367' AS DateTime), 4, 2, N'đá  ad ad ', 1, NULL)
INSERT [dbo].[Feedback] ([ID], [CreateTime], [EntityID], [Serviced_Id], [text], [User_id], [RecordID]) VALUES (28, CAST(N'2022-06-10T00:38:22.980' AS DateTime), 3, 2, N'Bạn rất tuyệt vời', 1, NULL)
INSERT [dbo].[Feedback] ([ID], [CreateTime], [EntityID], [Serviced_Id], [text], [User_id], [RecordID]) VALUES (29, CAST(N'2022-06-10T00:41:00.403' AS DateTime), 3, 2, N'very gud', 1, NULL)
INSERT [dbo].[Feedback] ([ID], [CreateTime], [EntityID], [Serviced_Id], [text], [User_id], [RecordID]) VALUES (30, CAST(N'2022-06-10T00:46:30.630' AS DateTime), 4, 2, N'Verry gud', 1, NULL)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[illness] ON 

INSERT [dbo].[illness] ([id], [illName]) VALUES (1, N'Tieu chay')
SET IDENTITY_INSERT [dbo].[illness] OFF
GO
SET IDENTITY_INSERT [dbo].[MedicalExaminationForm] ON 

INSERT [dbo].[MedicalExaminationForm] ([id], [PetName], [Weight], [HairColor], [Species], [PetGender], [CreateDate], [ClientId], [Image], [id_Appointment]) VALUES (1, N'Milu', 3, N'yellow', N'dog', 1, NULL, 1, NULL, 20033)
SET IDENTITY_INSERT [dbo].[MedicalExaminationForm] OFF
GO
SET IDENTITY_INSERT [dbo].[Servicess] ON 

INSERT [dbo].[Servicess] ([id], [Name], [Cost], [Description], [Image]) VALUES (1, N'Khám tổng quát', 1, N'Chuẩn đoán và điều trị hiệu quả các bệnh về hệ hô hấp, hệ tiêu hóa, hệ tuần hoàn, tiết niệu, sinh dục, lông da, xương khớp, các bệnh về mắt và tai', N'nurse.png')
INSERT [dbo].[Servicess] ([id], [Name], [Cost], [Description], [Image]) VALUES (2, N'Tiêm ngừa', 1, N'Để đảm bảo sức khỏe cho người và vật nuôi, thú cưng cần được tiêm phòng và tái chủng định kì theo hướng dẫn của bác sĩ', N'needle.png')
INSERT [dbo].[Servicess] ([id], [Name], [Cost], [Description], [Image]) VALUES (3, N'Phẫu thuật', 1, N'Phòng khám thú y Pet Clinic cung cấp dịch vụ Phẫu thuật theo yêu cầu: triệt sản, cắt đuôi và Phẫu thuật điều trị: nối xương, sỏi niệu, mổ bướu..', N'doctor-briefcase.png')
INSERT [dbo].[Servicess] ([id], [Name], [Cost], [Description], [Image]) VALUES (4, N'Làm Đẹp', 1, N'Viện thẩm mỹ ở Pet Clinic cung cấp dịch vụ chăm sóc da lông vật nuôi theo yêu cầu của quý khách như tắm khô, tắm ướt, chải xù, cắt lông tạo kiểu và cắt móng.', N'pet-grooming.png')
INSERT [dbo].[Servicess] ([id], [Name], [Cost], [Description], [Image]) VALUES (5, N'Xét nghiệm', 1, NULL, N'diagnose.png')
INSERT [dbo].[Servicess] ([id], [Name], [Cost], [Description], [Image]) VALUES (6, N'Lưu Chuồng', 1, N'Pet Clinic áp dụng quy trình lưu giữ thú cưng khoa học, đảm bảo cho thú cưng nhà bạn sống trong môi trường an toàn và sạch sẽ.', N'dog-house.png')
INSERT [dbo].[Servicess] ([id], [Name], [Cost], [Description], [Image]) VALUES (7, N'Siêu Âm', 1, NULL, N'ultrasound.png')
INSERT [dbo].[Servicess] ([id], [Name], [Cost], [Description], [Image]) VALUES (8, N'Khác', 1, NULL, N'pet-shampoo.png')
SET IDENTITY_INSERT [dbo].[Servicess] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [CreateTime], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [Phone]) VALUES (1, N'admin', N'4297f44b13955235245b2497399d7a93', N'ADMIN', N'LucLuong', N'1', N'theluc13@gmail.com', CAST(N'2022-04-26T20:39:10.947' AS DateTime), NULL, NULL, NULL, 1, N'012312312')
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [CreateTime], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [Phone]) VALUES (3, N'luongtheluc', N'202cb962ac59075b964b07152d234b70', N'MEMBER', N'Luong The Luc', N'1', N'thelucpro1306@gmail.com', NULL, NULL, NULL, NULL, 1, N'3123123')
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [CreateTime], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [Phone]) VALUES (4, N'luongtheluc1', N'4297f44b13955235245b2497399d7a93', N'MEMBER', N'Luong The Luc', N'1', N'EWQESA@DAS.COM', NULL, NULL, NULL, NULL, 1, N'12312312')
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [CreateTime], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [Phone]) VALUES (5, N'admin12', N'4297f44b13955235245b2497399d7a93', N'MEMBER', N'Luc Luong', NULL, N'lucpro1306@gmail.com', CAST(N'2022-05-04T20:08:25.983' AS DateTime), NULL, NULL, NULL, 1, N'1231231')
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [CreateTime], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [Phone]) VALUES (6, N'admin123', N'4297f44b13955235245b2497399d7a93', N'MEMBER', N'Luc Luong', NULL, N'gaew@ada.gsf', CAST(N'2022-05-04T20:12:23.373' AS DateTime), NULL, NULL, NULL, 1, N'123123')
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [CreateTime], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [Phone]) VALUES (7, N'nhat', N'ec59c4b347b013a355a615451d33ac26', N'MEMBER', N'Dang Duy Nhat', NULL, N'nhatdang261@gmail.com', CAST(N'2022-05-09T20:19:28.103' AS DateTime), NULL, NULL, NULL, 1, N'12312')
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [CreateTime], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [Phone]) VALUES (9, N'nhat', N'4297f44b13955235245b2497399d7a93', N'ADMIN', N'DuyNhat', N'1', N'Email', CAST(N'2121-12-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, 1, N'12312312')
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [CreateTime], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [Phone]) VALUES (10, N'hiep', N'1', N'MEMBER', N'Nguyen Van Hiep', N'1', N'hiep4so9@gmail.com', CAST(N'2022-02-16T00:00:00.000' AS DateTime), NULL, NULL, NULL, 1, N'31231231')
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [CreateTime], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [Phone]) VALUES (11, N'hiep', N'202cb962ac59075b964b07152d234b70', N'MEMBER', N'Nguyễn Văn Hiệp', N'1', N'hiep4so9@gmail.com', NULL, NULL, NULL, NULL, 1, N'12312312')
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [CreateTime], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [Phone]) VALUES (19, N'hiep123', N'4297f44b13955235245b2497399d7a93', NULL, N'a', NULL, N'a@a.com', CAST(N'2022-05-20T15:44:49.843' AS DateTime), NULL, NULL, NULL, 1, N'1231231231')
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [CreateTime], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [Phone]) VALUES (22, N'phuha123', N'4297f44b13955235245b2497399d7a93', NULL, N'hdffsafg sfdsdsdf ', NULL, N'haphu@phuha.com', CAST(N'2022-05-23T22:52:28.977' AS DateTime), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [CreateTime], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [Phone]) VALUES (10021, N'duyNhat', N'4297f44b13955235245b2497399d7a93', NULL, N'luc luong 123', NULL, N'123@123.com', CAST(N'2022-05-28T23:06:19.623' AS DateTime), NULL, NULL, NULL, 1, N'12312312')
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [CreateTime], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [Phone]) VALUES (20022, N'taikhoan', N'4297f44b13955235245b2497399d7a93', NULL, N'tài khoản', NULL, N'taikhoan@taikhoan.com', CAST(N'2022-05-31T23:04:55.807' AS DateTime), NULL, NULL, NULL, 1, N'1231231')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'ADMIN', N'Quan tri')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'MEMBER', N'Thanh vien')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'MOD', N'Quan Ly')
GO
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_ShowOnHome]  DEFAULT ((0)) FOR [ShowOnHome]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_ViewCount]  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Quatity]  DEFAULT ((0)) FOR [Quatity]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_ViewCount]  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_Table_1_status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_ShowOnHome]  DEFAULT ((0)) FOR [ShowOnHome]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_GroupID]  DEFAULT ('MEMBER') FOR [GroupID]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Apointment]  WITH CHECK ADD  CONSTRAINT [FK_Apointment_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([id])
GO
ALTER TABLE [dbo].[Apointment] CHECK CONSTRAINT [FK_Apointment_Client]
GO
ALTER TABLE [dbo].[Apointment]  WITH CHECK ADD  CONSTRAINT [FK_Apointment_Servicess1] FOREIGN KEY([ServicesId])
REFERENCES [dbo].[Servicess] ([id])
GO
ALTER TABLE [dbo].[Apointment] CHECK CONSTRAINT [FK_Apointment_Servicess1]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_User1] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_User1]
GO
ALTER TABLE [dbo].[DeltailsMedicalForm]  WITH CHECK ADD  CONSTRAINT [FK_DeltailsMedicalForm_Doctor] FOREIGN KEY([id_Doctor])
REFERENCES [dbo].[Doctor] ([Id])
GO
ALTER TABLE [dbo].[DeltailsMedicalForm] CHECK CONSTRAINT [FK_DeltailsMedicalForm_Doctor]
GO
ALTER TABLE [dbo].[DeltailsMedicalForm]  WITH CHECK ADD  CONSTRAINT [FK_DeltailsMedicalForm_illness] FOREIGN KEY([id_ill])
REFERENCES [dbo].[illness] ([id])
GO
ALTER TABLE [dbo].[DeltailsMedicalForm] CHECK CONSTRAINT [FK_DeltailsMedicalForm_illness]
GO
ALTER TABLE [dbo].[DeltailsMedicalForm]  WITH CHECK ADD  CONSTRAINT [FK_DeltailsMedicalForm_MedicalExaminationForm] FOREIGN KEY([id_Form])
REFERENCES [dbo].[MedicalExaminationForm] ([id])
GO
ALTER TABLE [dbo].[DeltailsMedicalForm] CHECK CONSTRAINT [FK_DeltailsMedicalForm_MedicalExaminationForm]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Faculty] FOREIGN KEY([FacultyId])
REFERENCES [dbo].[Faculty] ([FacultyId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Faculty]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Servicess] FOREIGN KEY([Serviced_Id])
REFERENCES [dbo].[Servicess] ([id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Servicess]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_User] FOREIGN KEY([User_id])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_User]
GO
ALTER TABLE [dbo].[MedicalExaminationForm]  WITH CHECK ADD  CONSTRAINT [FK_MedicalExaminationForm_Apointment] FOREIGN KEY([id_Appointment])
REFERENCES [dbo].[Apointment] ([Id])
GO
ALTER TABLE [dbo].[MedicalExaminationForm] CHECK CONSTRAINT [FK_MedicalExaminationForm_Apointment]
GO
ALTER TABLE [dbo].[MedicalExaminationForm]  WITH CHECK ADD  CONSTRAINT [FK_MedicalExaminationForm_Client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([id])
GO
ALTER TABLE [dbo].[MedicalExaminationForm] CHECK CONSTRAINT [FK_MedicalExaminationForm_Client]
GO
/****** Object:  StoredProcedure [dbo].[procAccountLogin]    Script Date: 6/10/2022 12:54:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[procAccountLogin]
	@username varchar(50),
	@password varchar(50)
as
begin
	declare @count int
	declare @res bit
	select @count = COUNT(*) from Sp_Account_Login s
	where s.UserName = @username and s.Password  = @password
	if @count >0
		set @res = 1
	else
		set @res = 0

	select @res
end
GO
USE [master]
GO
ALTER DATABASE [OnlineShop123] SET  READ_WRITE 
GO
