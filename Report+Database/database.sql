USE [FinalDotNet_db]
GO
ALTER TABLE [dbo].[UserRoles] DROP CONSTRAINT [FK_UserRoles_Users_UserId]
GO
ALTER TABLE [dbo].[UserRoles] DROP CONSTRAINT [FK_UserRoles_Roles_RoleId]
GO
ALTER TABLE [dbo].[Reviews] DROP CONSTRAINT [FK_Reviews_Users_UserId]
GO
ALTER TABLE [dbo].[Reviews] DROP CONSTRAINT [FK_Reviews_Products_ProductId]
GO
ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_Products_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_Products_Brands_BrandId]
GO
ALTER TABLE [dbo].[ProductColors] DROP CONSTRAINT [FK_ProductColors_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductColors] DROP CONSTRAINT [FK_ProductColors_Colors_ColorId]
GO
ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [FK_Orders_Users_UserId]
GO
ALTER TABLE [dbo].[OrderDetails] DROP CONSTRAINT [FK_OrderDetails_Products_ProductId]
GO
ALTER TABLE [dbo].[OrderDetails] DROP CONSTRAINT [FK_OrderDetails_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderDetails] DROP CONSTRAINT [DF__OrderDeta__isRev__14270015]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/26/2023 21:29:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 11/26/2023 21:29:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRoles]') AND type in (N'U'))
DROP TABLE [dbo].[UserRoles]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/26/2023 21:29:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND type in (N'U'))
DROP TABLE [dbo].[Roles]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 11/26/2023 21:29:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reviews]') AND type in (N'U'))
DROP TABLE [dbo].[Reviews]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/26/2023 21:29:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
DROP TABLE [dbo].[Products]
GO
/****** Object:  Table [dbo].[ProductColors]    Script Date: 11/26/2023 21:29:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductColors]') AND type in (N'U'))
DROP TABLE [dbo].[ProductColors]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/26/2023 21:29:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders]') AND type in (N'U'))
DROP TABLE [dbo].[Orders]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 11/26/2023 21:29:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderDetails]') AND type in (N'U'))
DROP TABLE [dbo].[OrderDetails]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 11/26/2023 21:29:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Colors]') AND type in (N'U'))
DROP TABLE [dbo].[Colors]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/26/2023 21:29:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'U'))
DROP TABLE [dbo].[Categories]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 11/26/2023 21:29:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Brands]') AND type in (N'U'))
DROP TABLE [dbo].[Brands]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 11/26/2023 21:29:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/26/2023 21:29:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 11/26/2023 21:29:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[ColorId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 11/26/2023 21:29:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Color] [nvarchar](100) NOT NULL,
	[Quantity] [int] NOT NULL,
	[isReview] [bit] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/26/2023 21:29:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[Total] [float] NOT NULL,
	[CreateAt] [datetime2](7) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductColors]    Script Date: 11/26/2023 21:29:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductColors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ColorId] [int] NOT NULL,
 CONSTRAINT [PK_ProductColors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/26/2023 21:29:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[SmallDescription] [nvarchar](max) NOT NULL,
	[DisPrice] [float] NOT NULL,
	[CurPrice] [float] NOT NULL,
	[ImageUrl] [nvarchar](500) NOT NULL,
	[BrandId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 11/26/2023 21:29:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[ReviewId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[Create_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/26/2023 21:29:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 11/26/2023 21:29:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[UserRoleId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/26/2023 21:29:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](150) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](6) NOT NULL,
	[DateCreate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([BrandId], [Name]) VALUES (2, N'Dell')
INSERT [dbo].[Brands] ([BrandId], [Name]) VALUES (3, N'Samsung')
INSERT [dbo].[Brands] ([BrandId], [Name]) VALUES (4, N'ASUS')
INSERT [dbo].[Brands] ([BrandId], [Name]) VALUES (5, N'Vivo')
INSERT [dbo].[Brands] ([BrandId], [Name]) VALUES (6, N'Acer')
INSERT [dbo].[Brands] ([BrandId], [Name]) VALUES (9, N'ThinkPad')
INSERT [dbo].[Brands] ([BrandId], [Name]) VALUES (14, N'Apple')
INSERT [dbo].[Brands] ([BrandId], [Name]) VALUES (24, N'HP')
INSERT [dbo].[Brands] ([BrandId], [Name]) VALUES (25, N'Sony')
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [Name], [Description]) VALUES (1, N'Mobile', N'Thiết bị di động')
INSERT [dbo].[Categories] ([CategoryId], [Name], [Description]) VALUES (2, N'Laptop', N'Thiết bị máy tính')
INSERT [dbo].[Categories] ([CategoryId], [Name], [Description]) VALUES (3, N'Mouse', N'Chuột không dây hoặc có dây')
INSERT [dbo].[Categories] ([CategoryId], [Name], [Description]) VALUES (4, N'Camera', N'Máy chụp ảnh cao cấp')
INSERT [dbo].[Categories] ([CategoryId], [Name], [Description]) VALUES (6, N'TV', N'TV chất lượng cao')
INSERT [dbo].[Categories] ([CategoryId], [Name], [Description]) VALUES (7, N'Ipad', N'Ipad of the world')
INSERT [dbo].[Categories] ([CategoryId], [Name], [Description]) VALUES (8, N'PC', N'PC of the world')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([ColorId], [Name]) VALUES (1, N'Black')
INSERT [dbo].[Colors] ([ColorId], [Name]) VALUES (2, N'White')
INSERT [dbo].[Colors] ([ColorId], [Name]) VALUES (3, N'Blue')
INSERT [dbo].[Colors] ([ColorId], [Name]) VALUES (4, N'Green')
INSERT [dbo].[Colors] ([ColorId], [Name]) VALUES (5, N'Yellow')
INSERT [dbo].[Colors] ([ColorId], [Name]) VALUES (6, N'Pink')
INSERT [dbo].[Colors] ([ColorId], [Name]) VALUES (7, N'Gray')
INSERT [dbo].[Colors] ([ColorId], [Name]) VALUES (8, N'Red')
SET IDENTITY_INSERT [dbo].[Colors] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Color], [Quantity], [isReview]) VALUES (26, 18, 4, N'Pink', 3, 1)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Color], [Quantity], [isReview]) VALUES (27, 18, 3, N'Blue', 4, 1)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Color], [Quantity], [isReview]) VALUES (28, 18, 6, N'Black', 4, 1)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Color], [Quantity], [isReview]) VALUES (29, 19, 3, N'Black', 3, 1)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Color], [Quantity], [isReview]) VALUES (30, 19, 4, N'Yellow', 3, 1)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Color], [Quantity], [isReview]) VALUES (31, 20, 4, N'Pink', 3, 1)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Color], [Quantity], [isReview]) VALUES (32, 20, 3, N'White', 5, 1)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Color], [Quantity], [isReview]) VALUES (33, 21, 3, N'Black', 2, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Color], [Quantity], [isReview]) VALUES (34, 21, 4, N'Yellow', 3, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Color], [Quantity], [isReview]) VALUES (35, 22, 3, N'Black', 2, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Color], [Quantity], [isReview]) VALUES (36, 23, 4, N'Yellow', 3, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Color], [Quantity], [isReview]) VALUES (37, 23, 6, N'White', 2, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Color], [Quantity], [isReview]) VALUES (38, 24, 3, N'Black', 2, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Color], [Quantity], [isReview]) VALUES (39, 24, 6, N'Black', 3, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Color], [Quantity], [isReview]) VALUES (40, 25, 6, N'White', 3, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Color], [Quantity], [isReview]) VALUES (41, 25, 7, N'Gray', 1, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Color], [Quantity], [isReview]) VALUES (42, 26, 3, N'White', 3, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Color], [Quantity], [isReview]) VALUES (43, 26, 4, N'Yellow', 3, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Color], [Quantity], [isReview]) VALUES (44, 26, 6, N'White', 2, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Color], [Quantity], [isReview]) VALUES (45, 28, 4, N'Yellow', 3, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Color], [Quantity], [isReview]) VALUES (46, 28, 3, N'Black', 4, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Color], [Quantity], [isReview]) VALUES (47, 29, 3, N'Black', 1, 1)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Color], [Quantity], [isReview]) VALUES (48, 30, 4, N'Yellow', 2, 0)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [Status], [Total], [CreateAt], [UserId]) VALUES (18, N'Success', 31697, CAST(N'2023-11-07T10:26:27.8071258' AS DateTime2), 5)
INSERT [dbo].[Orders] ([OrderId], [Status], [Total], [CreateAt], [UserId]) VALUES (19, N'Success', 17097, CAST(N'2023-11-07T10:45:20.0665611' AS DateTime2), 9)
INSERT [dbo].[Orders] ([OrderId], [Status], [Total], [CreateAt], [UserId]) VALUES (20, N'Success', 23097, CAST(N'2023-11-07T11:54:30.6304682' AS DateTime2), 6)
INSERT [dbo].[Orders] ([OrderId], [Status], [Total], [CreateAt], [UserId]) VALUES (21, N'Success', 14097, CAST(N'2023-11-07T23:59:49.0566048' AS DateTime2), 10)
INSERT [dbo].[Orders] ([OrderId], [Status], [Total], [CreateAt], [UserId]) VALUES (22, N'Delivering', 6000, CAST(N'2023-11-08T00:48:12.7138759' AS DateTime2), 4)
INSERT [dbo].[Orders] ([OrderId], [Status], [Total], [CreateAt], [UserId]) VALUES (23, N'Ordered', 13897, CAST(N'2023-11-08T21:59:53.8694913' AS DateTime2), 6)
INSERT [dbo].[Orders] ([OrderId], [Status], [Total], [CreateAt], [UserId]) VALUES (24, N'Delivering', 14700, CAST(N'2023-11-09T17:12:05.6719656' AS DateTime2), 11)
INSERT [dbo].[Orders] ([OrderId], [Status], [Total], [CreateAt], [UserId]) VALUES (25, N'Ordered', 10100, CAST(N'2023-11-09T17:13:43.2952558' AS DateTime2), 9)
INSERT [dbo].[Orders] ([OrderId], [Status], [Total], [CreateAt], [UserId]) VALUES (26, N'Delivering', 22897, CAST(N'2023-11-11T23:02:20.7154031' AS DateTime2), 5)
INSERT [dbo].[Orders] ([OrderId], [Status], [Total], [CreateAt], [UserId]) VALUES (28, N'Ordered', 20097, CAST(N'2023-11-17T07:11:08.7438592' AS DateTime2), 5)
INSERT [dbo].[Orders] ([OrderId], [Status], [Total], [CreateAt], [UserId]) VALUES (29, N'Success', 3000, CAST(N'2023-11-17T07:11:41.4187584' AS DateTime2), 5)
INSERT [dbo].[Orders] ([OrderId], [Status], [Total], [CreateAt], [UserId]) VALUES (30, N'Ordered', 5398, CAST(N'2023-11-17T07:35:44.9323944' AS DateTime2), 5)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductColors] ON 

INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (46, 4, 5)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (47, 4, 6)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (48, 4, 7)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (49, 3, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (50, 3, 2)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (51, 3, 3)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (52, 10, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (53, 10, 2)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (54, 10, 7)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (55, 11, 5)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (56, 11, 6)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (57, 11, 8)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (58, 12, 2)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (59, 12, 3)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (60, 12, 4)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (61, 12, 6)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (65, 13, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (66, 13, 2)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (67, 13, 7)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (68, 14, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (69, 14, 2)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (70, 14, 7)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (71, 15, 6)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (72, 16, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (73, 16, 7)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (74, 17, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (75, 17, 5)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (82, 6, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (83, 6, 2)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (84, 6, 7)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (85, 18, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (86, 18, 2)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (87, 18, 6)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (88, 19, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (89, 19, 7)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (90, 7, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (91, 7, 2)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (92, 7, 7)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (93, 20, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (94, 20, 2)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (95, 20, 3)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (96, 21, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (97, 21, 3)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId]) VALUES (98, 21, 7)
SET IDENTITY_INSERT [dbo].[ProductColors] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [Name], [Description], [SmallDescription], [DisPrice], [CurPrice], [ImageUrl], [BrandId], [CategoryId]) VALUES (3, N'iPhone 15 Pro Max 512GB', N'iPhone 15 Pro Max thuộc dòng sản phẩm cao cấp vừa mới được Apple cho ra mắt trên thị trường năm 2023, vẫn giữ nguyên thiết kế nổi bật “Dynamic Island” cùng với một loạt màu sắc sang trọng. Chiếc iPhone 15 Pro max được trang bị loại chip mới A17 Bionic với hiệu năng xử lý vượt trội, mạnh mẽ hiện nay để thực hiện được các tác vụ bạn muốn.

Nhìn tổng thể Iphone 15 Pro Max được thiết kế bo tròn 4 góc tinh tế nhỉnh hơn các thế hệ trước mang đến cảm giác mới mẻ, lạ mắt. Tuy nhiên, ở phiên bản này sẽ được thiết kế tối ưu cùng gọn nhẹ hơn giúp máy trở nên nhẹ nhàng. Không những thế, 15 Pro Max sở hữu khung viền titanium rất chắc chắn chống va đập mạnh giữ cho khung viền không bị hỏng hóc.

IPhone 15 Pro Max còn mang đến sự đa dạng với bốn màu sắc độc đáo bao gồm: Black Titanium cùng Natural Titanium mang lại cảm giác sang trọng, tinh tế, Silver Titanium thì thời thượng và Blue Titanium thể hiện sự năng động. Nhờ đó mở ra cho người dùng nhiều lựa chọn mới phù hợp với phong cách và sở thích riêng của bản thân, tạo nên sự cá nhân hóa độc đáo.

Một điều đặc biệt ở chiếc iPhone 15 Pro Max này chính là con chip A17 Bionic có hiệu suất GPU với 6 lõi mới nhanh hơn tới 20% nhờ đó mà khả năng chơi game cũng được cải thiện đáng kể cho phép bạn chơi những tựa game có cấu hình nặng hiện nay và đặc biệt là chỉnh sửa hình ảnh, thiết kế đồ họa hay dựng các video ngắn trên iPhone trở nên mượt mà và vượt trội hơn.

Wi-Fi 6E là một trong những công nghệ mới xuất hiện trên dòng iPhone 15 Pro Max. Công nghệ này có khả năng giúp gia tăng kết nối với tốc độ mạng chỉ hoạt động trên băng tần 6GHz và có độ trễ thấp hơn nhiều lần so với Wi-Fi 6. Đây có thể được xem là một bước nhảy vọt về tốc độ truyền dữ liệu, bạn có thể tải tài liệu xuống nhanh gấp 2 lần so với tốc độ bình thường.

iPhone 15 Pro Max sở hữu màn hình OLED Super Retina XDR 6.7inch với độ phân giải 2796 x 1290 pixels mang đến trải nghiệm làm việc và giải trí sống động, chân thực. Bên cạnh đó, 15 Pro Max còn được phủ lớp kính cường lực Ceramic Shield cao cấp và là chiếc iPhone sở hữu viền màn hình khá mỏng từ hãng.

Năm nay Apple đã cho các cổng sạc Lightning truyền thống trên chiếc iPhone 15 Pro Max đổi qua cổng sạc USB Type-C bởi nó cung cấp tốc độ truyền dữ liệu lên đến 10Gb/s, nhờ vậy bạn có thể gửi video nặng một cách nhanh chóng và hiệu quả. Bên cạnh đó cổng USB Type-C còn tích hợp với cả jack tai nghe cùng mic và nút điều khiển trên dây, giúp bạn dễ dàng giao tiếp và điều chỉnh âm lượng.

iPhone 15 Pro Max sở hữu dung lượng bộ nhớ trong ấn tượng có thể sánh ngang với các dòng laptop hiện nay. Ngoài phiên bản 256GB thì apple còn trang bị thêm các phiên bản bộ nhớ khác như 512GB và 1TB với khả năng lưu trữ dữ liệu rất lớn đem đến cho bạn nhiều sự lựa chọn hơn nhằm phù hợp với nhu cầu sử dụng của mình.
Bên cạnh đó thì dòng iPhone 15 Pro Max cũng sử dụng loại SIM kép bao gồm nano-SIM và eSIM cho phép người dùng sử dụng hai sim cùng lúc và được hỗ trợ 5G có khả năng kết nối internet với băng thông cao. Ngoài ra, eSIM cũng có thể tích hợp vào các loại thiết bị thông minh như đồng hồ thông minh, máy tính xách tay, iPad và thiết bị IoT.

iPhone 15 Pro Max cũng được trang bị thêm nhiều tính năng mới như khi phát hiện va chạm sẽ kích hoạt SOS nhằm hỗ trợ an toàn cho người dùng. Bên cạnh đó, một nút bấm đã xuất hiện từ các đời iPhone đầu tiên cũng đã có sự thay đổi lớn bởi bây giờ nút dùng để gạt tắt/mở âm lượng sẽ biến mất và thay vào đó là phím Action tương tự trên Apple Watch Ultra với các chức năng rất tiện lợi.

Pin của iPhone 15 Pro Max cũng là điều đáng quan tâm với mức dung lượng lớn hơn, màn hình khi hiển thị cũng giúp tiết kiệm năng lượng hơn. Ngoài ra còn có khả năng sạc nhanh 20W giúp bạn dễ dạng sạc được 50% trong vòng 30p. Người dùng cũng có thể sử dụng sạc không dây MagSafe lên đến 15W và sạc không dây Qi lên đến 7,5W.




', N'Chính hãng, Mới 100%, Nguyên seal
- Màn hình: OLED Super Retina XDR
- Camera sau: 48MP, 12MP
- Camera trước: 12MP
- CPU: Apple A17 Bionic
- Bộ nhớ: 512GB
- Hệ điều hành: iOS', 3100, 3000, N'iphone-15-pro.jfif', 14, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [SmallDescription], [DisPrice], [CurPrice], [ImageUrl], [BrandId], [CategoryId]) VALUES (4, N'iPhone 15 128GB', N'iPhone 15 vẫn mang trong mình sự tinh túy của các dòng máy thế hệ trước nhưng được thay đổi rõ rệt về hiệu năng hoạt động, ngoại hình. iPhone 15 hiện đang là dòng máy mới nhất được thương hiệu Apple chào sân trong thời gian gần đây, một sự lựa chọn hoàn hảo cho các tín đồ công nghệ.
Apple buộc phải thay đổi cổng kết nối chân sạc Lightning truyền thống 16 năm qua của thương hiệu trở thành cổng kết nối chân sạc USB-C theo quy định đã được ban hành của liên minh Châu Âu. Với loại cổng kết nối này, tốc độ sạc sẽ được cải thiện, tốc độ truyền tải dữ liệu nâng cao và đồng nhất chuẩn kết nối với tất cả sản phẩm của hãng.
Ngoài việc thay đổi cổng sạc, Apple còn thêm vào thiết bị mới của bạn chip Ultra Wideband nhằm tăng khả năng kết nối phạm vi rộng lên gấp 3 lần, giờ đây bạn có thể sử dụng chức năng tìm chính xác để chia sẻ vị trí của mình và người thân trong một đám đông hiệu quả nhất.
Đường viền của iPhone 15 được thiết kế lại với các góc cạnh được bo cong hơn so với phiên bản tiền nhiệm là iPhone 14, giúp trải nghiệm cầm của khách hàng thoải mái hơn, tổng thể sản phẩm cũng sang trọng, mượt mà hơn. Một điểm cộng lớn cho đội ngũ thiết kế của thương hiệu Apple.
Với iPhone 15 Apple lựa chọn thay đổi mặt lưng kính thông dụng trong nhiều bản iPhone trước đây bằng mặt lưng nhám chống trầy xước, chống bám vân tay hiệu quả khi sử dụng và tăng độ bền đáng kể cùng 5 màu sắc hồng, vàng, xanh lá, xanh dương, đen mới lạ và đẹp mắt.
Camera trước vẫn giữ nguyên độ phân giải 12 MP, cải tiến nằm ở camera sau với hai ống kính có độ phân giải được đẩy rất cao ở một ống kính lên tới 48MP và 12MP ở ống kính còn lại làm tăng hiệu quả chụp ảnh chân dung của sản phẩm.
Kèm theo sự nâng cấp của ống kính kép, thương hiệu Apple còn trang bị cho iPhone 15 một camera Telephoto 2x, sở hữu độ thu phóng quang học lớn trong các thế hệ iPhone từ trước đến nay. Sự cải tiến này nhằm nâng cao hiệu quả chụp cận cảnh và từ khoảng cách xa.
Sự thay đổi gần như là rõ rệt nhất của bản iPhone 15 chính là về nút bật tắt chế độ im lặng được chuyển từ dạng nút gạt lên xuống truyền thống từ những phiên bản đầu tiên thành nút bấm cứng. Sự thay đổi chưa từng có trước giờ của Apple về mặt thiết kế.

Không chỉ thay đổi về cách thức sử dụng, giờ đây nút tác vụ này còn tích hợp rất nhiều tính năng chờ người dùng khám phá. Có thể điểm qua một vài tính năng có thể được tích hợp như ghi âm, đèn pin, dịch thuật, kính lúp, phím tắt,…
Với màn hình Super Retina XDR 6.1 inch, mọi video và game chạy trên chiếc điện thoại iPhone 15 của bạn sẽ được nâng cấp hoàn toàn. Độ sáng tăng lên 1600 nit khiến trải nghiệm hình ảnh của người dùng sắc nét hơn bao giờ hết. Tần số quét của màn hình ở mức 60Hz.

Trang bị Dynamic Island là một trong những điểm nhấn mà thương hiệu muốn thêm vào chiếc iPhone này, giúp người dùng tăng tương tác rõ rệt với các loại thông báo và hoạt động trên màn hình. Việc tương tác nhàm chán bằng chỉ có lướt và chạm giờ trở nên thú vị, sống động hơn bao giờ hết.
Sự bất tiện về thời gian sử dụng của iPhone giờ sẽ không còn nữa khi ở phiên bản iPhone 15, dung lượng pin được nâng cấp có thể sử dụng xem video, chơi game liên tục lên đến 20 giờ. Con số đáng nể cho một thiết bị điện thoại thông minh.

Không chỉ tốc độ xử lý mà tốc độ truyền tải dữ liệu cũng được nâng cấp cao gấp nhiều lần so với phiên bản tiền nhiệm. Thêm một điểm nổi bật ngoài bộ nhớ trong có kích thước lớn 128GB - 256GB - 512GB. khiến iPhone 15 trở thành xu hướng trong cuộc cách mạng công nghệ hiện nay.
Ở phiên bản trước đó iPhone 14 đã gây ấn tượng với người sử dụng vì hiệu năng làm việc đáng nể với chip Apple A15 Bionic, đây đã được coi là một sự cải tiến lớn về mặt xử lý của một chiếc smartphone. Tuy nhiên, ở mẫu sản phẩm mới ra mắt Apple còn làm tốt hơn rất nhiều. Chip Apple A16 Bionic hiệu suất vượt trội được thêm vào giúp tăng đáng kể tốc độ xử lý của máy.
Hệ điều hành iOS 17 mới nhất được trang bị cũng sẽ làm tăng tính cá nhân và kèm theo nhiều tính năng mới về ứng dụng điện thoại, ứng dụng tin nhắn, chế độ chờ. Đặc biệt nhất là tính năng NameDrop, người dùng chỉ cần kết nối với nhau qua việc đặt hai thiết bị ở gần để chia sẻ thông tin liên lạc, airdrop và nhiều hơn vậy nữa.', N'Chính hãng, Mới 100%, Nguyên seal
- Màn hình: OLED Super Retina XDR
- Camera sau: 48MP, 12MP
- Camera trước: 12MP
- CPU: Apple A16 Bionic
- Bộ nhớ: 128GB
- Hệ điều hành: iOS', 2800, 2699, N'iphone-15.jfif', 14, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [SmallDescription], [DisPrice], [CurPrice], [ImageUrl], [BrandId], [CategoryId]) VALUES (6, N'Dell Inspiron T7430 - N7430I58W1', N'Laptop Dell Inspiron T7430 - N7430I58W1 là phiên bản máy tính xách tay văn phòng 2 trong 1, có thiết kế xoay gập 360 độ linh hoạt, dành riêng cho những người dùng ưa dịch chuyển và trải nghiệm liền mạch.

Hiệu năng Dell Inspiron T7430 - N7430I58W1 mạnh mẽ, xử lý tác vụ đa nhiệm
Laptop Dell Inspiron T7430 - N7430I58W1 được trang bị bộ vi xử lý Intel Core thế hệ thứ 13, i5-1335U, cung cấp hiệu suất mạnh mẽ với khả năng tính toán và thực hiện đa tác vụ cực kỳ hiệu quả. Bộ nhớ 8GB LPDDR5 có công dụng tối đa hóa thời lượng pin và tăng băng thông cao hơn 1.5 lần. Card đồ họa Intel Iris Xe giúp cho chiếc laptop này dễ dàng xử lý các tác vụ văn phòng yêu cầu đồ họa từ cơ bản đến nâng cao như chỉnh sửa hình ảnh, video trên các phần mềm thông dụng như PS, AI,... Kèm theo đó là ổ cứng SSD 512 GB giúp tốc độ khởi động hệ thống tăng lên nhanh chóng, mở rộng không gian lưu trữ đến mức tối đa là 2TB.


Thiết kế linh hoạt
Mẫu laptop này có kích thước nhỏ gọn, dài x rộng x dày là 314 x 226.56 x 15.54 mm, nặng 1.58 kg, được thiết kế để di chuyển cùng bạn đến bất cứ đâu. Bản lề 360 độ biến thiết bị này thành 4 chế độ: máy tính xách tay, máy tính dạng lều, máy tính có chân đế và máy tính bảng. Như vậy, bạn có thể sử dụng máy vào nhiều mục đích khác nhau, linh hoạt thay đổi cách thức sử dụng và tiết kiệm không gian làm việc.

Tổng thể máy được thiết kế với phong cách tối giản. Bề mặt bằng nhôm láng mịn, màu bạc không một tì vết. Sự tối giản càng khiến cho mẫu laptop này trở nên tinh tế và sang trọng hơn.

Hiệu năng Dell Inspiron T7430 - N7430I58W1 mạnh mẽ, xử lý tác vụ đa nhiệm
Hiệu năng Dell Inspiron T7430 - N7430I58W1 mạnh mẽ, xử lý tác vụ đa nhiệm
Màn hình hiển thị phong phú, sắc nét
Bạn có thể đắm mình vào những nội dung đầy hấp dẫn với màn hình cảm ứng siêu nhạy, kích thước 14 inch, khung hình 16:10 rộng rãi và phần mềm Dell ComfortView giúp giảm ánh sáng xanh gây hại. Độ phân giải FHD (1920 x 1200) có phủ tấm nền WVA mang đến khả năng hiển thị rõ nét hơn.

Thiết kế  Dell Inspiron T7430 - N7430I58W1 với màn hình cảm ứng siêu nhạy kèm bút cảm ứng tiện lợi
Thiết kế  Dell Inspiron T7430 - N7430I58W1 với màn hình cảm ứng siêu nhạy kèm bút cảm ứng tiện lợi
Bàn phím cơ bản với đầy đủ chức năng
Hệ thống bàn phím cơ bản, không bao gồm bàn phím số, không có đèn nền nhưng đầy đủ các phím chức năng, phù hợp với những nhu cầu học tập và làm việc thông thường. Touchpad rộng rãi, không chia nút chuột trái, phải, giúp mở rộng không gian thao tác.

Không gian thao tác rộng rãi với đầy đủ chức năng
Không gian thao tác rộng rãi với đầy đủ chức năng
Cổng kết nối đầy đủ
Hai bên cạnh máy phân bổ các cổng kết nối bao gồm: Đầu đọc thẻ SD, USB 3.2 gen 1 type-A, giắc cắm âm thanh đa năng, cổng HDMI 1.4 có Thunderbolt 4.0. Về kết nối không dây, hỗ trợ Intel WiFi 6E AX211 và Bluetooth.

Webcam có màn trập bảo vệ quyền riêng tư
Laptop Dell Inspiron T7430 - N7430I58W1 có webcam FHD, kèm micro kép và AI giảm tiếng ồn, gia tăng chất lượng cho mỗi cuộc gọi trực tuyến dù ở trong môi trường ồn ào. Khi bạn đã ngắt kết nối, màn trập bảo vệ quyền riêng tư trong camera sẽ bảo vệ bạn.

Bảo vệ sự riêng tư của người dùng
Bảo vệ sự riêng tư của người dùng
Dung lượng pin lớn, giảm thiểu ngắt quãng
Máy được tích hợp pin sơ cấp 4 cell 54Wh, cung cấp dung lượng tương đối lớn để máy có thể hoạt động bền bỉ trong suốt cả ngày dài mà không cần sạc pin quá nhiều.

Âm thanh trên Dell Inspiron T7430 - N7430I58W1 chân thực trong thế giới ảo
Sử hữu chiếc laptop Dell Inspiron T7430 - N7430I58W1, bạn có thể làm việc, nghe nhạc, xem phim và giải trí thỏa thích với âm thanh không gian Dolby Atmos. Hệ thống loa phát âm lượng lớn được đặt ngay bên cạnh bàn phím, mang đến trải nghiệm âm thanh thú vị hơn.', N'CPU: Intel Core i5-1335U
- Màn hình: 14" WVA (1920 x 1080)
- RAM: 8GB Onboard LPDDR5 4800MHz
- Đồ họa: Onboard Intel Iris Xe Graphics
- Lưu trữ: 512GB SSD M.2 NVMe /
- Hệ điều hành: Windows 11 Home SL + Office Home & Student 2021
- Pin: 4 cell 54 Wh Pin liền
- Khối lượng: 1.6kg
- Chuẩn Non-EVO', 3000, 2900, N'laptop-dell-inspiron-t7430.webp', 2, 2)
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [SmallDescription], [DisPrice], [CurPrice], [ImageUrl], [BrandId], [CategoryId]) VALUES (7, N'Smart Tivi Samsung 4K UHD', N'Smart Tivi Samsung 4K UHD 43 Inch UA43AU8000KXXV là dòng sản phẩm cao cấp nâng tầm không gian sống của bạn với thiết kế sang trọng cùng chất lượng giải trí hấp dẫn. Với việc ứng dụng nhiều công nghệ hình ảnh và âm thanh tiên tiến, dòng Tivi cao cấp của hãng Samsung sẽ mang đến cho gia đình bạn những phút giây giải trí với chất lượng tuyệt vời. 
Thiết kế thanh mảnh sang trọng, màn hình 43 inch đạt chuẩn 4K
Smart Tivi Samsung 4K UHD 43 Inch UA43AU8000KXXV sở hữu vẻ đẹp tinh tế đến từng chi tiết với thiết kế thanh mảnh cho độ mỏng ấn tượng, khi kết hợp với không gian xung quanh sẽ tạo nên một tổng thể liền mạch. Từ đó đem đến cho căn phòng của bạn sự sang trọng chưa từng có. 

Smart Tivi Samsung 4K UHD 43 Inch UA43AU8000KXXV | Thiết kế sang trọng
Nhằm tiết kiệm không gian đồng thời mang đến sự hài hòa cho gian phòng, với giá treo Slim Fit Wall-Mount đi kèm, giờ đây bạn có thể dễ dàng lắp đặt chiếc TV áp sát vào tường. Ngoài ra, giải pháp giấu dây tiện lợi còn giúp ẩn đi dây cáp nhằm hạn chế tình trạng dây cáp lộn xộn. 

Smart Tivi Samsung 4K UHD 43 Inch UA43AU8000KXXV || màn hình 43 inch đạt chuẩn 4K
Smart Tivi Samsung 4K UHD 43 Inch UA43AU8000KXXV được trang bị một màn hình có kích thước 43 inch với viền siêu mỏng nhằm mở rộng không gian hiển thị. Hình ảnh với độ phân giải cực sắc nét lên đến 4K, cho phép mọi hình ảnh được tái hiện chân thực với mức độ chi tiết ấn tượng.

Tận hưởng hình ảnh sắc nét, màu sắc tái tạo chân thực nhờ công nghệ hình ảnh tiên tiến
Smart Tivi Samsung 4K UHD 43 Inch UA43AU8000KXXV mang đến cho người xem một bữa tiệc thị giác đặc sắc với các công nghệ hình ảnh chất lượng. Đầu tiên, công nghệ Dynamic Crystal Color với dải màu sống động giúp truyền tải từng biến chuyển màu sắc chính xác đến từng chi tiết.

Smart Tivi Samsung 4K UHD 43 Inch UA43AU8000KXXV || công nghệ Dynamic Crystal Color
Tiếp theo, công nghệ Motion Xcelerator hỗ trợ chất lượng khung hình nâng cao khi có thể giảm thiểu hiện tượng “bóng ma” trên màn hình, đem đến nội dung sắc nét cùng các chuyển động mượt mà. 

Smart Tivi Samsung 4K UHD 43 Inch UA43AU8000KXXV || công nghệ Motion Xcelerator
Ngoài ra, với công nghệ HDR, chiếc Tivi cao cấp của Samsung còn có thể tự động điều chỉnh độ sáng phù hợp nhằm đảm bảo sự cân bằng, giúp mang đến những hình ảnh sắc nét ngay cả khi khung hình trở nên tối đi. 

Công nghệ âm thanh Q-Symphony hiện đại, tích hợp trợ lý giọng nói thông minh 
Smart Tivi Samsung 4K UHD 43 Inch UA43AU8000KXXV cải thiện chất lượng âm thanh nhờ vào công nghệ âm thanh hiện đại như Dolby Digital Plus, Adaptive Sound. 

Smart Tivi Samsung 4K UHD 43 Inch UA43AU8000KXXV || Công nghệ âm thanh Q-Symphony hiện đại
Không chỉ vậy, công nghệ âm thanh Q-Symphony nổi bật giúp thăng hoa mọi cảm xúc âm nhạc bằng việc đồng bộ liền mạch giữa loa thanh và Tivi, mang đến cho bạn cảm giác đắm chìm tuyệt vời. 

Smart Tivi Samsung 4K UHD 43 Inch UA43AU8000KXXV || tích hợp cả 3 trợ lý giọng nói, gồm có: Bixby, Amazon Alexa và Google Assistant.
Chiếc Tivi cao cấp của Samsung còn được hỗ trợ cả tính Năng Multiple Voice Assistants. Samsung TV đã tích hợp cả 3 trợ lý giọng nói, gồm có: Bixby, Amazon Alexa và Google Assistant.

Nhờ đó, người dùng có thể thoải mái lựa chọn trợ lý yêu thích của riêng mình để đạt được trải nghiệm giải trí tối ưu thông qua khả năng điều khiển thông minh đảm bảo sự tiện lợi và nhanh chóng. ', N'Màn hình Airslim UHD 4K hiển thị hình ảnh sắc nét gấp 4 lần Full HD
- Công nghệ Crystal 4K tối ưu hóa nâng cấp độ chi tiết của từng gam màu
- Cảm nhận chi tiết và sắc thái hoàn mỹ được hỗ trợ công nghệ HDR10+
- Công nghệ UHD Dimming tăng cường độ chi tiết hiển thị của hình ảnh
- Trải nghiệm hình ảnh mượt mà nhờ công nghệ Motion Xcelerator
- Hiển thị chính xác một tỷ sắc màu với công nghệ Dynamic Crystal Color', 1500, 1400, N'smart-tivi-samsung-4k-Uhd.webp', 3, 6)
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [SmallDescription], [DisPrice], [CurPrice], [ImageUrl], [BrandId], [CategoryId]) VALUES (10, N'iPhone 14 Pro Max 128GB', N'iPhone 14 Pro Max được ra mắt trong tháng 9 năm 2022 đã đem đến một dấu ấn nổi bật trên thị trường di động thông minh trên toàn thế giới bởi sự lột xác ấn tượng về thiết kế màn hình “Dynamic Island”. iPhone 14 dòng pro được Apple ưu ái khi trang bị con chip mạnh mẽ A16 Bionic có hiệu năng xử lý vượt trội, giúp bạn thực hiện được nhiều tác vụ trên máy cùng lúc mà không xảy ra tình trạng giật, lag. 
iPhone 14 Pro Max có thiết kế cạnh viền vuông vức tương tự như các dòng iPhone 12 trở về sau. Với việc loại bỏ màn hình tai thỏ thay thế bằng cụm “Dynamic Island” giúp màn hình được hiển thị rộng hơn cùng khả năng tùy biến, tương thích với những ứng dụng đang chạy trên điện thoại.
Bên cạnh đó, iPhone 14 Pro Max có khung máy làm từ chất liệu thép không gỉ và có mặt lưng kính mờ giúp chiếc điện thoại có độ bền tốt, đồng thời đem lại cho bạn trải nghiệm sang trọng hơn và hạn chế được việc bám vân tay khi sử dụng. 
Điểm đặc biệt của Apple ở mỗi sự kiện ra mắt đó chính là giới thiệu một phiên bản màu sắc hoàn toàn mới. Tại sự kiện năm 2022, Apple đã trình làng dòng iPhone Pro với phiên bản màu Deep Purple ấn tượng đang được rất nhiều người dùng mong đợi. Ngoài ra, iPhone 14 Pro Max còn có các phiên bản màu sắc như: Gold, Silver, Space Black cho khách hàng lựa chọn theo sở thích. 
Apple đã trang bị cho iPhone 14 Pro Max con chip mới nhất trong thời điểm ra mắt là A16 Bionic có 16 tỷ bóng bán dẫn, được sản xuất trên tiến trình 4nm đem lại một hiệu năng vượt trội và nhanh hơn khoảng 40% so với con chip A15 Bionic. Vì thế, chip này có khả năng xử lý hiệu quả, vượt trội với mọi tác vụ hay chơi được nhiều tựa game mobile có đồ họa cao như Asphalt 9, Pubg, Call Of Duty, Tốc chiến…
Ngoài ra, iPhone 14 Pro Max sở hữu bộ nhớ RAM lớn lên đến 6GB giúp bạn có thể lưu trữ tạm thời nhiều ứng dụng và chuyển qua lại các tab đang chạy được mượt mà hơn bao giờ hết. Bạn sẽ không gặp trình trạng giật lag hay nóng lên quá mức khi bạn chơi game đem lại một trải nghiệm tuyệt vời hơn cả.
iPhone 14 Pro Max được trang màn hình lớn trong bộ sưu tập iPhone 14 series năm nay lên đến 6.7 inch đem lại cho bạn một trải nghiệm rộng rãi. Màn hình Super Retina XDR hỗ trợ khả năng tiết kiệm pin hiệu quả 15% khi bạn bật chế độ Dark Mode cùng công nghệ tấm nền OLED sở hữu độ tương phản cao và độ phân giải ấn tượng 1290 x 2796 pixels đem lại chất lượng hình ảnh tốt, sắc nét hoàn hảo.
Bên cạnh đó, iPhone 14 Pro Max sở hữu một dung lượng bộ nhớ lớn đến ấn tượng ngang với các loại laptop hiện nay lên đến 512GB. Ngoài phiên bản 512GB ra thì iPhone 14 Pro Max còn có các phiên bộ nhớ khác đem lại cho bạn nhiều sự lựa chọn phù hợp với nhu cầu sử dụng của mình như: 128GB, 256GB và 1TB.
iPhone 14 Pro Max được trang bị bộ camera trước sau hoàn hảo, hỗ trợ khả năng chụp ảnh đỉnh cao với camera trước 12MP có góc rộng ƒ/1.9. Camera sau gồm cụm 2 camera tele 12MP và sự nâng cấp camera chính lên đến 48MP tích hợp thêm công nghệ cảm biến TOF cho ra những tấm ảnh hoàn hảo với góc siêu rộng và khả năng chụp thiếu sáng tuyệt vời.
Bên cạnh đó, iPhone 14 Pro Max hỗ trợ sạc nhanh không dây Magsafe lên đến 15W và sạc không dây chuẩn Qi lên đến 7.5W cùng cổng Lightning đặc trưng của nhà Táo. iPhone 14 Pro Max còn trang bị GPS dual-band A-GPS, GLONASS, GALILEO, BDS, QZSS giúp bạn định vị tốt trên các nền tảng ứng dụng tra đường. 
Cuối cùng, chiếc điện thoại này hỗ trợ Wi-Fi 802.11 a/b/g/n/ac/6, dual-band, hotspot kết nối mạng nhanh chóng với đường truyền tốc độ cao cùng Bluetooth 5.3 truyền tải mọi dữ liệu không dây ở phạm vi rộng và kết nối nhanh được với nhiều thiết bị.', N'Chính hãng, Mới 100%, Nguyên seal
- Màn hình: LTPO Super Retina XDR OLED - 120Hz
- Camera sau: 48MP, 2x 12MP
- Camera trước: 12MP
- CPU: A16 Bionic
- Bộ nhớ: 128GB
- RAM: 6GB
- Hệ điều hành: IOS', 2500, 2499, N'iphone-14-promax-128gb.webp', 14, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [SmallDescription], [DisPrice], [CurPrice], [ImageUrl], [BrandId], [CategoryId]) VALUES (11, N'Samsung Galaxy S23 8GB/256GB', N'Sự kiện ra mắt các sản phẩm flagship của Samsung luôn được đông đảo cộng đồng công nghệ trên thế giới quan tâm và cũng là tâm điểm sự chú ý của những SamFan yêu thích dòng điện thoại Samsung Galaxy. Trong sự kiện Samsung Unpacked 2023 vừa được tổ chức vào vài giờ trước, siêu phẩm Samsung Galaxy S23 Series cũng đã được giới thiệu chính thức với công chúng với 3 phiên bản cực thú vị. Cùng Phong Vũ tìm hiểu tính năng bên trong chiếc điện thoại này nhé!
Đúng như nhiều tin đồn xuất hiện trước đây, bộ ba sản phẩm Samsung Galaxy S23 Series không có quá nhiều thay đổi về mặt thiết kế so với các sản phẩm Galaxy S22 trước đó.

Chúng ta vẫn sẽ có những sản phẩm được phân cấp rõ ràng, người dùng có thể nhận biết các sản phẩm này thông qua kích thước màn hình tăng dần theo từng phiên bản. Riêng phiên bản Galaxy S23 Ultra, nó sẽ được thừa hưởng thiết kế từ dòng Galaxy Note vốn đã bị Samsung khai tử trước đó và được trang bị bút S Pen tiện lợi. 

Tất cả những thiết bị trong dòng Galaxy S23 đều không có cụm camera mà được trang bị những ống kính rời được đặt trên mặt lưng, một điểm khá thú vị và tạo ra sự khác biệt so với những sản phẩm khác trên thị trường. 
Hãng cũng đã công bố bộ bốn màu đặc trưng trên dòng sản phẩm Galaxy S năm nay bao gồm màu Đen Phantom, Trắng Cotton, Tím Lilac và Xanh Botani. Bên cạnh đó, Samsung cũng cho phép người dùng mua những màu độc quyền như Đỏ Lychee, Xanh Lime, Xanh SkyBlue và Xám Graphite tại Website chính thức của hãng tại Việt Nam. 

Đặc biệt, những thế hệ Samsung Galaxy S Series mới nhất cũng tự hào là những thiết bị smartphone đầu tiên trên thế giới được trang bị mặt kính cường lực cao cấp Corning® Gorilla® Glass Victus® 2 mang đến khả năng bảo vệ tuyệt vời cho thiết bị. 

Samsung đã nhấn mạnh rằng sản phẩm Samsung Galaxy S23 Series là một sản phẩm rất thân thiện với môi trường khi chiếc điện thoại này có đến 22% linh kiện được làm từ vật liệu tái chế. Bên cạnh đó, giống như những sản phẩm trước đây thì phần bao bì đều được làm từ 100% giấy tái chế. 
Tất cả phiên bản Samsung Galaxy S23 Series đều được trang bị con chip Snapdragon đến từ nhà Qualcomm và không có phiên bản nào sở hữu chip Exynos. Đây có lẽ là một thông tin đáng mừng dành cho các game thủ vì hiệu suất của chip Snapdragon thường được đánh giá tốt hơn nhiều lần so với chip Exynos của Samsung. 
Với bộ ba Galaxy S23 năm nay, người dùng sẽ được trang bị con chip mới nhất thuộc phân khúc cao nhất của Qualcomm đó chính là Snapdragon® 8 Gen 2 Mobile Platform for Galaxy. Đây là một con chip được Qualcomm sản xuất độc quyền cho Samsung và nó sở hữu xung nhịp cao hơn những phiên bản chip 8 Gen 2 thông thường. 

Samsung đã nhấn mạnh rằng, một trong những cải tiến lớn nhất trên Galaxy S23 đó chính là hiệu suất GPU được tối ưu tốt hơn đến 41% so với người tiền nhiệm S22. Điều này giúp cho người dùng có thể chơi game và giải trí một cách mượt mà với mức độ đồ họa có độ chi tiết cao và ấn tượng. Bên cạnh đó, GPU mới của Samsung cũng được trang bị công nghệ Ray Tracking giúp người dùng trải nghiệm các hiệu ứng đồ họa chân thực hơn. 

Về cấu hình RAM và ROM, người dùng sẽ có các tùy chọn dựa vào các phiên bản như dưới đây: 

Samsung Galaxy S23 tiêu chuẩn trang bị RAM 8GB (không có tùy chọn nâng cấp) và bộ nhớ 128GB, có thể nâng cấp tối đa bộ nhớ lên đến 256GB.
Samsung Galaxy S23 Plus phiên bản cao cấp nhất sẽ được trang bị RAM 8GB và 512GB bộ nhớ trong, trong khi phiên bản tiêu chuẩn sẽ được trang bị 8GB RAM và 256GB.
Samsung Galaxy S23 Ultra sẽ bắt đầu với phiên bản thấp nhất được trang bị cấu hình 8GB RAM và 256GB bộ nhớ trong. Người dùng cũng có thể nâng cấp lên phiên bản 12GB RAM và 512GB bộ nhớ trong hoặc 12GB RAM 1TB bộ nhớ.
Có thể thấy, Samsung chỉ giữ lại tùy chọn bộ nhớ 128GB trên dòng Galaxy S23 tiêu chuẩn, với các phiên bản S23 Plus và S23 Ultra thì người dùng sẽ được bắt đầu tới tùy chọn 256GB trở lên. Sự phân cấp bộ nhớ và RAM này giúp cho hãng thúc đẩy được doanh số của các phiên bản cao cấp một cách rõ rệt hơn. 
Chất lượng các tấm nền hiển thị của Samsung luôn mang đến trải nghiệm hình ảnh trên cả tuyệt vời dành cho người dùng. Bộ ba sản phẩm vẫn được trang bị công nghệ màn hình Dynamic AMOLED 2x và tần số quét 120Hz. 

Samsung vẫn giữ nguyên kích thước màn hinh trên các phiên bản của mình khi chiếc Samsung Galaxy S23 có kích thước màn hình 6.1inch, Galaxy S23+ có màn hình 6.6inch và đều sở hữu độ phân giải Full HD+. Phiên bản cao cấp nhất Galaxy S23 Ultra được trang bị màn hình lớn 6.8inch với độ phân giải 2K+. 
Đối với các phiên bản Samsung Galaxy S23 và S23 Plus thì hãng đều có những cải tiến nhẹ về thời lượng pin với phiên bản S23 có dung lượng 3.9000mAh, trong khi đó phiên bản S23 Plus sẽ có dung lượng 4.700mAh. Riêng phiên bản S23 Ultra vẫn được trang bị viên pin 5.000mAh giống như người tiền nhiệm 2022. 

Bộ đôi Galaxy S23+ và S23 Ultra hỗ trợ sạc nhanh 45W trong khi phiên bản tiêu chuẩn chỉ được trang bị sạc 25W. Ngoài ra, cả 3 phiên bản đều được tích hợp công nghệ sạc nhanh không dây và tính năng sạc ngược cho thiết bị khác. 
Samsung đã dành hơn 20 phút chỉ để giới thiệu về hệ thống camera mới trên các dòng Samsung S23 Series, điều này có thể thấy được camera trên các dòng Galaxy S mới nhất được hãng sở hữu rất nhiều cải tiến đáng giá. 

Hãng hầu như không thay đổi nhiều về camera trên bộ đôi Samsung S23 và S23 Plus so với người tiền nhiệm năm 2022. Bộ đôi sản phẩm này vẫn được trang bị cụm 3 camera với các thông số tương tự như năm ngoái với camera chính 50 megapixel, camera góc rộng 12 megapixel và camera tele 10 megapixel hỗ trợ zoom quang học 3x.
Mọi sự chú ý sẽ được đổ dồn về phiên bản Samsung Galaxy S23 Ultra với cụm camera được nâng cấp đáng chú ý với thông số cực ấn tượng. Samsung Galaxy S23 Ultra tự hào là sản phẩm đầu tiên của Samsung được trang bị ống kính chụp ảnh có độ phân giải lên đến 200 megapixel. Đi kèm với đó là bộ đôi camera tele hỗ trợ zoom quang học lên đến 10x và 3x, cuối cùng là camera góc siêu rộng 12 megapixel.

Cài đặt máy ảnh cũng được Samsung tích hợp thêm rất nhiều tính năng mới, cho phép người dùng có thể điều chỉnh nhiều thông số chuyên nghiệp, can thiệp sâu vào camera giúp tạo ra những bức ảnh đúng chất nghệ thuật. Galaxy S23 Ultra, Galaxy S23+ và Galaxy S23 cũng được trang bị camera selfie Galaxy Super HDR đầu tiên mang đến khả năng lấy nét tự động siêu nhanh để bạn có thể chụp ảnh và quay video có độ chi tiết cao hơn. 

Cuối cùng là tính năng Expert RAW được tích hợp trên dòng Galaxy S23 sẽ cho bạn không gian chỉnh sửa hình ảnh ở định dạng RAW và JPEG chuyên nghiệp như máy DSLR. Nếu là người đam mê với thiên văn học, bạn có thể trải nghiệm ngay tính năng chụp thiên văn Astrophoto để ghi hình dải ngân hà cực ấn tượng. ', N'Chính hãng, Mới 100%, Nguyên seal
- Màn hình: 6.1" Dynamic AMOLED 2X
- Camera sau: 50MP, 12MP, 10MP
- Camera trước: 12MP
- CPU: Snapdragon 8 Gen 2
- Bộ nhớ: 256GB
- RAM: 8GB
- Hệ điều hành: Android', 1900, 1799, N'samsung-galaxy-s23-8gb-256gb.webp', 3, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [SmallDescription], [DisPrice], [CurPrice], [ImageUrl], [BrandId], [CategoryId]) VALUES (12, N'Samsung Galaxy S23 Ultra', N'Samsung S23 Ultra là một trong những sản phẩm smartphone cao cấp đến từ nhà Samsung mang vẻ ngoài sang trọng, camera tuyệt đỉnh. Với đầy đủ tính năng mới, hơn thế nữa là chất liệu bền vững kết hợp với thiết kế tối giản và tối ưu hóa năng lượng là những yếu tố giúp S23 Ultra không chỉ là một chiếc điện thoại mà còn trở thành một sản phẩm tốt cho người tiêu dùng. Hãy cùng tìm hiểu thêm về những tính năng của chiếc điện thoại siêu phẩm nhà Samsung này trong bài viết dưới đây nhé!
Thiết kế đối xứng đậm chất Ultra trở lại và khẳng định mạnh mẽ hơn nữa cho công cuộc theo đuổi sự bền vững: Chất liệu tái chế với mong muốn bảo vệ môi trường. Từ lớp kính phủ là vật liệu tái chế đến màu sơn độc bản của khung viền kim loại, vẻ đẹp là bản sắc vốn có mang tên Samsung Galaxy S23 Ultra.
Thanh lịch và tinh tế, bộ sưu tập màu sắc với chất liệu thiên nhiên thổi hồn vào từng siêu phẩm, mang đến một nét đẹp không thể từ chối mà chẳng hề phô trương
Không ngại ghi dấu ấn với lối sống xanh và tinh thần yêu thiên nhiên? Những gam màu này là dành cho bạn dễ dàng lựa chọn: Xanh Lime Xanh Sky Blue Xám Graphite Đỏ Lychee
Bước tiến lớn trong lịch sử thiết kế điện thoại thông minh: Chất liệu tái chế cho một tương lai bền vững hơn hết. Khoác lên Galaxy S23 Ultra là lớp kính tái chế và phim phủ PET không chỉ lộng lẫy ở mọi góc cạnh mà còn giúp siêu phẩm di động nổi bật khác biệt với tuyên ngôn sống xanh đột phá.
Siêu bút S Pen cho di sản của Note tồn tại. Thêm vào đó, nó giúp bạn không còn phải phụ thuộc vào sổ tay, tạo ra các bản phác thảo bản ghi nhớ dễ dàng.
Tiếp nối huyền thoại của những chiếc điện thoại Galaxy S,  trọn bộ công nghệ đỉnh cao đã được hội tụ trong Camera Mắt Thần Bóng Đêm. Với cảm biến điểm ảnh lớn  trên thị trường hiện nay, chiếc Samsung S23 Ultra  này cho phép bạn chụp ảnh với độ phân giải cao và chi tiết tuyệt vời.
Sâu hơn, rộng hơn - đó là trường ảnh thu được từ bộ Camera chuyên nghiệp của Galaxy S23 Ultra. Mỗi khung hình đều được xóa phông tự nhiên, nổi bật chủ thể và vô cùng giàu chi tiết với cấp độ DSLR.
Trên đây là những thông tin đầy đủ và chính xác về Samsung Galaxy S23 Ultra, một trong những smartphone đáng chú ý trong năm nay với thiết kế đẹp mắt, tính năng vượt trội và đặc biệt là chất lượng camera cực kỳ ấn tượng. Nếu bạn đang tìm kiếm một chiếc điện thoại cao cấp để trải nghiệm công nghệ mới nhất, hãy đến Phong Vũ để sở hữu ngay sản phẩm này với giá tốt trên thị trường và nhiều ưu đãi hấp dẫn. Chúc bạn tìm được sản phẩm ưng ý và có trải nghiệm tuyệt vời cùng Samsung Galaxy S23 Ultra!


', N'Chính hãng, Mới 100%, Nguyên seal
- Màn hình: 6.8" Dynamic AMOLED 2X
- Camera sau: 200MP, 12 MP, 2 x 10MP
- Camera trước: 12 MP
- CPU: Snapdragon 8 Gen 2
- Bộ nhớ: 256GB
- RAM: 8GB
- Hệ điều hành: Android', 3200, 3188, N'samsung-galaxy-s23-ultra.webp', 3, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [SmallDescription], [DisPrice], [CurPrice], [ImageUrl], [BrandId], [CategoryId]) VALUES (13, N'Apple Macbook Air M1 256gb', N'Laptop MacBook Air 2020 13.3" MGND3SA/A là dòng máy cao cấp vì nó được trang bị bộ vi xử lý Apple M1, kết hợp cùng ổ cứng 256GB SSD xử lý các tác vụ nhanh chóng. Hơn thế nữa, kích thước nhỏ gọn, tiện lợi và phù hợp cho những ai đang đi học hoặc đã đi làm, đặc biệt là chốn công sở.
Thu hút người nhìn nhờ thiết kế tinh tế, kết hợp cùng tone màu vàng, laptop MacBook Air 2020 13.3" MGND3SA/A còn nổi bật nhờ logo Apple mạ kim loại sáng bóng được đặt giữa máy. 

Đồng thời, laptop MacBook Air 2020 13.3" MGND3SA/A có kích thước nhỏ gọn, chỉ 21.24 x 30.41 x 1.61cm và chỉ nặng khoảng 1.3kg, giúp bạn dễ dàng đem đi làm việc hoặc học tập ở mọi nơi.
Ngoài ra, laptop MacBook Air 2020 13.3" MGND3SA/A sở hữu màn hình rộng 13.3 inch với độ phân giải lên đến 2560 x 1600 pixels, kết hợp công nghệ True Tone giúp tự động điều chỉnh màu, đem đến cho bạn trải nghiệm hình ảnh chân thực và tự nhiên hơn.

Điểm độc đáo của laptop MacBook Air 2020 13.3" MGND3SA/A đó chính là thiết kế viền màn hình mỏng, giúp tăng diện tích hiển thị hình ảnh, đem đến cho bạn trải nghiệm góc nhìn rộng khi làm việc, chơi game hoặc là coi phim.
Được trang bị bộ vi xử lý Apple M1, laptop MacBook Air 2020 13.3" MGND3SA/A có thể sử dụng các ứng dụng văn phòng, giải trí, phần mềm đồ họa, dựng vlog, chỉnh sửa hình ảnh và video một cách trơn tru mà không cần lo lắng về vấn đề gián đoạn.
Kết hợp cùng RAM 8GB LPDDR4 với tốc độ xử lý 3733MHz, giúp tăng khả năng thực hiện các tác vụ đa nhiệm mượt mà hơn trên chiếc laptop MacBook Air 2020 13.3" MGND3SA/A.
Laptop MacBook Air 2020 13.3" MGND3SA/A được trang bị ổ cứng 256GB SSD giúp máy có thể xử lý nhanh chóng các tác vụ, đồng thời cung cấp một không gian lưu trữ thoải mái hơn cho người dùng.

Ngoài ra, với thời lượng sử dụng pin khá lâu của laptop MacBook Air 2020 13.3" MGND3SA/A, giúp bạn có thể dùng máy liên tục mà không lo bị gián đoạn bởi tình trạng hết pin, hạn chế cắm sạc nhiều lần gây chai pin.
Được trang bị 2 cổng Thunderbolt 3 kết hợp băng thông với tốc độ cao, giúp laptop MacBook Air 2020 13.3" MGND3SA/A có thể truyền tải dữ liệu, tương thích với nhiều loại cáp và bộ chuyển đổi. Đồng thời còn có các dạng kết nối không dây bao gồm: WiFi 802.11ax (Wifi 6) và Bluetooth 5.0.
Ngoài ra, laptop MacBook Air 2020 13.3" MGND3SA/A được trang bị một bộ bàn phím cực nhạy, tốc độ nhanh và độ phản hồi tốt. Đồng thời còn được trang bị thêm hệ thống đèn led để bạn có thể làm việc hiệu quả hơn trong điều kiện thiếu ánh sáng.

Hơn thế nữa, do sở hữu bàn di chuột rộng và nhạy, cùng với tốc độ phản hồi ấn tượng, laptop MacBook Air 2020 13.3" MGND3SA/A cho phép bạn có thể thao tác thoải mái tại mọi vị trí trên bàn di chuột cảm ứng.
Công nghệ cảm biến vân tay Touch ID siêu tiên tiến đã giúp laptop MacBook Air 2020 13.3" MGND3SA/A có thể bảo mật được thông tin và dữ liệu của bạn tốt hơn, đồng thời giúp cho việc mở máy được diễn ra nhanh chóng.
Không những thế, laptop MacBook Air 2020 13.3" MGND3SA/A còn được hỗ trợ cài đặt hệ điều hành macOS sở hữu kho ứng dụng lớn, trợ giúp được bạn trong quá trình học tập và giải trí, đáp ứng tốt mọi nhu cầu cần thiết.', N'CPU: Apple M1
- Màn hình: 13.3" (2560 x 1600) Retina
- RAM: 8GB / 256GB SSD
- Hệ điều hành: macOS
- Pin: 50 Wh', 4000, 3899, N'macbook-air-m1-256gb.webp', 14, 2)
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [SmallDescription], [DisPrice], [CurPrice], [ImageUrl], [BrandId], [CategoryId]) VALUES (14, N'MacBook Pro 2022 13 inch Z16T0003V', N'MacBook Pro 13 inch Z16T0003V thuộc dòng sản phẩm cao cấp đến từ nhà Táo, mang trong mình sức mạnh của chip Apple M2 đem đến hiệu năng mạnh mẽ, xử lý hầu hết mọi tác vụ. Máy có thiết kế tinh tế sang trọng đặc trưng của Apple được nhiều doanh nhân, KOL, Influencer lựa chọn làm bạn đồng hành trong công việc.
MacBook Pro mang đến vẻ đẹp sang trọng với gam màu bạc chủ đạo đậm nét tinh tế. Với kích thước 30.41 x 21.24 x 1.56cm giúp bạn dễ dàng bỏ vào balo mà không chiếm quá nhiều diện tích, đem đến sự thuận tiện cho những đối tượng khách hàng thường xuyên làm việc bên ngoài.

Macbook M2 được nhà sản xuất hoàn thiện hoàn toàn từ chất liệu cao cấp, nhờ đó mang đến độ bền cao cho khách hàng khi sử dụng lâu dài. Đặc biệt, chiếc MacBook Pro sở hữu khối lượng siêu nhẹ khi chỉ nặng khoảng 1.4 kg, nhờ đó cho phép người dùng có thể mang theo bên mình dễ dàng.
MacBook Pro Z16T0003V được trang bị màn hình với kích thước 13.3 inch cho phép bạn có thể kiểm soát được nội dung hiển thị trên màn hình một cách tốt nhất. Cùng với độ phân giải 2560 x 1600px Retina IPS HD mang đến khả năng hiển thị hình ảnh rõ nét, đem đến cho khách hàng chất lượng hiển thị tuyệt vời khi làm việc, giải trí.
MacBook sở hữu bàn phím chuẩn size với kiểu thiết kế đặc trưng được hoàn thiện tinh xảo, cùng với hành trình phím êm ái giúp đem đến cảm giác gõ mượt mà. Không những thế, touchpad của MacBook Pro cũng được đặt cân đối ở vị trí thích hợp giúp bạn có thể dễ dàng điều khiển linh hoạt.
Laptop MacBook Z16T0003V mang đến hiệu năng xử lý mạnh mẽ ấn tượng nhờ trang bị CPU Apple M2 8 nhân, 16 luồng, đây là dòng chip được nhà sản xuất cải tiến với hiệu suất được nâng cao so với thế hệ trước. Nhờ đó giúp cho khách hàng có thể thao tác mượt mà với nhiều tác vụ làm việc như chỉnh sửa hình ảnh, edit video…
MacBook M2 không chỉ sở hữu hiệu năng mạnh mẽ mà còn được tích hợp với công nghệ bảo mật vân tay hiện đại giúp cho bạn có thể bảo vệ dữ liệu bên trong máy được tốt hơn. Đặc biệt khi khách hàng mua MacBook Pro còn có các phụ kiện đi kèm theo máy như cable và adapter hỗ trợ bạn trong quá trình sử dụng.
MacBook 13.3 inch cho khả năng đa nhiệm ấn tượng nhờ được trang bị bộ nhớ RAM lên đến 16GB. Chính điều này giúp cho laptop hoạt động mượt mà khi khách hàng thao tác đa nhiệm cùng lúc với nhiều chương trình trong quá trình làm việc mà không lo xảy ra giật lag.
Bên cạnh đó, MacBook được nhà sản xuất trang bị bộ nhớ lên đến 256GB cho phép khách hàng có thể lưu trữ được khá nhiều dữ liệu quan trọng. Cùng với đó là khả năng truy xuất dữ liệu nhanh chóng nhờ sử dụng kiểu ổ cứng SSD, mang đến tốc độ xử lý ấn tượng so với ổ HDD.
MacBook Pro M2 sở hữu thời lượng pin ấn tượng nhờ sử dụng viên pin liền 58Wh, đây là một điểm mạnh đặc trưng của các dòng sản phẩm MacBook. Với thời lượng pin lớn cho khả năng sử dụng thoải mái với các tác vụ làm việc thường ngày mà khách hàng không cần phải cắm sạc liên tục.
MacBook Pro sử dụng hệ điều hành MacOS đặc trưng với nhiều tính năng hấp dẫn cho phép khách hàng có thể trải nghiệm được những tiện ích đặc trưng chỉ có trên hệ điều hành này. Bên cạnh đó, người dùng còn có thể đồng bộ hóa với nhiều sản phẩm khác đến từ thương hiệu Apple nổi tiếng.', N'CPU: Apple M2
- Màn hình: 13.3" (2560 x 1600) Retina
- RAM: 16GB / 256GB SSD
- Hệ điều hành: macOS
- Pin: 58 Wh', 3500, 3400, N'macbook-pro-2022-256gb.webp', 14, 2)
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [SmallDescription], [DisPrice], [CurPrice], [ImageUrl], [BrandId], [CategoryId]) VALUES (15, N'iPad Air 5 M1 2022 10.9 inch Wifi', N'Máy tính bảng Apple iPad Air 5 (2021) 10.9 inch Wifi 64GB (MM9D3ZA/A) (Pink) được nhiều người săn đón, đặc biệt là sự yêu thích của các iFan bởi thiết kế sang trọng cao cấp, hiệu năng giải trí đáng kinh ngạc cho mọi trải nghiệm mượt mà ngay trong tầm tay. 
Thiết kế gọn gàng di động, màu sắc thời trang thanh lịch 
Apple iPad Air 5 (2021) (MM9D3ZA/A) là phiên bản thời trang ấn tượng với kích thước 24.76 x 17.85 x 0.61 cm và khối lượng 461g, tạo nên sự gọn nhẹ để đồng hành cùng người dùng trong mọi cuộc hành trình. Trải nghiệm làm việc và giải trí dễ dàng ở bất kỳ đâu mà không lo cồng kềnh.
Chiếc iPad cao cấp của Apple khoác lên vẻ đẹp thanh lịch nhờ thiết kế màu hồng dịu dàng, kết hợp các đường nét hoàn thiện tinh tế với bốn góc máy bo tròn, tạo nên một tổng thể hài hòa, phù hợp với phong cách năng động hiện đại của nhiều người dùng trẻ.

Màn hình 10.9 inch rộng rãi, hình ảnh hiển thị tuyệt đẹp
Apple iPad Air 5 (2021) cho phép người dùng đắm mình trong bất cứ nội dung đang đọc, đang xem hoặc đang sáng tạo với màn hình Liquid Retina 10.9 inch tuyệt đẹp. Thiết kế viền mỏng càng làm tăng thêm cảm giác chân thực bởi khung hình mở rộng, nâng cao sự tập trung của bạn. 
Màn hình sở hữu tấm nền IPS hiện đại, vừa cải thiện độ sáng, độ tương phản hình ảnh rõ rệt, vừa hỗ trợ góc nhìn rộng lý tưởng cho trải nghiệm quan sát tốt hơn. Độ phân giải 2360 x 1640 px vượt trội tái hiện mọi nội dung với màu sắc sống động, đầy đủ chi tiết giúp người xem mãn nhãn. 

Hiệu năng đột phá với chip M1, đa nhiệm tuyệt vời với RAM 8GB
Chiếc iPad thế hệ mới được tích hợp chip M1 đột phá, giúp cấu hình thêm mạnh mẽ. CPU 8 nhân cung cấp hiệu suất nhanh hơn tới 60% so với thế hệ tiền nhiệm, biến chiếc iPad Air 5 trở thành một cỗ máy chơi game và sáng tạo di động tuyệt vời, đáp ứng mọi yêu cầu hiệu năng cao của bạn. 
Đa nhiệm mượt mà giữa các ứng dụng một cách mạnh mẽ và hỗ trợ chơi các trò chơi đồ họa chuyên sâu nhờ bộ nhớ RAM 8GB. Khả năng đa nhiệm nâng cấp cho phép bạn mở nhiều tab, vừa nghe nhạc vừa lướt web trơn tru mà không lo giật lag hay đơ màn hình khi đang chơi game…

Dung lượng lưu trữ 64GB, tích hợp camera sắc nét 
Chiếc Apple iPad Air 5 (2021) cao cấp được tích hợp bộ nhớ trong có dung lượng không quá lớn 64GB, đủ để có thể đáp ứng được nhu cầu lưu trữ ở mức vừa phải của bạn, cho phép người dùng lưu trữ nhiều hình ảnh, video hoặc tải một số ứng dụng yêu thích về máy. 

Chiếc iPad mới được Apple trang bị camera sau 12MP và camera trước 12MP, kèm một số tính năng hỗ trợ tiên tiến giúp bạn có được những tấm ảnh, đoạn video sắc nét, chất lượng sống động nhờ độ phân giải cao, dễ dàng lưu giữ mọi khoảnh khắc với camera của iPad Air 5. 

Hỗ trợ các kết nối tiên tiến, hệ điều hành iPadOS độc đáo 
Tham gia mạng không dây 5G siêu nhanh, giúp người dùng dễ dàng tải xuống tệp, chơi trò chơi hay phát trực tuyến phim và hơn thế nữa. Kết nối không dây nhanh mang đến giải pháp để bạn giữ liên lạc. Với Wi-Fi 6, hãy yên tâm rằng Wi-Fi siêu nhanh, cho trải nghiệm giải trí không độ trễ. Kết nối Bluetooth 5.0 giúp cung cấp tốc độ truyền tải dữ liệu đáng kinh ngạc. 

iPadOS dễ sử dụng và được thiết kế cho tính linh hoạt của chiếc iPad thế hệ mới. Với các tính năng tuyệt vời trong iPadOS 15, người dùng có thể ghi lại suy nghĩ của mình bằng Quick Note, sử dụng Live Text để thực hiện cuộc gọi, gửi email hoặc kết nối với bạn bè và gia đình bằng SharePlay một cách nhanh chóng, tối ưu trải nghiệm dù ở bất kỳ đâu. ', N' Chính hãng, Mới 100%, Nguyên seal
- Màn hình: 10.9" - Liquid Retina display - IPS
- Camera sau: 12MP
- Camera trước: 12MP
- CPU: Apple M1
- Bộ nhớ: 64GB
- RAM: 8GB
- Hệ điều hành: iPadOS', 900, 889, N'ipad-air-5-m1-2022.webp', 14, 7)
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [SmallDescription], [DisPrice], [CurPrice], [ImageUrl], [BrandId], [CategoryId]) VALUES (16, N'PC HP ProOne 400 G6 230T1PA', N'Máy tính để bàn HP AIO ProOne 400 G6 (230T1PA) sở hữu thiết kế đơn giản mà tinh tế, kiểu dáng thanh lịch cùng các chức năng nâng cấp đáp ứng mọi nhu cầu sử dụng của người dùng. Đây là sự lựa chọn hoàn hảo cho mọi đối tượng sử dụng, sẵn sàng chinh phục những tác vụ tầm cao.
Thiết kế bắt mắt, màu sắc hiện đại
Đến từ thương hiệu HP, PC HP AIO ProOne 400 G6 (230T1PA) có thiết kế khá gọn nhẹ với khối lượng 11.08kg, kích thước 65 x 24.5 x 45.8 cm, cho phép người dùng đặt ở nhiều vị trí khác nhau mà vẫn đem lại tính thẩm mỹ cao.
Hơn nữa, HP AIO ProOne 400 G6 có vỏ ngoài màu đen làm từ chất liệu cao cấp bền bỉ, cứng cáp, đem lại cảm giác đẳng cấp mà vẫn đầy hiện đại, trẻ trung. Ngoài ra, thiết kế chân đế cải tiến giúp việc đặt hay di chuyển trở nên linh hoạt và thuận tiện hơn.
CPU Core i7 thế hệ 10, chip đồ họa Intel UHD Graphics 630
Đặc biệt, PC HP AIO ProOne 400 G6 (230T1PA) được trang bị CPU Intel Core i7 với 8 nhân, 16 luồng, tốc độ đạt 2.9GHz-4.8GHz, đem lại hiệu năng mạnh mẽ, chuyên nghiệp, giúp máy tính hoạt động trơn tru và ổn định.
Bên cạnh đó, HP sử dụng cho PC AIO ProOne 400 G6 của mình card đồ họa Intel UHD Graphics 630 / Radeon 630 2GB hiện đại, cho phép người dùng thực hiện các tác vụ đồ họa nặng hoặc chơi game với chất lượng cực đỉnh.
RAM 8GB DDR4, ổ cứng 512GB
Là sản phẩm cao cấp của một thương hiệu danh tiếng, PC HP AIO ProOne 400 G6 (230T1PA) có 2 khe cắm RAM 8GB DDR4 hỗ trợ tối đa 32GB giúp gia tăng hiệu suất hoạt động, chuyển đổi ứng dụng ổn định, dễ dàng.
Cùng với đó PC HP sử dụng ổ cứng với dung lượng 512GB M.2 NVMe SSD với cổng lưu trữ thuận tiện, tạo ra không gian khổng lồ giúp bạn lưu trữ mọi dữ liệu quan trọng hay kỷ niệm đáng nhớ, có thể chạy tác vụ đa nhiệm một cách mượt mà.
Hệ điều hành Windows 10 Home SL 64-bit, cổng kết nối đa dạng
Được cải tiến hơn so với các dòng sản phẩm cũ, PC HP AIO ProOne 400 G6 (230T1PA) cài đặt hệ điều hành Windows 10 Home SL 64-bit tiên tiến, tương thích với các phần mềm và ứng dụng mới nhất, đồng thời nâng cao tính an toàn bảo mật thông tin và dữ liệu.
HP đã thiết kế cho AIO ProOne 400 G6 nhiều loại cổng kết nối khác nhau như USB Type C, USB 3.1, Audio combo với LAN 1GB/s đem lại khả năng truyền tải và xử lý dữ liệu khối lượng lớn, nhanh chóng, chính xác, đem lại hiệu quả cao.
Màn hình 23.8 inch Full HD IPS, kết nối không dây hiện đại
Đặc biệt, PC HP AIO ProOne 400 G6 (230T1PA) được trang bị màn hình 23.8 inch Full HD IPS có cảm ứng thuận tiện khi sử dụng, giúp tăng độ tương phản, chống chói, tạo nên hình ảnh sống động, rực rỡ, mãn nhãn người xem mà vẫn giảm thiểu tác hại cho mắt.
Hơn nữa,HP AIO ProOne 400 G6 có kết nối không dây bluetooth 5.0 và wifi 802.11ac đem lại chất lượng đường truyền internet ổn định, nhanh chóng, đáp ứng nhu cầu sử dụng mạng cao.
Mua PC HP AIO ProOne 400 G6 (230T1PA) chính hãng | Bảo hành 12 tháng tại Phong Vũ
Là sự kết hợp hoàn thiện giữa thiết kế tinh tế, ấn tượng và hiệu năng bùng nổ, PC HP AIO ProOne 400 G6 (230T1PA) là thiết bị hỗ trợ đắc lực giúp bạn trở thành một chiến binh cực mạnh. Mua ngay sản phẩm tại Phong Vũ để nhận các voucher giảm giá và các ưu đãi giao hàng, bảo hành khác.', N'CPU: Intel Core i7-10700 (2.90 GHz - 4.80 GHz/16MB/8 nhân, 16 luồng)
- RAM: 1 x 8GB DDR4 3200MHz (2 Khe cắm, Hỗ trợ tối đa 32GB)
- Đồ họa: Intel UHD Graphics 630 / Radeon 630 2GB
- Lưu trữ: 512GB M.2 NVMe SSD/
- Chuột + phím USB', 1200, 1199, N'pc-hp-proone-200-g6.webp', 24, 8)
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [SmallDescription], [DisPrice], [CurPrice], [ImageUrl], [BrandId], [CategoryId]) VALUES (17, N'PC ASUS M5401WU M5401WUAT-BA014W', N'PC Asus AIO M5401WU M5401WUAT-BA014W sở hữu một thiết kế mới lạ độc đáo mang nét riêng đến từ nhà Asus, cùng với cấu hình mạnh mẽ và ổn định giúp hiệu suất làm việc của người dùng được nâng cao. Đây sẽ là sản phẩm đáp ứng được mọi nhu cầu cơ bản hàng ngày của khách hàng.
PC Asus AIO M5401WU M5401WUAT-BA014W
Kiểu dáng độc đáo khác lạ, trang bị nhiều cổng kết nối tiện dụng
PC Asus M5401WU có kiểu dáng khá độc đáo với kích thước 54.1x45.3x20.2 cm và chỉ nặng khoảng 7kg cho phép ta có thể dễ dàng di chuyển và lắp đặt PC tại bất kỳ không gian nào mà bạn mong muốn. Đây là giải pháp tối ưu cho những không gian làm việc có diện tích không quá lớn nhưng vẫn muốn sử dụng PC thay vì laptop.

PC Asus AIO M5401WU M5401WUAT-BA014W | Kiểu dáng dộc đáo khác lạ
PC Asus AIO M5401WU còn được trang bị khá nhiều kết nối vật lý tiện dụng như 2 cổng HDMI, 1 cổng USB Type C , 2 cổng USB 3.2 , 2 cổng USB 2.0 , 1 cổng 3.5 mm , LAN 1 Gb/s cho phép người dùng kết nối với các thiết bị khác một cách thoải mái. Ngoài ra khi mua PC được tặng kèm phụ kiện bàn phím và chuột không dây, giúp bạn không cần phải mua thêm ở ngoài.

PC Asus AIO M5401WU M5401WUAT-BA014W | Đa dạng kết nối
Màn hình lớn 23.8 inch Full HD cùng công nghệ màn hình chống chói, công nghệ kết nối không dây tiện lợi hiện đại
Asus M5401WU được nhà sản xuất trang bị màn hình lớn lên đến 23.8 inch với chất lượng hiển thị Full HD cho hình ảnh rõ nét đến từng chi tiết nhỏ, đảm bảo được trải nghiệm chân thực nhất. Máy còn có thêm công nghệ màn hình chống lóa, cho phép bạn nhìn rõ hình ảnh ở môi trường có ánh sáng cao.

PC Asus AIO M5401WU M5401WUAT-BA014W | Màn hình sắc nét
Không những thế, PC AIO M5401WU còn sở hữu các tính năng kết nối không dây khá tiện lợi cho người sử dụng. Với Bluetooth 4.2 và WiFi 802.11ac mang đến cho bạn khả năng truyền dữ liệu qua các thiết bị khác một cách nhanh chóng và đảm bảo việc kết nối internet diễn ra mượt mà nhất.

Hiệu năng vượt trội cân mọi tác vụ nhờ CPU Ryzen 5, tích hợp sẵn chip đồ họa AMD Radeon Graphics 
PC Asus AIO này sở hữu hiệu năng mạnh mẽ với CPU AMD Ryzen 5 5500U 6 nhân 12 luồng, bộ nhớ đệm 8MP cho tốc độ xung nhịp tối đa 4.0GHz mạnh mẽ. Với hiệu năng này cho phép người dùng thỏa sức làm việc với các phần mềm phổ biến hiện nay hoặc chỉnh sửa đồ họa ở mức cơ bản một cách mượt mà và ổn định nhất từ đó nâng cao hiệu suất làm việc của bạn.

PC Asus AIO M5401WU M5401WUAT-BA014W | Hiệu năng ổn định
Không những thế, PC Asus AIO được tích hợp sẵn chip đồ họa AMD Radeon Graphics giúp mang đến hiệu quả xử lý hình ảnh cho chất lượng tốt hơn cung cấp cho người dùng những trải nghiệm mượt mà. Bạn có thể sử dụng PC để chỉnh sửa đồ họa cơ bản thoải mái với hiệu suất ổn định.

Đa nhiệm mượt mà hơn nhờ 8GB RAM, bộ nhớ khủng lên đến 512GB SSD
PC M5401WU nhà Asus được trang bị bộ nhớ RAM 8GB thế hệ DDR4 khá ấn tượng đem đến trải nghiệm đa nhiệm mượt mà khi chạy nhiều chương trình cùng lúc, hiệu suất được cải thiện tốt hơn so với phiên bản tiền nhiệm DDR3. Nhờ đó bạn sẽ có được năng suất làm việc cao hơn nhờ sự ổn định mà mượt mà.

PC Asus AIO M5401WU M5401WUAT-BA014W | Bộ nhớ lưu trữ lớn
Ngoài ra, bạn còn có thể lưu trữ dữ liệu trên máy một cách thoải mái nhờ bộ nhớ khủng được nhà sản xuất trang bị lên đến 512GB chuẩn M.2 NVMe. Nhờ ổ SSD này mà máy có tốc độ truy xuất dữ liệu nhanh chóng và ổn định hơn, bên cạnh đó quá trình khởi động máy cũng diễn ra nhanh hơn. ', N'CPU: AMD Ryzen 5 5500U (2.1GHz - 4.0GHz/8MB/6 nhân, 12 luồng)
- RAM: 1 x 8GB DDR4 (2 Khe cắm,
- Đồ họa: AMD Radeon Graphics
- Lưu trữ: 512GB M.2 NVMe SSD/
- Bàn phím + Chuột không dây', 1333, 1300, N'pc-asus-m5401wu.webp', 4, 8)
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [SmallDescription], [DisPrice], [CurPrice], [ImageUrl], [BrandId], [CategoryId]) VALUES (18, N'ACER Aspire 7 A715-42G-R05G', N'Laptop Acer Aspire 7 A715-42G-R05G gây ấn tượng với vẻ đẹp đậm chất hiện đại cùng sức mạnh đến từ chip Ryzen 5, cho phép bạn trải nghiệm hiệu năng mượt mà. Đây sẽ là phiên bản laptop cao cấp đáp ứng tốt nhu cầu làm việc, học tập hay giải trí chất lượng cao của người dùng hiện nay.

Thiết kế gọn nhẹ sang trọng, màn hình sắc nét mượt mà
Aspire 7 A715-42G-R05G sở hữu tạo hình gọn nhẹ với trọng lượng 2.1kg và kích thước 36.34 x 25.45 x 2.29 cm. Với sự linh hoạt cơ động, chiếc laptop có thể sẵn sàng đồng hành cùng bạn đến bất kỳ đâu. Gam màu đen hiện đại và thiết kế hoàn thiện nguyên khối đã tạo nên vẻ đẹp sang trọng.

Máy tính xách tay/ Laptop Acer Aspire 7 A715-42G-R05G (NH.QAYSV.007) | Thiết kế gọn nhẹ sang trọng
Màn hình lớn 15.6 inch với tấm nền IPS giúp mang đến không gian hiển thị chân thực dưới mọi góc nhìn. Độ phân giải Full HD (1920 x 1080P) tái hiện hình ảnh sắc nét ấn tượng cho mọi trải nghiệm xem chi tiết. Tần số quét 144Hz mang đến khung hình chuyển động mượt mà, không giật lag. 

Máy tính xách tay/ Laptop Acer Aspire 7 A715-42G-R05G (NH.QAYSV.007) | Độ phân giải sắc nét
Chiếc laptop tích hợp HD webcam, hỗ trợ chất lượng thu hình rõ nét và không bị mờ nhòe, giúp đáp ứng tốt nhu cầu học tập, họp online của người dùng qua các phần mềm như Google Meet, Zoom,... một cách hiệu quả. 

Hiệu năng mạnh mẽ với AMD Ryzen 5 5500U, RAM 8GB, bộ nhớ 512GB
Aspire 7 A715-42G-R05G khai thác sức mạnh của chip AMD Ryzen 5 5500U, gồm 6 nhân 12 luồng, hỗ trợ tốc độ xung nhịp cơ bản là 2.1GHz, và ở chế độ Turbo Boost có thể đạt tối đa 4.0 GHz. Hiệu năng siêu phân luồng mạnh mẽ mang đến lợi thế để Aspire 7 xử lý tốt nhiều tác vụ nặng. 

Máy tính xách tay/ Laptop Acer Aspire 7 A715-42G-R05G (NH.QAYSV.007) | Sử dụng văn phòng, đồ họa mượt mà
RAM 8GB DDR4 với tốc độ 3200 MHz, giúp nâng cấp khả năng đa nhiệm cùng lúc nhiều tác vụ. Với 2 khe cắm sẵn, người dùng có thể thoải mái nâng cấp RAM lên tối đa 32GB. NVIDIA GeForce GTX 1650 4GB GDDR6 đẩy mạnh khả năng xử lý hình ảnh để chơi game, thiết kế đồ họa..

Máy tính xách tay/ Laptop Acer Aspire 7 A715-42G-R05G (NH.QAYSV.007) | Dung lượng lưu trữ lớn
Ổ cứng SSD 512GB cung cấp dung lượng lớn để bạn lưu trữ mọi dữ liệu, tải về các phần mềm làm việc, học tập. Đồng thời, bộ nhớ SSD M.2 NVMe còn hỗ trợ tăng tốc khởi động máy, truy cập dữ liệu nhanh chóng. 

Cài sẵn Windows 11 bản quyền, cổng kết nối tiện ích
Chiếc laptop cao cấp Acer được cài sẵn Windows 11 Home, giúp bạn tiết kiệm chi phí. Các tính năng mới và những thay đổi trong giao diện của Windows thế hệ mới giúp tối ưu trải nghiệm sử dụng của người dùng. 

Máy tính xách tay/ Laptop Acer Aspire 7 A715-42G-R05G (NH.QAYSV.007) | Nhiều cổng kết nối hiện đại
Aspire 7 A715-42G-R05G được tích hợp nhiều cổng kết nối tiện ích như: 1 cổng HDMI, 1 cổng USB 3.2 Type C, 2 cổng USB 3.2, 1 cổng USB 2.0, LAN 1 Gb/s, giúp truyền xuất dữ liệu mau chóng. Chuẩn kết nối không dây WiFi 802.11ax (Wifi 6), Bluetooth 5.1 tiên tiến cho phép người dùng trải nghiệm mạng tốc độ cao với đường truyền ổn định, không gián đoạn. 

Bàn phím LED êm ái, thời lượng pin khá lớn
Laptop Aspire 7 A715-42G-R05G sở hữu layout bàn phím đầy đủ phím số, thuận tiện cho việc gõ nhập dữ liệu. Các phím có độ nảy tốt, cấu trúc chắc chắn, đảm bảo cảm giác êm ái khi gõ phím. Đèn nền LED bên dưới bàn phím cho phép bạn dễ dàng quan sát trong môi trường thiếu ánh sáng. Touchpad vừa phải, bề mặt đủ trơn mịn để tương tác mượt mà, thoải mái. 

Máy tính xách tay/ Laptop Acer Aspire 7 A715-42G-R05G (NH.QAYSV.007) | Bàn phím êm ái
Ngoài ra, chiếc laptop cao cấp còn được tích hợp tính năng bảo mật bằng khuôn mặt, cho phép người dùng mở máy, mở khóa màn hình nhanh chỉ trong vài giây. Đồng thời tăng cường khả năng bảo mật của thông tin cá nhân, đảm bảo an toàn cho dữ liệu lưu trữ trên máy của người dùng. 

Máy tính xách tay/ Laptop Acer Aspire 7 A715-42G-R05G (NH.QAYSV.007) | Dung lượng pin 48Wh
Chiếc laptop sử dụng viên pin có dung lượng 48Wh, hỗ trợ thời lượng hoạt động đủ dài với các tác vụ cơ bản, cho phép người dùng làm việc hay học tập liên tục nhiều giờ liền. Chiếc laptop còn được sạc đầy nhanh chóng, chỉ trong vòng 90 phút để bạn tiếp tục trải nghiệm mà không lo đợi lâu. ', N'CPU: AMD Ryzen 5 5500U
- Màn hình: 15.6" IPS (1920 x 1080),144Hz
- RAM: 1 x 8GB DDR4 3200MHz
- Đồ họa: GTX 1650 4GB GDDR6 / AMD Radeon Graphics
- Lưu trữ: 512GB SSD M.2 NVMe /
- Hệ điều hành: Windows 11 Home
- 48 Wh
- Khối lượng: 2.1kg
- Chuẩn AMD', 2999, 2888, N'laptop-acer-aspire-7.webp', 6, 2)
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [SmallDescription], [DisPrice], [CurPrice], [ImageUrl], [BrandId], [CategoryId]) VALUES (19, N'ASUS Vivobook Pro M3401QA-KM025W', N'Laptop ASUS Vivobook Pro M3401QA-KM025W sở hữu vẻ ngoài sang trọng, tinh tế khi phủ bên ngoài là lớp màu bạc tươi sáng tạo nên sự cao cấp cho chiếc laptop này. Đa nhiệm mạnh mẽ, màn hình mang tới hình ảnh sắc nét ngoài ra hiệu năng đầy mong đợi đến từ chip Ryzen 7 sẽ là bạn đồng hành ưu tú cho sinh viên, hoặc nhân viên văn trong xử lý công việc.
Thiết kế khung máy mềm mại, nhẹ nhàng khi mang theo
Laptop ASUS Vivobook Pro được hãng tạo nên như một vẻ đẹp mang tầm đẳng cấp, màu bạc làm sáng bật chiếc laptop của bạn giữa rất nhiều những chiếc laptop khác. Logo tên máy cũng được khắc nổi lên trên bề mặt nắp máy tạo sự mới mẻ khác với các kiểu khắc logo chìm trước đây.

Laptop ASUS Vivobook Pro M3401QA-KM025W | Khung máy êm ái nhẹ nhàng
Với kiến trúc nguyên khối làm nên chiếc Laptop ASUS Vivobook Pro cho độ bền bỉ theo thời gian sử dụng không suy giảm quá nhiều.  Kích thước máy với thông số 31.74 x 22.85 x 1.92 cm, độ mỏng ở nơi mỏng nhất chỉ 1.92cm và tổng cân nặng của máy là 1.5kg cho bạn thoải mái đem đến trường học, nơi công sở, đi chơi đi du lịch vẫn có thể mang theo rất dễ dàng.

Màn hình OLED hiện đại cho hình ảnh sắc nét, viền mỏng tạo góc nhìn lớn
Laptop ASUS Vivobook Pro sở hữu màn hình kích thước tiêu chuẩn 14 inch và tấm nền là dạng OLED độ phân giải Quad HD (2K) mang thế giới hình ảnh muôn ngàn màu sắc, mang đến sự chân thực và sắc nét cho bạn. Với một chiếc laptop cao cấp thì không thể quên lắp HD webcam cho bạn tiện việc kết nối với mọi người qua việc chia sẻ hình ảnh của mình qua video trực tuyến.

Laptop ASUS Vivobook Pro M3401QA-KM025W | Màn hình Oled viền mỏng sắc nét
Viền của chiếc laptop này cũng được xếp vào hạng mỏng so với những chiếc laptop cùng giá trị trên thị trường. Ưu điểm này sẽ giúp bạn có không gian làm việc trên màn hinh được lớn hơn, góc nhìn rộng mở hơn mỗi khi xem phim, chơi game,...

Hiệu năng xử lý tốc độ cao với Ryzen 7, Ram 8GB cho đa nhiệm mượt
Bạn là sinh viên, là nhân viên văn phòng đang cần tìm một chiếc máy có thể hỗ trợ bạn nhanh chóng xử lý được nhiều tác vụ office thì bạn nên chọn ASUS Vivobook Pro này. Vì nó được trang bị bộ vi Ryzen 7 có xung nhịp cơ bản 3.2 GHz và có thể đạt tới 4.4 GHz khi bạn ép xung, bộ nhớ đệm 16MB và kiến trúc 8 nhân, 16 luồng sẽ cho bạn những trải nghiệm làm việc văn phòng, đồ họa nhẹ nhàng đạt hiệu suất cao.

Laptop ASUS Vivobook Pro M3401QA-KM025W | Hiệu năng xử lý cao Ryzen 7
Laptop ASUS Vivobook Pro trang bị Ram 8GB Onboard DDR4, với chiếc Ram này bạn có thể dễ dàng thao tác cùng lúc trên nhiều tab mà vẫn chạy với độ mượt mà nhất định. Những tình trạng như đứng máy, lag máy sẽ được hạn chế xảy ra cho nên sẽ giúp bạn cải thiện hiệu suất làm việc.

Chip đồ họa xử lý hình ảnh tốt, lưu lượng ổ cứng lên đến 512GB 
Để có thể tiết kiệm tối đa chi phí giá thành cho chiếc laptop ASUS này thì hãng đã chọn thiết lập chip AMD Radeon Graphics bên trong máy và ngoài ra còn làm cho trọng lượng của máy được giảm đi đáng kể. Nhưng đồ họa được xử lý bằng con chip này vẫn được đáp ứng rất tốt.

Laptop ASUS Vivobook Pro M3401QA-KM025W | Đồ họa xử lý tốt
ASUS Vivobook Pro sử dụng ổ cứng SSD M.2 NVMe với tốc độ mở máy nhanh và đọc ghi dữ liệu nhanh chóng sẽ loại bỏ được tình trạng người dùng phải chờ đợi lâu khi khởi chạy máy hoặc các ứng dụng học tập và làm việc. 512GB dung lượng cũng sẽ giúp bạn thoải mái hơn troLaptop ASUS Vivobook Pro M3401QA-KM025W | Đồ họa xử lý tốtng việc lưu trữ thông tin.

Pin đáp ứng thời lượng sử dụng lâu, bàn phím cài nền LED hiện đại
ASUS Vivobook Pro M3401QA-KM025W sử dụng Pin 3 cell 63Wh cho khả năng làm việc xuyên suốt trong khoảng thời gian từ 6-8 tiếng liên tục. Pin của máy này cũng là dòng pin có thể giúp người dùng tiết kiệm điện năng, không tiêu hao quá nhiều năng lượng và có độ bền bỉ trong suốt quá trình sử dụng.

Laptop ASUS Vivobook Pro M3401QA-KM025W| Bàn phím led pin lâu
Bàn phím của chiếc laptop này được hãng khéo léo làm đèn Led nền bên dưới để vừa tăng tính thẩm mỹ của máy vừa giúp tăng sự tương phản khi làm việc trong nơi thiếu ánh sáng vẫn có thể nhìn rõ chữ. Độ phản hồi của bàn phím cũng khá cao nên bạn yên tâm là những gì bạn nhấn sẽ ngay lập tức hiển thị trên màn hình không bị chậm nhịp gây khó chịu.

Áp dụng bảo mật vân tay, đa dạng nhiều cổng kết nối khác nhau
ASUS Vivobook Pro M3401QA-KM025W được cài đặt sẵn sàng Windows 11 Home cho người dùng có thể sử dụng ngay sau khi mua sản phẩm. Trên chiếc laptop này còn trang bị bảo mật vân tay có thể đảm bảo độ an toàn cho thông tin bên trong máy và bạn mở máy chỉ bằng một lần chạm tay.

Laptop ASUS Vivobook Pro M3401QA-KM025W | Đa dạng cổng kết nối
Nhiều cổng kết nối đa dạng được tích hợp trên máy bao gồm 1 cổng HDMI, 1 cổng USB 3.2 Type C, 1 cổng USB 3.2 , 2 cổng USB 2.0 , 1 cổng micro SD card slot và kết nối không dây WiFi 802.11ax (Wifi 6) , Bluetooth 5.0 cho đường truyền ổn định và tương thích được với khá nhiều thiết bị ngoài vi khác nhau.', N'CPU: Ryzen 7 5800H
- Màn hình: 14" OLED (2880 x 1800)
- RAM: 8GB Onboard DDR4
- Đồ họa: Onboard AMD Radeon Graphics
- Lưu trữ: 512GB SSD M.2 NVMe /
- Hệ điều hành: Windows 11 Home
- Pin: 3 cell 63 Wh
- Khối lượng: 1.5kg
- Chuẩn AMD', 1900, 1869, N'laptop-asus-vivobook-pro.webp', 4, 2)
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [SmallDescription], [DisPrice], [CurPrice], [ImageUrl], [BrandId], [CategoryId]) VALUES (20, N'Smart Tivi Samsung 4K Crystal UHD', N'Smart Tivi Samsung Crystal UHD 4K 43 inch 43BU8000 sở hữu vẻ ngoài thời trang, công nghệ hình ảnh chân thực cùng với dàn âm thanh sống động, mượt mà. Trải nghiệm không gian thư giãn giải trí thoải mái cho gia đình của bạn sau một ngày dài làm việc mệt mỏi.
Thiết kế bắt mắt cùng thành phần chất liệu cao cấp
Tivi Samsung Crystal là dòng Smart Led TV có kích thước 965.5 x 559.9 x 25.7 mm và khối lượng 8.1kg. Các góc cạnh được nhà sản xuất tỉ mỉ thiết kế một cách cực kì tinh tế đã góp phần làm tăng thêm sự sang trọng, tính thẩm mĩ cao cho căn phòng nhà bạn.

Smart Tivi Samsung Crystal UHD 4K 43 inch 43BU8000 | Thiết kế bắt mắt
Những nguyên liệu cao cấp mà hãng sử dụng để cấu tạo nên chiếc tivi đem đến sự chắc chắn, bền bỉ nhờ đó cho thời gian sử dụng lâu dài. Hơn nữa, phần chân đế hình chữ V úp ngược tích hợp còn giúp sản phẩm dễ dàng đứng vững trên hầu hết tất cả các bề mặt phẳng.

Màn hình 43 inch ấn tượng, độ phân giải Ultra HD 4K sắc nét  
Smart Tivi Crystal cho người dùng trải nghiệm xem toàn diện hơn bao giờ hết với màn hình lớn 43 inch cùng thiết kế 3 cạnh siêu mỏng gần như không viền. Kích thước này đem đến trải nghiệm xem thoải mái mà lại không chiếm quá nhiều diện tích không gian lắp đặt.

Smart Tivi Samsung Crystal UHD 4K 43 inch 43BU8000 Màn hình chất lượng
Độ phân giải sắc nét Ultra HD 4K đạt 3840 x 2160 pixel của chiếc tivi thông minh 43BU8000 cho khả năng hiển thị lên đến hơn 8 triệu điểm ảnh. Những hình ảnh trình chiếu trên màn hình sẽ trở nên chi tiết hơn gấp nhiều lần so với các loại tivi HD thông thường. 

Công nghệ hình ảnh tiên tiến, hệ thống âm thanh sống động
Đa dạng các công nghệ hình ảnh được thiết lập trên Tivi Samsung Crystal như: Crystal Processor 4K, HDR, HDR10+, Mega Contrast, Dynamic Crystal Color, Micro Dimming, công nghệ Motion Xcelerator. Giúp cho hình ảnh hiển thị rực rỡ, mượt mà nhất có thể trên màn hình để từ đó cho người dùng trải nghiệm không gian ảo một cách chân thực.

Smart Tivi Samsung Crystal UHD 4K 43 inch 43BU8000 | Công nghệ hình ảnh tốt
Công suất loa 20W cùng nghệ âm thanh Dolby Digital Plus, Adaptive Sound, Q-Symphony và công nghệ Object Tracking Sound Lite trên Smart Tivi sẽ đưa bạn đắm chìm trong không gian âm thanh sống động. Thỏa sức tận hưởng những thước phim thú vị đầy cuốn hút ngay tại trong chính căn phòng nhà mình.

Smart Tivi Samsung Crystal UHD 4K 43 inch 43BU8000 | Hình ảnh âm thanh sống động
Hệ điều hành Tizen hiện đại và các kết nối tiện ích
Tivi thông minh Samsung Crystal sử dụng hệ điều hành Tizen nên có giao diện tương đối đơn giản và dễ dàng sử dụng. Kho ứng dụng phong phú gồm: Youtube, Netflix, FPT play, Spotify… hoàn toàn sẽ đáp ứng được tối đa nhu cầu cũng như sở thích của tất cả các thành viên trong gia đình bạn.

Smart Tivi Samsung Crystal UHD 4K 43 inch 43BU8000 | Hệ điều hành tizen thân thiện
Được trang bị 3 cổng xuất hình HDMI, 2 cổng USB và cổng xuất âm thanh Digital Audio Out (Cổng Optical), HDMI ARC (hỗ trợ eARC). Ngoài ra, người dùng còn có thể kết nối internet của Tivi 43BU8000 nhanh chóng nhờ cổng cổng LAN, WiFi hay công nghệ truyền phát Bluetooth hiện đại.', N'Kích thước: 43"
Độ phân giải: 3840 x 2160 / Ultra HD (4K)
Hệ điều hành: Tizen
- Kết nối mạng: LAN, WiFi, Bluetooth
- Cổng xuất hình: 3 x HDMI', 1200, 1000, N'smart-tivi-samsung-4k-crystal-Uhd.webp', 3, 6)
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [SmallDescription], [DisPrice], [CurPrice], [ImageUrl], [BrandId], [CategoryId]) VALUES (21, N'Smart Tivi Samsung 4K QLED', N'Smart Tivi Samsung 4K QLED 55 inch 55Q70BA đến từ thương hiệu đình đám Samsung, là model tivi QLED TV thuộc phân khúc sản phẩm cao cấp đem lại những trải nghiệm tuyệt vời cho mọi người dùng với nhiều sự cải tiến và thay đổi trong thiết kế cũng như chất lượng đáp ứng đầy đủ hơn những nhu cầu cơ bản của mọi hộ gia đình. 
Kiểu dáng hiện đại, thiết kế Airslim không viền
Smart Tivi Samsung 4K QLED 55 inch 55Q70BA được Samsung thiết kế kiểu dáng hiện đại, không viền 4 cạnh tạo cảm giác tràn viền, tối ưu không gian hiển thị giúp người dùng có góc nhìn rộng rãi, dễ dàng tập trung vào hình ảnh hiển thị trên màn hình một cách tự nhiên.

Smart Tivi Samsung 4K QLED 55 inch 55Q70BA | Kiểu dáng hiện đại
Ngoài ra với chân đế được làm bằng chất liệu kim loại giúp đỡ chiếc tivi được vững chắc và cứng cáp hơn tránh rơi vỡ khỏi những tác động vật lý ngoài ý muốn.

Màn hình lớn 55 inch rõ nét, độ phân giải Ultra HD 4K
Smart Tivi Samsung 55 inch 55Q70BA được thiết kế với kích thước lớn với thông số 1232.9 x 778.3 x 246.5 mm với khối lượng chỉ 17.6 kg. Với màn hình lớn lên đến 55 inch mang đến góc nhìn rộng thoải mái cho người dùng khi trải nghiệm.

Smart Tivi Samsung 4K QLED 55 inch 55Q70BA | Hiển thị hình ảnh sắc nét
Bên cạnh đó, Smart Tivi Samsung 4K QLED 55 inch 55Q70BA sở hữu độ phân giải lớn 3840 x 2160 pixels với bộ xử lý hình ảnh chuẩn Ultra HD 4K mang đến hình ảnh sắc nét gấp 4 lần Full HD với 8.3 triệu điểm ảnh cho hình ảnh hiển thị chân thực đến từng chi tiết. 

Màu sắc sống động, chi tiết nổi bật công nghệ Quantum HDR và Supreme UHD Dimming
Công nghệ Quantum HDR giúp Smart Tivi Samsung 4K QLED 55 inch 55Q70BA tối ưu độ tương phản của hình ảnh, tái tạo màu sắc chính xác và các chi tiết rõ ràng cho hình ảnh xuất ra càng thêm chân thực. 

Smart Tivi Samsung 4K QLED 55 inch 55Q70BA | Tối ưu độ tương phản
Bên cạnh đó, Supreme UHD Dimming giúp nâng cao khả năng hiển thị màu sắc và chi tiết hình ảnh, tạo ra cho bạn những khung hình với chất lượng tuyệt vời khi trải nghiệm trên chiếc tivi này. 

Smart Tivi Samsung 4K QLED 55 inch 55Q70BA | Khả năng hiển thị sắc nét
Công nghệ Motion Xcelerator Turbo+ cho hình ảnh mượt mà từng chuyển động 
Công nghệ Motion Xcelerator Turbo+ có tần số quét cao lên đến 120Hz giúp các phân cảnh được nối tiếp nhau không bị xuất hiện khoảng không khi chơi game hay xem phim giúp trải nghiệm của bạn trở nên hoàn hảo hơn bao giờ hết. 

Smart Tivi Samsung 4K QLED 55 inch 55Q70BA | Hình ảnh mượt mà
Công nghệ Q-Symphony cho âm thanh sống động, tự nhiên
Smart Tivi Samsung 4K QLED 55 inch 55Q70BA được trang bị công suất loa 20W với công nghệ Q-Symphony cho cảm giác thăng hoa cùng những thanh âm sống động, được đồng bộ liền mạch giữa loa tivi và loa thanh. Công nghệ Q-Symphony tận dụng loa thanh và loa tivi, kiến tạo không gian giải trí tuyệt vời và bao trùm mọi giác quan của bạn.

 

Điều khiển tivi của bạn qua ứng dụng SmartThings 
Với ứng dụng SmartThings bạn có thể dễ dàng điều khiển chiếc tivi của mình thông qua chiếc điện thoại thông minh để cài đặt sẵn ứng dụng SmartThings. Ngoài ra, với ứng dụng bạn cũng có thể điều khiển các thiết bị khác trong nhà tạo nên một hệ sinh thái hiện đại mới trong chính căn nhà của mình. 

Smart Tivi Samsung 4K QLED 55 inch 55Q70BA | Dễ dàng điều khiển tivi
Tivi được trang bị nhiều cổng và chuẩn kết nối 
Smart Tivi Samsung 4K QLED 55 inch 55Q70BA được trang bị nhiều cổng kết nối hiện đại như: 4 cổng xuất hình HDMI, 2 cổng USB, 2 cổng xuất âm thanh Digital Audio Out (Cổng Optical) và HDMI ARC (hỗ trợ eARC). Ngoài ra, còn được trang bị các kết nối Internet như: LAN, WiFi, Bluetooth.', N'Kích thước: 55"
- Độ phân giải: 3840 x 2160 / Ultra HD (4K)
- Hệ điều hành: Tizen
- Kết nối mạng: LAN, WiFi, Bluetooth
- Cổng xuất hình: 4 x HDMI', 1400, 1389, N'smart-tivi-samsung-4k-qled.webp', 3, 6)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Reviews] ON 

INSERT [dbo].[Reviews] ([ReviewId], [UserId], [ProductId], [Rating], [Comment], [Create_at]) VALUES (13, 5, 4, 4, N'Very Good!!', CAST(N'2023-11-07T10:38:24.0444758' AS DateTime2))
INSERT [dbo].[Reviews] ([ReviewId], [UserId], [ProductId], [Rating], [Comment], [Create_at]) VALUES (14, 5, 3, 5, N'Very very good, product is very good', CAST(N'2023-11-07T10:38:57.3852253' AS DateTime2))
INSERT [dbo].[Reviews] ([ReviewId], [UserId], [ProductId], [Rating], [Comment], [Create_at]) VALUES (15, 5, 6, 3, N'Not bad, product excellent', CAST(N'2023-11-07T10:39:36.9862959' AS DateTime2))
INSERT [dbo].[Reviews] ([ReviewId], [UserId], [ProductId], [Rating], [Comment], [Create_at]) VALUES (16, 9, 3, 4, N'Not bad, I think I will buy it again', CAST(N'2023-11-07T10:47:06.0630362' AS DateTime2))
INSERT [dbo].[Reviews] ([ReviewId], [UserId], [ProductId], [Rating], [Comment], [Create_at]) VALUES (17, 9, 4, 1, N'Very bad', CAST(N'2023-11-07T10:47:17.2490877' AS DateTime2))
INSERT [dbo].[Reviews] ([ReviewId], [UserId], [ProductId], [Rating], [Comment], [Create_at]) VALUES (18, 6, 3, 4, N'hahahahaaha', CAST(N'2023-11-08T00:49:09.3590970' AS DateTime2))
INSERT [dbo].[Reviews] ([ReviewId], [UserId], [ProductId], [Rating], [Comment], [Create_at]) VALUES (19, 6, 4, 4, N'Great', CAST(N'2023-11-08T00:49:20.9025907' AS DateTime2))
INSERT [dbo].[Reviews] ([ReviewId], [UserId], [ProductId], [Rating], [Comment], [Create_at]) VALUES (20, 5, 3, 4, N'product very good', CAST(N'2023-11-17T07:35:44.6550381' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Reviews] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RoleId], [Name]) VALUES (2, N'Customer')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRoles] ON 

INSERT [dbo].[UserRoles] ([UserId], [RoleId], [UserRoleId]) VALUES (4, 1, 1)
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [UserRoleId]) VALUES (5, 1, 2)
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [UserRoleId]) VALUES (6, 2, 3)
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [UserRoleId]) VALUES (7, 2, 5)
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [UserRoleId]) VALUES (8, 2, 6)
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [UserRoleId]) VALUES (9, 2, 7)
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [UserRoleId]) VALUES (10, 2, 8)
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [UserRoleId]) VALUES (11, 2, 9)
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [FullName], [UserName], [Password], [Email], [Address], [PhoneNumber], [Gender], [DateCreate]) VALUES (4, N'Do Van Hoang', N'HoangELT', N'$2b$10$nSu47NWrQ77F3AbnP5KDJu08PmvccWy7KEpeBOxDf3ohxBXyDxDmW', N'dovanhoang595@gmail.com', N'BR-VT', N'1234566390', N'male', CAST(N'2023-10-30T21:49:15.0370659' AS DateTime2))
INSERT [dbo].[Users] ([UserId], [FullName], [UserName], [Password], [Email], [Address], [PhoneNumber], [Gender], [DateCreate]) VALUES (5, N'Tran Trung Kien', N'Kien123', N'$2b$10$cGz0nD81VxFKqGt9/OqTFuMJAqr.tyDUePk3Cyh4Uy0Pd/SA2XaDy', N'kien12s34@gmail.com', N'Binh Thuan', N'9876543210', N'male', CAST(N'2023-10-31T11:05:30.0418179' AS DateTime2))
INSERT [dbo].[Users] ([UserId], [FullName], [UserName], [Password], [Email], [Address], [PhoneNumber], [Gender], [DateCreate]) VALUES (6, N'Nguyen Van Bien', N'Bien123', N'$2b$10$DJbfEnCftYcNIUCKKl8.yOaSbqvLeua/R1gjHo/uzr7BifeujcXVq', N'bien1234@gmail.com', N'Đắc Lắc', N'0326541859', N'male', CAST(N'2023-11-07T10:40:17.2567543' AS DateTime2))
INSERT [dbo].[Users] ([UserId], [FullName], [UserName], [Password], [Email], [Address], [PhoneNumber], [Gender], [DateCreate]) VALUES (7, N'Ly Dai Cuong', N'Cuong12311', N'$2b$10$m2kdmbUdw9j8r4V3eUOdDOT1aS0W1UV81sHcSRc2.YRnZb7MfLEk.', N'daicuong0505@gmail.com', N'Đồng Nai', N'3265987410', N'male', CAST(N'2023-11-07T10:40:36.7511123' AS DateTime2))
INSERT [dbo].[Users] ([UserId], [FullName], [UserName], [Password], [Email], [Address], [PhoneNumber], [Gender], [DateCreate]) VALUES (8, N'Huynh Kien Dong Duy', N'DuyKien1233', N'$2b$10$noQzrP2RfFR/Fi9Buuj5iO.mUdki/QvTL3soH.ad/Jhv1P0j1rgdu', N'duy12s34@gmail.com', N'Long An', N'6598741320', N'male', CAST(N'2023-11-07T10:40:59.4649451' AS DateTime2))
INSERT [dbo].[Users] ([UserId], [FullName], [UserName], [Password], [Email], [Address], [PhoneNumber], [Gender], [DateCreate]) VALUES (9, N'Đạo Thanh Hưng', N'HungDao1423', N'$2b$10$zIkna1REfxCavIZHxX5onewF.KZ1WpkOE6Pm9a42/sQYI88AxAnZW', N'daothanhhung123@gmail.com', N'Ninh Thuận', N'0326549871', N'male', CAST(N'2023-11-07T10:41:46.3706885' AS DateTime2))
INSERT [dbo].[Users] ([UserId], [FullName], [UserName], [Password], [Email], [Address], [PhoneNumber], [Gender], [DateCreate]) VALUES (10, N'Nguyễn Thị Cẩm Tú', N'TuCam321', N'$2b$10$6ORalGTI/l0QTtzDqN6I4.Fchs/tqq3pAn9vUdTgMQmJ92kk14z6a', N'nguyentu3010@gmail.com', N'BR-VT', N'0326589645', N'female', CAST(N'2023-11-07T10:42:45.9615560' AS DateTime2))
INSERT [dbo].[Users] ([UserId], [FullName], [UserName], [Password], [Email], [Address], [PhoneNumber], [Gender], [DateCreate]) VALUES (11, N'Do Minh Dang', N'Dang123', N'$2b$10$Qc7uc8EOkL2OHyycd.3.2eApNbLIotTByPbhIGKcoyNA1a2plqR4O', N'dovanhoang0805@gmail.com', N'Đà Lạt', N'5476479452', N'male', CAST(N'2023-11-08T22:45:58.3109873' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[OrderDetails] ADD  DEFAULT (CONVERT([bit],(0))) FOR [isReview]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products_ProductId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users_UserId]
GO
ALTER TABLE [dbo].[ProductColors]  WITH CHECK ADD  CONSTRAINT [FK_ProductColors_Colors_ColorId] FOREIGN KEY([ColorId])
REFERENCES [dbo].[Colors] ([ColorId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductColors] CHECK CONSTRAINT [FK_ProductColors_Colors_ColorId]
GO
ALTER TABLE [dbo].[ProductColors]  WITH CHECK ADD  CONSTRAINT [FK_ProductColors_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductColors] CHECK CONSTRAINT [FK_ProductColors_Products_ProductId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands_BrandId] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([BrandId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands_BrandId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Products_ProductId]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Users_UserId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles_RoleId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users_UserId]
GO
