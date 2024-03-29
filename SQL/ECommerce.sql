USE [master]
GO
/****** Object:  Database [ECommerce]    Script Date: 14-02-2024 09:05:23 PM ******/
CREATE DATABASE [ECommerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EMedicine', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EMedicine.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EMedicine_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EMedicine_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ECommerce] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ECommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ECommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ECommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [ECommerce] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ECommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ECommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ECommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ECommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ECommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ECommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ECommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ECommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ECommerce] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ECommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ECommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ECommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ECommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ECommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ECommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ECommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ECommerce] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ECommerce] SET  MULTI_USER 
GO
ALTER DATABASE [ECommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ECommerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ECommerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ECommerce] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ECommerce] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ECommerce] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ECommerce] SET QUERY_STORE = OFF
GO
USE [ECommerce]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[TotalPrice] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[CreatedON] [datetime] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOC_City]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOC_City](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](50) NOT NULL,
	[CityCode] [nvarchar](10) NULL,
	[StateId] [int] NOT NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_LOC_City] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOC_Country]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOC_Country](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](50) NOT NULL,
	[CountryCode] [nvarchar](5) NULL,
 CONSTRAINT [PK_LOC_Country] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOC_State]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOC_State](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](50) NOT NULL,
	[StateCode] [nvarchar](10) NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_LOC_State] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ManufacturerId] [int] IDENTITY(1,1) NOT NULL,
	[ManufacturerName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ManufacturerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderItemId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[TotalPrice] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[OrderNo] [varchar](32) NOT NULL,
	[ShippingAddress] [varchar](200) NOT NULL,
	[CountryId] [int] NULL,
	[StateId] [int] NULL,
	[CityId] [int] NULL,
	[OrderDate] [datetime] NOT NULL,
	[OrderStatus] [varchar](20) NULL,
 CONSTRAINT [PK__Orders__C3905BCF3586A1ED] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[ManufacturerId] [int] NOT NULL,
	[Description] [varchar](500) NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Discount] [decimal](10, 2) NULL,
	[Quantity] [int] NOT NULL,
	[ExpDate] [datetime] NULL,
	[ImageUrl] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK__Products__B40CC6CDC5BCEECF] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleType] [nvarchar](50) NULL,
	[CreatedON] [datetime] NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[SalesId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Discount] [int] NOT NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[SalesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NULL,
	[UserName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](10) NOT NULL,
	[CountryId] [int] NULL,
	[StateId] [int] NULL,
	[CityId] [int] NULL,
	[Address] [varchar](200) NULL,
	[CreatedON] [datetime] NULL,
	[ImageUrl] [nvarchar](200) NULL,
 CONSTRAINT [PK__Users__1788CC4CF57441D7] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([CartId], [UserId], [ProductId], [Quantity], [TotalPrice]) VALUES (1, 4, 5, 1, CAST(242.00 AS Decimal(10, 2)))
INSERT [dbo].[Cart] ([CartId], [UserId], [ProductId], [Quantity], [TotalPrice]) VALUES (5, 4, 3, 2, CAST(1738.00 AS Decimal(10, 2)))
INSERT [dbo].[Cart] ([CartId], [UserId], [ProductId], [Quantity], [TotalPrice]) VALUES (6, 4, 8, 3, CAST(8997.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CreatedON]) VALUES (1, N'Mens Wear', CAST(N'2023-04-22T21:52:44.900' AS DateTime))
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CreatedON]) VALUES (2, N'Women''s wear', CAST(N'2023-04-22T20:23:15.670' AS DateTime))
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CreatedON]) VALUES (3, N'Shoes', CAST(N'2023-04-22T21:29:51.723' AS DateTime))
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CreatedON]) VALUES (5, N'Watches', CAST(N'2023-04-29T19:07:52.690' AS DateTime))
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[LOC_City] ON 

INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (1, N'Alipur', N'101', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (2, N'Andaman Island', N'102', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (3, N'Anderson Island', N'103', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (4, N'Arainj-Laka-Punga', N'104', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (5, N'Austinabad', N'105', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (6, N'Bamboo Flat', N'106', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (7, N'Barren Island', N'107', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (8, N'Beadonabad', N'108', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (9, N'Betapur', N'109', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (10, N'Bindraban', N'110', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (11, N'Bonington', N'111', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (12, N'Brookesabad', N'112', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (13, N'Cadell Point', N'113', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (14, N'Calicut', N'114', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (15, N'Chetamale', N'115', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (16, N'Cinque Islands', N'116', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (17, N'Defence Island', N'117', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (18, N'Digilpur', N'118', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (19, N'Dolyganj', N'119', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (20, N'Flat Island', N'120', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (21, N'Geinyale', N'121', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (22, N'Great Coco Island', N'122', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (23, N'Haddo', N'123', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (24, N'Havelock Island', N'124', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (25, N'Henry Lawrence Island', N'125', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (26, N'Herbertabad', N'126', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (27, N'Hobdaypur', N'127', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (28, N'Ilichar', N'128', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (29, N'Ingoie', N'128', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (30, N'Inteview Island', N'130', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (31, N'Jangli Ghat', N'131', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (32, N'Jhon Lawrence Island', N'132', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (33, N'Karen', N'133', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (34, N'Kartara', N'134', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (35, N'KYD Islannd', N'135', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (36, N'Landfall Island', N'136', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (37, N'Little Andmand', N'137', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (38, N'Little Coco Island', N'138', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (39, N'Long Island', N'138', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (40, N'Maimyo', N'140', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (41, N'Malappuram', N'141', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (42, N'Manglutan', N'142', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (43, N'Manpur', N'143', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (44, N'Mitha Khari', N'144', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (45, N'Neill Island', N'145', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (46, N'Nicobar Island', N'146', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (47, N'North Brother Island', N'147', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (48, N'North Passage Island', N'148', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (49, N'North Sentinel Island', N'149', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (50, N'Nothen Reef Island', N'150', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (51, N'Outram Island', N'151', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (52, N'Pahlagaon', N'152', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (53, N'Palalankwe', N'153', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (54, N'Passage Island', N'154', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (55, N'Phaiapong', N'155', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (56, N'Phoenix Island', N'156', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (57, N'Port Blair', N'157', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (58, N'Preparis Island', N'158', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (59, N'Protheroepur', N'159', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (60, N'Rangachang', N'160', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (61, N'Rongat', N'161', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (62, N'Rutland Island', N'162', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (63, N'Sabari', N'163', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (64, N'Saddle Peak', N'164', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (65, N'Shadipur', N'165', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (66, N'Smith Island', N'166', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (67, N'Sound Island', N'167', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (68, N'South Sentinel Island', N'168', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (69, N'Spike Island', N'169', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (70, N'Tarmugli Island', N'170', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (71, N'Taylerabad', N'171', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (72, N'Titaije', N'172', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (73, N'Toibalawe', N'173', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (74, N'Tusonabad', N'174', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (75, N'West Island', N'175', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (76, N'Wimberleyganj', N'176', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (77, N'Yadita', N'177', 1, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (78, N'Adilabad', N'201', 2, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (79, N'Anantapur', N'201', 2, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (80, N'Chittoor', N'203', 2, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (81, N'Cuddapah', N'204', 2, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (82, N'East Godavari', N'205', 2, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (83, N'Guntur', N'206', 2, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (84, N'Hyderabad', N'207', 2, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (85, N'Karimnagar', N'208', 2, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (86, N'Khammam', N'209', 2, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (87, N'Krishna', N'210', 2, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (88, N'Kurnool', N'211', 2, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (89, N'Mahabubnagar', N'212', 2, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (90, N'Medak', N'213', 2, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (91, N'Nalgonda', N'214', 2, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (92, N'Nellore', N'215', 2, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (93, N'Nizamabad', N'216', 2, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (94, N'Prakasam', N'217', 2, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (95, N'Rangareddy', N'218', 2, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (96, N'Srikakulam', N'219', 2, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (97, N'Visakhapatnam', N'220', 2, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (98, N'Vizianagaram', N'221', 2, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (99, N'Warangal', N'222', 2, 99)
GO
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (100, N'West Godavari', N'223', 2, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (101, N'Anjaw', N'301', 3, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (102, N'Changlang', N'302', 3, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (103, N'Dibang Valley', N'303', 3, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (104, N'East Kameng', N'304', 3, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (105, N'East Siang', N'305', 3, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (106, N'Itanagar', N'306', 3, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (107, N'Kurung Kumey', N'307', 3, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (108, N'Lohit', N'308', 3, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (109, N'Lower Dibang Valley', N'309', 3, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (110, N'Lower Subansiri', N'310', 3, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (111, N'Papum Pare', N'311', 3, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (112, N'Tawang', N'312', 3, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (113, N'Tirap', N'313', 3, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (114, N'Upper Siang', N'314', 3, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (115, N'Upper Subansiri', N'315', 3, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (116, N'West Kameng', N'316', 3, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (117, N'West Siang', N'317', 3, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (118, N'Barpeta', N'401', 4, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (119, N'Bongaigaon', N'402', 4, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (120, N'Cachar', N'403', 4, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (121, N'Darrang', N'404', 4, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (122, N'Dhemaji', N'405', 4, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (123, N'Dhubri', N'406', 4, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (124, N'Dibrugarh', N'407', 4, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (125, N'Goalpara', N'408', 4, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (126, N'Golaghat', N'409', 4, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (127, N'Guwahati', N'410', 4, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (128, N'Hailakandi', N'411', 4, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (129, N'Jorhat', N'412', 4, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (130, N'Kamrup', N'413', 4, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (131, N'Karbi Anglong', N'414', 4, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (132, N'Karimganj', N'415', 4, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (133, N'Kokrajhar', N'416', 4, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (134, N'Lakhimpur', N'417', 4, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (135, N'Marigaon', N'418', 4, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (136, N'Nagaon', N'419', 4, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (137, N'Nalbari', N'420', 4, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (138, N'North Cachar Hills', N'421', 4, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (139, N'Silchar', N'422', 4, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (140, N'Sivasagar', N'423', 4, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (141, N'Sonitpur', N'424', 4, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (142, N'Tinsukia', N'425', 4, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (143, N'Udalguri', N'426', 4, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (144, N'Araria', N'501', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (145, N'Aurangabad', N'502', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (146, N'Banka', N'503', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (147, N'Begusarai', N'504', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (148, N'Bhagalpur', N'505', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (149, N'Bhojpur', N'506', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (150, N'Buxar', N'507', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (151, N'Darbhanga', N'508', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (152, N'East Champaran', N'509', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (153, N'Gaya', N'510', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (154, N'Gopalganj', N'511', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (155, N'Jamshedpur', N'512', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (156, N'Jamui', N'513', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (157, N'Jehanabad', N'514', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (158, N'Kaimur (Bhabua)', N'515', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (159, N'Katihar', N'516', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (160, N'Khagaria', N'517', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (161, N'Kishanganj', N'518', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (162, N'Lakhisarai', N'519', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (163, N'Madhepura', N'520', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (164, N'Madhubani', N'521', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (165, N'Munger', N'522', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (166, N'Muzaffarpur', N'523', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (167, N'Nalanda', N'524', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (168, N'Nawada', N'525', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (169, N'Patna', N'526', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (170, N'Purnia', N'527', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (171, N'Rohtas', N'528', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (172, N'Saharsa', N'529', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (173, N'Samastipur', N'530', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (174, N'Saran', N'531', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (175, N'Sheikhpura', N'532', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (176, N'Sheohar', N'533', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (177, N'Sitamarhi', N'534', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (178, N'Siwan', N'535', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (179, N'Supaul', N'536', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (180, N'Vaishali', N'537', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (181, N'West Champaran', N'538', 5, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (182, N'Bastar', N'601', 6, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (183, N'Bhilai', N'602', 6, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (184, N'Bijapur', N'603', 6, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (185, N'Bilaspur', N'604', 6, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (186, N'Dhamtari', N'605', 6, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (187, N'Durg', N'606', 6, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (188, N'Janjgir-Champa', N'607', 6, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (189, N'Jashpur', N'608', 6, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (190, N'Kabirdham-Kawardha', N'609', 6, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (191, N'Korba', N'610', 6, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (192, N'Korea', N'611', 6, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (193, N'Mahasamund', N'612', 6, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (194, N'Narayanpur', N'613', 6, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (195, N'Norh Bastar-Kanker', N'614', 6, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (196, N'Raigarh', N'615', 6, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (197, N'Raipur', N'616', 6, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (198, N'Rajnandgaon', N'617', 6, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (199, N'South Bastar-Dantewada', N'618', 6, 99)
GO
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (200, N'Surguja', N'619', 6, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (201, N'Chandigarh', N'701', 7, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (202, N'Mani Marja', N'702', 7, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (203, N'Amal', N'801', 8, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (204, N'Amli', N'802', 8, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (205, N'Bedpa', N'803', 8, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (206, N'Chikhli', N'804', 8, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (207, N'Dadra & Nagar Haveli', N'805', 8, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (208, N'Dahikhed', N'806', 8, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (209, N'Dolara', N'807', 8, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (210, N'Galonda', N'808', 8, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (211, N'Kanadi', N'809', 8, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (212, N'Karchond', N'810', 8, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (213, N'Khadoli', N'811', 8, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (214, N'Kharadpada', N'812', 8, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (215, N'Kherabari', N'813', 8, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (216, N'Kherdi', N'814', 8, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (217, N'Kothar', N'815', 8, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (218, N'Luari', N'816', 8, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (219, N'Mashat', N'817', 8, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (220, N'Rakholi', N'818', 8, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (221, N'Rudana', N'819', 8, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (222, N'Saili', N'820', 8, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (223, N'Sili', N'821', 8, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (224, N'Silvassa', N'822', 8, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (225, N'Sindavni', N'823', 8, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (226, N'Udva', N'824', 8, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (227, N'Umbarkoi', N'825', 8, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (228, N'Vansda', N'826', 8, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (229, N'Vasona', N'827', 8, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (230, N'Velugam', N'828', 8, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (231, N'Brancavare', N'901', 9, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (232, N'Dagasi', N'902', 9, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (233, N'Daman', N'903', 9, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (234, N'Diu', N'904', 9, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (235, N'Magarvara', N'905', 9, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (236, N'Nagwa', N'906', 9, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (237, N'Pariali', N'907', 9, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (238, N'Passo Covo', N'908', 9, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (239, N'Central Delhi', N'1001', 10, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (240, N'East Delhi', N'1002', 10, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (241, N'New Delhi', N'1003', 10, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (242, N'North Delhi', N'1004', 10, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (243, N'North East Delhi', N'1005', 10, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (244, N'North West Delhi', N'1006', 10, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (245, N'Old Delhi', N'1007', 10, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (246, N'South Delhi', N'1008', 10, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (247, N'South West Delhi', N'1009', 10, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (248, N'West Delhi', N'1010', 10, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (249, N'Canacona', N'1101', 11, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (250, N'Candolim', N'1102', 11, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (251, N'Chinchinim', N'1103', 11, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (252, N'Cortalim', N'1104', 11, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (253, N'Goa', N'1105', 11, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (254, N'Jua', N'1106', 11, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (255, N'Madgaon', N'1107', 11, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (256, N'Mahem', N'1108', 11, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (257, N'Mapuca', N'1109', 11, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (258, N'Marmagao', N'1110', 11, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (259, N'Panji', N'1111', 11, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (260, N'Ponda', N'1112', 11, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (261, N'Sanvordem', N'1113', 11, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (262, N'Terekhol', N'1114', 11, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (263, N'Ahmedabad', N'1201', 12, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (264, N'Amreli', N'1202', 12, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (265, N'Anand', N'1203', 12, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (266, N'Banaskantha', N'1204', 12, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (267, N'Baroda', N'1205', 12, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (268, N'Bharuch', N'1206', 12, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (269, N'Bhavnagar', N'1207', 12, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (270, N'Dahod', N'1208', 12, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (271, N'Dang', N'1209', 12, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (272, N'Dwarka', N'1210', 12, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (273, N'Gandhinagar', N'1211', 12, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (274, N'Jamnagar', N'1212', 12, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (275, N'Junagadh', N'1213', 12, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (276, N'Kheda', N'1214', 12, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (277, N'Kutch', N'1215', 12, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (278, N'Mehsana', N'1216', 12, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (279, N'Nadiad', N'1217', 12, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (280, N'Narmada', N'1218', 12, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (281, N'Navsari', N'1219', 12, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (282, N'Panchmahals', N'1220', 12, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (283, N'Patan', N'1221', 12, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (284, N'Porbandar', N'1222', 12, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (285, N'Rajkot', N'1223', 12, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (286, N'Sabarkantha', N'1224', 12, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (287, N'Surat', N'1225', 12, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (288, N'Surendranagar', N'1226', 12, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (289, N'Vadodara', N'1227', 12, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (290, N'Valsad', N'1228', 12, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (291, N'Vapi', N'1229', 12, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (292, N'Ambala', N'1301', 13, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (293, N'Bhiwani', N'1302', 13, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (294, N'Faridabad', N'1303', 13, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (295, N'Fatehabad', N'1304', 13, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (296, N'Gurgaon', N'1305', 13, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (297, N'Hisar', N'1306', 13, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (298, N'Jhajjar', N'1307', 13, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (299, N'Jind', N'1308', 13, 99)
GO
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (300, N'Kaithal', N'1309', 13, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (301, N'Karnal', N'1310', 13, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (302, N'Kurukshetra', N'1311', 13, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (303, N'Mahendragarh', N'1312', 13, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (304, N'Mewat', N'1313', 13, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (305, N'Panchkula', N'1314', 13, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (306, N'Panipat', N'1315', 13, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (307, N'Rewari', N'1316', 13, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (308, N'Rohtak', N'1317', 13, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (309, N'Sirsa', N'1318', 13, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (310, N'Sonipat', N'1319', 13, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (311, N'Yamunanagar', N'1320', 13, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (312, N'Bilaspur', N'1401', 14, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (313, N'Chamba', N'1402', 14, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (314, N'Dalhousie', N'1403', 14, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (315, N'Hamirpur', N'1404', 14, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (316, N'Kangra', N'1405', 14, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (317, N'Kinnaur', N'1406', 14, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (318, N'Kullu', N'1407', 14, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (319, N'Lahaul & Spiti', N'1408', 14, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (320, N'Mandi', N'1409', 14, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (321, N'Shimla', N'1410', 14, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (322, N'Sirmaur', N'1411', 14, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (323, N'Solan', N'1412', 14, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (324, N'Una', N'1413', 14, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (325, N'Anantnag', N'1501', 15, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (326, N'Baramulla', N'1502', 15, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (327, N'Budgam', N'1503', 15, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (328, N'Doda', N'1504', 15, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (329, N'Jammu', N'1505', 15, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (330, N'Kargil', N'1506', 15, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (331, N'Kathua', N'1507', 15, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (332, N'Kupwara', N'1508', 15, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (333, N'Leh', N'1509', 15, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (334, N'Poonch', N'1510', 15, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (335, N'Pulwama', N'1511', 15, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (336, N'Rajauri', N'1512', 15, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (337, N'Srinagar', N'1513', 15, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (338, N'Udhampur', N'1514', 15, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (339, N'Bokaro', N'1601', 16, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (340, N'Chatra', N'1602', 16, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (341, N'Deoghar', N'1603', 16, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (342, N'Dhanbad', N'1604', 16, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (343, N'Dumka', N'1605', 16, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (344, N'East Singhbhum', N'1606', 16, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (345, N'Garhwa', N'1607', 16, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (346, N'Giridih', N'1608', 16, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (347, N'Godda', N'1609', 16, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (348, N'Gumla', N'1610', 16, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (349, N'Hazaribag', N'1611', 16, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (350, N'Jamtara', N'1612', 16, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (351, N'Koderma', N'1613', 16, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (352, N'Latehar', N'1614', 16, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (353, N'Lohardaga', N'1615', 16, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (354, N'Pakur', N'1616', 16, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (355, N'Palamu', N'1617', 16, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (356, N'Ranchi', N'1618', 16, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (357, N'Sahibganj', N'1619', 16, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (358, N'Seraikela', N'1620', 16, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (359, N'Simdega', N'1621', 16, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (360, N'West Singhbhum', N'1622', 16, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (361, N'Bagalkot', N'1701', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (362, N'Bangalore', N'1702', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (363, N'Bangalore Rural', N'1703', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (364, N'Belgaum', N'1704', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (365, N'Bellary', N'1705', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (366, N'Bhatkal', N'1706', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (367, N'Bidar', N'1707', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (368, N'Bijapur', N'1708', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (369, N'Chamrajnagar', N'1709', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (370, N'Chickmagalur', N'1710', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (371, N'Chikballapur', N'1711', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (372, N'Chitradurga', N'1712', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (373, N'Dakshina Kannada', N'1713', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (374, N'Davanagere', N'1714', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (375, N'Dharwad', N'1715', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (376, N'Gadag', N'1716', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (377, N'Gulbarga', N'1717', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (378, N'Hampi', N'1718', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (379, N'Hassan', N'1719', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (380, N'Haveri', N'1720', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (381, N'Hospet', N'1721', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (382, N'Karwar', N'1722', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (383, N'Kodagu', N'1723', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (384, N'Kolar', N'1724', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (385, N'Koppal', N'1725', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (386, N'Madikeri', N'1726', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (387, N'Mandya', N'1727', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (388, N'Mangalore', N'1728', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (389, N'Manipal', N'1729', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (390, N'Mysore', N'1730', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (391, N'Raichur', N'1731', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (392, N'Shimoga', N'1732', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (393, N'Sirsi', N'1733', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (394, N'Sringeri', N'1734', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (395, N'Srirangapatna', N'1735', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (396, N'Tumkur', N'1736', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (397, N'Udupi', N'1737', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (398, N'Uttara Kannada', N'1738', 17, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (399, N'Alappuzha', N'1801', 18, 99)
GO
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (400, N'Alleppey', N'1802', 18, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (401, N'Alwaye', N'1803', 18, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (402, N'Ernakulam', N'1804', 18, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (403, N'Idukki', N'1805', 18, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (404, N'Kannur', N'1806', 18, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (405, N'Kasargod', N'1807', 18, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (406, N'Kochi', N'1808', 18, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (407, N'Kollam', N'1809', 18, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (408, N'Kottayam', N'1810', 18, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (409, N'Kovalam', N'1811', 18, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (410, N'Kozhikode', N'1812', 18, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (411, N'Malappuram', N'1813', 18, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (412, N'Palakkad', N'1814', 18, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (413, N'Pathanamthitta', N'1815', 18, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (414, N'Perumbavoor', N'1816', 18, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (415, N'Thiruvananthapuram', N'1817', 18, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (416, N'Thrissur', N'1818', 18, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (417, N'Trichur', N'1819', 18, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (418, N'Trivandrum', N'1820', 18, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (419, N'Wayanad', N'1821', 18, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (420, N'Agatti Island', N'1901', 19, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (421, N'Bingaram Island', N'1902', 19, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (422, N'Bitra Island', N'1903', 19, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (423, N'Chetlat Island', N'1904', 19, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (424, N'Kadmat Island', N'1905', 19, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (425, N'Kalpeni Island', N'1906', 19, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (426, N'Kavaratti Island', N'1907', 19, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (427, N'Kiltan Island', N'1908', 19, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (428, N'Lakshadweep Sea', N'1909', 19, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (429, N'Minicoy Island', N'1910', 19, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (430, N'North Island', N'1911', 19, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (431, N'South Island', N'1912', 19, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (432, N'Anuppur', N'2001', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (433, N'Ashoknagar', N'2002', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (434, N'Balaghat', N'2003', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (435, N'Barwani', N'2004', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (436, N'Betul', N'2005', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (437, N'Bhind', N'2006', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (438, N'Bhopal', N'2007', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (439, N'Burhanpur', N'2008', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (440, N'Chhatarpur', N'2009', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (441, N'Chhindwara', N'2010', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (442, N'Damoh', N'2011', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (443, N'Datia', N'2012', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (444, N'Dewas', N'2013', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (445, N'Dhar', N'2014', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (446, N'Dindori', N'2015', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (447, N'Guna', N'2016', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (448, N'Gwalior', N'2017', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (449, N'Harda', N'2018', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (450, N'Hoshangabad', N'2019', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (451, N'Indore', N'2020', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (452, N'Jabalpur', N'2021', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (453, N'Jagdalpur', N'2022', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (454, N'Jhabua', N'2023', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (455, N'Katni', N'2024', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (456, N'Khandwa', N'2025', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (457, N'Khargone', N'2026', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (458, N'Mandla', N'2027', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (459, N'Mandsaur', N'2028', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (460, N'Morena', N'2029', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (461, N'Narsinghpur', N'2030', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (462, N'Neemuch', N'2031', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (463, N'Panna', N'2032', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (464, N'Raisen', N'2033', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (465, N'Rajgarh', N'2034', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (466, N'Ratlam', N'2035', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (467, N'Rewa', N'2036', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (468, N'Sagar', N'2037', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (469, N'Satna', N'2038', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (470, N'Sehore', N'2039', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (471, N'Seoni', N'2040', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (472, N'Shahdol', N'2041', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (473, N'Shajapur', N'2042', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (474, N'Sheopur', N'2043', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (475, N'Shivpuri', N'2044', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (476, N'Sidhi', N'2045', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (477, N'Tikamgarh', N'2046', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (478, N'Ujjain', N'2047', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (479, N'Umaria', N'2048', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (480, N'Vidisha', N'2049', 20, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (481, N'Ahmednagar', N'2101', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (482, N'Akola', N'2102', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (483, N'Amravati', N'2103', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (484, N'Aurangabad', N'2104', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (485, N'Beed', N'2105', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (486, N'Bhandara', N'2106', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (487, N'Buldhana', N'2107', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (488, N'Chandrapur', N'2108', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (489, N'Dhule', N'2109', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (490, N'Gadchiroli', N'2110', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (491, N'Gondia', N'2111', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (492, N'Hingoli', N'2112', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (493, N'Jalgaon', N'2113', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (494, N'Jalna', N'2114', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (495, N'Kolhapur', N'2115', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (496, N'Latur', N'2116', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (497, N'Mahabaleshwar', N'2117', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (498, N'Mumbai', N'2118', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (499, N'Mumbai City', N'2119', 21, 99)
GO
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (500, N'Mumbai Suburban', N'2120', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (501, N'Nagpur', N'2121', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (502, N'Nanded', N'2122', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (503, N'Nandurbar', N'2123', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (504, N'Nashik', N'2124', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (505, N'Osmanabad', N'2125', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (506, N'Parbhani', N'2126', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (507, N'Pune', N'2127', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (508, N'Raigad', N'2128', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (509, N'Ratnagiri', N'2129', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (510, N'Sangli', N'2130', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (511, N'Satara', N'2131', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (512, N'Sholapur', N'2132', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (513, N'Sindhudurg', N'2133', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (514, N'Thane', N'2134', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (515, N'Wardha', N'2135', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (516, N'Washim', N'2136', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (517, N'Yavatmal', N'2137', 21, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (518, N'Bishnupur', N'2201', 22, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (519, N'Chandel', N'2202', 22, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (520, N'Churachandpur', N'2203', 22, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (521, N'Imphal East', N'2204', 22, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (522, N'Imphal West', N'2205', 22, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (523, N'Senapati', N'2206', 22, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (524, N'Tamenglong', N'2207', 22, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (525, N'Thoubal', N'2208', 22, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (526, N'Ukhrul', N'2209', 22, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (527, N'East Garo Hills', N'2301', 23, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (528, N'East Khasi Hills', N'2302', 23, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (529, N'Jaintia Hills', N'2303', 23, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (530, N'Ri Bhoi', N'2304', 23, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (531, N'Shillong', N'2305', 23, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (532, N'South Garo Hills', N'2306', 23, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (533, N'West Garo Hills', N'2307', 23, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (534, N'West Khasi Hills', N'2308', 23, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (535, N'Aizawl', N'2401', 24, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (536, N'Champhai', N'2402', 24, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (537, N'Kolasib', N'2403', 24, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (538, N'Lawngtlai', N'2404', 24, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (539, N'Lunglei', N'2405', 24, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (540, N'Mamit', N'2406', 24, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (541, N'Saiha', N'2407', 24, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (542, N'Serchhip', N'2408', 24, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (543, N'Dimapur', N'2501', 25, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (544, N'Kohima', N'2502', 25, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (545, N'Mokokchung', N'2503', 25, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (546, N'Mon', N'2504', 25, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (547, N'Phek', N'2505', 25, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (548, N'Tuensang', N'2506', 25, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (549, N'Wokha', N'2507', 25, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (550, N'Zunheboto', N'2508', 25, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (551, N'Angul', N'2601', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (552, N'Balangir', N'2602', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (553, N'Balasore', N'2603', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (554, N'Baleswar', N'2604', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (555, N'Bargarh', N'2605', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (556, N'Berhampur', N'2606', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (557, N'Bhadrak', N'2607', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (558, N'Bhubaneswar', N'2608', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (559, N'Boudh', N'2609', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (560, N'Cuttack', N'2610', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (561, N'Deogarh', N'2611', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (562, N'Dhenkanal', N'2612', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (563, N'Gajapati', N'2613', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (564, N'Ganjam', N'2614', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (565, N'Jagatsinghapur', N'2615', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (566, N'Jajpur', N'2616', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (567, N'Jharsuguda', N'2617', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (568, N'Kalahandi', N'2618', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (569, N'Kandhamal', N'2619', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (570, N'Kendrapara', N'2620', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (571, N'Kendujhar', N'2621', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (572, N'Khordha', N'2622', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (573, N'Koraput', N'2623', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (574, N'Malkangiri', N'2624', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (575, N'Mayurbhanj', N'2625', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (576, N'Nabarangapur', N'2626', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (577, N'Nayagarh', N'2627', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (578, N'Nuapada', N'2628', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (579, N'Puri', N'2629', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (580, N'Rayagada', N'2630', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (581, N'Rourkela', N'2631', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (582, N'Sambalpur', N'2632', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (583, N'Subarnapur', N'2633', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (584, N'Sundergarh', N'2634', 26, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (585, N'Bahur', N'2701', 27, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (586, N'Karaikal', N'2701', 27, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (587, N'Mahe', N'2701', 27, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (588, N'Pondicherry', N'2701', 27, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (589, N'Purnankuppam', N'2701', 27, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (590, N'Valudavur', N'2701', 27, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (591, N'Villianur', N'2701', 27, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (592, N'Yanam', N'2701', 27, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (593, N'Amritsar', N'2801', 28, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (594, N'Barnala', N'2801', 28, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (595, N'Bathinda', N'2801', 28, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (596, N'Faridkot', N'2801', 28, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (597, N'Fatehgarh Sahib', N'2801', 28, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (598, N'Ferozepur', N'2801', 28, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (599, N'Gurdaspur', N'2801', 28, 99)
GO
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (600, N'Hoshiarpur', N'2801', 28, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (601, N'Jalandhar', N'2801', 28, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (602, N'Kapurthala', N'2801', 28, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (603, N'Ludhiana', N'2801', 28, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (604, N'Mansa', N'2801', 28, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (605, N'Moga', N'2801', 28, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (606, N'Muktsar', N'2801', 28, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (607, N'Nawanshahr', N'2801', 28, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (608, N'Pathankot', N'2801', 28, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (609, N'Patiala', N'2801', 28, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (610, N'Rupnagar', N'2801', 28, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (611, N'Sangrur', N'2801', 28, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (612, N'SAS Nagar', N'2801', 28, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (613, N'Tarn Taran', N'2801', 28, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (614, N'Ajmer', N'2901', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (615, N'Alwar', N'2902', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (616, N'Banswara', N'2903', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (617, N'Baran', N'2904', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (618, N'Barmer', N'2905', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (619, N'Bharatpur', N'2906', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (620, N'Bhilwara', N'2907', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (621, N'Bikaner', N'2908', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (622, N'Bundi', N'2909', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (623, N'Chittorgarh', N'2910', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (624, N'Churu', N'2911', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (625, N'Dausa', N'2912', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (626, N'Dholpur', N'2913', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (627, N'Dungarpur', N'2914', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (628, N'Hanumangarh', N'2915', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (629, N'Jaipur', N'2916', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (630, N'Jaisalmer', N'2917', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (631, N'Jalore', N'2918', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (632, N'Jhalawar', N'2919', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (633, N'Jhunjhunu', N'2920', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (634, N'Jodhpur', N'2921', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (635, N'Karauli', N'2922', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (636, N'Kota', N'2923', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (637, N'Nagaur', N'2924', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (638, N'Pali', N'2925', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (639, N'Pilani', N'2926', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (640, N'Rajsamand', N'2927', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (641, N'Sawai Madhopur', N'2928', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (642, N'Sikar', N'2929', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (643, N'Sirohi', N'2930', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (644, N'Sri Ganganagar', N'2931', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (645, N'Tonk', N'2932', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (646, N'Udaipur', N'2933', 29, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (647, N'Barmiak', N'3001', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (648, N'Be', N'3002', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (649, N'Bhurtuk', N'3003', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (650, N'Chhubakha', N'3004', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (651, N'Chidam', N'3005', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (652, N'Chubha', N'3006', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (653, N'Chumikteng', N'3007', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (654, N'Dentam', N'3008', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (655, N'Dikchu', N'3009', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (656, N'Dzongri', N'3010', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (657, N'Gangtok', N'3011', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (658, N'Gauzing', N'3012', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (659, N'Gyalshing', N'3013', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (660, N'Hema', N'3014', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (661, N'Kerung', N'3015', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (662, N'Lachen', N'3016', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (663, N'Lachung', N'3017', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (664, N'Lema', N'3018', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (665, N'Lingtam', N'3019', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (666, N'Lungthu', N'3020', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (667, N'Mangan', N'3021', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (668, N'Namchi', N'3022', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (669, N'Namthang', N'3023', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (670, N'Nanga', N'3024', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (671, N'Nantang', N'3025', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (672, N'Naya Bazar', N'3026', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (673, N'Padamachen', N'3027', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (674, N'Pakhyong', N'3028', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (675, N'Pemayangtse', N'3029', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (676, N'Phensang', N'3030', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (677, N'Rangli', N'3031', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (678, N'Rinchingpong', N'3032', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (679, N'Sakyong', N'3033', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (680, N'Samdong', N'3034', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (681, N'Singtam', N'3035', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (682, N'Siniolchu', N'3035', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (683, N'Sombari', N'3036', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (684, N'Soreng', N'3037', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (685, N'Sosing', N'3038', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (686, N'Tekhug', N'3039', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (687, N'Temi', N'3040', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (688, N'Tsetang', N'3041', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (689, N'Tsomgo', N'3042', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (690, N'Tumlong', N'3043', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (691, N'Yangang', N'3044', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (692, N'Yumtang', N'3045', 30, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (693, N'Chennai', N'3101', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (694, N'Chidambaram', N'3102', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (695, N'Chingleput', N'3103', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (696, N'Coimbatore', N'3104', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (697, N'Courtallam', N'3105', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (698, N'Cuddalore', N'3106', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (699, N'Dharmapuri', N'3107', 31, 99)
GO
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (700, N'Dindigul', N'3108', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (701, N'Erode', N'3109', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (702, N'Hosur', N'3110', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (703, N'Kanchipuram', N'3111', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (704, N'Kanyakumari', N'3112', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (705, N'Karaikudi', N'3113', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (706, N'Karur', N'3114', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (707, N'Kodaikanal', N'3115', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (708, N'Kovilpatti', N'3116', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (709, N'Krishnagiri', N'3117', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (710, N'Kumbakonam', N'3118', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (711, N'Madurai', N'3119', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (712, N'Mayiladuthurai', N'3120', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (713, N'Nagapattinam', N'3121', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (714, N'Nagarcoil', N'3122', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (715, N'Namakkal', N'3123', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (716, N'Neyveli', N'3124', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (717, N'Nilgiris', N'3125', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (718, N'Ooty', N'3126', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (719, N'Palani', N'3127', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (720, N'Perambalur', N'3128', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (721, N'Pollachi', N'3129', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (722, N'Pudukkottai', N'3130', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (723, N'Rajapalayam', N'3131', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (724, N'Ramanathapuram', N'3132', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (725, N'Salem', N'3133', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (726, N'Sivaganga', N'3134', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (727, N'Sivakasi', N'3135', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (728, N'Thanjavur', N'3136', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (729, N'Theni', N'3137', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (730, N'Thoothukudi', N'3138', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (731, N'Tiruchirappalli', N'3139', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (732, N'Tirunelveli', N'3140', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (733, N'Tirupur', N'3141', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (734, N'Tiruvallur', N'3142', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (735, N'Tiruvannamalai', N'3143', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (736, N'Tiruvarur', N'3144', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (737, N'Trichy', N'3145', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (738, N'Tuticorin', N'3146', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (739, N'Vellore', N'3147', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (740, N'Villupuram', N'3148', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (741, N'Virudhunagar', N'3149', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (742, N'Yercaud', N'3150', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (743, N'Hyderabad', N'3201', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (744, N'Warangal', N'3202', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (745, N'Khammam', N'3203', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (746, N'Nalgonda', N'3204', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (747, N'Ramagundam', N'3205', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (748, N'Nizamabad', N'3206', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (749, N'Mahabubnagar', N'3207', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (750, N'Suryapet', N'3208', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (751, N'Miryalaguda', N'3209', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (752, N'Karimnagar', N'3210', 31, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (753, N'Agartala', N'3301', 33, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (754, N'Ambasa', N'3302', 33, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (755, N'Bampurbari', N'3303', 33, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (756, N'Belonia', N'3304', 33, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (757, N'Dhalai', N'3305', 33, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (758, N'Dharam Nagar', N'3306', 33, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (759, N'Kailashahar', N'3307', 33, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (760, N'Kamal Krishnabari', N'3308', 33, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (761, N'Khopaiyapara', N'3309', 33, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (762, N'Khowai', N'3310', 33, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (763, N'Phuldungsei', N'3311', 33, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (764, N'Radha Kishore Pur', N'3312', 33, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (765, N'Tripura', N'3313', 33, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (766, N'Achhnera', N'3401', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (767, N'Adari', N'3402', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (768, N'Agra', N'3403', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (769, N'Aligarh', N'3404', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (770, N'Allahabad', N'3405', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (771, N'Amroha', N'3406', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (772, N'Azamgarh', N'3407', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (773, N'Bahraich', N'3408', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (774, N'Ballia', N'3409', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (775, N'Balrampur', N'3410', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (776, N'Banda', N'3411', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (777, N'Bareilly', N'3412', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (778, N'Chandausi', N'3413', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (779, N'Dadri', N'3414', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (780, N'Deoria', N'3415', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (781, N'Etawah', N'3416', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (782, N'Fatehabad', N'3417', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (783, N'Fatehpur', N'3418', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (784, N'Greater Noida', N'3419', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (785, N'Hamirpur', N'3420', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (786, N'Hardoi', N'3421', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (787, N'Jajmau', N'3422', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (788, N'Jaunpur', N'3423', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (789, N'Jhansi', N'3424', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (790, N'Kalpi', N'3425', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (791, N'Kanpur', N'3426', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (792, N'Kota', N'3426', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (793, N'Laharpur', N'3427', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (794, N'Lakhimpur', N'3428', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (795, N'Lal Gopalganj Nindaura', N'3429', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (796, N'Lalganj', N'3430', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (797, N'Lalitpur', N'3431', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (798, N'Lar', N'3432', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (799, N'Loni', N'3433', 34, 99)
GO
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (800, N'Lucknow', N'3434', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (801, N'Mathura', N'3435', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (802, N'Meerut', N'3436', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (803, N'Modinagar', N'3437', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (804, N'Muradnagar', N'3438', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (805, N'Nagina', N'3438', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (806, N'Najibabad', N'3439', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (807, N'Nakur', N'3440', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (808, N'Nanpara', N'3441', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (809, N'Naraura', N'3442', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (810, N'Naugawan Sadat', N'3443', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (811, N'Nautanwa', N'3444', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (812, N'Nawabganj', N'3445', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (813, N'Nehtaur', N'3446', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (814, N'NOIDA', N'3447', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (815, N'Noorpur', N'3448', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (816, N'Obra', N'3449', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (817, N'Orai', N'3450', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (818, N'Padrauna', N'3451', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (819, N'Palia Kalan', N'3452', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (820, N'Parasi', N'3453', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (821, N'Phulpur', N'3454', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (822, N'Pihani', N'3455', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (823, N'Pilibhit', N'3456', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (824, N'Pilkhuwa', N'3457', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (825, N'Powayan', N'3458', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (826, N'Pukhrayan', N'3459', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (827, N'Puranpur', N'3460', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (828, N'Purquazi', N'3461', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (829, N'Purwa', N'3462', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (830, N'Rae Bareli', N'3463', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (831, N'Rampur', N'3464', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (832, N'Rampur Maniharan', N'3465', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (833, N'Rasra', N'3466', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (834, N'Rath', N'3467', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (835, N'Renukoot', N'3468', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (836, N'Reoti', N'3469', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (837, N'Robertsganj', N'3470', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (838, N'Rudauli', N'3471', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (839, N'Rudrapur', N'3472', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (840, N'Sadabad', N'3473', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (841, N'Safipur', N'3474', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (842, N'Saharanpur', N'3475', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (843, N'Sahaspur', N'3476', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (844, N'Sahaswan', N'3477', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (845, N'Sahawar', N'3478', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (846, N'Sahjanwa', N'3479', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (847, N'Saidpur', N'3480', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (848, N'Sambhal', N'3481', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (849, N'Samdhan', N'3482', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (850, N'Samthar', N'3483', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (851, N'Sandi', N'3484', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (852, N'Sandila', N'3485', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (853, N'Sardhana', N'3486', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (854, N'Seohara', N'3487', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (855, N'Shahganj', N'3488', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (856, N'Shahjahanpur', N'3489', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (857, N'Shamli', N'3490', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (858, N'Sherkot', N'3491', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (859, N'Shikarpur', N'3492', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (860, N'Shikohabad', N'3493', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (861, N'Shishgarh', N'3494', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (862, N'Siana', N'3495', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (863, N'Sikanderpur', N'3496', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (864, N'Sikandra Rao', N'3497', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (865, N'Sikandrabad', N'3498', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (866, N'Sirsaganj', N'3499', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (867, N'Sirsi', N'34100', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (868, N'Sitapur', N'34101', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (869, N'Soron', N'34102', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (870, N'Suar', N'34103', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (871, N'Sultanpur', N'34104', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (872, N'Sumerpur', N'34105', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (873, N'Tanda', N'34106', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (874, N'Tetri Bazar', N'34107', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (875, N'Thakurdwara', N'34108', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (876, N'Thana Bhawan', N'34109', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (877, N'Tilhar', N'34110', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (878, N'Tirwaganj', N'34111', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (879, N'Tulsipur', N'34112', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (880, N'Tundla', N'34113', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (881, N'Unnao', N'34114', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (882, N'Utraula', N'34115', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (883, N'Varanasi', N'34116', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (884, N'Vrindavan', N'34117', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (885, N'Warhapur', N'34118', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (886, N'Zaidpur', N'34119', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (887, N'Zamania', N'34120', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (888, N'Muzaffarnagar', N'34121', 34, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (889, N'Almora', N'3501', 35, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (890, N'Bazpur', N'3502', 35, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (891, N'Chamba', N'3503', 35, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (892, N'Dehradun', N'3504', 35, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (893, N'Haldwani', N'3505', 35, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (894, N'Haridwar', N'3506', 35, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (895, N'Jaspur', N'3507', 35, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (896, N'Kashipur', N'3508', 35, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (897, N'kichha', N'3509', 35, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (898, N'Kotdwara', N'3510', 35, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (899, N'Manglaur', N'3511', 35, 99)
GO
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (900, N'Mussoorie', N'3512', 35, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (901, N'Nagla', N'3513', 35, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (902, N'Nainital', N'3514', 35, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (903, N'Pauri', N'3515', 35, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (904, N'Pithoragarh', N'3516', 35, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (905, N'Ramnagar', N'3517', 35, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (906, N'Rishikesh', N'3518', 35, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (907, N'Roorkee', N'3519', 35, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (908, N'Rudrapur', N'3520', 35, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (909, N'Sitarganj', N'3521', 35, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (910, N'Tehri', N'3522', 35, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (911, N'Alipurduar', N'3601', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (912, N'Arambagh', N'3602', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (913, N'Asansol', N'3603', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (914, N'Baharampur', N'3604', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (915, N'Bally', N'3605', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (916, N'Balurghat', N'3606', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (917, N'Bankura', N'3607', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (918, N'Barakar', N'3608', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (919, N'Barasat', N'3609', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (920, N'Bardhaman', N'3610', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (921, N'Bidhan Nagar', N'3611', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (922, N'Chinsura', N'3612', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (923, N'Contai', N'3613', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (924, N'Cooch Behar', N'3614', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (925, N'Darjeeling', N'3615', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (926, N'Durgapur', N'3616', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (927, N'Haldia', N'3617', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (928, N'Howrah', N'3618', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (929, N'Islampur', N'3619', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (930, N'Jhargram', N'3620', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (931, N'Kharagpur', N'3621', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (932, N'Kolkata', N'3622', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (933, N'Mainaguri', N'3623', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (934, N'Mal', N'3624', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (935, N'Mathabhanga', N'3625', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (936, N'Medinipur', N'3626', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (937, N'Memari', N'3627', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (938, N'Monoharpur', N'3628', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (939, N'Murshidabad', N'3629', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (940, N'Nabadwip', N'3630', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (941, N'Naihati', N'3631', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (942, N'Panchla', N'3632', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (943, N'Pandua', N'3633', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (944, N'Paschim Punropara', N'3634', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (945, N'Purulia', N'3635', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (946, N'Raghunathpur', N'3636', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (947, N'Raiganj', N'3637', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (948, N'Rampurhat', N'3638', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (949, N'Ranaghat', N'3639', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (950, N'Sainthia', N'3640', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (951, N'Santipur', N'3641', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (952, N'Siliguri', N'3642', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (953, N'Sonamukhi', N'3643', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (954, N'Srirampore', N'3644', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (955, N'Suri', N'3645', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (956, N'Taki', N'3646', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (957, N'Tamluk', N'3647', 36, 99)
INSERT [dbo].[LOC_City] ([CityId], [CityName], [CityCode], [StateId], [CountryId]) VALUES (958, N'Tarakeswar', N'3648', 36, 99)
SET IDENTITY_INSERT [dbo].[LOC_City] OFF
GO
SET IDENTITY_INSERT [dbo].[LOC_Country] ON 

INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (1, N'Afganistan', N'AFG')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (2, N'Albania', N'ALB')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (3, N'Algeria', N'DZA')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (4, N'American Samoa', N'ASM')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (5, N'Andorra', N'AND')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (6, N'Angola', N'AGO')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (7, N'Anguilla', N'AIA')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (8, N'Antarctica', NULL)
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (9, N'Antigua and Barbuda', N'ATG')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (10, N'Argentina', N'ARG')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (11, N'Armenia', N'ARM')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (12, N'Aruba', N'ABW')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (13, N'Australia', N'AUS')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (14, N'Austria', N'AUT')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (15, N'Azerbaijan', N'AZE')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (16, N'Bahamas', N'BHS')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (17, N'Bahrain', N'BHR')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (18, N'Bangladesh', N'BGD')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (19, N'Barbados', N'BRB')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (20, N'Belarus', N'BLR')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (21, N'Belgium', N'BEL')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (22, N'Belize', N'BLZ')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (23, N'Benin', N'BEN')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (24, N'Bermuda', N'BMU')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (25, N'Bhutan', N'BTN')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (26, N'Bolivia', N'BOL')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (27, N'Bosnia and Herzegovina', N'BIH')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (28, N'Botswana', N'BWA')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (29, N'Bouvet Island', NULL)
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (30, N'Brazil', N'BRA')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (31, N'British Indian Ocean Territory', NULL)
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (32, N'Brunei Darussalam', N'BRN')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (33, N'Bulgaria', N'BGR')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (34, N'Burkina Faso', N'BFA')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (35, N'Burundi', N'BDI')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (36, N'Cambodia', N'KHM')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (37, N'Cameroon', N'CMR')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (38, N'Canada', N'CAN')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (39, N'Cape Verde', N'CPV')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (40, N'Cayman Islands', N'CYM')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (41, N'Central African Republic', N'CAF')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (42, N'Chad', N'TCD')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (43, N'Chile', N'CHL')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (44, N'China', N'CHN')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (45, N'Christmas Island', NULL)
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (46, N'Cocos (Keeling) Islands', NULL)
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (47, N'Colombia', N'COL')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (48, N'Comoros', N'COM')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (49, N'Congo', N'COG')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (50, N'Congo, the Democratic Republic of the', N'COD')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (51, N'Cook Islands', N'COK')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (52, N'Costa Rica', N'CRI')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (53, N'Cote D''Ivoire', N'CIV')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (54, N'Croatia', N'HRV')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (55, N'Cuba', N'CUB')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (56, N'Cyprus', N'CYP')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (57, N'Czech Republic', N'CZE')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (58, N'Denmark', N'DNK')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (59, N'Djibouti', N'DJI')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (60, N'Dominica', N'DMA')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (61, N'Dominican Republic', N'DOM')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (62, N'Ecuador', N'ECU')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (63, N'Egypt', N'EGY')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (64, N'El Salvador', N'SLV')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (65, N'Equatorial Guinea', N'GNQ')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (66, N'Eritrea', N'ERI')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (67, N'Estonia', N'EST')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (68, N'Ethiopia', N'ETH')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (69, N'Falkland Islands (Malvinas)', N'FLK')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (70, N'Faroe Islands', N'FRO')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (71, N'Fiji', N'FJI')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (72, N'Finland', N'FIN')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (73, N'France', N'FRA')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (74, N'French Guiana', N'GUF')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (75, N'French Polynesia', N'PYF')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (76, N'French Southern Territories', NULL)
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (77, N'Gabon', N'GAB')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (78, N'Gambia', N'GMB')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (79, N'Georgia', N'GEO')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (80, N'Germany', N'DEU')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (81, N'Ghana', N'GHA')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (82, N'Gibraltar', N'GIB')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (83, N'Greece', N'GRC')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (84, N'Greenland', N'GRL')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (85, N'Grenada', N'GRD')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (86, N'Guadeloupe', N'GLP')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (87, N'Guam', N'GUM')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (88, N'Guatemala', N'GTM')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (89, N'Guinea', N'GIN')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (90, N'Guinea-Bissau', N'GNB')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (91, N'Guyana', N'GUY')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (92, N'Haiti', N'HTI')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (93, N'Heard Island and Mcdonald Islands', NULL)
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (94, N'Holy See (Vatican City State)', N'VAT')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (95, N'Honduras', N'HND')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (96, N'Hong Kong', N'HKG')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (97, N'Hungary', N'HUN')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (98, N'Iceland', N'ISL')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (99, N'India', N'IND')
GO
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (100, N'Indonesia', N'IDN')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (101, N'Iran, Islamic Republic of', N'IRN')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (102, N'Iraq', N'IRQ')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (103, N'Ireland', N'IRL')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (104, N'Israel', N'ISR')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (105, N'Italy', N'ITA')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (106, N'Jamaica', N'JAM')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (107, N'Japan', N'JPN')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (108, N'Jordan', N'JOR')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (109, N'Kazakhstan', N'KAZ')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (110, N'Kenya', N'KEN')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (111, N'Kiribati', N'KIR')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (112, N'Korea, Democratic People''s Republic of', N'PRK')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (113, N'Korea, Republic of', N'KOR')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (114, N'Kuwait', N'KWT')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (116, N'Lao People''s Democratic Republic', N'LAO')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (117, N'Latvia', N'LVA')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (118, N'Lebanon', N'LBN')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (119, N'Lesotho', N'LSO')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (120, N'Liberia', N'LBR')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (121, N'Libyan Arab Jamahiriya', N'LBY')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (122, N'Liechtenstein', N'LIE')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (123, N'Lithuania', N'LTU')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (124, N'Luxembourg', N'LUX')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (125, N'Macao', N'MAC')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (126, N'Macedonia, the Former Yugoslav Republic of', N'MKD')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (127, N'Madagascar', N'MDG')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (128, N'Malawi', N'MWI')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (129, N'Malaysia', N'MYS')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (130, N'Maldives', N'MDV')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (131, N'Mali', N'MLI')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (132, N'Malta', N'MLT')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (133, N'Marshall Islands', N'MHL')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (134, N'Martinique', N'MTQ')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (135, N'Mauritania', N'MRT')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (136, N'Mauritius', N'MUS')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (137, N'Mayotte', NULL)
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (138, N'Mexico', N'MEX')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (139, N'Micronesia, Federated States of', N'FSM')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (140, N'Moldova, Republic of', N'MDA')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (141, N'Monaco', N'MCO')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (142, N'Mongolia', N'MNG')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (143, N'Montserrat', N'MSR')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (144, N'Morocco', N'MAR')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (145, N'Mozambique', N'MOZ')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (146, N'Myanmar', N'MMR')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (147, N'Namibia', N'NAM')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (148, N'Nauru', N'NRU')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (149, N'Nepal', N'NPL')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (150, N'Netherlands', N'NLD')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (151, N'Netherlands Antilles', N'ANT')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (152, N'New Caledonia', N'NCL')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (153, N'New Zealand', N'NZL')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (154, N'Nicaragua', N'NIC')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (155, N'Niger', N'NER')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (156, N'Nigeria', N'NGA')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (157, N'Niue', N'NIU')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (158, N'Norfolk Island', N'NFK')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (159, N'Northern Mariana Islands', N'MNP')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (160, N'Norway', N'NOR')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (161, N'Oman', N'OMN')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (162, N'Pakistan', N'PAK')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (163, N'Palau', N'PLW')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (164, N'Palestinian Territory, Occupied', NULL)
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (165, N'Panama', N'PAN')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (166, N'Papua New Guinea', N'PNG')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (167, N'Paraguay', N'PRY')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (168, N'Peru', N'PER')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (169, N'Philippines', N'PHL')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (170, N'Pitcairn', N'PCN')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (171, N'Poland', N'POL')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (172, N'Portugal', N'PRT')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (173, N'Puerto Rico', N'PRI')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (174, N'Qatar', N'QAT')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (175, N'Reunion', N'REU')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (176, N'Romania', N'ROM')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (177, N'Russian Federation', N'RUS')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (178, N'Rwanda', N'RWA')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (179, N'Saint Helena', N'SHN')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (180, N'Saint Kitts and Nevis', N'KNA')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (181, N'Saint Lucia', N'LCA')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (182, N'Saint Pierre and Miquelon', N'SPM')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (183, N'Saint Vincent and the Grenadines', N'VCT')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (184, N'Samoa', N'WSM')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (185, N'San Marino', N'SMR')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (186, N'Sao Tome and Principe', N'STP')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (187, N'Saudi Arabia', N'SAU')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (188, N'Senegal', N'SEN')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (189, N'Serbia and Montenegro', NULL)
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (190, N'Seychelles', N'SYC')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (191, N'Sierra Leone', N'SLE')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (192, N'Singapore', N'SGP')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (193, N'Slovakia', N'SVK')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (194, N'Slovenia', N'SVN')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (195, N'Solomon Islands', N'SLB')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (196, N'Somalia', N'SOM')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (197, N'South Africa', N'ZAF')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (198, N'South Georgia and the South Sandwich Islands', NULL)
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (199, N'Spain', N'ESP')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (200, N'Sri Lanka', N'LKA')
GO
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (201, N'Sudan', N'SDN')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (202, N'Suriname', N'SUR')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (203, N'Svalbard and Jan Mayen', N'SJM')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (204, N'Swaziland', N'SWZ')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (205, N'Sweden', N'SWE')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (206, N'Switzerland', N'CHE')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (207, N'Syrian Arab Republic', N'SYR')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (208, N'Taiwan, Province of China', N'TWN')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (209, N'Tajikistan', N'TJK')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (210, N'Tanzania, United Republic of', N'TZA')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (211, N'Thailand', N'THA')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (212, N'Timor-Leste', NULL)
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (213, N'Togo', N'TGO')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (214, N'Tokelau', N'TKL')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (215, N'Tonga', N'TON')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (216, N'Trinidad and Tobago', N'TTO')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (217, N'Tunisia', N'TUN')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (218, N'Turkey', N'TUR')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (219, N'Turkmenistan', N'TKM')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (220, N'Turks and Caicos Islands', N'TCA')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (221, N'Tuvalu', N'TUV')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (222, N'Uganda', N'UGA')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (223, N'Ukraine', N'UKR')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (224, N'United Arab Emirates', N'ARE')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (225, N'United Kingdom', N'GBR')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (226, N'United States', N'USA')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (227, N'United States Minor Outlying Islands', NULL)
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (228, N'Uruguay', N'URY')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (229, N'Uzbekistan', N'UZB')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (230, N'Vanuatu', N'VUT')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (231, N'Venezuela', N'VEN')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (232, N'Viet Nam', N'VNM')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (233, N'Virgin Islands, British', N'VGB')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (234, N'Virgin Islands, U.s.', N'VIR')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (235, N'Wallis and Futuna', N'WLF')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (236, N'Western Sahara', N'ESH')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (237, N'Yemen', N'YEM')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (238, N'Zambia', N'ZMB')
INSERT [dbo].[LOC_Country] ([CountryId], [CountryName], [CountryCode]) VALUES (239, N'Zimbabwe', N'ZWE')
SET IDENTITY_INSERT [dbo].[LOC_Country] OFF
GO
SET IDENTITY_INSERT [dbo].[LOC_State] ON 

INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (1, N'Andaman and Nicobar Islands', N'AN', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (2, N'Andhra Pradesh', N'AP', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (3, N'Arunachal Pradesh', N'AR', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (4, N'Assam', N'AS', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (5, N'Bihar', N'BR', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (6, N'Chattisgarh', N'CT', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (7, N'Chandigarh', N'CH', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (8, N'Dadra and Nagar Haveli', N'DN', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (9, N'Daman and Diu', N'DD', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (10, N'Delhi', N'DL', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (11, N'Goa', N'GA', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (12, N'Gujarat', N'GJ', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (13, N'Haryana', N'HR', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (14, N'Himachal Pradesh', N'HP', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (15, N'Jammu and Kashmir', N'JK', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (16, N'Jharkhand', N'JH', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (17, N'Karnataka', N'KA', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (18, N'Kerala', N'KL', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (19, N'Lakshadweep Islands', N'LD', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (20, N'Madhya Pradesh', N'MP', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (21, N'Maharashtra', N'MH', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (22, N'Manipur', N'MN', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (23, N'Meghalaya', N'ML', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (24, N'Mizoram', N'MZ', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (25, N'Nagaland', N'NL', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (26, N'Odisha', N'OD', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (27, N'Pondicherry', N'PY', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (28, N'Punjab', N'PB', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (29, N'Rajasthan', N'RJ', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (30, N'Sikkim', N'SK', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (31, N'Tamil Nadu', N'TN', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (32, N'Telangana', N'TS', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (33, N'Tripura', N'TR', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (34, N'Uttar Pradesh', N'UP', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (35, N'Uttarakhand', N'UK', 99)
INSERT [dbo].[LOC_State] ([StateId], [StateName], [StateCode], [CountryId]) VALUES (36, N'West Bengal', N'WB', 99)
SET IDENTITY_INSERT [dbo].[LOC_State] OFF
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName]) VALUES (1, N'ABFRL')
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [ProductId], [Quantity], [TotalPrice]) VALUES (1, 27, 3, 2, CAST(1738.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [ProductId], [Quantity], [TotalPrice]) VALUES (2, 27, 3, 2, CAST(1738.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [ProductId], [Quantity], [TotalPrice]) VALUES (3, 27, 3, 2, CAST(1738.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderNo], [ShippingAddress], [CountryId], [StateId], [CityId], [OrderDate], [OrderStatus]) VALUES (1, 1, N'sdfjjbivbdvdffvndfjvjdfvd', N'sfdkwhfwn  jkndsdb sdnnsdbc jjcsddjb', NULL, NULL, NULL, CAST(N'2023-05-14T00:00:00.000' AS DateTime), N'Pending')
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderNo], [ShippingAddress], [CountryId], [StateId], [CityId], [OrderDate], [OrderStatus]) VALUES (25, 4, N'2171B252201E4DAF98E20D90A76EBD1B', N'bhagvati para main road', NULL, NULL, NULL, CAST(N'2023-10-11T08:04:24.123' AS DateTime), N'Panding')
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderNo], [ShippingAddress], [CountryId], [StateId], [CityId], [OrderDate], [OrderStatus]) VALUES (26, 4, N'6AF5BB9A9E6B40C2A1FE1C9FC71F0936', N'bhagvati para main road', NULL, NULL, NULL, CAST(N'2023-10-11T08:25:53.223' AS DateTime), N'Panding')
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderNo], [ShippingAddress], [CountryId], [StateId], [CityId], [OrderDate], [OrderStatus]) VALUES (27, 4, N'B068EFA6CC8B4016B48E5E135644961E', N'bhagvati para main road', NULL, NULL, NULL, CAST(N'2023-10-11T08:26:53.460' AS DateTime), N'Panding')
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderNo], [ShippingAddress], [CountryId], [StateId], [CityId], [OrderDate], [OrderStatus]) VALUES (28, 4, N'BB50CFF138634407B4312F4815CCDBEC', N'bhagvati para main road', NULL, NULL, NULL, CAST(N'2023-10-11T08:31:28.857' AS DateTime), N'Panding')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [CategoryId], [Name], [ManufacturerId], [Description], [Price], [Discount], [Quantity], [ExpDate], [ImageUrl]) VALUES (3, 1, N'Denim Co. Men''s Regular Fit Hooded Bomber Jacket', 1, N'Care Instructions: Dry Clean Only
Fit Type: Regular Fit
Color name: Teal
Material: Synthetic
long sleeve
dry clean only', CAST(869.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 400, NULL, N'/ProductsImages/1.jpg')
INSERT [dbo].[Products] ([ProductId], [CategoryId], [Name], [ManufacturerId], [Description], [Price], [Discount], [Quantity], [ExpDate], [ImageUrl]) VALUES (4, 1, N'Veirdo® Paisley Printed Zip Up Cotton Shacket/Jacket for Men', 1, N'Care Instructions: Hand Wash Only
Fit Type: Regular Fit
Brand: Veirdo
Care Instructions: Hand Wash
Pack Contains: 1 Shacket
Pattern: All Over Print; Sleeve Type: Full Sleeves; Fit: Regular Fit
Material: Pure Cotton', CAST(869.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 500, NULL, N'/ProductsImages/2.jpg')
INSERT [dbo].[Products] ([ProductId], [CategoryId], [Name], [ManufacturerId], [Description], [Price], [Discount], [Quantity], [ExpDate], [ImageUrl]) VALUES (5, 2, N'Ayukta Women''s Rayon A-Line Kurta', 1, N'Care Instructions: Machine Wash
Fit Type: A-Line
Calf length
A-line
Note:- model(height 5.8'''') is wearing size S. Length of kurti is 48 Inches
Material: Rayon
color: peach
pattern: Printed
Color Name: Pink', CAST(242.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 200, NULL, N'/ProductsImages/3.jpg')
INSERT [dbo].[Products] ([ProductId], [CategoryId], [Name], [ManufacturerId], [Description], [Price], [Discount], [Quantity], [ExpDate], [ImageUrl]) VALUES (7, 2, N'Ayukta Women''s Cotton Anarkali Kurti with Dupatta', 1, N'Care Instructions: Machine Wash
Fit Type: Anarkali
Material: Cotton
Care Instructions: Machine Wash
Neck style: Round neck
Sleeve type: 3/4 Sleeve
Item length: Ankle Length
Pack of 1
Disclaimer: Slight color variation is possible due to photographic effects & printing limitations
Made in India', CAST(898.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 300, NULL, N'/ProductsImages/4.jpg')
INSERT [dbo].[Products] ([ProductId], [CategoryId], [Name], [ManufacturerId], [Description], [Price], [Discount], [Quantity], [ExpDate], [ImageUrl]) VALUES (8, 2, N'MANOHARI Most Trendy Banarasi Silk Woven Pattern Jacquard Work Saree for Women', 1, N'Care Instructions: Dry Clean Only
Saree Fabric: Banarasi Silk , Blouse Fabric : Malai Silk
Saree Color: Red , Blouse Color: Green
Saree Length: 5.5 Meter , Blouse Length: 0.8 Meter
Saree comes with unstitched blouse piece,which is attached with end of the saree only. Buyer have to cut blouse part from the saree. Stiching service will not be available. There might be color variation due to screen resolution and digital photography
', CAST(2999.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 80, NULL, N'/ProductsImages/5.jpg')
INSERT [dbo].[Products] ([ProductId], [CategoryId], [Name], [ManufacturerId], [Description], [Price], [Discount], [Quantity], [ExpDate], [ImageUrl]) VALUES (9, 3, N'AVANT Men''s Grey Running Shoes - 10 UK', 1, N'MAXIMUM COMFORT: From rigorous running to high intensity training this shoe has got you covered. It has a soft cushioning to give the feet maximum comfort.The design ensures full comfort with spacious yet secure fit. It is lightweight and breathable with high density backing. The engineered backing across the vamp & collar provides stretch & comfort where needed
RUBBERISED EVA MIDSOLE: The rubberized EVA midsoles ensure flexibility and enhanced comfort for the feet. Its cushioned support and re', CAST(649.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 453, NULL, N'/ProductsImages/6.jpg')
INSERT [dbo].[Products] ([ProductId], [CategoryId], [Name], [ManufacturerId], [Description], [Price], [Discount], [Quantity], [ExpDate], [ImageUrl]) VALUES (10, 3, N'sealok Men''s Perfect Style|Breathable Mesh Lace up Sport''s', 1, N'Sole: Air Mix
Closure: Lace-Up
Heel Height: 0.5 inches
Fit Type: Regular
Shoe Width: Medium
Brand:- Sealok
Occasions- Premium Quality Synthetic Leather & Stylish Design makes for Beautiful Party Wear, Casual, Ethnic & Wedding Wear Fashion Sandals
Long-Lasting! - Synthetic Upper and Inner of the sandal provides it the necessary strength and Sole makes it easier for the sandal to have a firm grip over any kind of surface.. The cushioned padding of the footbed gives your feet a smooth surfac', CAST(699.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 342, NULL, N'/ProductsImages/7.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [RoleType], [CreatedON]) VALUES (1, N'Admin', NULL)
INSERT [dbo].[Role] ([RoleId], [RoleType], [CreatedON]) VALUES (2, N'User', NULL)
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Sales] ON 

INSERT [dbo].[Sales] ([SalesId], [ProductId], [Discount]) VALUES (1, 3, 0)
SET IDENTITY_INSERT [dbo].[Sales] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [RoleId], [UserName], [Email], [Password], [CountryId], [StateId], [CityId], [Address], [CreatedON], [ImageUrl]) VALUES (1, 1, N'Kutubkhan', N'200540107014@darshan.ac.in', N'12345678', 99, NULL, NULL, N'bhagvati para main road', NULL, N'/Admin/assets/avatars/kutubkhan.JPG')
INSERT [dbo].[Users] ([UserId], [RoleId], [UserName], [Email], [Password], [CountryId], [StateId], [CityId], [Address], [CreatedON], [ImageUrl]) VALUES (4, 2, N'Fatema', N'fatemakhokhar06@gmail.com', N'12345678', 99, NULL, NULL, N'bhagvati para main road', CAST(N'2023-05-18T19:29:45.650' AS DateTime), N'/Admin/assets/avatars/Fatema.JPG')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D105346D95F6A7]    Script Date: 14-02-2024 09:05:24 PM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UQ__Users__A9D105346D95F6A7] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Products]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Users]
GO
ALTER TABLE [dbo].[LOC_City]  WITH CHECK ADD  CONSTRAINT [FK_LOC_City_LOC_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[LOC_Country] ([CountryId])
GO
ALTER TABLE [dbo].[LOC_City] CHECK CONSTRAINT [FK_LOC_City_LOC_Country]
GO
ALTER TABLE [dbo].[LOC_City]  WITH CHECK ADD  CONSTRAINT [FK_LOC_City_LOC_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[LOC_State] ([StateId])
GO
ALTER TABLE [dbo].[LOC_City] CHECK CONSTRAINT [FK_LOC_City_LOC_State]
GO
ALTER TABLE [dbo].[LOC_State]  WITH CHECK ADD  CONSTRAINT [FK_LOC_State_LOC_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[LOC_Country] ([CountryId])
GO
ALTER TABLE [dbo].[LOC_State] CHECK CONSTRAINT [FK_LOC_State_LOC_Country]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK__OrderItem__Produ__398D8EEE] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK__OrderItem__Produ__398D8EEE]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__UserId__35BCFE0A] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__UserId__35BCFE0A]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_LOC_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[LOC_City] ([CityId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_LOC_City]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_LOC_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[LOC_Country] ([CountryId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_LOC_Country]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_LOC_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[LOC_State] ([StateId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_LOC_State]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Category]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Manufacturer] FOREIGN KEY([ManufacturerId])
REFERENCES [dbo].[Manufacturer] ([ManufacturerId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Manufacturer]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Products]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_LOC_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[LOC_City] ([CityId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_LOC_City]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_LOC_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[LOC_Country] ([CountryId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_LOC_Country]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_LOC_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[LOC_State] ([StateId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_LOC_State]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role]
GO
/****** Object:  StoredProcedure [dbo].[PR_Cart_DeleteByPK]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_Cart_DeleteByPK]

@CartId		int,
@UserId		int

AS 

DELETE
FROM   [dbo].[Cart]
WHERE  [dbo].[Cart].CartId=@CartId  and	[dbo].[Cart].[UserId]=@UserId
GO
/****** Object:  StoredProcedure [dbo].[PR_Cart_Insert]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Cart_Insert]

@UserId				int,
@ProductId			int,
@Quantity			int,
@Price				decimal(10, 2)
		
AS

INSERT INTO	[dbo].[Cart]
(
		UserId,
		ProductId,
		Quantity,
		TotalPrice
)
VALUES
(
		@UserId,
		@ProductId,
		@Quantity,
		@Quantity * @Price
)
GO
/****** Object:  StoredProcedure [dbo].[PR_Cart_SelectbyUser]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Cart_SelectbyUser]

@UserId		int

AS
SELECT 
		[dbo].[Cart].[CartId],
		[dbo].[Cart].[ProductId],
		[dbo].[Users].[UserName],
		[dbo].[Products].[Name],
		[dbo].[Products].[ImageUrl],
		[dbo].[Products].[Price],
		[dbo].[Cart].[Quantity],
		[dbo].[Cart].[TotalPrice]

FROM	[dbo].[Cart]
INNER JOIN [dbo].[Products]
ON [dbo].[Products].[ProductId] = [dbo].[Cart].[ProductId]
INNER JOIN [dbo].[Users]
ON [dbo].[Users].[UserId] = @UserId
WHERE	[dbo].[Cart].UserId=@UserId
GO
/****** Object:  StoredProcedure [dbo].[PR_Category_DeleteByPK]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_Category_DeleteByPK]

@CategoryId		int

AS 

DELETE
FROM   [dbo].[Category]
WHERE  [dbo].[Category].CategoryId=@CategoryId
GO
/****** Object:  StoredProcedure [dbo].[PR_Category_Insert]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Category_Insert]

@CategoryName		nvarchar(50),
@CreatedON			datetime

AS

INSERT INTO	[dbo].[Category]
(
		CategoryName,
		CreatedON
)
VALUES
(
		@CategoryName,
		ISNULL(@CreatedON,GETDATE())
)
GO
/****** Object:  StoredProcedure [dbo].[PR_Category_SelectAll]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Category_SelectAll]

AS
SELECT 
		[dbo].[Category].[CategoryId],
		[dbo].[Category].[CategoryName]

FROM	[dbo].[Category]
GO
/****** Object:  StoredProcedure [dbo].[PR_Category_SelectbyPK]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Category_SelectbyPK]

@CategoryId		int

AS
SELECT 
		[dbo].[Category].[CategoryId],
		[dbo].[Category].[CategoryName]

FROM	[dbo].[Category]
WHERE	[dbo].[Category].CategoryId=@CategoryId
GO
/****** Object:  StoredProcedure [dbo].[PR_Category_UpdateByPK]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Category_UpdateByPK]

@CategoryId			int,
@CategoryName		nvarchar(50),
@CreatedON			datetime

AS

UPDATE	[dbo].[Category]
SET
		[dbo].[Category].[CategoryName]			=	@CategoryName,
		[dbo].[Category].[CreatedON]			=ISNULL (@CreatedON,getdate())

WHERE	[dbo].[Category].CategoryId=@CategoryId
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_DeleteByPK]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_LOC_City_DeleteByPK]

@CityID		int,
@UserID		int

AS

DELETE
FROM   [dbo].[LOC_City]
WHERE  [dbo].[LOC_City].CityID=@CityID and
		[dbo].[LOC_City].UserID=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_Insert]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_LOC_City_Insert]

	@CityName			nvarchar(50),
	@CityCode			nvarchar(50),
	@StateID			int,
	@CountryID			int,
	@CreationDate		datetime,
	@ModificationDate   datetime

AS

INSERT INTO [dbo].[LOC_City]
(
	CityName,
	UserID,
	CityCode,
	StateID,
	CountryID,
	CreationDate,
	ModificationDate
)
VALUES
(
	@CityName,	
	1,
	@CityCode,		
	@StateID,	
	@CountryID,		
	ISNULL(@CreationDate,GETDATE()),
	ISNULL(@ModificationDate,GETDATE())
)
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_SelectAll]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_LOC_City_SelectAll]

AS
SELECT 
	[dbo].[LOC_City].[CityId],
	[dbo].[LOC_City].[CityName],
	[dbo].[LOC_City].[CityCode],
	[dbo].[LOC_State].[StateName],
	[dbo].[LOC_Country].[CountryName]

FROM [dbo].[LOC_City]
INNER JOIN [dbo].[LOC_State]
ON [dbo].[LOC_State].[StateId] = [dbo].[LOC_City].[StateId]
INNER JOIN [dbo].[LOC_Country]
ON [dbo].[LOC_Country].[CountryId] = [dbo].[LOC_City].[CountryId]

ORDER BY [dbo].[LOC_City].[StateID]
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_SelectByCityName]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_LOC_City_SelectByCityName]
@CityName varchar(50)
AS
SELECT
	CityName
FROM LOC_City
WHERE (@CityName IS NULL OR CityName LIKE Concat('%',@CityName,'%'))
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_SelectByPK]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_LOC_City_SelectByPK]

@CityId		int
AS

SELECT 
		[dbo].[LOC_City].[CityId],
		[dbo].[LOC_City].[CityName],
		[dbo].[LOC_City].[CityCode],
		[dbo].[LOC_City].[StateId],
		[dbo].[LOC_City].[CountryId]

FROM	[dbo].[LOC_City]

WHERE   [dbo].[LOC_City].CityId=@CityId
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_SelectForDropDown]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_LOC_City_SelectForDropDown]
@StateID	int
AS

SELECT	 [dbo].[LOC_City].[CityID],
		 [dbo].[LOC_City].[CityName]
FROM	 [dbo].[LOC_City]
WHERE CAST ([dbo].[LOC_City].[StateID] as int) = CAST(@StateID as int)
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_UpdateByPK]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_LOC_City_UpdateByPK]

@CityID        int,
@CityName      nvarchar(50),
@CityCode      nvarchar(50),
@CountryID			int,
@StateID			int,
@ModificationDate datetime

AS

UPDATE [dbo].[LOC_City]						
SET    [dbo].[LOC_City].[CityName]        =@CityName,
	   [dbo].[LOC_City].[CityCode]        =@CityCode,
	   [dbo].[LOC_City].[CountryID]		=@CountryID,
	   [dbo].[LOC_City].[StateID]		=@StateID,
	   [dbo].[LOC_City].[ModificationDate]	=ISNULL (@ModificationDate,getdate())

WHERE  [dbo].[LOC_City].CityID=@CityID
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_DeleteByPK]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_LOC_Country_DeleteByPK]

@CountryId	int

AS

DELETE
FROM   [dbo].[LOC_Country]
WHERE  [dbo].[LOC_Country].CountryId=@CountryId
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_Insert]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_LOC_Country_Insert]

	@CountryName		nvarchar(50),
	@CountryCode		nvarchar(5)

AS

INSERT INTO [dbo].[LOC_Country]
(
	CountryName,
	CountryCode
)
VALUES
(
	@CountryName,
	@CountryCode
)
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_Search]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_LOC_Country_Search]
@CountryName nvarchar(50)
AS
Select * from LOC_Country
WHERE (@CountryName is null or LOC_Country.CountryName like '%'+@CountryName+'%')
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_SelectAll]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_LOC_Country_SelectAll]

AS

SELECT 
		[dbo].[LOC_Country].[CountryId],
		[dbo].[LOC_Country].[CountryName],
		[dbo].[LOC_Country].[CountryCode]

FROM	[dbo].[LOC_Country]

ORDER BY [dbo].[LOC_Country].[CountryName]
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_SelectByCountryName]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_LOC_Country_SelectByCountryName]
@CountryName varchar(50)
AS
SELECT
	CountryName
FROM LOC_Country
WHERE (@CountryName IS NULL OR CountryName LIKE Concat('%',@CountryName,'%'))
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_SelectByPK]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_LOC_Country_SelectByPK]

@CountryId	int
AS

SELECT 
		[dbo].[LOC_Country].[CountryId],
		[dbo].[LOC_Country].[CountryName],
		[dbo].[LOC_Country].[CountryCode]

FROM	[dbo].[LOC_Country]

WHERE   [dbo].[LOC_Country].CountryId=@CountryId
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_SelectForDropDown]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_LOC_Country_SelectForDropDown]

AS

SELECT	 [dbo].[LOC_Country].[CountryID],
		 [dbo].[LOC_Country].[CountryName]

FROM	 [dbo].[LOC_Country]
ORDER BY [dbo].[LOC_Country].[CountryName]
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_UpdateByPK]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_LOC_Country_UpdateByPK]

@CountryID        int,
@CountryName      nvarchar(50),
@CountryCode      nvarchar(50),
@ModificationDate datetime

AS

UPDATE [dbo].[LOC_Country]						
SET    [dbo].[LOC_Country].[CountryName]        =@CountryName,
	   [dbo].[LOC_Country].[CountryCode]        =@CountryCode,
	   [dbo].[LOC_Country].[ModificationDate]	=ISNULL (@ModificationDate,getdate())

WHERE  [dbo].[LOC_Country].CountryID=@CountryID
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_State_DeleteByPK]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_LOC_State_DeleteByPK]

@StateId	int

AS

DELETE
FROM   [dbo].[LOC_State]
WHERE  [dbo].[LOC_State].StateId=@StateId
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_State_Insert]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_LOC_State_Insert]

	@StateName			nvarchar(50),
	@StateCode			nvarchar(50),
	@CountryId			int

AS

INSERT INTO [dbo].[LOC_State]
(
	StateName,
	StateCode,
	CountryId
)
VALUES
(
	@StateName,
	@StateCode,
	@CountryId
)
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_State_SelectAll]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_LOC_State_SelectAll]

AS
SELECT 
		[dbo].[LOC_State].[StateId],
		[dbo].[LOC_State].[StateName],
		[dbo].[LOC_State].[StateCode],
		[dbo].[LOC_Country].[CountryName]

FROM	[dbo].[LOC_State]
INNER JOIN [dbo].[LOC_Country]
ON [dbo].[LOC_Country].[CountryId] = [dbo].[LOC_State].[CountryId]

ORDER BY [dbo].[LOC_State].[StateName]
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_State_SelectByPK]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_LOC_State_SelectByPK]

@StateId	int
AS

SELECT 
		[dbo].[LOC_State].[StateId],
		[dbo].[LOC_State].[StateName],
		[dbo].[LOC_State].[StateCode],
		[dbo].[LOC_State].[CountryId]

FROM	[dbo].[LOC_State]

WHERE   [dbo].[LOC_State].StateId=@StateId
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_State_SelectForDropDownByCountryID]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_LOC_State_SelectForDropDownByCountryID]
@CountryId	int
AS

SELECT	 [dbo].[LOC_State].[StateId],
		 [dbo].[LOC_State].[StateName]
FROM	 [dbo].[LOC_State]
WHERE CAST ([dbo].[LOC_State].[CountryId] as int) = CAST(@CountryId as int) 
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_State_UpdateByPK]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_LOC_State_UpdateByPK]

@StateID			int,
@StateName			nvarchar(50),
@StateCode			nvarchar(50),
@CountryID			int,
@ModificationDate	datetime

AS

UPDATE [dbo].[LOC_State]						
SET    [dbo].[LOC_State].[StateName]        =@StateName,
	   [dbo].[LOC_State].[StateCode]        =@StateCode,
	   [dbo].[LOC_State].[CountryID]		=@CountryID,
	   [dbo].[LOC_State].[ModificationDate]	=ISNULL (@ModificationDate,getdate())

WHERE  [dbo].[LOC_State].StateID=@StateID
GO
/****** Object:  StoredProcedure [dbo].[PR_Manufacturer_DeleteByPK]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_Manufacturer_DeleteByPK]

@ManufacturerId		int

AS 

DELETE
FROM   [dbo].[Manufacturer]
WHERE  [dbo].[Manufacturer].ManufacturerId=@ManufacturerId
GO
/****** Object:  StoredProcedure [dbo].[PR_Manufacturer_Insert]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Manufacturer_Insert]

@ManufacturerName		nvarchar(50)

AS

INSERT INTO	[dbo].[Manufacturer]
(
		ManufacturerName
)
VALUES
(
		@ManufacturerName
)
GO
/****** Object:  StoredProcedure [dbo].[PR_Manufacturer_SelectAll]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Manufacturer_SelectAll]

AS
SELECT 
		[dbo].[Manufacturer].[ManufacturerId],
		[dbo].[Manufacturer].[ManufacturerName]

FROM	[dbo].[Manufacturer]
GO
/****** Object:  StoredProcedure [dbo].[PR_Manufacturer_SelectByPK]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Manufacturer_SelectByPK]

@ManufacturerId		int

AS
SELECT 
		[dbo].[Manufacturer].[ManufacturerId],
		[dbo].[Manufacturer].[ManufacturerName]

FROM   [dbo].[Manufacturer]
WHERE  [dbo].[Manufacturer].ManufacturerId=@ManufacturerId
GO
/****** Object:  StoredProcedure [dbo].[PR_Manufacturer_UpdateByPK]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Manufacturer_UpdateByPK]

@ManufacturerId			int,
@ManufacturerName		nvarchar(50)

AS

UPDATE	[dbo].[Manufacturer]
SET
		[dbo].[Manufacturer].[ManufacturerName]	=	@ManufacturerName

WHERE	[dbo].[Manufacturer].ManufacturerId=@ManufacturerId
GO
/****** Object:  StoredProcedure [dbo].[PR_Order_SelectAll]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Order_SelectAll]

AS

SELECT 
		[dbo].[Orders].[OrderId],
		[dbo].[Orders].[OrderNo],
		[dbo].[OrderItems].[ProductId],
		[dbo].[Products].[Name],
		[dbo].[Products].[ImageUrl],
		[dbo].[Products].[Price],
		[dbo].[OrderItems].[Quantity],
		[dbo].[OrderItems].[TotalPrice],
		[dbo].[Products].[Description]

FROM	[dbo].[Orders]
INNER JOIN [dbo].[OrderItems]
ON [dbo].[OrderItems].[OrderId] = [dbo].[Orders].[OrderId]
INNER JOIN [dbo].[Products]
ON [dbo].[Products].[ProductId] = [dbo].[OrderItems].[ProductId]
ORDER BY OrderDate
GO
/****** Object:  StoredProcedure [dbo].[PR_Order_SelectByUser]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Order_SelectByUser]

@UserId		int

AS

SELECT 
		[dbo].[Orders].[OrderId],
		[dbo].[Orders].[OrderNo],
		[dbo].[OrderItems].[ProductId],
		[dbo].[Products].[Name],
		[dbo].[Products].[ImageUrl],
		[dbo].[Products].[Price],
		[dbo].[OrderItems].[Quantity],
		[dbo].[OrderItems].[TotalPrice],
		[dbo].[Products].[Description]

FROM	[dbo].[Orders]
INNER JOIN [dbo].[OrderItems]
ON [dbo].[OrderItems].[OrderId] = [dbo].[Orders].[OrderId]
INNER JOIN [dbo].[Products]
ON [dbo].[Products].[ProductId] = [dbo].[OrderItems].[ProductId]
WHERE	[dbo].[Orders].UserId=@UserId
ORDER BY OrderDate
GO
/****** Object:  StoredProcedure [dbo].[PR_Order_SelectLatest]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Order_SelectLatest]

@UserId		int,
@OrderId    int

AS
SELECT @OrderId =  IDENT_CURRENT('Orders')
SELECT 
		[dbo].[Orders].[OrderId],
		[dbo].[Orders].[OrderNo],
		[dbo].[OrderItems].[ProductId],
		[dbo].[Products].[Name],
		[dbo].[Products].[ImageUrl],
		[dbo].[Products].[Price],
		[dbo].[OrderItems].[Quantity],
		[dbo].[OrderItems].[TotalPrice],
		[dbo].[Products].[Description]

FROM	[dbo].[Orders]
INNER JOIN [dbo].[OrderItems]
ON [dbo].[OrderItems].[OrderId] = @OrderId
INNER JOIN [dbo].[Products]
ON [dbo].[Products].[ProductId] = [dbo].[OrderItems].[ProductId]
WHERE	[dbo].[Orders].UserId=@UserId  and  [dbo].[Orders].OrderId = @OrderId
GO
/****** Object:  StoredProcedure [dbo].[PR_Order_UpdateLatest]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Order_UpdateLatest]

@OrderId					int,
@ShippingAddress			varchar(500),
@OrderDate					datetime
AS

SELECT @OrderId	= IDENT_CURRENT('Orders')
UPDATE	[dbo].[Orders]
SET
		[dbo].[Orders].[ShippingAddress]		=	@ShippingAddress,
		[dbo].[Orders].[OrderStatus]			=	'Confirm',
		[dbo].[Orders].[OrderDate]				=	ISNULL(@OrderDate,GETDATE())

WHERE	[dbo].[Orders].OrderId=@OrderId
GO
/****** Object:  StoredProcedure [dbo].[PR_OrderItems_Insert]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_OrderItems_Insert]

@OrderId			int,
@ProductId			int,
@Quantity			int,
@Price				decimal(10, 2)

AS

INSERT INTO	[dbo].[OrderItems]
(
		OrderId,
		ProductId,
		Quantity,
		TotalPrice
)
VALUES
(
		ISNULL(@OrderId,IDENT_CURRENT('Orders')),
		@ProductId,
		@Quantity,
		@Quantity * @Price
)
GO
/****** Object:  StoredProcedure [dbo].[PR_Orders_Insert]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Orders_Insert]

@UserId				int,
@ShippingAddress	varchar(200),
@OrderDate			datetime

AS

INSERT INTO	[dbo].[Orders]
(
		UserId,
		OrderNo,
		ShippingAddress,
		OrderDate,
		OrderStatus
)
VALUES
(
		@UserId,
		REPLACE(NEWID(),'-',''),
		@ShippingAddress,
		ISNULL(@OrderDate,GETDATE()),
		'Panding'
)
GO
/****** Object:  StoredProcedure [dbo].[PR_Product_DeleteByPK]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_Product_DeleteByPK]

@ProductId	int

AS

DELETE
FROM   [dbo].[Products]
WHERE  [dbo].[Products].ProductId=@ProductId
GO
/****** Object:  StoredProcedure [dbo].[PR_Product_Insert]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Product_Insert]

@CategoryId			int,
@Name				varchar(100),
@ManufacturerId		int,
@Description		varchar(500),
@Price				decimal(10, 2),
@Discount			decimal(10, 2),
@Quantity			int,
@ImageUrl			nvarchar(200)

AS

INSERT INTO	[dbo].[Products]
(
		CategoryId,
		Name,
		ManufacturerId,
		Description,
		Price,
		Discount,
		Quantity,
		ImageUrl
)
VALUES
(
		@CategoryId,
		@Name,
		@ManufacturerId,
		@Description,
		@Price,
		@Discount,
		@Quantity,
		@ImageUrl
)
GO
/****** Object:  StoredProcedure [dbo].[PR_Product_SelectAll]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Product_SelectAll]
AS
SELECT 
		[dbo].[Products].[ProductId],
		[dbo].[Category].[CategoryName],
		[dbo].[Products].[Name],
		[dbo].[Manufacturer].[ManufacturerName],
		[dbo].[Products].[Description],
		[dbo].[Products].[Price],
		[dbo].[Products].[Discount],
		[dbo].[Products].[Quantity],
		[dbo].[Products].[ImageUrl]

FROM	[dbo].[Products]
INNER JOIN [dbo].[Category]
ON [dbo].[Category].[CategoryId] = [dbo].[Products].[CategoryId]
INNER JOIN [dbo].[Manufacturer]
ON [dbo].[Manufacturer].[ManufacturerId] = [dbo].[Products].[ManufacturerId]
GO
/****** Object:  StoredProcedure [dbo].[PR_Product_SelectbyPK]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Product_SelectbyPK]

@ProductId		int

AS
SELECT 
		[dbo].[Products].[ProductId],
		[dbo].[Products].[CategoryId],
		[dbo].[Products].[Name],
		[dbo].[Products].[ManufacturerId],
		[dbo].[Products].[Description],
		[dbo].[Products].[Price],
		[dbo].[Products].[Discount],
		[dbo].[Products].[Quantity],
		[dbo].[Products].[ImageUrl]

FROM	[dbo].[Products]
INNER JOIN [dbo].[Category]
ON [dbo].[Category].[CategoryId] = [dbo].[Products].[CategoryId]
WHERE	[dbo].[Products].ProductId=@ProductId
GO
/****** Object:  StoredProcedure [dbo].[PR_Product_UpdateByPK]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Product_UpdateByPK]

@ProductId			int,
@CategoryId			int,
@Name				varchar(100),
@ManufacturerId		int,
@Description		varchar(500),
@Price				decimal(10, 2),
@Discount			decimal(10, 2),
@Quantity			int,
@ImageUrl			nvarchar(200)

AS

UPDATE	[dbo].[Products]
SET
		[dbo].[Products].[CategoryId]			=	@CategoryId,
		[dbo].[Products].[Name]					=	@Name,
		[dbo].[Products].[ManufacturerId]		=	@ManufacturerId,
		[dbo].[Products].[Description]			=	@Description,
		[dbo].[Products].[Price]				=	@Price,
		[dbo].[Products].[Discount]				=	@Discount,
		[dbo].[Products].[Quantity]				=	@Quantity,
		[dbo].[Products].[ImageUrl]				=	@ImageUrl

WHERE	[dbo].[Products].ProductId=@ProductId
GO
/****** Object:  StoredProcedure [dbo].[PR_Sales_DeleteByPK]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[PR_Sales_DeleteByPK]

@SalesId		int

AS 

DELETE
FROM   [dbo].[Sales]
WHERE  [dbo].[Sales].SalesId=@SalesId
GO
/****** Object:  StoredProcedure [dbo].[PR_Sales_Insert]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[PR_Sales_Insert]

@ProductId			int,
@Discount			int
		
AS

INSERT INTO	[dbo].[Sales]
(
		ProductId,
		Discount
)
VALUES
(
		@ProductId,
		@Discount
)
GO
/****** Object:  StoredProcedure [dbo].[PR_Sales_SelectAll]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[PR_Sales_SelectAll]

AS
SELECT 
		[dbo].[Sales].[SalesId],
		[dbo].[Products].[Name],
		[dbo].[Products].[ImageUrl],
		[dbo].[Products].[Description],
		[dbo].[Category].[CategoryName],
		[dbo].[Manufacturer].[ManufacturerName],
		[dbo].[Products].[Price],
		[dbo].[Products].[Quantity],
		[dbo].[Sales].[Discount]

FROM	[dbo].[Sales]
INNER JOIN [dbo].[Products]
ON [dbo].[Products].[ProductId] = [dbo].[Sales].[ProductId]
INNER JOIN [dbo].[Category]
ON [dbo].[Category].[CategoryId] = [dbo].[Products].[CategoryId]
INNER JOIN [dbo].[Manufacturer]
ON [dbo].[Manufacturer].[ManufacturerId] = [dbo].[Products].[ManufacturerId]
GO
/****** Object:  StoredProcedure [dbo].[PR_User_DeleteByPK]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_User_DeleteByPK]

@UserId	int

AS

DELETE
FROM   [dbo].[Users]
WHERE  [dbo].[Users].UserId=@UserId
GO
/****** Object:  StoredProcedure [dbo].[PR_User_Insert]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_User_Insert]

@UserName			varchar(50),
@Email			varchar(50),
@Password		varchar(10),
@Address		varchar(200),
@CreatedON		Datetime,
@ImageUrl		nvarchar(200)

AS

INSERT INTO	[dbo].[Users]
(
		UserName,
		Email,
		Password,
		Address,
		CreatedON,
		ImageUrl
)
VALUES
(
	@UserName,		
	@Email,		
	@Password,	
	@Address,		
	ISNULL(@CreatedON,GETDATE()),
	@ImageUrl
)
GO
/****** Object:  StoredProcedure [dbo].[PR_User_Register]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_User_Register]

@UserName		varchar(50),
@Email			varchar(50),
@Password		varchar(10),
@CreatedON		Datetime

AS

INSERT INTO	[dbo].[Users]
(
		UserName,
		Email,
		Password,
		RoleId,
		CreatedON
)
VALUES
(
	@UserName,		
	@Email,		
	@Password,	
	2,
	ISNULL(@CreatedON,GETDATE())
)
GO
/****** Object:  StoredProcedure [dbo].[PR_User_SelectAll]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_User_SelectAll]
AS
SELECT 
		[dbo].[Users].[UserId],
		[dbo].[Users].[UserName],
		[dbo].[Role].[RoleType],
		[dbo].[Users].[Email],
		[dbo].[LOC_Country].[CountryName],
		[dbo].[Users].[Address],
		[dbo].[Users].[ImageUrl]

FROM	[dbo].[Users]
INNER JOIN [dbo].[Role]
ON [dbo].[Role].[RoleId] = [dbo].[Users].[RoleId]
INNER JOIN [dbo].[LOC_Country]
ON [dbo].[LOC_Country].[CountryId] = [dbo].[Users].[CountryId]
GO
/****** Object:  StoredProcedure [dbo].[PR_User_SelectByIDPass]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_User_SelectByIDPass]

@Email			nvarchar(50),
@Password		nvarchar(10)
AS

SELECT
		[dbo].[Users].[UserId],
		[dbo].[Users].[UserName],
		[dbo].[Users].[Address],
		[dbo].[Users].[Email],
		[dbo].[Users].[Password],
		[dbo].[Users].[CountryId],
		[dbo].[Role].[RoleType],
		[dbo].[Users].[ImageUrl]

FROM	[dbo].[Users]
INNER JOIN [dbo].[Role]
ON [dbo].[Role].[RoleId] = [dbo].[Users].[RoleId]

WHERE   [dbo].[Users].Email = @Email and
		[dbo].[Users].Password = @Password
GO
/****** Object:  StoredProcedure [dbo].[PR_User_SelectbyPK]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_User_SelectbyPK]

@UserId		int

AS
SELECT 
		[dbo].[Users].[UserName],
		[dbo].[Role].[RoleType],
		[dbo].[LOC_Country].[CountryName],
		[dbo].[Users].[Email],
		[dbo].[Users].[Address],
		[dbo].[Users].[Password],
		[dbo].[Users].[ImageUrl]

FROM	[dbo].[Users]
INNER JOIN [dbo].[Role]
ON [dbo].[Role].[RoleId] = [dbo].[Users].[RoleId]
INNER JOIN [dbo].[LOC_Country]
ON [dbo].[LOC_Country].[CountryId] = [dbo].[Users].[CountryId]
WHERE	[dbo].[Users].UserId=@UserId
GO
/****** Object:  StoredProcedure [dbo].[PR_User_UpdateByPK]    Script Date: 14-02-2024 09:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_User_UpdateByPK]

@UserId			int,
@UserName			varchar(50),
@Email			varchar(50),
@Password		varchar(10),
@Address		varchar(200),
@ImageUrl		nvarchar(200)

AS

UPDATE	[dbo].[Users]
SET
		[dbo].[Users].[UserName]	=	@UserName,	
		[dbo].[Users].[Email]		=	@Email,
		[dbo].[Users].[Address]		=	@Address,
		[dbo].[Users].[Password]	=	@Password,
		[dbo].[Users].ImageUrl		=	@ImageUrl

WHERE	[dbo].[Users].UserId=@UserId
GO
USE [master]
GO
ALTER DATABASE [ECommerce] SET  READ_WRITE 
GO
