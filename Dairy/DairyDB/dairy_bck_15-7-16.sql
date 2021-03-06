USE [master]
GO
/****** Object:  Database [TeamedDB]    Script Date: 7/15/2016 11:40:09 PM ******/
CREATE DATABASE [TeamedDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TeamedDB_Data', FILENAME = N'c:\dzsqls\TeamedDB.mdf' , SIZE = 3136KB , MAXSIZE = 15360KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TeamedDB_Logs', FILENAME = N'c:\dzsqls\TeamedDB.ldf' , SIZE = 1024KB , MAXSIZE = 20480KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TeamedDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TeamedDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TeamedDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TeamedDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TeamedDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TeamedDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TeamedDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TeamedDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TeamedDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TeamedDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TeamedDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TeamedDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TeamedDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TeamedDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TeamedDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TeamedDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TeamedDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TeamedDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TeamedDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TeamedDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TeamedDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TeamedDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TeamedDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TeamedDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TeamedDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TeamedDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TeamedDB] SET  MULTI_USER 
GO
ALTER DATABASE [TeamedDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TeamedDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TeamedDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TeamedDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [TeamedDB]
GO
/****** Object:  User [teamed_sql]    Script Date: 7/15/2016 11:40:16 PM ******/
CREATE USER [teamed_sql] FOR LOGIN [teamed_sql] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [teamed_sql]
GO
/****** Object:  Schema [teamed_sql]    Script Date: 7/15/2016 11:40:20 PM ******/
CREATE SCHEMA [teamed_sql]
GO
/****** Object:  Table [dbo].[ItemMaster]    Script Date: 7/15/2016 11:40:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemMaster](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Discription] [nvarchar](max) NULL,
	[UnitId] [int] NULL,
	[IsDelete] [bit] NULL,
	[DOC] [datetime] NULL,
 CONSTRAINT [PK_ItemMaster] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderCancelMaster]    Script Date: 7/15/2016 11:40:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderCancelMaster](
	[OrderCancelId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[ItemId] [int] NULL,
	[Quantity] [int] NULL,
	[TransType] [nvarchar](20) NULL,
	[Status] [int] NULL,
	[ForDate] [datetime] NULL,
	[DOC] [datetime] NULL,
	[IsDelete] [bit] NULL,
 CONSTRAINT [PK_OrderCancelMaster] PRIMARY KEY CLUSTERED 
(
	[OrderCancelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permission]    Script Date: 7/15/2016 11:40:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[PermissionId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PermissionType]    Script Date: 7/15/2016 11:40:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermissionType](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_PermissionType] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PriceMaster]    Script Date: 7/15/2016 11:40:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceMaster](
	[PriceId] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[Date] [datetime] NULL,
	[IsDelete] [bit] NULL,
 CONSTRAINT [PK_PriceMaster] PRIMARY KEY CLUSTERED 
(
	[PriceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoleMaster]    Script Date: 7/15/2016 11:40:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoleMaster](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](30) NULL,
	[IsDelete] [bit] NULL,
	[DOC] [datetime] NULL,
 CONSTRAINT [PK_RoleMaster] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoleRuleRelation]    Script Date: 7/15/2016 11:40:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleRuleRelation](
	[RoleRuleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NULL,
	[RuleId] [int] NULL,
	[IsDelete] [bit] NULL,
 CONSTRAINT [PK_RoleRuleRelation] PRIMARY KEY CLUSTERED 
(
	[RoleRuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RuleMaster]    Script Date: 7/15/2016 11:40:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RuleMaster](
	[RuleId] [int] IDENTITY(1,1) NOT NULL,
	[TypeId] [int] NULL,
	[PermissionId] [int] NULL,
	[IsDelete] [bit] NULL,
	[DOC] [datetime] NULL,
 CONSTRAINT [PK_RuleMaster] PRIMARY KEY CLUSTERED 
(
	[RuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SaleDtlMaster]    Script Date: 7/15/2016 11:40:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleDtlMaster](
	[SaleDtlID] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NULL,
	[Quantity] [int] NULL,
	[Remark] [nvarchar](max) NULL,
	[SaleId] [int] NULL,
	[IsDelete] [bit] NULL,
	[DOC] [datetime] NULL,
 CONSTRAINT [PK_SaleDtlMaster] PRIMARY KEY CLUSTERED 
(
	[SaleDtlID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SaleMaster]    Script Date: 7/15/2016 11:40:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleMaster](
	[SaleId] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[CustId] [int] NULL,
	[UserId] [int] NULL,
	[Amount] [decimal](18, 5) NULL,
	[IsDelete] [bit] NULL,
	[DOC] [datetime] NULL,
 CONSTRAINT [PK_SaleMaster] PRIMARY KEY CLUSTERED 
(
	[SaleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShopMaster]    Script Date: 7/15/2016 11:40:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopMaster](
	[ShopId] [int] IDENTITY(1,1) NOT NULL,
	[ShopName] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[IsDelete] [bit] NULL,
	[DOC] [datetime] NULL,
 CONSTRAINT [PK_ShopMaster] PRIMARY KEY CLUSTERED 
(
	[ShopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StatusMaster]    Script Date: 7/15/2016 11:40:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusMaster](
	[StatusMasterId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_StatusMaster] PRIMARY KEY CLUSTERED 
(
	[StatusMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Transection]    Script Date: 7/15/2016 11:40:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transection](
	[TransId] [int] IDENTITY(1,1) NOT NULL,
	[CustomUniqueId] [nvarchar](max) NULL,
	[ResponceUniqueId] [nvarchar](max) NULL,
	[Date] [datetime] NULL,
	[UserId] [int] NULL,
	[TransType] [nchar](10) NULL,
	[Amount] [decimal](18, 5) NULL,
	[Remark] [nvarchar](max) NULL,
	[TransectionId] [nvarchar](50) NULL,
	[SaleId] [int] NULL,
 CONSTRAINT [PK_Transection] PRIMARY KEY CLUSTERED 
(
	[TransId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UnitMaster]    Script Date: 7/15/2016 11:40:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitMaster](
	[UnitId] [int] IDENTITY(1,1) NOT NULL,
	[UnitName] [nvarchar](50) NULL,
 CONSTRAINT [PK_UnitMaster] PRIMARY KEY CLUSTERED 
(
	[UnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserItem]    Script Date: 7/15/2016 11:40:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserItem](
	[UserItemId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[ItemId] [int] NULL,
	[Quantity] [int] NULL,
	[Scheduled] [nvarchar](max) NULL,
	[IsDelete] [bit] NULL,
	[DOC] [datetime] NULL,
 CONSTRAINT [PK_UserItem] PRIMARY KEY CLUSTERED 
(
	[UserItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserMaster]    Script Date: 7/15/2016 11:40:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserMaster](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Address] [varchar](max) NULL,
	[MobileNo] [nchar](10) NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[RoleId] [int] NULL,
	[ShopId] [int] NULL,
	[ActiveBalance] [decimal](18, 5) NULL,
	[IsDelete] [bit] NULL,
	[DOC] [datetime] NULL,
 CONSTRAINT [PK_UserMaster] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ItemMaster] ON 

INSERT [dbo].[ItemMaster] ([ItemId], [Name], [Discription], [UnitId], [IsDelete], [DOC]) VALUES (1, N'Amul milk', N'Amol milk jhsdfj', 1, 0, CAST(0x0000A5F20002C18D AS DateTime))
INSERT [dbo].[ItemMaster] ([ItemId], [Name], [Discription], [UnitId], [IsDelete], [DOC]) VALUES (2, N'Milk B', N'Bafelow Milk', 1, 0, CAST(0x0000A63801657E09 AS DateTime))
INSERT [dbo].[ItemMaster] ([ItemId], [Name], [Discription], [UnitId], [IsDelete], [DOC]) VALUES (3, N'Milk C', N'Caw Nilk', 1, 0, CAST(0x0000A6380165A33A AS DateTime))
INSERT [dbo].[ItemMaster] ([ItemId], [Name], [Discription], [UnitId], [IsDelete], [DOC]) VALUES (4, N'Taak', N'Butter Milk', 1, 0, CAST(0x0000A6380165C368 AS DateTime))
INSERT [dbo].[ItemMaster] ([ItemId], [Name], [Discription], [UnitId], [IsDelete], [DOC]) VALUES (5, N'Loni', N'Loni', 2, 0, CAST(0x0000A63801666467 AS DateTime))
INSERT [dbo].[ItemMaster] ([ItemId], [Name], [Discription], [UnitId], [IsDelete], [DOC]) VALUES (6, N'Tup', N'Tupe', 2, 0, CAST(0x0000A63801669F2B AS DateTime))
INSERT [dbo].[ItemMaster] ([ItemId], [Name], [Discription], [UnitId], [IsDelete], [DOC]) VALUES (7, N'', N'', 1, 0, CAST(0x0000A64400D65B79 AS DateTime))
INSERT [dbo].[ItemMaster] ([ItemId], [Name], [Discription], [UnitId], [IsDelete], [DOC]) VALUES (8, N'', N'', 2, 0, CAST(0x0000A64400D6798E AS DateTime))
SET IDENTITY_INSERT [dbo].[ItemMaster] OFF
SET IDENTITY_INSERT [dbo].[OrderCancelMaster] ON 

INSERT [dbo].[OrderCancelMaster] ([OrderCancelId], [UserId], [ItemId], [Quantity], [TransType], [Status], [ForDate], [DOC], [IsDelete]) VALUES (1, 1, 1, 1, N'Order', 1, NULL, NULL, NULL)
INSERT [dbo].[OrderCancelMaster] ([OrderCancelId], [UserId], [ItemId], [Quantity], [TransType], [Status], [ForDate], [DOC], [IsDelete]) VALUES (3, 1, 1, 2, N'Order', 1, CAST(0x0000A5FB00000000 AS DateTime), CAST(0x0000A6140062D0EF AS DateTime), 0)
INSERT [dbo].[OrderCancelMaster] ([OrderCancelId], [UserId], [ItemId], [Quantity], [TransType], [Status], [ForDate], [DOC], [IsDelete]) VALUES (4, 1, 1, 2, N'Order', 1, CAST(0x0000A5FB00000000 AS DateTime), CAST(0x0000A614006349E9 AS DateTime), 0)
INSERT [dbo].[OrderCancelMaster] ([OrderCancelId], [UserId], [ItemId], [Quantity], [TransType], [Status], [ForDate], [DOC], [IsDelete]) VALUES (6, 1, 1, 2, N'Cancel', 1, CAST(0x0000A5FB00000000 AS DateTime), CAST(0x0000A61400815D57 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[OrderCancelMaster] OFF
SET IDENTITY_INSERT [dbo].[Permission] ON 

INSERT [dbo].[Permission] ([PermissionId], [Name]) VALUES (1, N'Insert')
INSERT [dbo].[Permission] ([PermissionId], [Name]) VALUES (2, N'Delete')
INSERT [dbo].[Permission] ([PermissionId], [Name]) VALUES (3, N'View')
INSERT [dbo].[Permission] ([PermissionId], [Name]) VALUES (4, N'Update')
SET IDENTITY_INSERT [dbo].[Permission] OFF
SET IDENTITY_INSERT [dbo].[PermissionType] ON 

INSERT [dbo].[PermissionType] ([TypeId], [TypeName]) VALUES (1, N'Cutomer')
INSERT [dbo].[PermissionType] ([TypeId], [TypeName]) VALUES (2, N'Order')
SET IDENTITY_INSERT [dbo].[PermissionType] OFF
SET IDENTITY_INSERT [dbo].[PriceMaster] ON 

INSERT [dbo].[PriceMaster] ([PriceId], [ItemId], [Price], [Date], [IsDelete]) VALUES (1, 1, CAST(20 AS Decimal(18, 0)), CAST(0x0000A60F007C6476 AS DateTime), 0)
INSERT [dbo].[PriceMaster] ([PriceId], [ItemId], [Price], [Date], [IsDelete]) VALUES (2, 1, CAST(10 AS Decimal(18, 0)), CAST(0x0000A60F007CA31B AS DateTime), 0)
INSERT [dbo].[PriceMaster] ([PriceId], [ItemId], [Price], [Date], [IsDelete]) VALUES (3, 1, CAST(50 AS Decimal(18, 0)), CAST(0x0000A60F0188259D AS DateTime), 0)
INSERT [dbo].[PriceMaster] ([PriceId], [ItemId], [Price], [Date], [IsDelete]) VALUES (4, 1, CAST(100 AS Decimal(18, 0)), CAST(0x0000A615002DB420 AS DateTime), 0)
INSERT [dbo].[PriceMaster] ([PriceId], [ItemId], [Price], [Date], [IsDelete]) VALUES (6, 1, CAST(0 AS Decimal(18, 0)), CAST(0x0000A615002F2337 AS DateTime), 0)
INSERT [dbo].[PriceMaster] ([PriceId], [ItemId], [Price], [Date], [IsDelete]) VALUES (7, 1, CAST(110 AS Decimal(18, 0)), CAST(0x0000A6150033055E AS DateTime), 0)
INSERT [dbo].[PriceMaster] ([PriceId], [ItemId], [Price], [Date], [IsDelete]) VALUES (8, 1, CAST(100 AS Decimal(18, 0)), CAST(0x0000A615005DAA69 AS DateTime), 0)
INSERT [dbo].[PriceMaster] ([PriceId], [ItemId], [Price], [Date], [IsDelete]) VALUES (9, 2, CAST(46 AS Decimal(18, 0)), CAST(0x0000A6380169742A AS DateTime), 0)
INSERT [dbo].[PriceMaster] ([PriceId], [ItemId], [Price], [Date], [IsDelete]) VALUES (10, 3, CAST(40 AS Decimal(18, 0)), CAST(0x0000A6380169924A AS DateTime), 0)
INSERT [dbo].[PriceMaster] ([PriceId], [ItemId], [Price], [Date], [IsDelete]) VALUES (11, 4, CAST(30 AS Decimal(18, 0)), CAST(0x0000A6380169D078 AS DateTime), 0)
INSERT [dbo].[PriceMaster] ([PriceId], [ItemId], [Price], [Date], [IsDelete]) VALUES (12, 5, CAST(380 AS Decimal(18, 0)), CAST(0x0000A6380169E57B AS DateTime), 0)
INSERT [dbo].[PriceMaster] ([PriceId], [ItemId], [Price], [Date], [IsDelete]) VALUES (13, 6, CAST(500 AS Decimal(18, 0)), CAST(0x0000A638016A13ED AS DateTime), 0)
INSERT [dbo].[PriceMaster] ([PriceId], [ItemId], [Price], [Date], [IsDelete]) VALUES (14, 4, CAST(21 AS Decimal(18, 0)), CAST(0x0000A638016BA7FF AS DateTime), 0)
INSERT [dbo].[PriceMaster] ([PriceId], [ItemId], [Price], [Date], [IsDelete]) VALUES (15, 4, CAST(21 AS Decimal(18, 0)), CAST(0x0000A638016BAAF7 AS DateTime), 0)
INSERT [dbo].[PriceMaster] ([PriceId], [ItemId], [Price], [Date], [IsDelete]) VALUES (16, 4, CAST(21 AS Decimal(18, 0)), CAST(0x0000A638016BAB40 AS DateTime), 0)
INSERT [dbo].[PriceMaster] ([PriceId], [ItemId], [Price], [Date], [IsDelete]) VALUES (17, 4, CAST(21 AS Decimal(18, 0)), CAST(0x0000A638016BABD6 AS DateTime), 0)
INSERT [dbo].[PriceMaster] ([PriceId], [ItemId], [Price], [Date], [IsDelete]) VALUES (18, 4, CAST(21 AS Decimal(18, 0)), CAST(0x0000A638016BAC95 AS DateTime), 0)
INSERT [dbo].[PriceMaster] ([PriceId], [ItemId], [Price], [Date], [IsDelete]) VALUES (19, 4, CAST(21 AS Decimal(18, 0)), CAST(0x0000A638016BBC79 AS DateTime), 0)
INSERT [dbo].[PriceMaster] ([PriceId], [ItemId], [Price], [Date], [IsDelete]) VALUES (20, 4, CAST(21 AS Decimal(18, 0)), CAST(0x0000A638016BC926 AS DateTime), 0)
INSERT [dbo].[PriceMaster] ([PriceId], [ItemId], [Price], [Date], [IsDelete]) VALUES (21, 1, CAST(99 AS Decimal(18, 0)), CAST(0x0000A63900D23474 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[PriceMaster] OFF
SET IDENTITY_INSERT [dbo].[RoleMaster] ON 

INSERT [dbo].[RoleMaster] ([RoleId], [RoleName], [IsDelete], [DOC]) VALUES (1, N'Admin', 0, CAST(0x0000A5F20003AF03 AS DateTime))
INSERT [dbo].[RoleMaster] ([RoleId], [RoleName], [IsDelete], [DOC]) VALUES (2, N'Cutomer', 0, CAST(0x0000A5F20003B609 AS DateTime))
INSERT [dbo].[RoleMaster] ([RoleId], [RoleName], [IsDelete], [DOC]) VALUES (3, N'Employee', 0, CAST(0x0000A5F20003B94F AS DateTime))
SET IDENTITY_INSERT [dbo].[RoleMaster] OFF
SET IDENTITY_INSERT [dbo].[RoleRuleRelation] ON 

INSERT [dbo].[RoleRuleRelation] ([RoleRuleId], [RoleId], [RuleId], [IsDelete]) VALUES (1, 1, 1, 0)
INSERT [dbo].[RoleRuleRelation] ([RoleRuleId], [RoleId], [RuleId], [IsDelete]) VALUES (2, 1, 2, 0)
INSERT [dbo].[RoleRuleRelation] ([RoleRuleId], [RoleId], [RuleId], [IsDelete]) VALUES (3, 1, 3, 0)
INSERT [dbo].[RoleRuleRelation] ([RoleRuleId], [RoleId], [RuleId], [IsDelete]) VALUES (4, 1, 4, 0)
INSERT [dbo].[RoleRuleRelation] ([RoleRuleId], [RoleId], [RuleId], [IsDelete]) VALUES (5, 2, 3, 0)
INSERT [dbo].[RoleRuleRelation] ([RoleRuleId], [RoleId], [RuleId], [IsDelete]) VALUES (6, 2, 4, 0)
SET IDENTITY_INSERT [dbo].[RoleRuleRelation] OFF
SET IDENTITY_INSERT [dbo].[RuleMaster] ON 

INSERT [dbo].[RuleMaster] ([RuleId], [TypeId], [PermissionId], [IsDelete], [DOC]) VALUES (1, 1, 1, 0, NULL)
INSERT [dbo].[RuleMaster] ([RuleId], [TypeId], [PermissionId], [IsDelete], [DOC]) VALUES (2, 1, 2, 0, NULL)
INSERT [dbo].[RuleMaster] ([RuleId], [TypeId], [PermissionId], [IsDelete], [DOC]) VALUES (3, 2, 3, 0, NULL)
INSERT [dbo].[RuleMaster] ([RuleId], [TypeId], [PermissionId], [IsDelete], [DOC]) VALUES (4, 2, 4, 0, NULL)
SET IDENTITY_INSERT [dbo].[RuleMaster] OFF
SET IDENTITY_INSERT [dbo].[SaleDtlMaster] ON 

INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (1, 1, 3, NULL, 1, 0, NULL)
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (2, 1, 2, NULL, 1, 0, NULL)
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (5, 1, 2, NULL, 1, 0, NULL)
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (6, 1, 2, N'test', 5, 0, NULL)
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (8, 1, 2, N'', 7, 0, NULL)
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (9, 1, 2, N'', 8, 0, NULL)
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (10, 1, 2, N'', 8, 0, NULL)
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (11, 1, 100, N'remark', 9, 0, CAST(0x0000A61500AAF75F AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (12, 1, 100, N'remark', 10, 0, CAST(0x0000A61500AAF937 AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (13, 1, 100, N'remark', 11, 0, CAST(0x0000A61500AAFA96 AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (14, 1, 100, N'remark', 12, 0, CAST(0x0000A61500AAFAC9 AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (15, 1, 10, N'remark', 13, 0, CAST(0x0000A61500AB89B6 AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (16, 1, 23, N'remark', 14, 0, CAST(0x0000A616015F7852 AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (17, 1, 20, N'remark', 14, 0, CAST(0x0000A616015F7852 AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (18, 1, 15, N'remark', 14, 0, CAST(0x0000A616015F7852 AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (19, 1, 2, N'remark', 15, 0, CAST(0x0000A6160166BB2B AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (20, 1, 1, N'remark', 15, 0, CAST(0x0000A6160166BB2C AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (21, 1, 2, N'remark', 16, 0, CAST(0x0000A6160166BEFF AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (22, 1, 1, N'remark', 16, 0, CAST(0x0000A6160166BEFF AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (23, 1, 2, N'remark', 17, 0, CAST(0x0000A6160166C2EF AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (24, 1, 1, N'remark', 17, 0, CAST(0x0000A6160166C2EF AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (25, 1, 2, N'remark', 18, 0, CAST(0x0000A6160166C7C8 AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (26, 1, 1, N'remark', 18, 0, CAST(0x0000A6160166C7C8 AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (27, 1, 123, N'remark', 19, 0, CAST(0x0000A61601670445 AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (28, 1, 2, N'remark', 19, 0, CAST(0x0000A61601670445 AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (29, 1, 25, N'remark', 20, 0, CAST(0x0000A61601680304 AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (30, 1, 20, N'remark', 20, 0, CAST(0x0000A61601680304 AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (31, 1, 25, N'remark', 21, 0, CAST(0x0000A616016808EE AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (32, 1, 20, N'remark', 21, 0, CAST(0x0000A616016808EE AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (33, 1, 2, N'remark', 22, 0, CAST(0x0000A6160182D14A AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (34, 1, 3, N'remark', 23, 0, CAST(0x0000A6170069016C AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (35, 1, 2, N'remark', 23, 0, CAST(0x0000A6170069016C AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (36, 1, 2, N'remark', 24, 0, CAST(0x0000A61900C44CE3 AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (37, 1, 2, N'remark', 25, 0, CAST(0x0000A61900C44F26 AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (38, 1, 10, N'remark', 26, 0, CAST(0x0000A6220184AC0D AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (39, 1, 2, N'remark', 26, 0, CAST(0x0000A6220184AC0D AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (40, 1, 2, N'remark', 33, 0, CAST(0x0000A63800DA84B5 AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (41, 4, 2, N'remark', 34, 0, CAST(0x0000A638016AA734 AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (42, 1, 2, N'remark', 34, 0, CAST(0x0000A638016AA734 AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (43, 5, 1, N'remark', 35, 0, CAST(0x0000A638016AFB72 AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (44, 5, 1, N'remark', 36, 0, CAST(0x0000A638016B082C AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (45, 1, 2, N'remark', 37, 0, CAST(0x0000A63900DD10EE AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (46, 3, 4, N'remark', 37, 0, CAST(0x0000A63900DD10EE AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (47, 5, 9, N'remark', 37, 0, CAST(0x0000A63900DD10EE AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (48, 4, 52, N'remark', 37, 0, CAST(0x0000A63900DD10EE AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (49, 1, 5, N'remark', 37, 0, CAST(0x0000A63900DD10EF AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (50, 2, 2, N'remark', 37, 0, CAST(0x0000A63900DD10EF AS DateTime))
INSERT [dbo].[SaleDtlMaster] ([SaleDtlID], [ItemId], [Quantity], [Remark], [SaleId], [IsDelete], [DOC]) VALUES (51, 1, 2, N'remark', 37, 0, CAST(0x0000A63900DD10EF AS DateTime))
SET IDENTITY_INSERT [dbo].[SaleDtlMaster] OFF
SET IDENTITY_INSERT [dbo].[SaleMaster] ON 

INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (1, CAST(0x0000A5F20004CBCE AS DateTime), 1, 1, CAST(100.00000 AS Decimal(18, 5)), 0, NULL)
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (2, CAST(0x0000A5F40082D961 AS DateTime), 1, 1, CAST(2000.00000 AS Decimal(18, 5)), 0, NULL)
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (4, CAST(0x0000A5FB007217CF AS DateTime), 1, 1, CAST(2000.00000 AS Decimal(18, 5)), 0, NULL)
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (5, CAST(0x0000A5FB0073ABC6 AS DateTime), 1, 1, CAST(2000.00000 AS Decimal(18, 5)), 0, NULL)
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (7, CAST(0x0000A5FB007AFB39 AS DateTime), 1, 1, CAST(2000.00000 AS Decimal(18, 5)), 0, NULL)
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (8, CAST(0x0000A5FB007C448A AS DateTime), 1, 1, CAST(2000.00000 AS Decimal(18, 5)), 0, NULL)
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (9, CAST(0x0000A61500AAF75D AS DateTime), 0, 1, CAST(10000.00000 AS Decimal(18, 5)), 0, CAST(0x0000A61500AAF75D AS DateTime))
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (10, CAST(0x0000A61500AAF937 AS DateTime), 0, 1, CAST(10000.00000 AS Decimal(18, 5)), 0, CAST(0x0000A61500AAF937 AS DateTime))
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (11, CAST(0x0000A61500AAFA96 AS DateTime), 0, 1, CAST(10000.00000 AS Decimal(18, 5)), 0, CAST(0x0000A61500AAFA96 AS DateTime))
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (12, CAST(0x0000A61500AAFAC8 AS DateTime), 0, 1, CAST(10000.00000 AS Decimal(18, 5)), 0, CAST(0x0000A61500AAFAC8 AS DateTime))
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (13, CAST(0x0000A61500AB89B6 AS DateTime), 0, 1, CAST(1000.00000 AS Decimal(18, 5)), 0, CAST(0x0000A61500AB89B6 AS DateTime))
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (14, CAST(0x0000A616015F7843 AS DateTime), 0, 1, CAST(5800.00000 AS Decimal(18, 5)), 0, CAST(0x0000A616015F7843 AS DateTime))
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (15, CAST(0x0000A6160166BB29 AS DateTime), 2, 3, CAST(300.00000 AS Decimal(18, 5)), 0, CAST(0x0000A6160166BB29 AS DateTime))
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (16, CAST(0x0000A6160166BEFF AS DateTime), 2, 3, CAST(300.00000 AS Decimal(18, 5)), 0, CAST(0x0000A6160166BEFF AS DateTime))
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (17, CAST(0x0000A6160166C2EF AS DateTime), 2, 3, CAST(300.00000 AS Decimal(18, 5)), 0, CAST(0x0000A6160166C2EF AS DateTime))
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (18, CAST(0x0000A6160166C7C8 AS DateTime), 2, 3, CAST(300.00000 AS Decimal(18, 5)), 0, CAST(0x0000A6160166C7C8 AS DateTime))
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (19, CAST(0x0000A61601670444 AS DateTime), 1, 3, CAST(12500.00000 AS Decimal(18, 5)), 0, CAST(0x0000A61601670444 AS DateTime))
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (20, CAST(0x0000A61601680303 AS DateTime), 16, 3, CAST(4500.00000 AS Decimal(18, 5)), 0, CAST(0x0000A61601680303 AS DateTime))
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (21, CAST(0x0000A616016808EE AS DateTime), 16, 3, CAST(4500.00000 AS Decimal(18, 5)), 0, CAST(0x0000A616016808EE AS DateTime))
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (22, CAST(0x0000A6160182D148 AS DateTime), 1, 3, CAST(200.00000 AS Decimal(18, 5)), 0, CAST(0x0000A6160182D148 AS DateTime))
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (23, CAST(0x0000A6170069016A AS DateTime), 2, 3, CAST(500.00000 AS Decimal(18, 5)), 0, CAST(0x0000A6170069016A AS DateTime))
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (24, CAST(0x0000A61900C44CDB AS DateTime), 4, 3, CAST(200.00000 AS Decimal(18, 5)), 0, CAST(0x0000A61900C44CDB AS DateTime))
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (25, CAST(0x0000A61900C44F26 AS DateTime), 4, 3, CAST(200.00000 AS Decimal(18, 5)), 0, CAST(0x0000A61900C44F26 AS DateTime))
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (26, CAST(0x0000A6220184AC05 AS DateTime), 1, 3, CAST(1200.00000 AS Decimal(18, 5)), 0, CAST(0x0000A6220184AC05 AS DateTime))
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (27, CAST(0x0000A63700D849C3 AS DateTime), 1, 3, CAST(100.00000 AS Decimal(18, 5)), 0, CAST(0x0000A63700D849C3 AS DateTime))
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (28, CAST(0x0000A6380075049E AS DateTime), 1, 1, CAST(123.00000 AS Decimal(18, 5)), 0, CAST(0x0000A6380075049E AS DateTime))
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (29, CAST(0x0000A638008882C4 AS DateTime), 12, 3, CAST(12345.00000 AS Decimal(18, 5)), 0, CAST(0x0000A638008882C4 AS DateTime))
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (30, CAST(0x0000A638008E2BB2 AS DateTime), 12, 3, CAST(12345.00000 AS Decimal(18, 5)), 0, CAST(0x0000A638008E2BB2 AS DateTime))
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (31, CAST(0x0000A638008E7D95 AS DateTime), 12, 3, CAST(12345.00000 AS Decimal(18, 5)), 0, CAST(0x0000A638008E7D95 AS DateTime))
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (32, CAST(0x0000A638009120FD AS DateTime), 12, 3, CAST(12345.00000 AS Decimal(18, 5)), 0, CAST(0x0000A638009120FD AS DateTime))
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (33, CAST(0x0000A63800DA84B2 AS DateTime), 1, 3, CAST(200.00000 AS Decimal(18, 5)), 0, CAST(0x0000A63800DA84B2 AS DateTime))
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (34, CAST(0x0000A638016AA733 AS DateTime), 1, 3, CAST(260.00000 AS Decimal(18, 5)), 0, CAST(0x0000A638016AA733 AS DateTime))
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (35, CAST(0x0000A638016AFB72 AS DateTime), 19, 3, CAST(380.00000 AS Decimal(18, 5)), 0, CAST(0x0000A638016AFB72 AS DateTime))
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (36, CAST(0x0000A638016B082C AS DateTime), 19, 3, CAST(380.00000 AS Decimal(18, 5)), 0, CAST(0x0000A638016B082C AS DateTime))
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (37, CAST(0x0000A63900DD10ED AS DateTime), 1, 3, CAST(5655.00000 AS Decimal(18, 5)), 0, CAST(0x0000A63900DD10ED AS DateTime))
SET IDENTITY_INSERT [dbo].[SaleMaster] OFF
SET IDENTITY_INSERT [dbo].[ShopMaster] ON 

INSERT [dbo].[ShopMaster] ([ShopId], [ShopName], [Address], [IsDelete], [DOC]) VALUES (1, N'Sahilu Shop', N'Amrawati', 0, CAST(0x0000A5F2000267C3 AS DateTime))
INSERT [dbo].[ShopMaster] ([ShopId], [ShopName], [Address], [IsDelete], [DOC]) VALUES (2, N'Naga Shop', N'Ankoli', 0, CAST(0x0000A5F200027D10 AS DateTime))
INSERT [dbo].[ShopMaster] ([ShopId], [ShopName], [Address], [IsDelete], [DOC]) VALUES (3, N'SushantShop', N'Barshi', 0, CAST(0x0000A60E009D7508 AS DateTime))
INSERT [dbo].[ShopMaster] ([ShopId], [ShopName], [Address], [IsDelete], [DOC]) VALUES (4, N'test', N'test', 0, CAST(0x0000A616000A8928 AS DateTime))
INSERT [dbo].[ShopMaster] ([ShopId], [ShopName], [Address], [IsDelete], [DOC]) VALUES (5, N'abhinav2', N'thergaon', 0, CAST(0x0000A616009335A5 AS DateTime))
INSERT [dbo].[ShopMaster] ([ShopId], [ShopName], [Address], [IsDelete], [DOC]) VALUES (6, N'abhinav dairy2', N'theragaon', 0, CAST(0x0000A61C0044698C AS DateTime))
INSERT [dbo].[ShopMaster] ([ShopId], [ShopName], [Address], [IsDelete], [DOC]) VALUES (7, N'abnv', N'thergaon', 0, CAST(0x0000A61C0095704E AS DateTime))
INSERT [dbo].[ShopMaster] ([ShopId], [ShopName], [Address], [IsDelete], [DOC]) VALUES (8, N'Abhinav Sangavi', N'Sangavi', 0, CAST(0x0000A63900CF7474 AS DateTime))
INSERT [dbo].[ShopMaster] ([ShopId], [ShopName], [Address], [IsDelete], [DOC]) VALUES (9, N'hinj', N'phs 1', 0, CAST(0x0000A641008AE563 AS DateTime))
SET IDENTITY_INSERT [dbo].[ShopMaster] OFF
SET IDENTITY_INSERT [dbo].[StatusMaster] ON 

INSERT [dbo].[StatusMaster] ([StatusMasterId], [Name]) VALUES (1, N'Pending')
INSERT [dbo].[StatusMaster] ([StatusMasterId], [Name]) VALUES (2, N'Complete')
INSERT [dbo].[StatusMaster] ([StatusMasterId], [Name]) VALUES (3, N'Cancel')
SET IDENTITY_INSERT [dbo].[StatusMaster] OFF
SET IDENTITY_INSERT [dbo].[Transection] ON 

INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (1, N'sdh', N'sakjjdhjkshd', CAST(0x0000A5F200053AF6 AS DateTime), 1, N'cr        ', CAST(1000.00000 AS Decimal(18, 5)), NULL, NULL, 1)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (2, N'123123', N'234234', CAST(0x0000A5FB00763FAA AS DateTime), 1, N'Cr        ', CAST(3000.00000 AS Decimal(18, 5)), N'add', N'1231111', 5)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (4, N'1c64cbb3-5b7d-4079-9426-9539b170d28c', N'0', CAST(0x0000A5FB007B01DD AS DateTime), 1, NULL, CAST(2000.00000 AS Decimal(18, 5)), NULL, NULL, 7)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (5, N'96309858-56fc-4b3e-b5d7-e365edeeaa59', N'0', CAST(0x0000A5FB007C5043 AS DateTime), 1, N'Cr        ', CAST(1000.00000 AS Decimal(18, 5)), NULL, NULL, 8)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (6, N'3d865ffd-8f14-4b18-bfd0-8e1001bfaedb', N'0', CAST(0x0000A61500AAF761 AS DateTime), 1, N'cr        ', CAST(10000.00000 AS Decimal(18, 5)), N'', NULL, 9)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (7, N'914e7167-c955-40b0-be06-dd45fb038b0c', N'0', CAST(0x0000A61500AAF937 AS DateTime), 1, N'cr        ', CAST(10000.00000 AS Decimal(18, 5)), N'', NULL, 10)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (8, N'4c7303e8-eab3-4bc3-b701-b34890d1ed51', N'0', CAST(0x0000A61500AAFA96 AS DateTime), 1, N'cr        ', CAST(10000.00000 AS Decimal(18, 5)), N'', NULL, 11)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (9, N'8487c278-8872-44a2-bee2-026ba56b7648', N'0', CAST(0x0000A61500AAFAC9 AS DateTime), 1, N'cr        ', CAST(10000.00000 AS Decimal(18, 5)), N'', NULL, 12)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (10, N'3587a372-a730-4967-ae18-2f89d2b469b9', N'0', CAST(0x0000A61500AB89B7 AS DateTime), 1, N'cr        ', CAST(1000.00000 AS Decimal(18, 5)), N'', NULL, 13)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (11, N'22489900-2b84-4f81-8d18-61576059bd29', N'0', CAST(0x0000A616015F7854 AS DateTime), 1, N'cr        ', CAST(5800.00000 AS Decimal(18, 5)), N'', NULL, 14)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (12, N'5913c016-78b2-4892-9d9d-19d2a64ca36d', N'0', CAST(0x0000A6160166BB2E AS DateTime), 3, N'cr        ', CAST(300.00000 AS Decimal(18, 5)), N'', NULL, 15)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (13, N'a93a6326-94ec-4a68-838a-cbc45d43d70c', N'0', CAST(0x0000A6160166BEFF AS DateTime), 3, N'cr        ', CAST(300.00000 AS Decimal(18, 5)), N'', NULL, 16)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (14, N'606014b1-dc55-4a49-8c64-e9016d0fd452', N'0', CAST(0x0000A6160166C2F0 AS DateTime), 3, N'cr        ', CAST(300.00000 AS Decimal(18, 5)), N'', NULL, 17)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (15, N'74fa8fdc-d4a8-4eee-83cc-31bfd3b6eb1c', N'0', CAST(0x0000A6160166C7C9 AS DateTime), 3, N'cr        ', CAST(300.00000 AS Decimal(18, 5)), N'', NULL, 18)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (16, N'071c48ee-9984-40e1-ac97-e4d2d68d124e', N'0', CAST(0x0000A61601670445 AS DateTime), 3, N'cr        ', CAST(12500.00000 AS Decimal(18, 5)), N'', NULL, 19)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (17, N'0dcb2770-a069-4d34-838f-5652a6d64264', N'0', CAST(0x0000A61601680305 AS DateTime), 3, N'cr        ', CAST(4500.00000 AS Decimal(18, 5)), N'', NULL, 20)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (18, N'b7f6fe60-fd29-462a-8c8b-7272b7fb31b9', N'0', CAST(0x0000A616016808EE AS DateTime), 3, N'cr        ', CAST(4500.00000 AS Decimal(18, 5)), N'', NULL, 21)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (19, N'994f7525-3233-4f8f-9959-886a593b11e1', N'0', CAST(0x0000A6160182D14B AS DateTime), 3, N'cr        ', CAST(200.00000 AS Decimal(18, 5)), N'', NULL, 22)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (20, N'9262f8ab-d0e2-4432-b85f-30eb1af3dc53', N'0', CAST(0x0000A6170069016D AS DateTime), 3, N'cr        ', CAST(500.00000 AS Decimal(18, 5)), N'', NULL, 23)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (21, N'3a488d61-bde0-42a1-be50-efb893232770', N'0', CAST(0x0000A61900C44CE5 AS DateTime), 3, N'cr        ', CAST(200.00000 AS Decimal(18, 5)), N'', NULL, 24)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (22, N'fe9a0859-64ce-4e9f-a950-7ce875000e13', N'0', CAST(0x0000A61900C44F27 AS DateTime), 3, N'cr        ', CAST(200.00000 AS Decimal(18, 5)), N'', NULL, 25)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (23, N'3f872344-292a-4e05-984f-27e58558ac9c', N'0', CAST(0x0000A6220184AC0F AS DateTime), 3, N'cr        ', CAST(1200.00000 AS Decimal(18, 5)), N'', NULL, 26)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (24, NULL, NULL, CAST(0x0000A63700D849C6 AS DateTime), 3, N'Dr        ', CAST(100.00000 AS Decimal(18, 5)), N'Cash Paid', NULL, 27)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (25, NULL, NULL, CAST(0x0000A638007504A6 AS DateTime), 1, N'manual    ', CAST(123.00000 AS Decimal(18, 5)), N'Remark', NULL, 28)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (26, NULL, NULL, CAST(0x0000A638008882C5 AS DateTime), 3, N'Manual    ', CAST(12345.00000 AS Decimal(18, 5)), N'Best Remark', NULL, 29)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (27, NULL, NULL, CAST(0x0000A638008E2BB3 AS DateTime), 3, N'Manual    ', CAST(12345.00000 AS Decimal(18, 5)), N'Best Remark', NULL, 30)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (28, NULL, NULL, CAST(0x0000A638008E7D95 AS DateTime), 3, N'Manual    ', CAST(12345.00000 AS Decimal(18, 5)), N'Best Remark', NULL, 31)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (29, NULL, NULL, CAST(0x0000A638009120FD AS DateTime), 3, N'Manual    ', CAST(12345.00000 AS Decimal(18, 5)), N'Best Remark', NULL, 32)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (30, N'a0d585a7-a6d2-41a9-821f-09a5d41e2c9d', N'0', CAST(0x0000A63800DA84B7 AS DateTime), 3, N'cr        ', CAST(200.00000 AS Decimal(18, 5)), N'', NULL, 33)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (31, N'f98b84e1-da40-47e6-a4a1-0f3887265d1c', N'0', CAST(0x0000A638016AA736 AS DateTime), 3, N'cr        ', CAST(260.00000 AS Decimal(18, 5)), N'', NULL, 34)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (32, N'eac2584b-262a-4a87-b755-e11c796074be', N'0', CAST(0x0000A638016AFB72 AS DateTime), 3, N'cr        ', CAST(380.00000 AS Decimal(18, 5)), N'', NULL, 35)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (33, N'00a8b0bb-4cef-431e-a78c-404ed2200207', N'0', CAST(0x0000A638016B082C AS DateTime), 3, N'cr        ', CAST(380.00000 AS Decimal(18, 5)), N'', NULL, 36)
INSERT [dbo].[Transection] ([TransId], [CustomUniqueId], [ResponceUniqueId], [Date], [UserId], [TransType], [Amount], [Remark], [TransectionId], [SaleId]) VALUES (34, N'e9956a7d-abdc-41ef-89ca-9043d94b444e', N'0', CAST(0x0000A63900DD10F1 AS DateTime), 3, N'cr        ', CAST(5655.00000 AS Decimal(18, 5)), N'', NULL, 37)
SET IDENTITY_INSERT [dbo].[Transection] OFF
SET IDENTITY_INSERT [dbo].[UnitMaster] ON 

INSERT [dbo].[UnitMaster] ([UnitId], [UnitName]) VALUES (1, N'Lit')
INSERT [dbo].[UnitMaster] ([UnitId], [UnitName]) VALUES (2, N'Kilo')
INSERT [dbo].[UnitMaster] ([UnitId], [UnitName]) VALUES (3, N'Second')
SET IDENTITY_INSERT [dbo].[UnitMaster] OFF
SET IDENTITY_INSERT [dbo].[UserItem] ON 

INSERT [dbo].[UserItem] ([UserItemId], [UserId], [ItemId], [Quantity], [Scheduled], [IsDelete], [DOC]) VALUES (1, 1, 1, 2, N'D', 0, CAST(0x0000A5F20004A277 AS DateTime))
INSERT [dbo].[UserItem] ([UserItemId], [UserId], [ItemId], [Quantity], [Scheduled], [IsDelete], [DOC]) VALUES (2, 1, 1, 1, N'SAT,MON,THU', 0, CAST(0x0000A5FE007545DF AS DateTime))
INSERT [dbo].[UserItem] ([UserItemId], [UserId], [ItemId], [Quantity], [Scheduled], [IsDelete], [DOC]) VALUES (3, 1, 1, 1, N'Sat,Sun', 0, CAST(0x0000A60F0072F26A AS DateTime))
INSERT [dbo].[UserItem] ([UserItemId], [UserId], [ItemId], [Quantity], [Scheduled], [IsDelete], [DOC]) VALUES (4, 1, 1, 1, N'Sat,Sun', 0, CAST(0x0000A60F007365A0 AS DateTime))
INSERT [dbo].[UserItem] ([UserItemId], [UserId], [ItemId], [Quantity], [Scheduled], [IsDelete], [DOC]) VALUES (6, 2, 1, 12, N'daily', 0, CAST(0x0000A6150052B73B AS DateTime))
INSERT [dbo].[UserItem] ([UserItemId], [UserId], [ItemId], [Quantity], [Scheduled], [IsDelete], [DOC]) VALUES (7, 2, 1, 10, N'sun,mon,tue', 0, CAST(0x0000A6150052D4F2 AS DateTime))
INSERT [dbo].[UserItem] ([UserItemId], [UserId], [ItemId], [Quantity], [Scheduled], [IsDelete], [DOC]) VALUES (8, 2, 1, 10, N'sun,tue,sun,tue,wen,thr', 0, CAST(0x0000A615005310E3 AS DateTime))
INSERT [dbo].[UserItem] ([UserItemId], [UserId], [ItemId], [Quantity], [Scheduled], [IsDelete], [DOC]) VALUES (9, 2, 1, 10, N'daily', 0, CAST(0x0000A61500CE377A AS DateTime))
SET IDENTITY_INSERT [dbo].[UserItem] OFF
SET IDENTITY_INSERT [dbo].[UserMaster] ON 

INSERT [dbo].[UserMaster] ([UserId], [Name], [Address], [MobileNo], [UserName], [Password], [RoleId], [ShopId], [ActiveBalance], [IsDelete], [DOC]) VALUES (1, N'Shailesh', N'Amrawati', N'998989989 ', N'npa', N'npa', 1, 1, CAST(25892.00000 AS Decimal(18, 5)), 0, CAST(0x0000A5F20004427C AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [Name], [Address], [MobileNo], [UserName], [Password], [RoleId], [ShopId], [ActiveBalance], [IsDelete], [DOC]) VALUES (2, N'Naganatha', N'Ankiloa', N'9898989898', N'', N'', 2, 1, CAST(1700.00000 AS Decimal(18, 5)), 0, CAST(0x0000A5FF00E55715 AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [Name], [Address], [MobileNo], [UserName], [Password], [RoleId], [ShopId], [ActiveBalance], [IsDelete], [DOC]) VALUES (3, N'mahesh', N'karkamb', N'9999999   ', N'npe', N'npe', 3, 1, CAST(0.00000 AS Decimal(18, 5)), 0, CAST(0x0000A60D00FB58C5 AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [Name], [Address], [MobileNo], [UserName], [Password], [RoleId], [ShopId], [ActiveBalance], [IsDelete], [DOC]) VALUES (4, N'vijay', N'pune', N'8888888   ', N'npc1', N'npc1', 2, 1, CAST(400.00000 AS Decimal(18, 5)), 0, CAST(0x0000A60D00FC1C73 AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [Name], [Address], [MobileNo], [UserName], [Password], [RoleId], [ShopId], [ActiveBalance], [IsDelete], [DOC]) VALUES (5, N'ram', N'Pune', N'9876543210', N'', N'ram', 2, 1, CAST(0.00000 AS Decimal(18, 5)), 0, CAST(0x0000A60D0102427B AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [Name], [Address], [MobileNo], [UserName], [Password], [RoleId], [ShopId], [ActiveBalance], [IsDelete], [DOC]) VALUES (6, N'gggg', N'mailt@test.com', N'9888990900', N'', N'qwert', 3, 1, CAST(0.00000 AS Decimal(18, 5)), 0, CAST(0x0000A60E0013D12B AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [Name], [Address], [MobileNo], [UserName], [Password], [RoleId], [ShopId], [ActiveBalance], [IsDelete], [DOC]) VALUES (7, N'Naganatha', N'Ankoli', N'9898989898', N'', N'', 2, 1, CAST(0.00000 AS Decimal(18, 5)), 0, CAST(0x0000A60E015DB202 AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [Name], [Address], [MobileNo], [UserName], [Password], [RoleId], [ShopId], [ActiveBalance], [IsDelete], [DOC]) VALUES (8, N'Naganatha', N'Ankoli', N'9898989898', N'', N'', 2, 1, CAST(0.00000 AS Decimal(18, 5)), 0, CAST(0x0000A60E015DB9FE AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [Name], [Address], [MobileNo], [UserName], [Password], [RoleId], [ShopId], [ActiveBalance], [IsDelete], [DOC]) VALUES (9, N'Naganatha', N'Ankoli', N'9898989898', N'', N'', 2, 1, CAST(0.00000 AS Decimal(18, 5)), 0, CAST(0x0000A60E015DBEA3 AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [Name], [Address], [MobileNo], [UserName], [Password], [RoleId], [ShopId], [ActiveBalance], [IsDelete], [DOC]) VALUES (10, N'rahul', N'pune', N'8554846019', N'', N'pune', 3, 3, CAST(0.00000 AS Decimal(18, 5)), 0, CAST(0x0000A60E018B6C63 AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [Name], [Address], [MobileNo], [UserName], [Password], [RoleId], [ShopId], [ActiveBalance], [IsDelete], [DOC]) VALUES (11, N'rahul', N'pune', N'8554846019', N'', N'model', 3, 3, CAST(0.00000 AS Decimal(18, 5)), 0, CAST(0x0000A60F00A188D2 AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [Name], [Address], [MobileNo], [UserName], [Password], [RoleId], [ShopId], [ActiveBalance], [IsDelete], [DOC]) VALUES (12, N'Naganatha', N'Ankiloa', N'9898989898', N'', N'', 2, 1, CAST(-49380.00000 AS Decimal(18, 5)), 0, CAST(0x0000A614008517D0 AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [Name], [Address], [MobileNo], [UserName], [Password], [RoleId], [ShopId], [ActiveBalance], [IsDelete], [DOC]) VALUES (13, N'Naganatha', N'Ankiloa', N'9898989898', N'', N'', 2, 1, CAST(0.00000 AS Decimal(18, 5)), 0, CAST(0x0000A61400851AE3 AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [Name], [Address], [MobileNo], [UserName], [Password], [RoleId], [ShopId], [ActiveBalance], [IsDelete], [DOC]) VALUES (14, N'Arvind', N'pune', N'8956859885', N'', N'8956859885', 3, 3, CAST(0.00000 AS Decimal(18, 5)), 0, CAST(0x0000A615007618DF AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [Name], [Address], [MobileNo], [UserName], [Password], [RoleId], [ShopId], [ActiveBalance], [IsDelete], [DOC]) VALUES (15, N'chris', N'Ankiloa', N'9898989898', N'', N'', 2, 1, CAST(0.00000 AS Decimal(18, 5)), 0, CAST(0x0000A6150078D6C7 AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [Name], [Address], [MobileNo], [UserName], [Password], [RoleId], [ShopId], [ActiveBalance], [IsDelete], [DOC]) VALUES (16, N'rahul', N'thergaon', N'9999999999', N'', N'999999999', 3, 3, CAST(9000.00000 AS Decimal(18, 5)), 0, CAST(0x0000A615007D2B19 AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [Name], [Address], [MobileNo], [UserName], [Password], [RoleId], [ShopId], [ActiveBalance], [IsDelete], [DOC]) VALUES (17, N'Naganatha', N'Ankiloa', N'9898989898', N'', N'', 2, 1, CAST(0.00000 AS Decimal(18, 5)), 0, CAST(0x0000A61600099F30 AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [Name], [Address], [MobileNo], [UserName], [Password], [RoleId], [ShopId], [ActiveBalance], [IsDelete], [DOC]) VALUES (18, N'rv', N'pune', N'8554846019', N'', N'8956859885', 3, 3, CAST(0.00000 AS Decimal(18, 5)), 0, CAST(0x0000A61900C46F15 AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [Name], [Address], [MobileNo], [UserName], [Password], [RoleId], [ShopId], [ActiveBalance], [IsDelete], [DOC]) VALUES (19, N'Aslam  Shinde', N'kakamb', N'9876543210', N'', N'12345678', 3, 2, CAST(760.00000 AS Decimal(18, 5)), 0, CAST(0x0000A630008E8B22 AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [Name], [Address], [MobileNo], [UserName], [Password], [RoleId], [ShopId], [ActiveBalance], [IsDelete], [DOC]) VALUES (20, N'Data shinde', N'karkamb', N'9876543210', N'', N'123456', 3, 2, CAST(0.00000 AS Decimal(18, 5)), 0, CAST(0x0000A6300091DB9D AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [Name], [Address], [MobileNo], [UserName], [Password], [RoleId], [ShopId], [ActiveBalance], [IsDelete], [DOC]) VALUES (21, N'really', N'karkamb', N'9876543210', N'', N'1234', 3, 1, CAST(0.00000 AS Decimal(18, 5)), 0, CAST(0x0000A638008B9D13 AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [Name], [Address], [MobileNo], [UserName], [Password], [RoleId], [ShopId], [ActiveBalance], [IsDelete], [DOC]) VALUES (22, N'Naganatha', N'thergaon', N'9898989898', N'', N'', 2, 1, CAST(0.00000 AS Decimal(18, 5)), 0, CAST(0x0000A6380169AAEA AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [Name], [Address], [MobileNo], [UserName], [Password], [RoleId], [ShopId], [ActiveBalance], [IsDelete], [DOC]) VALUES (23, N'mahesh', N'pune', N'9999999   ', N'', N'', 3, 1, CAST(0.00000 AS Decimal(18, 5)), 0, CAST(0x0000A639001C32C8 AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [Name], [Address], [MobileNo], [UserName], [Password], [RoleId], [ShopId], [ActiveBalance], [IsDelete], [DOC]) VALUES (24, N'ASlam', N'karkamb', N'9999999   ', N'', N'', 3, 1, CAST(0.00000 AS Decimal(18, 5)), 0, CAST(0x0000A63900BF11B1 AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [Name], [Address], [MobileNo], [UserName], [Password], [RoleId], [ShopId], [ActiveBalance], [IsDelete], [DOC]) VALUES (25, N'Sushant', N'Pune', N'8149881849', N'', N'sush', 3, 8, CAST(0.00000 AS Decimal(18, 5)), 0, CAST(0x0000A63900D06886 AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [Name], [Address], [MobileNo], [UserName], [Password], [RoleId], [ShopId], [ActiveBalance], [IsDelete], [DOC]) VALUES (26, N'mahesh', N'karkamb123', N'9999999   ', N'', N'', 3, 1, CAST(0.00000 AS Decimal(18, 5)), 0, CAST(0x0000A63900D448A8 AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [Name], [Address], [MobileNo], [UserName], [Password], [RoleId], [ShopId], [ActiveBalance], [IsDelete], [DOC]) VALUES (27, N'Salaman Khan', N'Mumbai', N'7867867867', N'', N'salam', 3, 3, CAST(0.00000 AS Decimal(18, 5)), 0, CAST(0x0000A63900D4A449 AS DateTime))
SET IDENTITY_INSERT [dbo].[UserMaster] OFF
ALTER TABLE [dbo].[ItemMaster] ADD  CONSTRAINT [DF_ItemMaster_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[ItemMaster] ADD  CONSTRAINT [DF_ItemMaster_DOC]  DEFAULT (getdate()) FOR [DOC]
GO
ALTER TABLE [dbo].[OrderCancelMaster] ADD  CONSTRAINT [DF_OrderCancelMaster_DOC]  DEFAULT (getdate()) FOR [DOC]
GO
ALTER TABLE [dbo].[OrderCancelMaster] ADD  CONSTRAINT [DF_OrderCancelMaster_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[PriceMaster] ADD  CONSTRAINT [DF_PriceMaster_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[PriceMaster] ADD  CONSTRAINT [DF_PriceMaster_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[RoleMaster] ADD  CONSTRAINT [DF_RoleMaster_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[RoleMaster] ADD  CONSTRAINT [DF_RoleMaster_DOC]  DEFAULT (getdate()) FOR [DOC]
GO
ALTER TABLE [dbo].[RoleRuleRelation] ADD  CONSTRAINT [DF_RoleRuleRelation_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[RuleMaster] ADD  CONSTRAINT [DF_RuleMaster_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[SaleDtlMaster] ADD  CONSTRAINT [DF_SaleDtlMaster_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[SaleDtlMaster] ADD  CONSTRAINT [DF_SaleDtlMaster_DOC]  DEFAULT (getdate()) FOR [DOC]
GO
ALTER TABLE [dbo].[SaleMaster] ADD  CONSTRAINT [DF_SaleMaster_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[SaleMaster] ADD  CONSTRAINT [DF_SaleMaster_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[SaleMaster] ADD  CONSTRAINT [DF_SaleMaster_DOC]  DEFAULT (getdate()) FOR [DOC]
GO
ALTER TABLE [dbo].[ShopMaster] ADD  CONSTRAINT [DF_ShopMaster_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[ShopMaster] ADD  CONSTRAINT [DF_ShopMaster_DOC]  DEFAULT (getdate()) FOR [DOC]
GO
ALTER TABLE [dbo].[Transection] ADD  CONSTRAINT [DF_Transection_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[UserItem] ADD  CONSTRAINT [DF_UserItem_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[UserItem] ADD  CONSTRAINT [DF_UserItem_DOC]  DEFAULT (getdate()) FOR [DOC]
GO
ALTER TABLE [dbo].[UserMaster] ADD  CONSTRAINT [DF_UserMaster_ActiveBalance]  DEFAULT ((0)) FOR [ActiveBalance]
GO
ALTER TABLE [dbo].[UserMaster] ADD  CONSTRAINT [DF_UserMaster_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[UserMaster] ADD  CONSTRAINT [DF_UserMaster_DOC]  DEFAULT (getdate()) FOR [DOC]
GO
ALTER TABLE [dbo].[ItemMaster]  WITH CHECK ADD  CONSTRAINT [FK_ItemMaster_UnitMaster] FOREIGN KEY([UnitId])
REFERENCES [dbo].[UnitMaster] ([UnitId])
GO
ALTER TABLE [dbo].[ItemMaster] CHECK CONSTRAINT [FK_ItemMaster_UnitMaster]
GO
ALTER TABLE [dbo].[OrderCancelMaster]  WITH CHECK ADD  CONSTRAINT [FK_OrderCancelMaster_ItemMaster] FOREIGN KEY([ItemId])
REFERENCES [dbo].[ItemMaster] ([ItemId])
GO
ALTER TABLE [dbo].[OrderCancelMaster] CHECK CONSTRAINT [FK_OrderCancelMaster_ItemMaster]
GO
ALTER TABLE [dbo].[OrderCancelMaster]  WITH CHECK ADD  CONSTRAINT [FK_OrderCancelMaster_StatusMaster] FOREIGN KEY([Status])
REFERENCES [dbo].[StatusMaster] ([StatusMasterId])
GO
ALTER TABLE [dbo].[OrderCancelMaster] CHECK CONSTRAINT [FK_OrderCancelMaster_StatusMaster]
GO
ALTER TABLE [dbo].[OrderCancelMaster]  WITH CHECK ADD  CONSTRAINT [FK_OrderCancelMaster_UserMaster] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserMaster] ([UserId])
GO
ALTER TABLE [dbo].[OrderCancelMaster] CHECK CONSTRAINT [FK_OrderCancelMaster_UserMaster]
GO
ALTER TABLE [dbo].[PriceMaster]  WITH CHECK ADD  CONSTRAINT [FK_PriceMaster_ItemMaster] FOREIGN KEY([ItemId])
REFERENCES [dbo].[ItemMaster] ([ItemId])
GO
ALTER TABLE [dbo].[PriceMaster] CHECK CONSTRAINT [FK_PriceMaster_ItemMaster]
GO
ALTER TABLE [dbo].[RoleRuleRelation]  WITH CHECK ADD  CONSTRAINT [FK_RoleRuleRelation_RoleMaster] FOREIGN KEY([RoleId])
REFERENCES [dbo].[RoleMaster] ([RoleId])
GO
ALTER TABLE [dbo].[RoleRuleRelation] CHECK CONSTRAINT [FK_RoleRuleRelation_RoleMaster]
GO
ALTER TABLE [dbo].[RoleRuleRelation]  WITH CHECK ADD  CONSTRAINT [FK_RoleRuleRelation_RuleMaster] FOREIGN KEY([RuleId])
REFERENCES [dbo].[RuleMaster] ([RuleId])
GO
ALTER TABLE [dbo].[RoleRuleRelation] CHECK CONSTRAINT [FK_RoleRuleRelation_RuleMaster]
GO
ALTER TABLE [dbo].[RuleMaster]  WITH CHECK ADD  CONSTRAINT [FK_RuleMaster_Permission] FOREIGN KEY([PermissionId])
REFERENCES [dbo].[Permission] ([PermissionId])
GO
ALTER TABLE [dbo].[RuleMaster] CHECK CONSTRAINT [FK_RuleMaster_Permission]
GO
ALTER TABLE [dbo].[RuleMaster]  WITH CHECK ADD  CONSTRAINT [FK_RuleMaster_PermissionType1] FOREIGN KEY([TypeId])
REFERENCES [dbo].[PermissionType] ([TypeId])
GO
ALTER TABLE [dbo].[RuleMaster] CHECK CONSTRAINT [FK_RuleMaster_PermissionType1]
GO
ALTER TABLE [dbo].[SaleDtlMaster]  WITH CHECK ADD  CONSTRAINT [FK_SaleDtlMaster_ItemMaster] FOREIGN KEY([ItemId])
REFERENCES [dbo].[ItemMaster] ([ItemId])
GO
ALTER TABLE [dbo].[SaleDtlMaster] CHECK CONSTRAINT [FK_SaleDtlMaster_ItemMaster]
GO
ALTER TABLE [dbo].[SaleDtlMaster]  WITH CHECK ADD  CONSTRAINT [FK_SaleDtlMaster_SaleMaster] FOREIGN KEY([SaleId])
REFERENCES [dbo].[SaleMaster] ([SaleId])
GO
ALTER TABLE [dbo].[SaleDtlMaster] CHECK CONSTRAINT [FK_SaleDtlMaster_SaleMaster]
GO
ALTER TABLE [dbo].[Transection]  WITH CHECK ADD  CONSTRAINT [FK_Transection_UserMaster] FOREIGN KEY([SaleId])
REFERENCES [dbo].[SaleMaster] ([SaleId])
GO
ALTER TABLE [dbo].[Transection] CHECK CONSTRAINT [FK_Transection_UserMaster]
GO
ALTER TABLE [dbo].[Transection]  WITH CHECK ADD  CONSTRAINT [FK_Transection_UserMaster1] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserMaster] ([UserId])
GO
ALTER TABLE [dbo].[Transection] CHECK CONSTRAINT [FK_Transection_UserMaster1]
GO
ALTER TABLE [dbo].[UserItem]  WITH CHECK ADD  CONSTRAINT [FK_UserItem_ItemMaster] FOREIGN KEY([ItemId])
REFERENCES [dbo].[ItemMaster] ([ItemId])
GO
ALTER TABLE [dbo].[UserItem] CHECK CONSTRAINT [FK_UserItem_ItemMaster]
GO
ALTER TABLE [dbo].[UserItem]  WITH CHECK ADD  CONSTRAINT [FK_UserItem_UserMaster] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserMaster] ([UserId])
GO
ALTER TABLE [dbo].[UserItem] CHECK CONSTRAINT [FK_UserItem_UserMaster]
GO
ALTER TABLE [dbo].[UserMaster]  WITH CHECK ADD  CONSTRAINT [FK_UserMaster_RoleMaster] FOREIGN KEY([RoleId])
REFERENCES [dbo].[RoleMaster] ([RoleId])
GO
ALTER TABLE [dbo].[UserMaster] CHECK CONSTRAINT [FK_UserMaster_RoleMaster]
GO
ALTER TABLE [dbo].[UserMaster]  WITH CHECK ADD  CONSTRAINT [FK_UserMaster_ShopMaster] FOREIGN KEY([ShopId])
REFERENCES [dbo].[ShopMaster] ([ShopId])
GO
ALTER TABLE [dbo].[UserMaster] CHECK CONSTRAINT [FK_UserMaster_ShopMaster]
GO
USE [master]
GO
ALTER DATABASE [TeamedDB] SET  READ_WRITE 
GO
