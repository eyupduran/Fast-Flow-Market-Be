USE [master]
GO
/****** Object:  Database [ETrade]    Script Date: 2.07.2023 16:23:35 ******/
CREATE DATABASE [ETrade]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ETrade', FILENAME = N'C:\Users\edued\ETrade.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ETrade_log', FILENAME = N'C:\Users\edued\ETrade_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ETrade] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ETrade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ETrade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ETrade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ETrade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ETrade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ETrade] SET ARITHABORT OFF 
GO
ALTER DATABASE [ETrade] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ETrade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ETrade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ETrade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ETrade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ETrade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ETrade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ETrade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ETrade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ETrade] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ETrade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ETrade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ETrade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ETrade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ETrade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ETrade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ETrade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ETrade] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ETrade] SET  MULTI_USER 
GO
ALTER DATABASE [ETrade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ETrade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ETrade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ETrade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ETrade] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ETrade] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ETrade] SET QUERY_STORE = OFF
GO
USE [ETrade]
GO
/****** Object:  Table [dbo].[BankAccounts]    Script Date: 2.07.2023 16:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankAccounts](
	[BankAccountId] [int] IDENTITY(1,1) NOT NULL,
	[CartNumber] [nvarchar](200) NOT NULL,
	[CartName] [nvarchar](200) NOT NULL,
	[ExpirationDate] [nvarchar](200) NOT NULL,
	[SecurityCode] [nvarchar](200) NOT NULL,
	[IbanNo] [nvarchar](200) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_BankAccounts] PRIMARY KEY CLUSTERED 
(
	[BankAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cargoes]    Script Date: 2.07.2023 16:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargoes](
	[CargoId] [int] IDENTITY(1,1) NOT NULL,
	[CargoName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Cargoes] PRIMARY KEY CLUSTERED 
(
	[CargoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2.07.2023 16:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactInfoes]    Script Date: 2.07.2023 16:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactInfoes](
	[ContactInfoId] [int] IDENTITY(1,1) NOT NULL,
	[Country] [nvarchar](100) NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[PhoneNumber] [nvarchar](200) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_ContactInfoes] PRIMARY KEY CLUSTERED 
(
	[ContactInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperationClaims]    Script Date: 2.07.2023 16:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2.07.2023 16:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[OrderDate] [nvarchar](100) NOT NULL,
	[CargoId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[OrderStatusId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatues]    Script Date: 2.07.2023 16:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatues](
	[OrderStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[OrderStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 2.07.2023 16:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[ProductImageId] [int] IDENTITY(1,1) NOT NULL,
	[ImagePath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProductImage] PRIMARY KEY CLUSTERED 
(
	[ProductImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2.07.2023 16:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](300) NOT NULL,
	[UnitPrice] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ProductImageId] [int] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCarts]    Script Date: 2.07.2023 16:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCarts](
	[ShoppingCartId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_ShoppingCarts] PRIMARY KEY CLUSTERED 
(
	[ShoppingCartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserOperationClaims]    Script Date: 2.07.2023 16:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserOperationClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[OperationClaimId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2.07.2023 16:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PasswordHash] [varbinary](500) NOT NULL,
	[PasswordSalt] [varbinary](500) NOT NULL,
	[Status] [bit] NOT NULL,
	[UserType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Users__3214EC07F807AAB9] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cargoes] ON 

INSERT [dbo].[Cargoes] ([CargoId], [CargoName]) VALUES (1, N'Aras Kargo')
INSERT [dbo].[Cargoes] ([CargoId], [CargoName]) VALUES (2, N'Yurtiçi Kargo')
INSERT [dbo].[Cargoes] ([CargoId], [CargoName]) VALUES (3, N'Sürat Kargo')
SET IDENTITY_INSERT [dbo].[Cargoes] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (1, N'Gıda ve İçecek')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (2, N'Elektronik')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (3, N'Moda ve Giyim')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (4, N'Kişisel Bakım')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (5, N'Bebek ve Çocuk')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (6, N'Spor ve Outdoor')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (7, N'Kitaplar ve Müzik')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (8, N'Ev ve Bahçe')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (9, N'Sağlık ve Fitness')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (10, N'Pet Ürünleri')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[ContactInfoes] ON 

INSERT [dbo].[ContactInfoes] ([ContactInfoId], [Country], [City], [Address], [PhoneNumber], [UserId]) VALUES (1, N'Türkiye', N'Denizli', N'Turkey Denizli', N'55555555', 4)
INSERT [dbo].[ContactInfoes] ([ContactInfoId], [Country], [City], [Address], [PhoneNumber], [UserId]) VALUES (2, N'Türkiye', N'Doğu', N'Hakkari', N'88888888', 5)
INSERT [dbo].[ContactInfoes] ([ContactInfoId], [Country], [City], [Address], [PhoneNumber], [UserId]) VALUES (1002, N'Türkiye', N'Doğu', N'Hakkari', N'888888888', 2002)
INSERT [dbo].[ContactInfoes] ([ContactInfoId], [Country], [City], [Address], [PhoneNumber], [UserId]) VALUES (1003, N'Türkiye', N'Denizli', N'Turkey Denizli', N'99999999999', 2003)
INSERT [dbo].[ContactInfoes] ([ContactInfoId], [Country], [City], [Address], [PhoneNumber], [UserId]) VALUES (1004, N'Türkiye', N'Denizli', N'Turkey Denizli', N'9999999999', 2004)
INSERT [dbo].[ContactInfoes] ([ContactInfoId], [Country], [City], [Address], [PhoneNumber], [UserId]) VALUES (2002, N'Türkiye', N'Denizli', N'Turkey Denizli', N'555 555 55 55', 3002)
SET IDENTITY_INSERT [dbo].[ContactInfoes] OFF
GO
SET IDENTITY_INSERT [dbo].[OperationClaims] ON 

INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (1, N'productAdd')
INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (2, N'user')
SET IDENTITY_INSERT [dbo].[OperationClaims] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [ProductId], [OrderDate], [CargoId], [UserId], [OrderStatusId], [Quantity]) VALUES (1, 8, N'Wed May 31 2023', 2, 4, 1, 1)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [OrderDate], [CargoId], [UserId], [OrderStatusId], [Quantity]) VALUES (2, 1002, N'Wed May 31 2023', 3, 4, 1, 3)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [OrderDate], [CargoId], [UserId], [OrderStatusId], [Quantity]) VALUES (3, 7, N'Wed May 31 2023', 2, 4, 1, 2)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [OrderDate], [CargoId], [UserId], [OrderStatusId], [Quantity]) VALUES (4, 3, N'Wed May 31 2023', 2, 4, 1, 1)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [OrderDate], [CargoId], [UserId], [OrderStatusId], [Quantity]) VALUES (5, 9, N'Wed May 31 2023', 2, 4, 1, 3)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [OrderDate], [CargoId], [UserId], [OrderStatusId], [Quantity]) VALUES (1002, 5, N'Mon Jun 05 2023', 1, 5, 1, 2)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [OrderDate], [CargoId], [UserId], [OrderStatusId], [Quantity]) VALUES (1003, 7, N'Mon Jun 05 2023', 1, 5, 1, 2)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [OrderDate], [CargoId], [UserId], [OrderStatusId], [Quantity]) VALUES (1004, 8, N'Mon Jun 05 2023', 1, 5, 1, 1)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [OrderDate], [CargoId], [UserId], [OrderStatusId], [Quantity]) VALUES (2002, 5, N'Wed Jun 07 2023', 1, 2002, 1, 2)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [OrderDate], [CargoId], [UserId], [OrderStatusId], [Quantity]) VALUES (2003, 3, N'Wed Jun 07 2023', 1, 2002, 1, 1)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [OrderDate], [CargoId], [UserId], [OrderStatusId], [Quantity]) VALUES (2004, 4, N'Wed Jun 07 2023', 1, 2002, 1, 3)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [OrderDate], [CargoId], [UserId], [OrderStatusId], [Quantity]) VALUES (2005, 4, N'Wed Jun 07 2023', 1, 2003, 1, 3)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [OrderDate], [CargoId], [UserId], [OrderStatusId], [Quantity]) VALUES (2006, 17, N'Wed Jun 07 2023', 1, 2003, 1, 1)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [OrderDate], [CargoId], [UserId], [OrderStatusId], [Quantity]) VALUES (2007, 17, N'Wed Jun 07 2023', 1, 2004, 1, 1)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [OrderDate], [CargoId], [UserId], [OrderStatusId], [Quantity]) VALUES (2008, 3, N'Wed Jun 07 2023', 1, 2004, 1, 3)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [OrderDate], [CargoId], [UserId], [OrderStatusId], [Quantity]) VALUES (3002, 17, N'Mon Jun 26 2023', 1, 3002, 1, 1)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [OrderDate], [CargoId], [UserId], [OrderStatusId], [Quantity]) VALUES (3003, 7, N'Mon Jun 26 2023', 1, 3002, 1, 1)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [OrderDate], [CargoId], [UserId], [OrderStatusId], [Quantity]) VALUES (3004, 6, N'Mon Jun 26 2023', 1, 3002, 1, 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatues] ON 

INSERT [dbo].[OrderStatues] ([OrderStatusId], [Status]) VALUES (1, N'Sipariş Alındı')
INSERT [dbo].[OrderStatues] ([OrderStatusId], [Status]) VALUES (2, N'Hazırlanıyor')
INSERT [dbo].[OrderStatues] ([OrderStatusId], [Status]) VALUES (3, N'Kargoya Verildi')
INSERT [dbo].[OrderStatues] ([OrderStatusId], [Status]) VALUES (4, N'Yolda')
INSERT [dbo].[OrderStatues] ([OrderStatusId], [Status]) VALUES (5, N'Teslim Edildi')
SET IDENTITY_INSERT [dbo].[OrderStatues] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImages] ON 

INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (1, N'f82d14fd1d19496790b7d06383a8e8f3_5_28_2023.jpeg')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (2, N'f15e3a3cb1044a47946c00ad3c94d704_5_28_2023.webp')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (3, N'497ee27db48a4a0da2072df162b601af_5_28_2023.jpeg')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (4, N'4a9d7f28bf4846ceb13a99759ea0bd54_5_28_2023.jpeg')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (5, N'd2b2bd042f2d462388dd9f1bb38c117a_5_28_2023.jpg')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (6, N'07271ce86b85453396d5c05c3872efdb_5_28_2023.webp')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (7, N'9f8c04ce920946ee8840fc85aaa59712_5_28_2023.jpeg')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (8, N'5d37a01aff2947b48efdab0396d5913c_5_28_2023.jpeg')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (9, N'f2e6fcac98cb4c0286ed1dd7b828abbe_5_28_2023.jpeg')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (10, N'6b8f46e545314086bb7b1a4d67de26fa_5_28_2023.jpeg')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (11, N'b8d1b7b8958643a5b081ad20b817f628_5_28_2023.jpeg')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (12, N'd9dcfe5c3d9a45eeb5d79c7ab3ce5e97_5_28_2023.jpeg')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (13, N'06874ecabcf84941922d8a94c7c17584_5_28_2023.jpeg')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (14, N'f313a59f07f5442aaf6da643412236ea_5_28_2023.webp')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (15, N'5d4b91f933bd49beaff298d4c51485bb_5_28_2023.jpeg')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (16, N'c4c8a47b23dc45138bd0b6ce5e88fba9_5_28_2023.webp')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (17, N'33f15131c2e94729932bcf4028dadfa6_5_28_2023.webp')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (18, N'16589c9914384801a1749f7ccdfc2e54_5_28_2023.jpeg')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (19, N'2d51a9aa431c4bda9f61b69fe972059f_5_28_2023.webp')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (20, N'3fd9c5546b5f4d299bb158fa5a111813_5_28_2023.webp')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (21, N'931ec71595974d0e913e06a16675655f_5_28_2023.webp')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (22, N'7b846b380e36481e87f828d85d2706f8_5_28_2023.jpeg')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (23, N'ba555e7808cc4cdea3bf8194246bab47_5_28_2023.jpeg')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (24, N'2668b326d3ac4751ae162dfff3703c57_5_28_2023.jpeg')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (25, N'f4dd2cf3bcff4f7094e6095afd2aa09f_5_28_2023.jpg')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (26, N'9c16ecd4da8f4f3d95860f693e4fa460_5_28_2023.jpg')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (27, N'9c1e32bd5a6c4e49bcdaa7f5dc3e4fec_5_28_2023.jpeg')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (28, N'd775e50ec516410f9331b13599e18a79_5_28_2023.webp')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (29, N'51deec4f9dbc4e4f95641048e13ae705_5_28_2023.webp')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (30, N'f952a69788c747ec9fec1816587ad971_5_28_2023.webp')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (31, N'b88674e6c10549829fde71ea32bf3a2a_5_28_2023.webp')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (32, N'9d41ab1996af4f1782bf14a8ff28e692_5_28_2023.webp')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (33, N'e9c2b5189e734314a83403c93b00b6f7_5_28_2023.webp')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (34, N'573642e26db34f63930b207941d5d71e_5_28_2023.jpeg')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (35, N'70f9bf72df4d43cd88eea3ee8f0395ae_5_28_2023.webp')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (1002, N'bde001f6748043c493cabc842bcdeef9_5_30_2023.png')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (2002, N'6b4397e4e9834b1d81d7dd9b3401f092_5_31_2023.jpeg')
INSERT [dbo].[ProductImages] ([ProductImageId], [ImagePath]) VALUES (2003, N'9aa1096130cc4f6a832f8ea7ec33282d_5_31_2023.jpg')
SET IDENTITY_INSERT [dbo].[ProductImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (2, N'Tam Buğday Ekmek', N'500g, katkısız, doğal mayalı, yüksek lifli ve besleyici tam buğday ekmeği', 10, 1, 1, 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (3, N'Doğal Zeytinyağı', N'1L, soğuk sıkım, Ege bölgesinden elde edilmiş yüksek kaliteli zeytinyağı', 75, 1, 2, 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (4, N'Çikolatalı Mısır Gevreği', N'450g, tam buğday unlu, çikolata kaplı mısır gevreği', 20, 1, 3, 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (5, N'Samsung Galaxy A52 5G', N'6.5 inç Super AMOLED ekran, 128 GB depolama, 48 MP ana kamera, 5G uyumlu, IP67 su ve toz direnci.', 5000, 2, 4, 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (6, N'Kablosuz Kulaklık', N'Sony WF-1000XM3-Bluetooth 5.0, aktif gürültü engelleme, 24 saat pil ömrü ', 3649, 2, 5, 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (7, N'Taşınabilir Şarj Cihazı', N'10000 mAh kapasite, hızlı şarj özelliği, USB-C ve USB-A bağlantıları.', 364, 2, 6, 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (8, N'Erkek Gömlek', N': %100 pamuk, slim fit, mavi renk, S-XXL beden seçenekleri', 325, 3, 9, 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (9, N'Kadın Bluz', N'Siyah Balon Kol Detaylı Bluz', 449, 3, 11, 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (10, N'Erkek Pantolon', N'Slazenger BULL Erkek Pantolon Bej', 419, 3, 12, 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (11, N'Elektrikli Diş Fırçası', N'Oral-B Vitality 100 Cross Action Elektrikli Diş Fırçası', 492, 4, 13, 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (12, N'Yüz & Cilt Bakım', N'Hassas ciltler için özel olarak tasarlanmış, 3''lü bakım seti', 300, 4, 14, 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (13, N'Saç Kurutma Makinesi', N'Dyson Supersonic ,Yüksek hızlı hava akımı ve akıllı kontrol ile saçlarınızı hızlı ve güvenli bir şekilde kurutan makine', 6000, 4, 15, 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (14, N'Beşik', N'Chicco Marka, Bebeğinizin yanınızda uyumasını sağlayan, 6 farklı yükseklik ayarı olan beşik', 3790, 5, 17, 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (15, N'Lego', N'Lego Classic Büyük Boy Yaratıcı Yapım Kutusu En Popüler Blok Oyuncak', 800, 5, 18, 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (16, N'Mini Araba', N'1-3 yaş arası çocuklar için tasarlanmış, pedal ile çalışan mini araba', 3000, 5, 19, 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (17, N'Akıllı Saat', N'Garmin Forerunner 945 Akıllı Saat | GPS, müzik çalma, nabız ölçümü gibi özellikleri ile sporcular için tasarlanmış akıllı saat', 12000, 6, 20, 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (18, N'Aile Çadırı', N'Gümüş kaplamalı, yağmur geçirmez, UV korumalı ve uzun ömürlü, kaliteli Oxford kumaştan üretilmiştir. Tamamen otomatik yapı, kurulum hızlı ve kolaydı', 2296, 6, 21, 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (19, N'Trekking Ayakkabısı', N'Lumberjack Siyah Kadın Trekking Ayakkabısı ,geçirmez, dayanıklı ve rahat trekking ayakkabıs', 1889, 6, 22, 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (20, N'Dune - Frank Herbert', N'Chicago Tribune En İyi Roman kategorisinde Hugo Ödülü En İyi Roman kategorisinde Nebula Ödülü Okurlar tarafından 20. yüzyılın en iyi bilimkurgu yapıtı seçilen Dune serisi', 90, 7, 23, 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (21, N'Plak', N'Queen''in en sevilen şarkılarının yer aldığı vinyl albüm', 759, 7, 24, 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (22, N'Sapiens - Yuval Noah Harari', N'İnsanlık tarihinin geniş bir perspektiften ele alındığı, çok satan kitap', 117, 7, 25, 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (23, N'Philips Hue Akıllı Aydınlatma Seti', N'Wi-Fi bağlantılı, renkli ve dim edilebilir akıllı ampullerden oluşan aydınlatma seti', 2011, 8, 26, 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (24, N'Tefal Optigrill Izgara Makinesi', N'6 farklı programı mükemmel ızgara lezzeti sunan, kolay temizlenebilen izgara makinesi	', 800, 8, 27, 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (25, N'Basınçlı Yıkama Makinesi', N'Bosch EasyAquatak 120 Yüksek Basınçlı Yıkama Makinesi', 2204, 8, 28, 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (26, N'Fitbit Charge 4 Akıllı Bileklik', N'Nabız ölçümü, uyku takibi, GPS gibi özellikleri ile fitness takibi için ideal akıllı bileklik', 1000, 9, 30, 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (27, N'Reebok Step Platformu', N'Aerobik ve fitness egzersizleri için kullanılan, ayarlanabilir yükseklikli step platformu', 2899, 9, 31, 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (28, N'Dambıl Seti', N'2x5kg, 2x2.5kg ve 2x1.25kg ağırlıklardan oluşan, evde fitness yapmak için ideal dumbell seti', 250, 9, 32, 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (29, N'Royal Canin Kedi Maması', N'İçerdiği özel besinler ile kedinizin sağlıklı beslenmesini sağlayan mama', 126, 10, 33, 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (30, N'Trixie Köpek Tasma ve Boyunluk Seti', N'Yumuşak malzemeden üretilmiş, ayarlanabilir boyunluk ve tasma seti', 250, 10, 34, 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (31, N'Ferplast Kedi Kum Kabı', N'Kapaklı, kolay temizlenebilen ve koku yapmayan kedi kum kabı', 220, 10, 35, 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (1002, N'Bluetooth Kulaklık', N'Sony WH-1000XM4, gelişmiş ses kalitesi ve gürültü engelleme özelliği ile üst düzey bir kablosuz ', 1000, 2, 2002, 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [UnitPrice], [CategoryId], [ProductImageId], [UserId]) VALUES (1003, N'Coca Cola Zero', N'Coca Cola Zero 330 mL kutu kola', 20, 1, 2003, 2)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ShoppingCarts] ON 

INSERT [dbo].[ShoppingCarts] ([ShoppingCartId], [ProductId], [UserId], [Quantity]) VALUES (4002, 2, 4, 3)
INSERT [dbo].[ShoppingCarts] ([ShoppingCartId], [ProductId], [UserId], [Quantity]) VALUES (4003, 8, 4, 1)
SET IDENTITY_INSERT [dbo].[ShoppingCarts] OFF
GO
SET IDENTITY_INSERT [dbo].[UserOperationClaims] ON 

INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (1, 2, 1)
INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (2, 3, 1)
INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (3, 4, 2)
INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (4, 5, 2)
INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (1002, 1002, 1)
INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (2002, 2002, 2)
INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (2003, 2003, 2)
INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (2004, 2004, 2)
INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (3002, 3002, 2)
SET IDENTITY_INSERT [dbo].[UserOperationClaims] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status], [UserType]) VALUES (2, N'seller', N'1', N'seller1@gmail.com', 0x7E3019CBC5FD50BBF7E638B82C711AA63D79FD601E10C793228600C669A500AF8FEA64B05717AE09240A08236DE2FB4E2F7F3FD36D37A0125FAA73C00F881375, 0x476976E81D693160C0125038D3A4FECC4210B90EEE5935CCEC5992271106FC492AF9AAA1119DCAACF638C7D5263C6B8D615397513858CA425CCF3C7A5D31759F338803B5211B6F40782242980E1CF39739DBBAB07CC542AF94190A528E0216890717927290712B0F5E39B0EC234AEEB3D336AE4050919B3A011BB3209FCB36CD, 1, N'Seller')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status], [UserType]) VALUES (3, N'seller', N'2', N'seller2@gmail.com', 0x2D17AB26E9E64ADE1555AE4F87375874F9D722E1237DCC83AEE003B2120616416A4D587AB878D619F8C5265D301DA9C6CB17FE4A30980047009CCE631B8F4DB3, 0x724826D5AC44D65A5124067EAB1DAFC164E8109AE3D589296446622FC4222110553648501800FFDE6B8861DE73EA6BE10A1EB7FB0C1EB5BB5D96ECB32A4CCB5E5B970192BC89494D329930E0885DAF053B3E29EEE2556602072D025663B4ABD921DF0EFDE5B7B97EC3DE69B7E83A878B77B901843CF30AB81D083A9E58363BCF, 1, N'Seller')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status], [UserType]) VALUES (4, N'buyer', N'1', N'buyer1@gmail.com', 0xFB9280CF6498FCF0E9C026E6F63372CFED91EE77DB918DFA170DE5CAD68A1423F2BDF3C0B907DA03F9042E88DC6F16EAC83B48183684D73BB499A03C35F1145B, 0xF5BC4880EFB397C1DB24A9F68D5469D4C58C6AC06125F46F26B06C4246C3FA249F408620EA777822FA7BABE5D02EF0F4428CA2B2E127DA11491B6598FE3D2C14335F51DFF21796FBF185E4724CE0F7BD3862D565E5480CF7F996A0B9D1ACEF9C839A8C045DF1047E8B0D535E2660889FFD17D2E48BE0EE292B5EF2A475F7953C, 1, N'Buyer')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status], [UserType]) VALUES (5, N'buyer', N'2', N'buyer2@gmail.com', 0xCBAABAC4DB8DADF834127AD1206DFBEB4452E685FBA0D71E6C479F33500904E5DEF2464DCE3919742C4A7FD8CE23698DBF8561732C9E6CAFA0BC36F897A16017, 0xFFEEB318083D89F621701E3FEEFED02CD7B7AE61B0AF8A43A2481AE8ED6DADC0DCFA2AFBF0C62383920916CCE003019B7C2D91480CBCBE81A94E83DD971B2B9E1B97F4045D36A44DEC4E60F5CC43B784CC5C2FF3050B4AF353A943203325AA96AEB81A98171EF6293B24DA522FA5E98FD15E7B836D9AD38B83A0421A25B79000, 1, N'Buyer')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status], [UserType]) VALUES (1002, N'eyup', N'duran', N'seller3@gmail.com', 0x8909F62D3FF14FBA96B287B5FD36476AFAF21E77E84A3E3F1211EDE63BBD58C08430F9737F031322094A307CE07CDEA02D0AEA194BE7EE792A6140783584122E, 0x9A828AAE7D7314BC03C39A063E3F4DA47A7A3CAAAEE68AD96184FB58D7614B86D08CE73D3392F1F9E674589741177C2E3D332994B50F2C7970321DEE5B6CDD9E0F62897B56A4202342844E4C292CD6FC9E30D68833B4D926E28F834F0D606729FC8A4CCDDABA59612763ABC74CC707C492F667CE5467FCAD88406D9784AF9B6B, 1, N'Seller')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status], [UserType]) VALUES (2002, N'Buyer', N'4', N'buyer4@gmail.com', 0xA86B69D6B21DA8007A3B7849F40651D36AE828235D5D60D8F1FF5313F812994CADABEAE9214DFB51E0A7DF7B86212150AC6F0BE86A95F61F4A6C55D64060599D, 0x7DF81456BDB386A7F57553FE6194187030A6F5CA912582B12E4588D6C07620E7E6E385C451B1AA672CBB5DC20EE0CAA7A93D400FFE26D290997A47F2495429AEDE0F166E03B31A4260B4C8B959DB6DE1294A26762F0E0011A3A9EC6AD2D2465E1F05A117E855440E764514A094BC1122E5F97DB8C1DF382D8E08A09F145A8D61, 1, N'Buyer')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status], [UserType]) VALUES (2003, N'buyer', N'5', N'buyer5@gmail.com', 0x80FCF2383EB71508F8DC43262C39AF925BF25B78511B19A692E95FC6CB99E405468B46D2762A5178F6B53ADF1367FB706060DD3F2885876F166D93B90E5FEA51, 0x830B5D581B4C29178EF1DE4AA12B64297FFF90616816E962DD74571A1F24165D69782AAF1C2521D2B28112D1CF3C580499A90A44578DC00560AB0C6ADC146D37F3B4A8EAC1193BCC120F4CBB63EFE42D317D7714347742B5AF86044667824775E855FFC19BDF8FA74D0EED8FBA2A6FB61522F6DECC4356D98AC4B14336D06EDB, 1, N'Buyer')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status], [UserType]) VALUES (2004, N'fatih', N'duran', N'fatih@gmail.com', 0xE27557DBE22CEC02507286C91B9FF38EF10998A0307A3F7DAAC78E8EBF542A63C784CC82CC11BA75D15F007AF01B6E3D381D66C8B3D3D16871AAAEE508311DBF, 0xFAF2C105136E99F29F8214E395FDDE29F85B7B9F58E68389D14FB8DAE37B91E87918E9BF5304072A88D889CB744BEFC0E8E0C3C21A5F4455E517AEB0F059EEB27D12F4F7C24FDF90741096C79542D54BB073E95E44987E4A0A0F0FD229FA1DF6CD2078EAEF0C017E40F0EB4828E749C19D865BD740361CBB35B743F4312D7C80, 1, N'Buyer')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status], [UserType]) VALUES (3002, N'Buyer', N'5', N'buyer6@gmail.com', 0xC985B5ADD1C6C3FBCE2E8685F9F2DD3C8E7C7A5DFE4C2481111AF76AFE09FC9362AB0D0F2E188D2C592F89823E744ACF48E092FFFB098E4CA9BF93B92A540BE0, 0x44A144AF1CD86BB90668E0EDA66952E1482A8394DCE35B567F833E715D1F81052BF659BA4745A847B0D20227F3E1C0747EAF42650D48E896D5F8B0F18ED34AD519D652E0C787235E1E88848F19859F5EC6CC36F0BEE05021C1AE2E65C368794B7ACC3FEBA8F22923DEE83E85C716FC17FDD3DC21B6A3F1A46C6F8C40D6408CBD, 1, N'Buyer')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [UQ__UserOper__446BDAEC696FCBC3]    Script Date: 2.07.2023 16:23:36 ******/
ALTER TABLE [dbo].[UserOperationClaims] ADD UNIQUE NONCLUSTERED 
(
	[UserId] ASC,
	[OperationClaimId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BankAccounts]  WITH CHECK ADD  CONSTRAINT [FK_BankAccounts_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[BankAccounts] CHECK CONSTRAINT [FK_BankAccounts_Users]
GO
ALTER TABLE [dbo].[ContactInfoes]  WITH CHECK ADD  CONSTRAINT [FK_ContactInfo_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ContactInfoes] CHECK CONSTRAINT [FK_ContactInfo_Users]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Cargoes] FOREIGN KEY([CargoId])
REFERENCES [dbo].[Cargoes] ([CargoId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Cargoes]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrderStatus] FOREIGN KEY([OrderStatusId])
REFERENCES [dbo].[OrderStatues] ([OrderStatusId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_OrderStatus]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Users]
GO
ALTER TABLE [dbo].[ShoppingCarts]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCarts_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[ShoppingCarts] CHECK CONSTRAINT [FK_ShoppingCarts_Products]
GO
ALTER TABLE [dbo].[ShoppingCarts]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCarts_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ShoppingCarts] CHECK CONSTRAINT [FK_ShoppingCarts_Users]
GO
ALTER TABLE [dbo].[UserOperationClaims]  WITH CHECK ADD FOREIGN KEY([OperationClaimId])
REFERENCES [dbo].[OperationClaims] ([Id])
GO
ALTER TABLE [dbo].[UserOperationClaims]  WITH CHECK ADD FOREIGN KEY([OperationClaimId])
REFERENCES [dbo].[OperationClaims] ([Id])
GO
ALTER TABLE [dbo].[UserOperationClaims]  WITH CHECK ADD FOREIGN KEY([OperationClaimId])
REFERENCES [dbo].[OperationClaims] ([Id])
GO
ALTER TABLE [dbo].[UserOperationClaims]  WITH CHECK ADD  CONSTRAINT [FK_UserOperationClaims_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserOperationClaims] CHECK CONSTRAINT [FK_UserOperationClaims_Users]
GO
/****** Object:  Trigger [dbo].[trg_seller_user]    Script Date: 2.07.2023 16:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_seller_user]
ON [dbo].[Users]
after insert
AS Begin
declare @UserId INT
declare @UserType Varchar(100)

select @UserId =  ins.Id from inserted ins;
select @UserType = ins.UserType from inserted ins

if @UserType='Seller' Begin
INSERT INTO UserOperationClaims(UserId,OperationClaimId)
VALUES (@UserId,1);
 PRINT 'We Successfully Fired the AFTER INSERT Triggers in SQL Server.'
end
else
INSERT INTO UserOperationClaims(UserId,OperationClaimId)
VALUES (@UserId,2);
END

GO
ALTER TABLE [dbo].[Users] ENABLE TRIGGER [trg_seller_user]
GO
USE [master]
GO
ALTER DATABASE [ETrade] SET  READ_WRITE 
GO
