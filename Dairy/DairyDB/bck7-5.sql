USE [master]
GO
/****** Object:  Database [Dairy]    Script Date: 5/7/2016 9:32:12 PM ******/
CREATE DATABASE [Dairy] ON  PRIMARY 
( NAME = N'Dairy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Dairy.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Dairy_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Dairy_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Dairy] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Dairy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Dairy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Dairy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Dairy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Dairy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Dairy] SET ARITHABORT OFF 
GO
ALTER DATABASE [Dairy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Dairy] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Dairy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Dairy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Dairy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Dairy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Dairy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Dairy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Dairy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Dairy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Dairy] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Dairy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Dairy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Dairy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Dairy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Dairy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Dairy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Dairy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Dairy] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Dairy] SET  MULTI_USER 
GO
ALTER DATABASE [Dairy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Dairy] SET DB_CHAINING OFF 
GO
USE [Dairy]
GO
/****** Object:  Table [dbo].[ItemMaster]    Script Date: 5/7/2016 9:32:12 PM ******/
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
/****** Object:  Table [dbo].[OrderCancelMaster]    Script Date: 5/7/2016 9:32:12 PM ******/
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
 CONSTRAINT [PK_OrderCancelMaster] PRIMARY KEY CLUSTERED 
(
	[OrderCancelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permission]    Script Date: 5/7/2016 9:32:12 PM ******/
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
/****** Object:  Table [dbo].[PermissionType]    Script Date: 5/7/2016 9:32:12 PM ******/
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
/****** Object:  Table [dbo].[PriceMaster]    Script Date: 5/7/2016 9:32:12 PM ******/
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
/****** Object:  Table [dbo].[RoleMaster]    Script Date: 5/7/2016 9:32:12 PM ******/
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
/****** Object:  Table [dbo].[RoleRuleRelation]    Script Date: 5/7/2016 9:32:12 PM ******/
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
/****** Object:  Table [dbo].[RuleMaster]    Script Date: 5/7/2016 9:32:12 PM ******/
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
/****** Object:  Table [dbo].[SaleDtlMaster]    Script Date: 5/7/2016 9:32:12 PM ******/
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
/****** Object:  Table [dbo].[SaleMaster]    Script Date: 5/7/2016 9:32:12 PM ******/
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
/****** Object:  Table [dbo].[ShopMaster]    Script Date: 5/7/2016 9:32:12 PM ******/
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
/****** Object:  Table [dbo].[StatusMaster]    Script Date: 5/7/2016 9:32:12 PM ******/
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
/****** Object:  Table [dbo].[Transection]    Script Date: 5/7/2016 9:32:12 PM ******/
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
/****** Object:  Table [dbo].[UnitMaster]    Script Date: 5/7/2016 9:32:12 PM ******/
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
/****** Object:  Table [dbo].[UserItem]    Script Date: 5/7/2016 9:32:12 PM ******/
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
/****** Object:  Table [dbo].[UserMaster]    Script Date: 5/7/2016 9:32:12 PM ******/
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
	[ActiveBalance] [nvarchar](10) NULL,
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
SET IDENTITY_INSERT [dbo].[ItemMaster] OFF
SET IDENTITY_INSERT [dbo].[OrderCancelMaster] ON 

INSERT [dbo].[OrderCancelMaster] ([OrderCancelId], [UserId], [ItemId], [Quantity], [TransType], [Status]) VALUES (1, 1, 1, 1, N'Order', 1)
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
SET IDENTITY_INSERT [dbo].[SaleDtlMaster] OFF
SET IDENTITY_INSERT [dbo].[SaleMaster] ON 

INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (1, CAST(0x0000A5F20004CBCE AS DateTime), 1, 1, CAST(100.00000 AS Decimal(18, 5)), 0, NULL)
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (2, CAST(0x0000A5F40082D961 AS DateTime), 1, 1, CAST(2000.00000 AS Decimal(18, 5)), 0, NULL)
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (4, CAST(0x0000A5FB007217CF AS DateTime), 1, 1, CAST(2000.00000 AS Decimal(18, 5)), 0, NULL)
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (5, CAST(0x0000A5FB0073ABC6 AS DateTime), 1, 1, CAST(2000.00000 AS Decimal(18, 5)), 0, NULL)
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (7, CAST(0x0000A5FB007AFB39 AS DateTime), 1, 1, CAST(2000.00000 AS Decimal(18, 5)), 0, NULL)
INSERT [dbo].[SaleMaster] ([SaleId], [Date], [CustId], [UserId], [Amount], [IsDelete], [DOC]) VALUES (8, CAST(0x0000A5FB007C448A AS DateTime), 1, 1, CAST(2000.00000 AS Decimal(18, 5)), 0, NULL)
SET IDENTITY_INSERT [dbo].[SaleMaster] OFF
SET IDENTITY_INSERT [dbo].[ShopMaster] ON 

INSERT [dbo].[ShopMaster] ([ShopId], [ShopName], [Address], [IsDelete], [DOC]) VALUES (1, N'Sahilu Shop', N'Amrawati', 0, CAST(0x0000A5F2000267C3 AS DateTime))
INSERT [dbo].[ShopMaster] ([ShopId], [ShopName], [Address], [IsDelete], [DOC]) VALUES (2, N'Naga Shop', N'Ankoli', 0, CAST(0x0000A5F200027D10 AS DateTime))
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
SET IDENTITY_INSERT [dbo].[Transection] OFF
SET IDENTITY_INSERT [dbo].[UnitMaster] ON 

INSERT [dbo].[UnitMaster] ([UnitId], [UnitName]) VALUES (1, N'Lit')
INSERT [dbo].[UnitMaster] ([UnitId], [UnitName]) VALUES (2, N'Kilo')
INSERT [dbo].[UnitMaster] ([UnitId], [UnitName]) VALUES (3, N'Second')
SET IDENTITY_INSERT [dbo].[UnitMaster] OFF
SET IDENTITY_INSERT [dbo].[UserItem] ON 

INSERT [dbo].[UserItem] ([UserItemId], [UserId], [ItemId], [Quantity], [Scheduled], [IsDelete], [DOC]) VALUES (1, 1, 1, 2, N'D', 0, CAST(0x0000A5F20004A277 AS DateTime))
INSERT [dbo].[UserItem] ([UserItemId], [UserId], [ItemId], [Quantity], [Scheduled], [IsDelete], [DOC]) VALUES (2, 1, 1, 1, N'SAT,MON,THU', 0, CAST(0x0000A5FE007545DF AS DateTime))
SET IDENTITY_INSERT [dbo].[UserItem] OFF
SET IDENTITY_INSERT [dbo].[UserMaster] ON 

INSERT [dbo].[UserMaster] ([UserId], [Name], [Address], [MobileNo], [UserName], [Password], [RoleId], [ShopId], [ActiveBalance], [IsDelete], [DOC]) VALUES (1, N'Shailesh', N'Amrawati', N'998989989 ', N'shail', N'test', 1, 1, N'6100', 0, CAST(0x0000A5F20004427C AS DateTime))
SET IDENTITY_INSERT [dbo].[UserMaster] OFF
ALTER TABLE [dbo].[ItemMaster] ADD  CONSTRAINT [DF_ItemMaster_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[ItemMaster] ADD  CONSTRAINT [DF_ItemMaster_DOC]  DEFAULT (getdate()) FOR [DOC]
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
ALTER DATABASE [Dairy] SET  READ_WRITE 
GO
