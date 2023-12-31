USE [master]
GO
/****** Object:  Database [UserManagement]    Script Date: 7/7/2023 2:32:37 PM ******/
CREATE DATABASE [UserManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UserManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.LONGBAO\MSSQL\DATA\UserManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UserManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.LONGBAO\MSSQL\DATA\UserManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [UserManagement] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UserManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UserManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UserManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UserManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UserManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UserManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [UserManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [UserManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UserManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UserManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UserManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UserManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UserManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UserManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UserManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UserManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [UserManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UserManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UserManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UserManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UserManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UserManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UserManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UserManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UserManagement] SET  MULTI_USER 
GO
ALTER DATABASE [UserManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UserManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UserManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UserManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UserManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UserManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [UserManagement] SET QUERY_STORE = ON
GO
ALTER DATABASE [UserManagement] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [UserManagement]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 7/7/2023 2:32:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[orderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[productID] [nvarchar](50) NULL,
	[orderID] [nvarchar](50) NULL,
	[price] [decimal](18, 0) NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_tblOrderDetails] PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 7/7/2023 2:32:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[OrderID] [nvarchar](50) NOT NULL,
	[UserID] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
	[Total] [decimal](18, 0) NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 7/7/2023 2:32:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
	[Brand] [nvarchar](50) NULL,
	[category] [nvarchar](50) NULL,
	[price] [decimal](18, 0) NULL,
	[quantity] [int] NULL,
	[description] [nvarchar](max) NULL,
	[Image1] [nvarchar](max) NULL,
	[Image2] [nvarchar](max) NULL,
	[Image3] [nvarchar](max) NULL,
	[Image4] [nvarchar](max) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 7/7/2023 2:32:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetails] ON 

INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (58, N'P00006', N'O9363', CAST(5990 AS Decimal(18, 0)), 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (59, N'P00003', N'O9363', CAST(2764 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (60, N'P00010', N'O5358', CAST(9795 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (61, N'P00015', N'O5358', CAST(27990 AS Decimal(18, 0)), 3)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (62, N'P00009', N'O7664', CAST(8045 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (63, N'P00014', N'O7664', CAST(23990 AS Decimal(18, 0)), 3)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (64, N'P00002', N'O2859', CAST(790 AS Decimal(18, 0)), 3)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (65, N'P00001', N'O2859', CAST(1145 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (66, N'P00002', N'O3608', CAST(790 AS Decimal(18, 0)), 3)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (67, N'P00001', N'O3608', CAST(1145 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (68, N'P00002', N'O8274', CAST(790 AS Decimal(18, 0)), 3)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (69, N'P00001', N'O8274', CAST(1145 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (70, N'P00002', N'O0354', CAST(790 AS Decimal(18, 0)), 3)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (71, N'P00001', N'O0354', CAST(1145 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (72, N'P00002', N'O3312', CAST(790 AS Decimal(18, 0)), 3)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (73, N'P00001', N'O3312', CAST(1145 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (74, N'P00002', N'O7692', CAST(790 AS Decimal(18, 0)), 3)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (75, N'P00001', N'O7692', CAST(1145 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (76, N'P00002', N'O8276', CAST(790 AS Decimal(18, 0)), 3)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (77, N'P00001', N'O8276', CAST(1145 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (78, N'P00002', N'O9433', CAST(790 AS Decimal(18, 0)), 3)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (79, N'P00001', N'O9433', CAST(1145 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (80, N'P00002', N'O1005', CAST(790 AS Decimal(18, 0)), 3)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (81, N'P00001', N'O1005', CAST(1145 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (82, N'P00002', N'O5667', CAST(790 AS Decimal(18, 0)), 3)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (83, N'P00001', N'O5667', CAST(1145 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (84, N'P00002', N'O4201', CAST(790 AS Decimal(18, 0)), 3)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (85, N'P00001', N'O4201', CAST(1145 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (86, N'P00002', N'O3503', CAST(790 AS Decimal(18, 0)), 3)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (87, N'P00001', N'O3503', CAST(1145 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (88, N'P00001', N'O1931', CAST(1145 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (89, N'P00001', N'O8174', CAST(1145 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (90, N'P00014', N'O8720', CAST(23990 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (91, N'P00014', N'O1592', CAST(23990 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (92, N'P00010', N'O2184', CAST(9795 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (93, N'P00008', N'O2184', CAST(280 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (94, N'P00007', N'O2184', CAST(2490 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (95, N'P00013', N'O2184', CAST(35990 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (96, N'P00005', N'O8370', CAST(4990 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (97, N'P00005', N'O1490', CAST(4990 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (98, N'P00013', N'O8111', CAST(35990 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (99, N'P00012', N'O8111', CAST(9894 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (100, N'P00013', N'O6968', CAST(35990 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [productID], [orderID], [price], [quantity]) VALUES (101, N'P00012', N'O6968', CAST(9894 AS Decimal(18, 0)), 1)
SET IDENTITY_INSERT [dbo].[tblOrderDetails] OFF
GO
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Total]) VALUES (N'O0354', N'admin', CAST(N'2023-07-03T07:11:26.740' AS DateTime), CAST(3515 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Total]) VALUES (N'O1005', N'admin', CAST(N'2023-07-03T07:15:11.887' AS DateTime), CAST(3515 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Total]) VALUES (N'O1490', N'admin', CAST(N'2023-07-03T17:07:52.753' AS DateTime), CAST(4990 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Total]) VALUES (N'O1592', N'admin', CAST(N'2023-07-03T16:03:31.307' AS DateTime), CAST(23990 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Total]) VALUES (N'O1931', N'admin', CAST(N'2023-07-03T15:43:09.023' AS DateTime), CAST(1145 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Total]) VALUES (N'O2184', N'admin', CAST(N'2023-07-03T17:05:58.717' AS DateTime), CAST(48555 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Total]) VALUES (N'O2859', N'admin', CAST(N'2023-07-03T07:00:50.417' AS DateTime), CAST(3515 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Total]) VALUES (N'O3312', N'admin', CAST(N'2023-07-03T07:12:32.780' AS DateTime), CAST(3515 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Total]) VALUES (N'O3503', N'admin', CAST(N'2023-07-03T07:16:44.733' AS DateTime), CAST(3515 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Total]) VALUES (N'O3608', N'admin', CAST(N'2023-07-03T07:10:01.483' AS DateTime), CAST(3515 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Total]) VALUES (N'O4201', N'admin', CAST(N'2023-07-03T07:16:09.397' AS DateTime), CAST(3515 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Total]) VALUES (N'O5358', N'admin', CAST(N'2023-07-02T07:52:31.183' AS DateTime), CAST(93765 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Total]) VALUES (N'O5667', N'admin', CAST(N'2023-07-03T07:16:00.783' AS DateTime), CAST(3515 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Total]) VALUES (N'O6968', N'admin', CAST(N'2023-07-04T23:05:12.453' AS DateTime), CAST(45884 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Total]) VALUES (N'O7664', N'admin', CAST(N'2023-07-02T08:00:17.857' AS DateTime), CAST(80015 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Total]) VALUES (N'O7692', N'admin', CAST(N'2023-07-03T07:12:51.327' AS DateTime), CAST(3515 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Total]) VALUES (N'O8111', N'admin', CAST(N'2023-07-04T23:02:40.633' AS DateTime), CAST(45884 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Total]) VALUES (N'O8174', N'admin', CAST(N'2023-07-03T15:43:51.403' AS DateTime), CAST(1145 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Total]) VALUES (N'O8274', N'admin', CAST(N'2023-07-03T07:10:55.350' AS DateTime), CAST(3515 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Total]) VALUES (N'O8276', N'admin', CAST(N'2023-07-03T07:14:20.220' AS DateTime), CAST(3515 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Total]) VALUES (N'O8370', N'admin', CAST(N'2023-07-03T17:06:52.147' AS DateTime), CAST(4990 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Total]) VALUES (N'O8720', N'admin', CAST(N'2023-07-03T16:03:27.830' AS DateTime), CAST(23990 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Total]) VALUES (N'O9363', N'admin', CAST(N'2023-07-02T07:49:01.267' AS DateTime), CAST(14744 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Total]) VALUES (N'O9433', N'admin', CAST(N'2023-07-03T07:14:42.630' AS DateTime), CAST(3515 AS Decimal(18, 0)))
GO
INSERT [dbo].[tblProduct] ([productID], [name], [Brand], [category], [price], [quantity], [description], [Image1], [Image2], [Image3], [Image4], [Status]) VALUES (N'P00001', N'Nữ LWA-300H-7E2VDF', N'Casio', N'Watch', CAST(1145 AS Decimal(18, 0)), 10, N'Đồng hồ Casio 42.1 mm Nữ LWA-300H-7E2VDF thuộc thương hiệu Casio của Nhật Bản. Đồng hồ sở hữu đường kính mặt 42.1mm, phù hợp với các bạn nữ. Chất liệu mặt kính là nhựa, an toàn, khó vỡ chịu được va đập tốt và bền bỉ trong mọi hoàn cảnh, dễ dàng đánh bóng khi gặp trầy xước nhẹ. Khung viền của đồng hồ làm từ thép không gỉ - sáng bóng, hạn chế chống ăn mòn và trầy xước. Chất liệu dây đeo được làm từ nhựa - an toàn và bền bỉ, mang lại cảm giác nhẹ tay cho người dùng khi đeo', N'https://cdn.tgdd.vn/Products/Images/7264/307456/casio-lwa-300h-7e2vdf-nu-1.jpg', N'https://cdn.tgdd.vn/Products/Images/7264/307456/casio-lwa-300h-7e2vdf-nu-2.jpg', N'https://cdn.tgdd.vn/Products/Images/7264/307456/casio-lwa-300h-7e2vdf-nu-3.jpg', N'https://cdn.tgdd.vn/Products/Images/7264/307456/casio-lwa-300h-7e2vdf-nu-4.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [name], [Brand], [category], [price], [quantity], [description], [Image1], [Image2], [Image3], [Image4], [Status]) VALUES (N'P00002', N'Nam AE-1200WH-1AVDF', N'Casio', N'Watch', CAST(790 AS Decimal(18, 0)), 7, N'Thương hiệu đồng hồ nổi tiếng đến từ Nhật Bản không ngừng cải tiến và cho ra mắt những dòng sản phẩm chất lượng phù hợp với nhiều đối tượng khách hàng. Những dòng sản phẩm nổi tiếng của Casio là: G-Shock với thiết kế mạnh mẽ cùng độ bền cao, Edifice thiết kế hiện đại cùng nhiều tính năng vượt trội, Sheen với thiết kế cổ điển và sang trọng,…', N'https://cdn.tgdd.vn/Products/Images/7264/199493/casio-ae-1200wh-1avdf-den-1-2-org.jpg', N'https://cdn.tgdd.vn/Products/Images/7264/199493/casio-ae-1200wh-1avdf-den-2-2-org.jpg', N'https://cdn.tgdd.vn/Products/Images/7264/199493/casio-ae-1200wh-1avdf-den-3-2-org.jpg', N'https://cdn.tgdd.vn/Products/Images/7264/199493/casio-ae-1200wh-1avdf-den-4-2-org.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [name], [Brand], [category], [price], [quantity], [description], [Image1], [Image2], [Image3], [Image4], [Status]) VALUES (N'P00003', N'Nam MTP-E715L-1AVDF', N'Casio ', N'Watch', CAST(2764 AS Decimal(18, 0)), 20, N'Thương hiệu đồng hồ nổi tiếng đến từ Nhật Bản không ngừng cải tiến và cho ra mắt những dòng sản phẩm chất lượng phù hợp với nhiều đối tượng khách hàng. Những dòng sản phẩm nổi tiếng của Casio là: G-Shock với thiết kế mạnh mẽ cùng độ bền cao, Edifice thiết kế hiện đại cùng nhiều tính năng vượt trội, Sheen với thiết kế cổ điển và sang trọng,…', N'https://cdn.tgdd.vn/Products/Images/7264/302237/casio-mtp-e715l-1avdf-nam-1.jpg', N'https://cdn.tgdd.vn/Products/Images/7264/302237/casio-mtp-e715l-1avdf-nam-2.jpg', N'https://cdn.tgdd.vn/Products/Images/7264/302237/casio-mtp-e715l-1avdf-nam-3.jpg', N'https://cdn.tgdd.vn/Products/Images/7264/302237/casio-mtp-e715l-1avdf-nam-4.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [name], [Brand], [category], [price], [quantity], [description], [Image1], [Image2], [Image3], [Image4], [Status]) VALUES (N'P00004', N'Nam MTD-130-1AVDF', N'Casio', N'Watch', CAST(2842 AS Decimal(18, 0)), 10, N'Thương hiệu đồng hồ nổi tiếng đến từ Nhật Bản không ngừng cải tiến và cho ra mắt những dòng sản phẩm chất lượng phù hợp với nhiều đối tượng khách hàng. Những dòng sản phẩm nổi tiếng của Casio là: G-Shock với thiết kế mạnh mẽ cùng độ bền cao, Edifice thiết kế hiện đại cùng nhiều tính năng vượt trội, Sheen với thiết kế cổ điển và sang trọng,…', N'https://cdn.tgdd.vn/Products/Images/7264/302235/casio-mtd-130-1avdf-nam-1.jpg', N'https://cdn.tgdd.vn/Products/Images/7264/302235/casio-mtd-130-1avdf-nam-2.jpg', N'https://cdn.tgdd.vn/Products/Images/7264/302235/casio-mtd-130-1avdf-nam-3.jpg', N'https://cdn.tgdd.vn/Products/Images/7264/302235/casio-mtd-130-1avdf-nam-4.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [name], [Brand], [category], [price], [quantity], [description], [Image1], [Image2], [Image3], [Image4], [Status]) VALUES (N'P00005', N'Samsung Galaxy Buds 2 Pro R510N', N'Samsung', N'Earbuds', CAST(4990 AS Decimal(18, 0)), 3, N'Tai nghe Bluetooth True Wireless Samsung Galaxy Buds 2 Pro R510N là sản phẩm gây ấn tượng mạnh trong sự kiện Samsung Galaxy Unpacked 2022 diễn ra vào ngày 10/8 nhờ vào những điểm nâng cấp giá trị về tính năng cũng như thiết kế. Đây chính là món phụ kiện thời trang rất đáng để sở hữu đối với SamFan.', N'https://cdn.tgdd.vn/Products/Images/54/286045/tai-nghe-bluetooth-true-wireless-galaxy-buds2-pro-den-1.jpg', N'https://cdn.tgdd.vn/Products/Images/54/286045/tai-nghe-bluetooth-true-wireless-galaxy-buds2-pro-den-2.jpg', N'https://cdn.tgdd.vn/Products/Images/54/286045/tai-nghe-bluetooth-true-wireless-galaxy-buds2-pro-den-3.jpg', N'https://cdn.tgdd.vn/Products/Images/54/286045/tai-nghe-bluetooth-true-wireless-galaxy-buds2-pro-den-4.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [name], [Brand], [category], [price], [quantity], [description], [Image1], [Image2], [Image3], [Image4], [Status]) VALUES (N'P00006', N'MagSafe Charge Apple MQD83', N'Apple', N'Earbuds', CAST(5990 AS Decimal(18, 0)), 4, N'AirPods Pro 2 là một trong những sản phẩm được Apple ra mắt trong năm 2022, với nhiều nâng cấp ấn tượng, chip H2 mạnh mẽ, âm thanh phong phú hơn, khả năng khử tiếng ồn chủ động,... hứa hẹn sẽ mang lại trải nghiệm tuyệt vời cho người dùng.', N'https://cdn.tgdd.vn/Products/Images/54/289781/airpods-pro-2nd-generation-0.jpg', N'https://cdn.tgdd.vn/Products/Images/54/289781/airpods-pro-2nd-generation-2.jpg', N'https://cdn.tgdd.vn/Products/Images/54/289781/airpods-pro-2nd-generation-1.jpg', N'https://cdn.tgdd.vn/Products/Images/54/289781/airpods-pro-2nd-generation-3.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [name], [Brand], [category], [price], [quantity], [description], [Image1], [Image2], [Image3], [Image4], [Status]) VALUES (N'P00007', N'Sony WF-C700N', N'Sony', N'Earbuds', CAST(2490 AS Decimal(18, 0)), 6, N'Tai nghe Bluetooth True Wireless Sony WF-C700N với màu sắc sang trọng, thiết kế siêu nhỏ gọn, kiểu dáng năng động, trải nghiệm không gian nghe nhạc thú vị, dễ dàng tùy chỉnh âm thanh theo cách riêng của bạn.', N'https://cdn.tgdd.vn/Products/Images/54/306158/tai-nghe-bluetooth-true-wireless-sony-wf-c700n-den-1.jpg', N'https://cdn.tgdd.vn/Products/Images/54/306158/tai-nghe-bluetooth-true-wireless-sony-wf-c700n-den-2.jpg', N'https://cdn.tgdd.vn/Products/Images/54/306158/tai-nghe-bluetooth-true-wireless-sony-wf-c700n-den-3.jpg', N'https://cdn.tgdd.vn/Products/Images/54/306158/tai-nghe-bluetooth-true-wireless-sony-wf-c700n-den-4.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [name], [Brand], [category], [price], [quantity], [description], [Image1], [Image2], [Image3], [Image4], [Status]) VALUES (N'P00008', N'Mozard Q7', N'Mozard', N'Earbuds', CAST(280 AS Decimal(18, 0)), 10, N'Tai nghe Bluetooth True Wireless Mozard Q7 với màu sắc trẻ trung, kiểu dáng bo tròn đẹp mắt, chất lượng âm thanh sống động, kết nối nhanh chóng với thiết bị âm thanh mang đến người dùng những trải nghiệm tối ưu.', N'https://cdn.tgdd.vn/Products/Images/54/305597/tai-nghe-bluetooth-true-wireless-mozard-q7-hong-1.jpg', N'https://cdn.tgdd.vn/Products/Images/54/305597/tai-nghe-bluetooth-true-wireless-mozard-q7-hong-2.jpg', N'https://cdn.tgdd.vn/Products/Images/54/305597/tai-nghe-bluetooth-true-wireless-mozard-q7-hong-3.jpg', N'https://cdn.tgdd.vn/Products/Images/54/305597/tai-nghe-bluetooth-true-wireless-mozard-q7-hong-4.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [name], [Brand], [category], [price], [quantity], [description], [Image1], [Image2], [Image3], [Image4], [Status]) VALUES (N'P00009', N'Road Java 700C-Veloce-D 700C Size S', N'Java', N'Bike', CAST(8045 AS Decimal(18, 0)), 3, N'Mang một diện mạo khỏe khoắn cùng nhiều phiên bản màu sắc nổi bật, xe đạp thể thao Road Java 700C-VELOCE-D 700C Size S phù hợp cho các tín đồ xe đạp đam mê khám phá và rèn luyện sức khỏe hàng ngày.', N'https://cdn.tgdd.vn/Products/Images/9758/265866/xe-road-java-700c-veloce-d-700c-size-s-bac-glr-1.jpg', N'https://cdn.tgdd.vn/Products/Images/9758/265866/xe-road-java-700c-veloce-d-700c-size-s-bac-glr-2.jpg', N'https://cdn.tgdd.vn/Products/Images/9758/265866/xe-road-java-700c-veloce-d-700c-size-s-bac-glr-3.jpg', N'https://cdn.tgdd.vn/Products/Images/9758/265866/xe-road-java-700c-veloce-d-700c-size-s-bac-glr-4.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [name], [Brand], [category], [price], [quantity], [description], [Image1], [Image2], [Image3], [Image4], [Status]) VALUES (N'P00010', N'Road Java 700C-Siluro2-18S-1 700C Size S', N'Java', N'Bike', CAST(9795 AS Decimal(18, 0)), 5, N'Mang một diện mạo khỏe khoắn cùng nhiều phiên bản màu sắc nổi bật, xe đạp thể thao Road Java 700C-SILURO2-18S-1 700C Size S phù hợp cho các tín đồ xe đạp đam mê khám phá, chinh phục thử thách hay đơn giản là rèn luyện sức khỏe hàng ngày.', N'https://cdn.tgdd.vn/Products/Images/9758/265871/xe-road-java-700c-siluro2-18s-1-700c-size-s-den-1.jpg', N'https://cdn.tgdd.vn/Products/Images/9758/265871/xe-road-java-700c-siluro2-18s-1-700c-size-s-den-2.jpg', N'https://cdn.tgdd.vn/Products/Images/9758/265871/xe-road-java-700c-siluro2-18s-1-700c-size-s-den-3.jpg', N'https://cdn.tgdd.vn/Products/Images/9758/265871/xe-road-java-700c-siluro2-18s-1-700c-size-s-den-4.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [name], [Brand], [category], [price], [quantity], [description], [Image1], [Image2], [Image3], [Image4], [Status]) VALUES (N'P00011', N'Road Txed Speed Horse S5 29 inch Size L', N'Txed', N'Bike', CAST(5694 AS Decimal(18, 0)), 7, N'Xe đạp thể thao Road Txed Speed Horse S5 29 inch Size L thu hút với kiểu dáng năng động, trẻ trung, độc đáo với nhiều phiên bản màu sắc độc đáo (tình trạng còn hàng tuỳ thuộc vào khu vực và thời điểm, bài viết sử dụng bản màu đen để minh hoạ). Mẫu xe là người bạn đồng hành đáng tin cậy cho các tay đua trong những cuộc cạnh tranh khốc liệt, đồng thời cũng phù hợp với người dùng yêu thích bộ môn đạp xe để rèn luyện sức khỏe. ', N'https://cdn.tgdd.vn/Products/Images/9758/250986/Slider/txed-speed-hourse-s5-den-size-l638046364326866124.jpg', N'https://cdn.tgdd.vn/Products/Images/9758/250986/Slider/txed-speed-hourse-s5-den-size-l638055909031713970.jpg', N'https://cdn.tgdd.vn/Products/Images/9758/250986/Slider/txed-speed-hourse-s5-den-size-l638053292632918305.jpg', N'https://cdn.tgdd.vn/Products/Images/9758/250986/Slider/txed-speed-hourse-s5-den-size-l-5-1020x570.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [name], [Brand], [category], [price], [quantity], [description], [Image1], [Image2], [Image3], [Image4], [Status]) VALUES (N'P00012', N'Road Txed Classic 29 inch Size L', N'Txed', N'Bike', CAST(9894 AS Decimal(18, 0)), 10, N'Xe đạp thể thao Road Txed Road Classic 29 inch Size L gây thương nhớ với lối thiết kế tinh tế không kém phần mạnh mẽ, năng động. Xe phù hợp với người có chiều cao từ 160 - 190 cm. Mẫu xe có nhiều phiên bản màu sắc và còn hàng tùy theo khu vực, địa điểm.', N'https://cdn.tgdd.vn/Products/Images/9758/250983/txed-road-classic-size-l-trang-xanh-l-min-1.jpeg', N'https://cdn.tgdd.vn/Products/Images/9758/250983/txed-road-classic-size-l-trang-xanh-l-min-2.jpeg', N'https://cdn.tgdd.vn/Products/Images/9758/250983/txed-road-classic-size-l-trang-xanh-l-min-3.jpeg', N'https://cdn.tgdd.vn/Products/Images/9758/250983/txed-road-classic-size-l-trang-xanh-l-min-4.jpeg', 1)
INSERT [dbo].[tblProduct] ([productID], [name], [Brand], [category], [price], [quantity], [description], [Image1], [Image2], [Image3], [Image4], [Status]) VALUES (N'P00013', N'Samsung Galaxy Z Fold4 5G 256GB', N'Samsung', N'Phone', CAST(35990 AS Decimal(18, 0)), 4, N'Sau bao lời đồn đoán về ngoại hình cùng bộ thông số thì mới đây chiếc Samsung Galaxy Z Fold4 5G 256GB cũng đã chính thức lộ diện qua sự kiện Unpacked thường niên của Samsung. Với độ bền bỉ gia tăng cùng sự nâng cấp đáng kể về hiệu năng giúp cho thiết bị có khả xử lý mượt mà nhiều tác vụ hay chơi game cấu hình cao mượt mà.', N'https://cdn.tgdd.vn/Products/Images/42/250625/samsung-galaxy-z-fold4-256gb-1.jpg', N'https://cdn.tgdd.vn/Products/Images/42/250625/samsung-galaxy-z-flod-4-den-1.jpg', N'https://cdn.tgdd.vn/Products/Images/42/250625/samsung-galaxy-z-fold-4-256gb-1.jpg', N'https://cdn.tgdd.vn/Products/Images/42/250625/samsung-galaxy-z-fold-4-256gb-6.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [name], [Brand], [category], [price], [quantity], [description], [Image1], [Image2], [Image3], [Image4], [Status]) VALUES (N'P00014', N'Samsung Galaxy S23+ 5G 256GB', N'Samsung', N'Phone', CAST(23990 AS Decimal(18, 0)), 15, N'Mỗi dịp đầu năm thì thị trường điện thoại trở nên cực kỳ náo nhiệt bởi hàng loạt các ông lớn smartphone liên tục ấn định ngày giới thiệu sản phẩm mới, một trong số đó có thể kể đến như chiếc Samsung Galaxy S23 plus sẽ được ra mắt vào ngày 02/02, máy sở hữu con chip Snapdragon 8 Gen 2 vô cùng mạnh mẽ đi kèm với màn hình chất lượng cùng camera chính có độ phân giải lên tới 50 MP.', N'https://cdn.tgdd.vn/Products/Images/42/290829/samsung-galaxy-s23-plus-kem-1.jpg', N'https://cdn.tgdd.vn/Products/Images/42/290829/samsung-galaxy-s23-plus-xanh-1-1.jpg', N'https://cdn.tgdd.vn/Products/Images/42/290829/samsung-galaxy-s23-plus-den-1.jpg', N'https://cdn.tgdd.vn/Products/Images/42/290829/samsung-galaxy-s23-plus-tim-1.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [name], [Brand], [category], [price], [quantity], [description], [Image1], [Image2], [Image3], [Image4], [Status]) VALUES (N'P00015', N'iPhone 14 Pro Max 128GB', N'Apple', N'Phone', CAST(27990 AS Decimal(18, 0)), 9, N'Điểm nhấn của sự kiện ra mắt sản phẩm tháng 9/2022 của Apple chính là siêu phẩm iPhone 14 Pro Max 128GB với thiết kế mặt trước đổi mới, camera nâng cấp mạnh mẽ và hiệu năng bùng nổ từ chip A16 Bionic, đáp ứng mọi nhu cầu của người dùng.', N'https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-den-1-1.jpg', N'https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-bac-1.jpg', N'https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-vang-1.jpg', N'https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-purple-1.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [name], [Brand], [category], [price], [quantity], [description], [Image1], [Image2], [Image3], [Image4], [Status]) VALUES (N'P00016', N'iPhone 11 64GB', N'Apple', N'Phone', CAST(10690 AS Decimal(18, 0)), 12, N'Sau chiếc điện thoại iPhone Xr, Apple tiếp tục ra mắt siêu phẩm 2019 mang tên iPhone 11 64GB - một smartphone được nâng cấp toàn diện từ thiết kế cao cấp, vi xử lý hiệu năng mạnh mẽ đến hệ thống camera chất lượng cùng thời lượng pin vượt trội.', N'https://cdn.tgdd.vn/Products/Images/42/153856/iphone-11-trang-1-2-org.jpg', N'https://cdn.tgdd.vn/Products/Images/42/153856/iphone-11-trang-4-1-org.jpg', N'https://cdn.tgdd.vn/Products/Images/42/153856/iphone-11-den-1-1-1-org.jpg', N'https://cdn.tgdd.vn/Products/Images/42/153856/iphone-11-den-4-1-org.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [name], [Brand], [category], [price], [quantity], [description], [Image1], [Image2], [Image3], [Image4], [Status]) VALUES (N'P00017', N'Nồi cơm điện tử Philips', NULL, NULL, CAST(1290 AS Decimal(18, 0)), 20, NULL, N'https://cdn.tgdd.vn/Products/Images/1922/299636/philips-18-lit-hd4515-55-1.jpg', NULL, NULL, NULL, 1)
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'abcdef', N'abcdef', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'admin', N'Toi la admin', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'anhtai', N'anhtai', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'baolong', N'baolong', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'hallo', N'hallo', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'hallu', N'hallu', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'hello', N'hello', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'Hoadnt', N'Hoa Doan', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'longbao', N'longbao', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'nihao', N'nihao', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE1234', N'Nam Anh', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE1235', N'Long Vu', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE130363', N'Ngo Ha Tri Ba', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140103', N'Phuoc Ha', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'vulong', N'vulong', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'xinchao', N'xinchao', N'1', N'US', 1)
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblOrders] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([OrderID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblOrders]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblProduct] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblProduct]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblUsers]
GO
USE [master]
GO
ALTER DATABASE [UserManagement] SET  READ_WRITE 
GO
