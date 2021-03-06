USE [Koyuncu]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 13.04.2022 11:12:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](15) NOT NULL,
	[Description] [ntext] NULL,
	[Picture] [image] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 13.04.2022 11:12:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](40) NOT NULL,
	[CategoryID] [int] NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [smallint] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Picture]) VALUES (1, N'Bilgisayar', N'2.7kg', NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Picture]) VALUES (2, N'Ekranlar', N'5kg', NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock]) VALUES (1, N'Lenova', 1, 15.0000, 50)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock]) VALUES (2, N'Asus', 1, 20.0000, 30)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock]) VALUES (3, N'AOC', 2, 10.0000, 20)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock]) VALUES (4, N'Samsung', 2, 15.0000, 35)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock]) VALUES (5, N'MSI', NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock]) VALUES (9, N'HP', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
