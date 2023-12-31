USE [master]
GO
/****** Object:  Database [JobFinder]    Script Date: 8/30/2023 10:11:32 PM ******/
CREATE DATABASE [JobFinder]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JobFinder', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\JobFinder.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JobFinder_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\JobFinder_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [JobFinder] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JobFinder].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JobFinder] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JobFinder] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JobFinder] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JobFinder] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JobFinder] SET ARITHABORT OFF 
GO
ALTER DATABASE [JobFinder] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JobFinder] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JobFinder] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JobFinder] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JobFinder] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JobFinder] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JobFinder] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JobFinder] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JobFinder] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JobFinder] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JobFinder] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JobFinder] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JobFinder] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JobFinder] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JobFinder] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JobFinder] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JobFinder] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JobFinder] SET RECOVERY FULL 
GO
ALTER DATABASE [JobFinder] SET  MULTI_USER 
GO
ALTER DATABASE [JobFinder] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JobFinder] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JobFinder] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JobFinder] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JobFinder] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [JobFinder] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'JobFinder', N'ON'
GO
ALTER DATABASE [JobFinder] SET QUERY_STORE = OFF
GO
USE [JobFinder]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8/30/2023 10:11:32 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditLogs]    Script Date: 8/30/2023 10:11:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Identity] [nvarchar](50) NOT NULL,
	[UseCaseName] [nvarchar](50) NOT NULL,
	[ExecutionDateTime] [datetime2](7) NOT NULL,
	[IsAuthorized] [bit] NOT NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_AuditLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 8/30/2023 10:11:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ParentId] [int] NULL,
	[DeletedAt] [datetime2](7) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Experiences]    Script Date: 8/30/2023 10:11:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Experiences](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Experiences] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobAds]    Script Date: 8/30/2023 10:11:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobAds](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SalaryMin] [decimal](18, 2) NOT NULL,
	[SalaryMax] [decimal](18, 2) NOT NULL,
	[JobTypeId] [int] NOT NULL,
	[SalaryTypeId] [int] NOT NULL,
	[JobId] [int] NOT NULL,
	[EndAt] [datetime2](7) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_JobAds] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobApplications]    Script Date: 8/30/2023 10:11:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobApplications](
	[JobAdId] [int] NOT NULL,
	[CandidateId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_JobApplications] PRIMARY KEY CLUSTERED 
(
	[JobAdId] ASC,
	[CandidateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 8/30/2023 10:11:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Description] [text] NOT NULL,
	[ExperienceId] [int] NOT NULL,
	[EmployerId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobSkills]    Script Date: 8/30/2023 10:11:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobSkills](
	[JobAdId] [int] NOT NULL,
	[SkillId] [int] NOT NULL,
 CONSTRAINT [PK_JobSkills] PRIMARY KEY CLUSTERED 
(
	[JobAdId] ASC,
	[SkillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobTypes]    Script Date: 8/30/2023 10:11:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_JobTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalaryTypes]    Script Date: 8/30/2023 10:11:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalaryTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_SalaryTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skills]    Script Date: 8/30/2023 10:11:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skills](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Skills] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/30/2023 10:11:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](450) NOT NULL,
	[Username] [nvarchar](450) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[Degree] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[CV] [nvarchar](max) NULL,
	[PersonalWebsite] [nvarchar](max) NULL,
	[LinkedInProfile] [nvarchar](max) NULL,
	[Company] [nvarchar](max) NULL,
	[Adress] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCases]    Script Date: 8/30/2023 10:11:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCases](
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
 CONSTRAINT [PK_UserUseCases] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[UseCaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230830194008_Initial-migration', N'5.0.17')
GO
SET IDENTITY_INSERT [dbo].[AuditLogs] ON 

INSERT [dbo].[AuditLogs] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (1, 0, N'Anonymous', N'Create initial data Command.', CAST(N'2023-08-30T19:42:01.7089223' AS DateTime2), 1, N'{"Skills":[{"Name":"JavaScript","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Python","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Java","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"C#","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Ruby","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"PHP","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Swift","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Go","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Rust","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Kotlin","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Git","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"SVN","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Mercurial","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"React","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Angular","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Vue.js","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":".NET Core","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Ruby on Rails","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Django","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Spring Boot","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Laravel","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Flask","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Express.js","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"SQL","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"MongoDB","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"PostgreSQL","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"MySQL","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"SQLite","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Adobe Photoshop","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Adobe Illustrator","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Sketch","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Figma","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"InVision","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Microsoft SQL Server","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Oracle Database","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"MySQL Server","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"PostgreSQL Server","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"MongoDB Atlas","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Linux","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Ubuntu","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"CentOS","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Windows Server","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Azure","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"AWS","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Google Cloud","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Networking Fundamentals","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Cisco Networking","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Categories":[{"Name":"Development","ParentId":null,"Parent":null,"Subcategories":[{"Name":"Front-end Development","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Back-end Development","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Full-stack Development","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Mobile App Development","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Game Development","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Design","ParentId":null,"Parent":null,"Subcategories":[{"Name":"UI/UX Design","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Graphic Design","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Web Design","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Interaction Design","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Motion Design","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Data & Analytics","ParentId":null,"Parent":null,"Subcategories":[{"Name":"Data Science","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Business Intelligence","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Machine Learning","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Data Engineering","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Data Analysis","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Cybersecurity","ParentId":null,"Parent":null,"Subcategories":[{"Name":"Network Security","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Application Security","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Information Security","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Penetration Testing","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Security Auditing","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Project Management","ParentId":null,"Parent":null,"Subcategories":[{"Name":"Agile Project Management","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Scrum Master","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Product Owner","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"IT Project Manager","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Program Manager","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"JobTypes":[{"Name":"Onsite","Jobs":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Hybrid","Jobs":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Remote","Jobs":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Experiences":[{"Name":"Junior","Jobs":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Mid-Level","Jobs":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Senior","Jobs":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Admin":{"FirstName":"Mateja","LastName":"Mastelica","Email":"admin@gmail.com","Username":"admin123","Password":"$2a$11$SN.Pjnh8jxhR8vESwajHf.dkvkeQx8cipec5HFpAJyXGfsXIbPRB2","Discriminator":null,"UseCases":[{"UserId":0,"UseCaseId":27,"User":null},{"UserId":0,"UseCaseId":9,"User":null},{"UserId":0,"UseCaseId":25,"User":null},{"UserId":0,"UseCaseId":12,"User":null},{"UserId":0,"UseCaseId":30,"User":null},{"UserId":0,"UseCaseId":31,"User":null},{"UserId":0,"UseCaseId":10,"User":null},{"UserId":0,"UseCaseId":4,"User":null},{"UserId":0,"UseCaseId":3,"User":null},{"UserId":0,"UseCaseId":7,"User":null},{"UserId":0,"UseCaseId":35,"User":null},{"UserId":0,"UseCaseId":36,"User":null}],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},"Employer":{"Company":"ABC Corporation","Adress":"123 Business Street","City":"Metropolis","Country":"United Kingdom","Description":"We are a leading global company.","Jobs":[],"FirstName":"Jane","LastName":"Smith","Email":"employer@gmail.com","Username":"employer123","Password":"$2a$11$GdA2zCK9O7in7Ndo71GLxOTFybXbMvab3RPAVX8urETw8RjZeRfH2","Discriminator":null,"UseCases":[{"UserId":0,"UseCaseId":6,"User":null},{"UserId":0,"UseCaseId":21,"User":null},{"UserId":0,"UseCaseId":13,"User":null},{"UserId":0,"UseCaseId":14,"User":null},{"UserId":0,"UseCaseId":31,"User":null},{"UserId":0,"UseCaseId":14,"User":null},{"UserId":0,"UseCaseId":15,"User":null},{"UserId":0,"UseCaseId":11,"User":null},{"UserId":0,"UseCaseId":10,"User":null},{"UserId":0,"UseCaseId":4,"User":null},{"UserId":0,"UseCaseId":3,"User":null},{"UserId":0,"UseCaseId":7,"User":null},{"UserId":0,"UseCaseId":35,"User":null},{"UserId":0,"UseCaseId":36,"User":null}],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},"Candidate":{"Degree":"Bachelor of Science","Phone":"555-123-456","CV":"Link to CV","PersonalWebsite":"johndoe.com","LinkedInProfile":"linkedin.com/in/johndoe","JobApplications":[],"FirstName":"John","LastName":"Doe","Email":"candidate@gmail.com","Username":"candidate123","Password":"$2a$11$tfrek4pdSvC4SfMVG10Sh.LygGoZVwEj2vNdOaxcypVhvjEFAkE6S","Discriminator":null,"UseCases":[{"UserId":0,"UseCaseId":2,"User":null},{"UserId":0,"UseCaseId":22,"User":null},{"UserId":0,"UseCaseId":31,"User":null},{"UserId":0,"UseCaseId":11,"User":null},{"UserId":0,"UseCaseId":10,"User":null},{"UserId":0,"UseCaseId":4,"User":null},{"UserId":0,"UseCaseId":3,"User":null},{"UserId":0,"UseCaseId":7,"User":null},{"UserId":0,"UseCaseId":35,"User":null},{"UserId":0,"UseCaseId":36,"User":null}],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (2, 0, N'Anonymous', N'Create initial data Command.', CAST(N'2023-08-30T19:43:45.8739199' AS DateTime2), 1, N'{"Skills":[{"Name":"JavaScript","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Python","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Java","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"C#","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Ruby","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"PHP","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Swift","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Go","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Rust","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Kotlin","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Git","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"SVN","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Mercurial","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"React","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Angular","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Vue.js","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":".NET Core","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Ruby on Rails","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Django","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Spring Boot","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Laravel","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Flask","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Express.js","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"SQL","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"MongoDB","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"PostgreSQL","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"MySQL","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"SQLite","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Adobe Photoshop","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Adobe Illustrator","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Sketch","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Figma","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"InVision","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Microsoft SQL Server","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Oracle Database","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"MySQL Server","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"PostgreSQL Server","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"MongoDB Atlas","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Linux","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Ubuntu","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"CentOS","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Windows Server","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Azure","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"AWS","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Google Cloud","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Networking Fundamentals","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Cisco Networking","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Categories":[{"Name":"Development","ParentId":null,"Parent":null,"Subcategories":[{"Name":"Front-end Development","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Back-end Development","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Full-stack Development","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Mobile App Development","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Game Development","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Design","ParentId":null,"Parent":null,"Subcategories":[{"Name":"UI/UX Design","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Graphic Design","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Web Design","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Interaction Design","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Motion Design","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Data & Analytics","ParentId":null,"Parent":null,"Subcategories":[{"Name":"Data Science","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Business Intelligence","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Machine Learning","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Data Engineering","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Data Analysis","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Cybersecurity","ParentId":null,"Parent":null,"Subcategories":[{"Name":"Network Security","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Application Security","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Information Security","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Penetration Testing","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Security Auditing","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Project Management","ParentId":null,"Parent":null,"Subcategories":[{"Name":"Agile Project Management","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Scrum Master","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Product Owner","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"IT Project Manager","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Program Manager","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"JobTypes":[{"Name":"Onsite","Jobs":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Hybrid","Jobs":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Remote","Jobs":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Experiences":[{"Name":"Junior","Jobs":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Mid-Level","Jobs":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Senior","Jobs":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Admin":{"FirstName":"Mateja","LastName":"Mastelica","Email":"admin@gmail.com","Username":"admin123","Password":"$2a$11$7UPy5/yuscICae88/huOs.tFYyKlxCheU5EniADxqBaHNZS.neydy","Discriminator":null,"UseCases":[{"UserId":0,"UseCaseId":27,"User":null},{"UserId":0,"UseCaseId":9,"User":null},{"UserId":0,"UseCaseId":25,"User":null},{"UserId":0,"UseCaseId":12,"User":null},{"UserId":0,"UseCaseId":30,"User":null},{"UserId":0,"UseCaseId":31,"User":null},{"UserId":0,"UseCaseId":10,"User":null},{"UserId":0,"UseCaseId":4,"User":null},{"UserId":0,"UseCaseId":3,"User":null},{"UserId":0,"UseCaseId":7,"User":null},{"UserId":0,"UseCaseId":35,"User":null},{"UserId":0,"UseCaseId":36,"User":null}],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},"Employer":{"Company":"ABC Corporation","Adress":"123 Business Street","City":"Metropolis","Country":"United Kingdom","Description":"We are a leading global company.","Jobs":[],"FirstName":"Jane","LastName":"Smith","Email":"employer@gmail.com","Username":"employer123","Password":"$2a$11$XRZxFQ8kWmJlOqSY4.b4We0HFd7LBHIZ0S1YFOpoNV35lWtKNxHEG","Discriminator":null,"UseCases":[{"UserId":0,"UseCaseId":6,"User":null},{"UserId":0,"UseCaseId":21,"User":null},{"UserId":0,"UseCaseId":13,"User":null},{"UserId":0,"UseCaseId":14,"User":null},{"UserId":0,"UseCaseId":31,"User":null},{"UserId":0,"UseCaseId":14,"User":null},{"UserId":0,"UseCaseId":15,"User":null},{"UserId":0,"UseCaseId":11,"User":null},{"UserId":0,"UseCaseId":10,"User":null},{"UserId":0,"UseCaseId":4,"User":null},{"UserId":0,"UseCaseId":3,"User":null},{"UserId":0,"UseCaseId":7,"User":null},{"UserId":0,"UseCaseId":35,"User":null},{"UserId":0,"UseCaseId":36,"User":null}],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},"Candidate":{"Degree":"Bachelor of Science","Phone":"555-123-456","CV":"Link to CV","PersonalWebsite":"johndoe.com","LinkedInProfile":"linkedin.com/in/johndoe","JobApplications":[],"FirstName":"John","LastName":"Doe","Email":"candidate@gmail.com","Username":"candidate123","Password":"$2a$11$odW3MWR3dBwNelmgahzdAuKEeAJEW.V47ssWG8ayKgnhCokd99lDW","Discriminator":null,"UseCases":[{"UserId":0,"UseCaseId":2,"User":null},{"UserId":0,"UseCaseId":22,"User":null},{"UserId":0,"UseCaseId":31,"User":null},{"UserId":0,"UseCaseId":11,"User":null},{"UserId":0,"UseCaseId":10,"User":null},{"UserId":0,"UseCaseId":4,"User":null},{"UserId":0,"UseCaseId":3,"User":null},{"UserId":0,"UseCaseId":7,"User":null},{"UserId":0,"UseCaseId":35,"User":null},{"UserId":0,"UseCaseId":36,"User":null}],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (3, 0, N'Anonymous', N'Create initial data Command.', CAST(N'2023-08-30T19:48:35.9657224' AS DateTime2), 1, N'{"Skills":[{"Name":"JavaScript","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Python","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Java","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"C#","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Ruby","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"PHP","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Swift","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Go","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Rust","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Kotlin","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Git","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"SVN","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Mercurial","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"React","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Angular","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Vue.js","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":".NET Core","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Ruby on Rails","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Django","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Spring Boot","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Laravel","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Flask","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Express.js","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"SQL","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"MongoDB","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"PostgreSQL","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"MySQL","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"SQLite","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Adobe Photoshop","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Adobe Illustrator","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Sketch","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Figma","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"InVision","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Microsoft SQL Server","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Oracle Database","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"MySQL Server","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"PostgreSQL Server","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"MongoDB Atlas","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Linux","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Ubuntu","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"CentOS","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Windows Server","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Azure","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"AWS","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Google Cloud","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Networking Fundamentals","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Cisco Networking","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Categories":[{"Name":"Development","ParentId":null,"Parent":null,"Subcategories":[{"Name":"Front-end Development","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Back-end Development","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Full-stack Development","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Mobile App Development","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Game Development","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Design","ParentId":null,"Parent":null,"Subcategories":[{"Name":"UI/UX Design","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Graphic Design","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Web Design","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Interaction Design","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Motion Design","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Data & Analytics","ParentId":null,"Parent":null,"Subcategories":[{"Name":"Data Science","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Business Intelligence","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Machine Learning","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Data Engineering","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Data Analysis","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Cybersecurity","ParentId":null,"Parent":null,"Subcategories":[{"Name":"Network Security","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Application Security","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Information Security","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Penetration Testing","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Security Auditing","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Project Management","ParentId":null,"Parent":null,"Subcategories":[{"Name":"Agile Project Management","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Scrum Master","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Product Owner","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"IT Project Manager","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Program Manager","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"JobTypes":[{"Name":"Onsite","Jobs":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Hybrid","Jobs":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Remote","Jobs":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Experiences":[{"Name":"Junior","Jobs":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Mid-Level","Jobs":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Senior","Jobs":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Admin":{"FirstName":"Mateja","LastName":"Mastelica","Email":"admin@gmail.com","Username":"admin123","Password":"$2a$11$oUhoYZug3Tvy5yqwtY/WUeQi7wcS.uvtk6qWSAj6T/DdoouqTxLAe","Discriminator":null,"UseCases":[{"UserId":0,"UseCaseId":27,"User":null},{"UserId":0,"UseCaseId":9,"User":null},{"UserId":0,"UseCaseId":25,"User":null},{"UserId":0,"UseCaseId":12,"User":null},{"UserId":0,"UseCaseId":30,"User":null},{"UserId":0,"UseCaseId":31,"User":null},{"UserId":0,"UseCaseId":10,"User":null},{"UserId":0,"UseCaseId":4,"User":null},{"UserId":0,"UseCaseId":3,"User":null},{"UserId":0,"UseCaseId":7,"User":null},{"UserId":0,"UseCaseId":35,"User":null},{"UserId":0,"UseCaseId":36,"User":null}],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},"Employer":{"Company":"ABC Corporation","Adress":"123 Business Street","City":"Metropolis","Country":"United Kingdom","Description":"We are a leading global company.","Jobs":[],"FirstName":"Jane","LastName":"Smith","Email":"employer@gmail.com","Username":"employer123","Password":"$2a$11$nUpjSh2nhELNsa.hoWl1Cu.IOisj5nHp6Mp1AFT6kIRAz2q.OG/.i","Discriminator":null,"UseCases":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},"Candidate":{"Degree":"Bachelor of Science","Phone":"555-123-456","CV":"Link to CV","PersonalWebsite":"johndoe.com","LinkedInProfile":"linkedin.com/in/johndoe","JobApplications":[],"FirstName":"John","LastName":"Doe","Email":"candidate@gmail.com","Username":"candidate123","Password":"$2a$11$z3WTa29UkPdhtbRMsP5.QON9x8bqsiJdD9CMk0WIWyMQIKYkLp67q","Discriminator":null,"UseCases":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [Identity], [UseCaseName], [ExecutionDateTime], [IsAuthorized], [Data]) VALUES (4, 0, N'Anonymous', N'Create initial data Command.', CAST(N'2023-08-30T20:03:25.2411088' AS DateTime2), 1, N'{"Skills":[{"Name":"JavaScript","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Python","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Java","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"C#","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Ruby","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"PHP","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Swift","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Go","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Rust","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Kotlin","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Git","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"SVN","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Mercurial","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"React","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Angular","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Vue.js","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":".NET Core","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Ruby on Rails","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Django","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Spring Boot","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Laravel","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Flask","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Express.js","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"SQL","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"MongoDB","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"PostgreSQL","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"MySQL","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"SQLite","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Adobe Photoshop","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Adobe Illustrator","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Sketch","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Figma","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"InVision","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Microsoft SQL Server","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Oracle Database","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"MySQL Server","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"PostgreSQL Server","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"MongoDB Atlas","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Linux","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Ubuntu","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"CentOS","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Windows Server","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Azure","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"AWS","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Google Cloud","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Networking Fundamentals","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Cisco Networking","JobSkills":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Categories":[{"Name":"Development","ParentId":null,"Parent":null,"Subcategories":[{"Name":"Front-end Development","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Back-end Development","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Full-stack Development","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Mobile App Development","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Game Development","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Design","ParentId":null,"Parent":null,"Subcategories":[{"Name":"UI/UX Design","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Graphic Design","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Web Design","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Interaction Design","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Motion Design","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Data & Analytics","ParentId":null,"Parent":null,"Subcategories":[{"Name":"Data Science","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Business Intelligence","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Machine Learning","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Data Engineering","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Data Analysis","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Cybersecurity","ParentId":null,"Parent":null,"Subcategories":[{"Name":"Network Security","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Application Security","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Information Security","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Penetration Testing","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Security Auditing","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Project Management","ParentId":null,"Parent":null,"Subcategories":[{"Name":"Agile Project Management","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Scrum Master","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Product Owner","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"IT Project Manager","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Program Manager","ParentId":null,"Parent":null,"Subcategories":[],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Jobs":[],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"JobTypes":[{"Name":"Onsite","Jobs":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Hybrid","Jobs":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Remote","Jobs":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Experiences":[{"Name":"Junior","Jobs":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Mid-Level","Jobs":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},{"Name":"Senior","Jobs":[],"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}],"Admin":{"FirstName":"Mateja","LastName":"Mastelica","Email":"admin@gmail.com","Username":"admin123","Password":"$2a$11$QTOR3kZz0nUF3fSVW6eJM.uCKro7mkd9A6RtLntQ/ADHn2GUOF3Xe","Discriminator":null,"UseCases":[{"UserId":0,"UseCaseId":27,"User":null},{"UserId":0,"UseCaseId":9,"User":null},{"UserId":0,"UseCaseId":25,"User":null},{"UserId":0,"UseCaseId":12,"User":null},{"UserId":0,"UseCaseId":30,"User":null},{"UserId":0,"UseCaseId":31,"User":null},{"UserId":0,"UseCaseId":10,"User":null},{"UserId":0,"UseCaseId":4,"User":null},{"UserId":0,"UseCaseId":3,"User":null},{"UserId":0,"UseCaseId":7,"User":null},{"UserId":0,"UseCaseId":35,"User":null},{"UserId":0,"UseCaseId":36,"User":null}],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},"Employer":{"Company":"ABC Corporation","Adress":"123 Business Street","City":"Metropolis","Country":"United Kingdom","Description":"We are a leading global company.","Jobs":[],"FirstName":"Jane","LastName":"Smith","Email":"employer@gmail.com","Username":"employer123","Password":"$2a$11$SeeL/HCaf9O3n/F8R57mMuL2G/BioAeFWyjJUCORJ7i0OiBE9ZRU.","Discriminator":null,"UseCases":[{"UserId":0,"UseCaseId":6,"User":null},{"UserId":0,"UseCaseId":21,"User":null},{"UserId":0,"UseCaseId":13,"User":null},{"UserId":0,"UseCaseId":31,"User":null},{"UserId":0,"UseCaseId":14,"User":null},{"UserId":0,"UseCaseId":15,"User":null},{"UserId":0,"UseCaseId":11,"User":null},{"UserId":0,"UseCaseId":10,"User":null},{"UserId":0,"UseCaseId":4,"User":null},{"UserId":0,"UseCaseId":3,"User":null},{"UserId":0,"UseCaseId":7,"User":null},{"UserId":0,"UseCaseId":35,"User":null},{"UserId":0,"UseCaseId":36,"User":null}],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},"Candidate":{"Degree":"Bachelor of Science","Phone":"555-123-456","CV":"Link to CV","PersonalWebsite":"johndoe.com","LinkedInProfile":"linkedin.com/in/johndoe","JobApplications":[],"FirstName":"John","LastName":"Doe","Email":"candidate@gmail.com","Username":"candidate123","Password":"$2a$11$uUc5SJQXM8eYXPYy5/6/Ku0dR1H2rx3LCdySpcCYay.q3tEUtOvYa","Discriminator":null,"UseCases":[{"UserId":0,"UseCaseId":2,"User":null},{"UserId":0,"UseCaseId":22,"User":null},{"UserId":0,"UseCaseId":31,"User":null},{"UserId":0,"UseCaseId":11,"User":null},{"UserId":0,"UseCaseId":10,"User":null},{"UserId":0,"UseCaseId":4,"User":null},{"UserId":0,"UseCaseId":3,"User":null},{"UserId":0,"UseCaseId":7,"User":null},{"UserId":0,"UseCaseId":35,"User":null},{"UserId":0,"UseCaseId":36,"User":null}],"DeletedAt":null,"Id":0,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null},"UserUseCase":null}')
SET IDENTITY_INSERT [dbo].[AuditLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (1, N'Development', NULL, NULL, CAST(N'2023-08-30T21:43:48.2266667' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (2, N'Design', NULL, NULL, CAST(N'2023-08-30T21:43:48.2266667' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (3, N'Data & Analytics', NULL, NULL, CAST(N'2023-08-30T21:43:48.2266667' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (4, N'Cybersecurity', NULL, NULL, CAST(N'2023-08-30T21:43:48.2266667' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (5, N'Project Management', NULL, NULL, CAST(N'2023-08-30T21:43:48.2266667' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (6, N'Front-end Development', 1, NULL, CAST(N'2023-08-30T21:43:49.0766667' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (7, N'Program Manager', 5, NULL, CAST(N'2023-08-30T21:43:49.0766667' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (8, N'IT Project Manager', 5, NULL, CAST(N'2023-08-30T21:43:49.0766667' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (9, N'Product Owner', 5, NULL, CAST(N'2023-08-30T21:43:49.0766667' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (10, N'Scrum Master', 5, NULL, CAST(N'2023-08-30T21:43:49.0766667' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (11, N'Agile Project Management', 5, NULL, CAST(N'2023-08-30T21:43:49.0766667' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (12, N'Security Auditing', 4, NULL, CAST(N'2023-08-30T21:43:49.0766667' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (13, N'Information Security', 4, NULL, CAST(N'2023-08-30T21:43:49.0766667' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (14, N'Application Security', 4, NULL, CAST(N'2023-08-30T21:43:49.0766667' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (15, N'Network Security', 4, NULL, CAST(N'2023-08-30T21:43:49.0766667' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (16, N'Data Analysis', 3, NULL, CAST(N'2023-08-30T21:43:49.0766667' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (17, N'Data Engineering', 3, NULL, CAST(N'2023-08-30T21:43:49.0766667' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (18, N'Penetration Testing', 4, NULL, CAST(N'2023-08-30T21:43:49.0766667' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (19, N'Business Intelligence', 3, NULL, CAST(N'2023-08-30T21:43:49.0766667' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (20, N'Machine Learning', 3, NULL, CAST(N'2023-08-30T21:43:49.0766667' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (21, N'Full-stack Development', 1, NULL, CAST(N'2023-08-30T21:43:49.0766667' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (22, N'Mobile App Development', 1, NULL, CAST(N'2023-08-30T21:43:49.0766667' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (23, N'Game Development', 1, NULL, CAST(N'2023-08-30T21:43:49.0766667' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (24, N'UI/UX Design', 2, NULL, CAST(N'2023-08-30T21:43:49.0766667' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (25, N'Back-end Development', 1, NULL, CAST(N'2023-08-30T21:43:49.0766667' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (26, N'Web Design', 2, NULL, CAST(N'2023-08-30T21:43:49.0766667' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (27, N'Interaction Design', 2, NULL, CAST(N'2023-08-30T21:43:49.0766667' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (28, N'Motion Design', 2, NULL, CAST(N'2023-08-30T21:43:49.0766667' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (29, N'Data Science', 3, NULL, CAST(N'2023-08-30T21:43:49.0766667' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (30, N'Graphic Design', 2, NULL, CAST(N'2023-08-30T21:43:49.0766667' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Experiences] ON 

INSERT [dbo].[Experiences] ([Id], [Name], [CreatedAt], [UpdatedAt]) VALUES (1, N'Junior', CAST(N'2023-08-30T21:43:48.3933333' AS DateTime2), NULL)
INSERT [dbo].[Experiences] ([Id], [Name], [CreatedAt], [UpdatedAt]) VALUES (2, N'Mid-Level', CAST(N'2023-08-30T21:43:48.3933333' AS DateTime2), NULL)
INSERT [dbo].[Experiences] ([Id], [Name], [CreatedAt], [UpdatedAt]) VALUES (3, N'Senior', CAST(N'2023-08-30T21:43:48.3933333' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Experiences] OFF
GO
SET IDENTITY_INSERT [dbo].[JobTypes] ON 

INSERT [dbo].[JobTypes] ([Id], [Name], [CreatedAt], [UpdatedAt]) VALUES (1, N'Remote', CAST(N'2023-08-30T21:43:48.5366667' AS DateTime2), NULL)
INSERT [dbo].[JobTypes] ([Id], [Name], [CreatedAt], [UpdatedAt]) VALUES (2, N'Onsite', CAST(N'2023-08-30T21:43:48.5366667' AS DateTime2), NULL)
INSERT [dbo].[JobTypes] ([Id], [Name], [CreatedAt], [UpdatedAt]) VALUES (3, N'Hybrid', CAST(N'2023-08-30T21:43:48.5366667' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[JobTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[SalaryTypes] ON 

INSERT [dbo].[SalaryTypes] ([Id], [Name], [CreatedAt], [UpdatedAt]) VALUES (1, N'Monthly', CAST(N'2023-08-30T22:08:49.3566667' AS DateTime2), NULL)
INSERT [dbo].[SalaryTypes] ([Id], [Name], [CreatedAt], [UpdatedAt]) VALUES (2, N'Yearly', CAST(N'2023-08-30T22:08:52.8466667' AS DateTime2), NULL)
INSERT [dbo].[SalaryTypes] ([Id], [Name], [CreatedAt], [UpdatedAt]) VALUES (3, N'Daily', CAST(N'2023-08-30T22:08:57.2800000' AS DateTime2), NULL)
INSERT [dbo].[SalaryTypes] ([Id], [Name], [CreatedAt], [UpdatedAt]) VALUES (4, N'Hourly', CAST(N'2023-08-30T22:09:01.4633333' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[SalaryTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Skills] ON 

INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (1, N'SQLite', NULL, CAST(N'2023-08-30T21:43:48.6766667' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (2, N'Adobe Photoshop', NULL, CAST(N'2023-08-30T21:43:48.6766667' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (3, N'Adobe Illustrator', NULL, CAST(N'2023-08-30T21:43:48.6766667' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (4, N'Sketch', NULL, CAST(N'2023-08-30T21:43:48.6766667' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (5, N'Figma', NULL, CAST(N'2023-08-30T21:43:48.6766667' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (6, N'InVision', NULL, CAST(N'2023-08-30T21:43:48.6766667' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (7, N'Microsoft SQL Server', NULL, CAST(N'2023-08-30T21:43:48.6766667' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (8, N'Oracle Database', NULL, CAST(N'2023-08-30T21:43:48.6766667' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (9, N'MySQL Server', NULL, CAST(N'2023-08-30T21:43:48.6766667' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (10, N'CentOS', NULL, CAST(N'2023-08-30T21:43:48.6766667' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (11, N'MongoDB Atlas', NULL, CAST(N'2023-08-30T21:43:48.6766667' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (12, N'Linux', NULL, CAST(N'2023-08-30T21:43:48.6766667' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (13, N'Ubuntu', NULL, CAST(N'2023-08-30T21:43:48.6766667' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (14, N'MySQL', NULL, CAST(N'2023-08-30T21:43:48.6766667' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (15, N'Windows Server', NULL, CAST(N'2023-08-30T21:43:48.6766667' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (16, N'Azure', NULL, CAST(N'2023-08-30T21:43:48.6766667' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (17, N'AWS', NULL, CAST(N'2023-08-30T21:43:48.6766667' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (18, N'Google Cloud', NULL, CAST(N'2023-08-30T21:43:48.6766667' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (19, N'Networking Fundamentals', NULL, CAST(N'2023-08-30T21:43:48.6766667' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (20, N'Cisco Networking', NULL, CAST(N'2023-08-30T21:43:48.6766667' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (21, N'PostgreSQL Server', NULL, CAST(N'2023-08-30T21:43:48.6766667' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (22, N'PostgreSQL', NULL, CAST(N'2023-08-30T21:43:48.6766667' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (23, N'Flask', NULL, CAST(N'2023-08-30T21:43:48.6766667' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (24, N'SQL', NULL, CAST(N'2023-08-30T21:43:48.6766667' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (25, N'JavaScript', NULL, CAST(N'2023-08-30T21:43:48.6766667' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (26, N'Python', NULL, CAST(N'2023-08-30T21:43:48.6766667' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (27, N'Java', NULL, CAST(N'2023-08-30T21:43:48.6766667' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (28, N'C#', NULL, CAST(N'2023-08-30T21:43:48.6766667' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (29, N'Ruby', NULL, CAST(N'2023-08-30T21:43:48.6766667' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (30, N'PHP', NULL, CAST(N'2023-08-30T21:43:48.6766667' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (31, N'Swift', NULL, CAST(N'2023-08-30T21:43:48.6766667' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (32, N'Go', NULL, CAST(N'2023-08-30T21:43:48.8333333' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (33, N'Rust', NULL, CAST(N'2023-08-30T21:43:48.8333333' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (34, N'Kotlin', NULL, CAST(N'2023-08-30T21:43:48.8333333' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (35, N'MongoDB', NULL, CAST(N'2023-08-30T21:43:48.8333333' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (36, N'Git', NULL, CAST(N'2023-08-30T21:43:48.8333333' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (37, N'Mercurial', NULL, CAST(N'2023-08-30T21:43:48.8333333' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (38, N'React', NULL, CAST(N'2023-08-30T21:43:48.8333333' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (39, N'Angular', NULL, CAST(N'2023-08-30T21:43:48.8333333' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (40, N'Vue.js', NULL, CAST(N'2023-08-30T21:43:48.8333333' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (41, N'.NET Core', NULL, CAST(N'2023-08-30T21:43:48.8333333' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (42, N'Ruby on Rails', NULL, CAST(N'2023-08-30T21:43:48.8333333' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (43, N'Django', NULL, CAST(N'2023-08-30T21:43:48.8333333' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (44, N'Spring Boot', NULL, CAST(N'2023-08-30T21:43:48.8333333' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (45, N'Laravel', NULL, CAST(N'2023-08-30T21:43:48.8333333' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (46, N'Express.js', NULL, CAST(N'2023-08-30T21:43:48.8333333' AS DateTime2), NULL)
INSERT [dbo].[Skills] ([Id], [Name], [DeletedAt], [CreatedAt], [UpdatedAt]) VALUES (47, N'SVN', NULL, CAST(N'2023-08-30T21:43:48.8333333' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Skills] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Username], [Password], [Discriminator], [DeletedAt], [Degree], [Phone], [CV], [PersonalWebsite], [LinkedInProfile], [Company], [Adress], [City], [Country], [Description], [CreatedAt], [UpdatedAt]) VALUES (6, N'Mateja', N'Mastelica', N'admin@gmail.com', N'admin123', N'$2a$11$QTOR3kZz0nUF3fSVW6eJM.uCKro7mkd9A6RtLntQ/ADHn2GUOF3Xe', N'Admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-08-30T22:03:28.5200000' AS DateTime2), NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Username], [Password], [Discriminator], [DeletedAt], [Degree], [Phone], [CV], [PersonalWebsite], [LinkedInProfile], [Company], [Adress], [City], [Country], [Description], [CreatedAt], [UpdatedAt]) VALUES (7, N'Jane', N'Smith', N'employer@gmail.com', N'employer123', N'$2a$11$SeeL/HCaf9O3n/F8R57mMuL2G/BioAeFWyjJUCORJ7i0OiBE9ZRU.', N'Employer', NULL, NULL, NULL, NULL, NULL, NULL, N'ABC Corporation', N'123 Business Street', N'Metropolis', N'United Kingdom', N'We are a leading global company.', CAST(N'2023-08-30T22:03:28.5400000' AS DateTime2), NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Username], [Password], [Discriminator], [DeletedAt], [Degree], [Phone], [CV], [PersonalWebsite], [LinkedInProfile], [Company], [Adress], [City], [Country], [Description], [CreatedAt], [UpdatedAt]) VALUES (8, N'John', N'Doe', N'candidate@gmail.com', N'candidate123', N'$2a$11$uUc5SJQXM8eYXPYy5/6/Ku0dR1H2rx3LCdySpcCYay.q3tEUtOvYa', N'Candidate', NULL, N'Bachelor of Science', N'555-123-456', N'Link to CV', N'johndoe.com', N'linkedin.com/in/johndoe', NULL, NULL, NULL, NULL, NULL, CAST(N'2023-08-30T22:03:28.5500000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 3)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 7)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 9)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 10)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 12)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 25)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 27)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 30)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 31)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 35)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 36)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (7, 3)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (7, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (7, 6)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (7, 7)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (7, 10)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (7, 11)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (7, 13)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (7, 14)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (7, 15)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (7, 21)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (7, 31)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (7, 35)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (7, 36)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (8, 2)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (8, 3)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (8, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (8, 7)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (8, 10)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (8, 11)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (8, 22)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (8, 31)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (8, 35)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (8, 36)
GO
/****** Object:  Index [IX_AuditLogs_ExecutionDateTime]    Script Date: 8/30/2023 10:11:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_AuditLogs_ExecutionDateTime] ON [dbo].[AuditLogs]
(
	[ExecutionDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AuditLogs_Identity]    Script Date: 8/30/2023 10:11:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_AuditLogs_Identity] ON [dbo].[AuditLogs]
(
	[Identity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AuditLogs_UseCaseName]    Script Date: 8/30/2023 10:11:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_AuditLogs_UseCaseName] ON [dbo].[AuditLogs]
(
	[UseCaseName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AuditLogs_UserId]    Script Date: 8/30/2023 10:11:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_AuditLogs_UserId] ON [dbo].[AuditLogs]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Categories_Name]    Script Date: 8/30/2023 10:11:32 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Categories_Name] ON [dbo].[Categories]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Categories_ParentId]    Script Date: 8/30/2023 10:11:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_Categories_ParentId] ON [dbo].[Categories]
(
	[ParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Experiences_Name]    Script Date: 8/30/2023 10:11:32 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Experiences_Name] ON [dbo].[Experiences]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_JobAds_JobId]    Script Date: 8/30/2023 10:11:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_JobAds_JobId] ON [dbo].[JobAds]
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_JobAds_JobTypeId]    Script Date: 8/30/2023 10:11:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_JobAds_JobTypeId] ON [dbo].[JobAds]
(
	[JobTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_JobAds_SalaryTypeId]    Script Date: 8/30/2023 10:11:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_JobAds_SalaryTypeId] ON [dbo].[JobAds]
(
	[SalaryTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_JobApplications_CandidateId]    Script Date: 8/30/2023 10:11:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_JobApplications_CandidateId] ON [dbo].[JobApplications]
(
	[CandidateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Jobs_CategoryId]    Script Date: 8/30/2023 10:11:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_Jobs_CategoryId] ON [dbo].[Jobs]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Jobs_EmployerId]    Script Date: 8/30/2023 10:11:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_Jobs_EmployerId] ON [dbo].[Jobs]
(
	[EmployerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Jobs_ExperienceId]    Script Date: 8/30/2023 10:11:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_Jobs_ExperienceId] ON [dbo].[Jobs]
(
	[ExperienceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_JobSkills_SkillId]    Script Date: 8/30/2023 10:11:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_JobSkills_SkillId] ON [dbo].[JobSkills]
(
	[SkillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_JobTypes_Name]    Script Date: 8/30/2023 10:11:32 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_JobTypes_Name] ON [dbo].[JobTypes]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SalaryTypes_Name]    Script Date: 8/30/2023 10:11:32 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_SalaryTypes_Name] ON [dbo].[SalaryTypes]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Skills_Name]    Script Date: 8/30/2023 10:11:32 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Skills_Name] ON [dbo].[Skills]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 8/30/2023 10:11:32 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Username]    Script Date: 8/30/2023 10:11:32 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Username] ON [dbo].[Users]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Experiences] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[JobAds] ADD  DEFAULT (dateadd(day,(30),getdate())) FOR [EndAt]
GO
ALTER TABLE [dbo].[JobAds] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[JobApplications] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Jobs] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[JobTypes] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[SalaryTypes] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Skills] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Categories_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Categories_ParentId]
GO
ALTER TABLE [dbo].[JobAds]  WITH CHECK ADD  CONSTRAINT [FK_JobAds_Jobs_JobId] FOREIGN KEY([JobId])
REFERENCES [dbo].[Jobs] ([Id])
GO
ALTER TABLE [dbo].[JobAds] CHECK CONSTRAINT [FK_JobAds_Jobs_JobId]
GO
ALTER TABLE [dbo].[JobAds]  WITH CHECK ADD  CONSTRAINT [FK_JobAds_JobTypes_JobTypeId] FOREIGN KEY([JobTypeId])
REFERENCES [dbo].[JobTypes] ([Id])
GO
ALTER TABLE [dbo].[JobAds] CHECK CONSTRAINT [FK_JobAds_JobTypes_JobTypeId]
GO
ALTER TABLE [dbo].[JobAds]  WITH CHECK ADD  CONSTRAINT [FK_JobAds_SalaryTypes_SalaryTypeId] FOREIGN KEY([SalaryTypeId])
REFERENCES [dbo].[SalaryTypes] ([Id])
GO
ALTER TABLE [dbo].[JobAds] CHECK CONSTRAINT [FK_JobAds_SalaryTypes_SalaryTypeId]
GO
ALTER TABLE [dbo].[JobApplications]  WITH CHECK ADD  CONSTRAINT [FK_JobApplications_JobAds_JobAdId] FOREIGN KEY([JobAdId])
REFERENCES [dbo].[JobAds] ([Id])
GO
ALTER TABLE [dbo].[JobApplications] CHECK CONSTRAINT [FK_JobApplications_JobAds_JobAdId]
GO
ALTER TABLE [dbo].[JobApplications]  WITH CHECK ADD  CONSTRAINT [FK_JobApplications_Users_CandidateId] FOREIGN KEY([CandidateId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[JobApplications] CHECK CONSTRAINT [FK_JobApplications_Users_CandidateId]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Experiences_ExperienceId] FOREIGN KEY([ExperienceId])
REFERENCES [dbo].[Experiences] ([Id])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Experiences_ExperienceId]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Users_EmployerId] FOREIGN KEY([EmployerId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Users_EmployerId]
GO
ALTER TABLE [dbo].[JobSkills]  WITH CHECK ADD  CONSTRAINT [FK_JobSkills_JobAds_JobAdId] FOREIGN KEY([JobAdId])
REFERENCES [dbo].[JobAds] ([Id])
GO
ALTER TABLE [dbo].[JobSkills] CHECK CONSTRAINT [FK_JobSkills_JobAds_JobAdId]
GO
ALTER TABLE [dbo].[JobSkills]  WITH CHECK ADD  CONSTRAINT [FK_JobSkills_Skills_SkillId] FOREIGN KEY([SkillId])
REFERENCES [dbo].[Skills] ([Id])
GO
ALTER TABLE [dbo].[JobSkills] CHECK CONSTRAINT [FK_JobSkills_Skills_SkillId]
GO
ALTER TABLE [dbo].[UserUseCases]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCases_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserUseCases] CHECK CONSTRAINT [FK_UserUseCases_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [JobFinder] SET  READ_WRITE 
GO
