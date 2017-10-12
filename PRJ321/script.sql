USE [master]
GO
/****** Object:  Database [ShopGameDB]    Script Date: 10/12/2017 4:02:07 PM ******/
CREATE DATABASE [ShopGameDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopGameDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ShopGameDB.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ShopGameDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ShopGameDB_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ShopGameDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopGameDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopGameDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopGameDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopGameDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopGameDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopGameDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopGameDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShopGameDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ShopGameDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopGameDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopGameDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopGameDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopGameDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopGameDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopGameDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopGameDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopGameDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShopGameDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopGameDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopGameDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopGameDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopGameDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopGameDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopGameDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopGameDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopGameDB] SET  MULTI_USER 
GO
ALTER DATABASE [ShopGameDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopGameDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopGameDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopGameDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ShopGameDB]
GO
/****** Object:  Table [dbo].[AccountRoleTBL]    Script Date: 10/12/2017 4:02:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountRoleTBL](
	[AccountID] [nvarchar](10) NOT NULL,
	[RoleID] [nvarchar](3) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AccountTBL]    Script Date: 10/12/2017 4:02:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountTBL](
	[AccountID] [nvarchar](10) NOT NULL,
	[Email] [nvarchar](30) NOT NULL,
	[Password] [nvarchar](30) NOT NULL,
	[RoleID] [nvarchar](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BillTBL]    Script Date: 10/12/2017 4:02:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillTBL](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NULL,
	[AccountID] [nvarchar](10) NULL,
	[PaymentID] [nvarchar](10) NOT NULL,
	[CartID] [nvarchar](10) NOT NULL,
	[State] [nvarchar](20) NOT NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CartTBL]    Script Date: 10/12/2017 4:02:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartTBL](
	[CartID] [nvarchar](10) NOT NULL,
	[AccountID] [nvarchar](10) NOT NULL,
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CategoryTBL]    Script Date: 10/12/2017 4:02:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryTBL](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nchar](50) NOT NULL,
 CONSTRAINT [PK_CategoryTBL] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentTBL]    Script Date: 10/12/2017 4:02:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentTBL](
	[PaymentID] [nvarchar](10) NOT NULL,
	[PaymentType] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductTBL]    Script Date: 10/12/2017 4:02:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTBL](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](40) NOT NULL,
	[UnitPrice] [money] NULL,
	[Amount] [int] NOT NULL,
	[Details] [nvarchar](50) NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK__ProductT__B40CC6EDFE213ED1] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RattingTBL]    Script Date: 10/12/2017 4:02:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RattingTBL](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [nvarchar](10) NOT NULL,
	[Score] [int] NOT NULL,
	[Comment] [nvarchar](150) NULL,
 CONSTRAINT [PK_RattingTBL] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoleTBL]    Script Date: 10/12/2017 4:02:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleTBL](
	[RoleID] [nvarchar](3) NOT NULL,
	[AccType] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[URLImageTBL]    Script Date: 10/12/2017 4:02:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[URLImageTBL](
	[ProductID] [int] NOT NULL,
	[URLImage] [varchar](1000) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserTBL]    Script Date: 10/12/2017 4:02:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTBL](
	[AccountID] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PhoneNumber] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[CategoryTBL] ON 

INSERT [dbo].[CategoryTBL] ([CategoryID], [CategoryName]) VALUES (1, N'Action                                            ')
INSERT [dbo].[CategoryTBL] ([CategoryID], [CategoryName]) VALUES (2, N'Adventure                                         ')
INSERT [dbo].[CategoryTBL] ([CategoryID], [CategoryName]) VALUES (3, N'Casual                                            ')
INSERT [dbo].[CategoryTBL] ([CategoryID], [CategoryName]) VALUES (4, N'Indie                                             ')
INSERT [dbo].[CategoryTBL] ([CategoryID], [CategoryName]) VALUES (5, N'Massively Multiplayer                             ')
INSERT [dbo].[CategoryTBL] ([CategoryID], [CategoryName]) VALUES (6, N'Racing                                            ')
INSERT [dbo].[CategoryTBL] ([CategoryID], [CategoryName]) VALUES (7, N'RPG                                               ')
INSERT [dbo].[CategoryTBL] ([CategoryID], [CategoryName]) VALUES (8, N'Simulation                                        ')
INSERT [dbo].[CategoryTBL] ([CategoryID], [CategoryName]) VALUES (9, N'Sports                                            ')
INSERT [dbo].[CategoryTBL] ([CategoryID], [CategoryName]) VALUES (10, N'Strategy                                          ')
SET IDENTITY_INSERT [dbo].[CategoryTBL] OFF
SET IDENTITY_INSERT [dbo].[ProductTBL] ON 

INSERT [dbo].[ProductTBL] ([ProductID], [ProductName], [UnitPrice], [Amount], [Details], [CategoryID]) VALUES (12, N'LOL-League of Legends', 0.0000, 5, N'game moba hot', 9)
SET IDENTITY_INSERT [dbo].[ProductTBL] OFF
INSERT [dbo].[URLImageTBL] ([ProductID], [URLImage]) VALUES (12, N'C:\Users\giangtm\Desktop\javaEE\PRJ321\build\web\imgs\1_5.png')
INSERT [dbo].[URLImageTBL] ([ProductID], [URLImage]) VALUES (12, N'C:\Users\giangtm\Desktop\javaEE\PRJ321\build\web\imgs\1_6.png')
INSERT [dbo].[URLImageTBL] ([ProductID], [URLImage]) VALUES (12, N'C:\Users\giangtm\Desktop\javaEE\PRJ321\build\web\imgs\1_7.png')
INSERT [dbo].[URLImageTBL] ([ProductID], [URLImage]) VALUES (12, N'C:\Users\giangtm\Desktop\javaEE\PRJ321\build\web\imgs\1_8.png')
INSERT [dbo].[URLImageTBL] ([ProductID], [URLImage]) VALUES (12, N'C:\Users\giangtm\Desktop\javaEE\PRJ321\build\web\imgs\1_9.png')
INSERT [dbo].[URLImageTBL] ([ProductID], [URLImage]) VALUES (12, N'C:\Users\giangtm\Desktop\javaEE\PRJ321\build\web\imgs\1_10.png')
INSERT [dbo].[URLImageTBL] ([ProductID], [URLImage]) VALUES (12, N'C:\Users\giangtm\Desktop\javaEE\PRJ321\build\web\imgs\12_5.png')
INSERT [dbo].[URLImageTBL] ([ProductID], [URLImage]) VALUES (12, N'C:\Users\giangtm\Desktop\javaEE\PRJ321\build\web\imgs\12_6.png')
INSERT [dbo].[URLImageTBL] ([ProductID], [URLImage]) VALUES (12, N'C:\Users\giangtm\Desktop\javaEE\PRJ321\build\web\imgs\12_7.png')
INSERT [dbo].[URLImageTBL] ([ProductID], [URLImage]) VALUES (12, N'C:\Users\giangtm\Desktop\javaEE\PRJ321\build\web\imgs\12_8.png')
INSERT [dbo].[URLImageTBL] ([ProductID], [URLImage]) VALUES (12, N'C:\Users\giangtm\Desktop\javaEE\PRJ321\build\web\imgs\12_9.png')
INSERT [dbo].[URLImageTBL] ([ProductID], [URLImage]) VALUES (12, N'C:\Users\giangtm\Desktop\javaEE\PRJ321\build\web\imgs\12_10.png')
ALTER TABLE [dbo].[AccountRoleTBL]  WITH CHECK ADD  CONSTRAINT [acceach] FOREIGN KEY([AccountID])
REFERENCES [dbo].[AccountTBL] ([AccountID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AccountRoleTBL] CHECK CONSTRAINT [acceach]
GO
ALTER TABLE [dbo].[AccountRoleTBL]  WITH CHECK ADD  CONSTRAINT [RoleEach] FOREIGN KEY([RoleID])
REFERENCES [dbo].[RoleTBL] ([RoleID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AccountRoleTBL] CHECK CONSTRAINT [RoleEach]
GO
ALTER TABLE [dbo].[BillTBL]  WITH CHECK ADD  CONSTRAINT [BillCart] FOREIGN KEY([CartID])
REFERENCES [dbo].[CartTBL] ([CartID])
GO
ALTER TABLE [dbo].[BillTBL] CHECK CONSTRAINT [BillCart]
GO
ALTER TABLE [dbo].[BillTBL]  WITH CHECK ADD  CONSTRAINT [BillCustomer] FOREIGN KEY([AccountID])
REFERENCES [dbo].[UserTBL] ([AccountID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BillTBL] CHECK CONSTRAINT [BillCustomer]
GO
ALTER TABLE [dbo].[BillTBL]  WITH CHECK ADD  CONSTRAINT [BillPay] FOREIGN KEY([PaymentID])
REFERENCES [dbo].[PaymentTBL] ([PaymentID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BillTBL] CHECK CONSTRAINT [BillPay]
GO
ALTER TABLE [dbo].[CartTBL]  WITH CHECK ADD  CONSTRAINT [CartCustomer] FOREIGN KEY([AccountID])
REFERENCES [dbo].[UserTBL] ([AccountID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartTBL] CHECK CONSTRAINT [CartCustomer]
GO
ALTER TABLE [dbo].[CartTBL]  WITH CHECK ADD  CONSTRAINT [CartProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[ProductTBL] ([ProductID])
GO
ALTER TABLE [dbo].[CartTBL] CHECK CONSTRAINT [CartProduct]
GO
ALTER TABLE [dbo].[ProductTBL]  WITH CHECK ADD  CONSTRAINT [FK_ProductTBL_CategoryTBL] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[CategoryTBL] ([CategoryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductTBL] CHECK CONSTRAINT [FK_ProductTBL_CategoryTBL]
GO
ALTER TABLE [dbo].[RattingTBL]  WITH CHECK ADD  CONSTRAINT [RattCustomer] FOREIGN KEY([AccountID])
REFERENCES [dbo].[UserTBL] ([AccountID])
GO
ALTER TABLE [dbo].[RattingTBL] CHECK CONSTRAINT [RattCustomer]
GO
ALTER TABLE [dbo].[RattingTBL]  WITH CHECK ADD  CONSTRAINT [RattProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[ProductTBL] ([ProductID])
GO
ALTER TABLE [dbo].[RattingTBL] CHECK CONSTRAINT [RattProduct]
GO
ALTER TABLE [dbo].[URLImageTBL]  WITH CHECK ADD  CONSTRAINT [FK_URLImageTBL_ProductTBL] FOREIGN KEY([ProductID])
REFERENCES [dbo].[ProductTBL] ([ProductID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[URLImageTBL] CHECK CONSTRAINT [FK_URLImageTBL_ProductTBL]
GO
ALTER TABLE [dbo].[UserTBL]  WITH CHECK ADD  CONSTRAINT [UserAcc] FOREIGN KEY([AccountID])
REFERENCES [dbo].[AccountTBL] ([AccountID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserTBL] CHECK CONSTRAINT [UserAcc]
GO
USE [master]
GO
ALTER DATABASE [ShopGameDB] SET  READ_WRITE 
GO
