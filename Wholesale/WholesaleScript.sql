USE [master]
GO
/****** Object:  Database [WholesaleDB]    Script Date: 30.09.2022 12:07:46 ******/
CREATE DATABASE [WholesaleDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WholesaleDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\WholesaleDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WholesaleDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\WholesaleDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WholesaleDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WholesaleDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WholesaleDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WholesaleDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WholesaleDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WholesaleDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WholesaleDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [WholesaleDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WholesaleDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WholesaleDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WholesaleDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WholesaleDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WholesaleDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WholesaleDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WholesaleDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WholesaleDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WholesaleDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WholesaleDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WholesaleDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WholesaleDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WholesaleDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WholesaleDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WholesaleDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WholesaleDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WholesaleDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WholesaleDB] SET  MULTI_USER 
GO
ALTER DATABASE [WholesaleDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WholesaleDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WholesaleDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WholesaleDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WholesaleDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WholesaleDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WholesaleDB] SET QUERY_STORE = OFF
GO
USE [WholesaleDB]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 30.09.2022 12:07:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[IdCust] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[OrderDate] [date] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[IdCust] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 30.09.2022 12:07:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[IdProd] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Amount] [int] NOT NULL,
	[Measure] [nvarchar](50) NOT NULL,
	[Cost] [int] NOT NULL,
	[Note] [nvarchar](50) NOT NULL,
	[ProviderFK] [int] NOT NULL,
	[CustomerFK] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[IdProd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 30.09.2022 12:07:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[IdProv] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED 
(
	[IdProv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([IdCust], [Name], [Phone], [Address], [OrderDate]) VALUES (1, N'Карамбей', N'9998887654', N'Москва', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[Customer] ([IdCust], [Name], [Phone], [Address], [OrderDate]) VALUES (2, N'Солнце', N'2345678905', N'Самара', CAST(N'2022-06-12' AS Date))
INSERT [dbo].[Customer] ([IdCust], [Name], [Phone], [Address], [OrderDate]) VALUES (3, N'Нюша', N'6578497364', N'Новосибирск', CAST(N'2022-01-01' AS Date))
INSERT [dbo].[Customer] ([IdCust], [Name], [Phone], [Address], [OrderDate]) VALUES (4, N'Шарарам', N'8763459465', N'Томск', CAST(N'2022-06-30' AS Date))
INSERT [dbo].[Customer] ([IdCust], [Name], [Phone], [Address], [OrderDate]) VALUES (6, N'Трофей', N'2375849384', N'Санкт-Петербург', CAST(N'2022-10-05' AS Date))
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([IdProd], [Name], [Amount], [Measure], [Cost], [Note], [ProviderFK], [CustomerFK]) VALUES (1, N'Молоко', 56, N'Литр', 50, N'Парное, козье, 2.3%', 1, 1)
INSERT [dbo].[Product] ([IdProd], [Name], [Amount], [Measure], [Cost], [Note], [ProviderFK], [CustomerFK]) VALUES (2, N'Сыр', 20, N'Килограмм', 75, N'Чеддер', 2, 2)
INSERT [dbo].[Product] ([IdProd], [Name], [Amount], [Measure], [Cost], [Note], [ProviderFK], [CustomerFK]) VALUES (3, N'Газировка', 100, N'Литр', 80, N'Байкал', 3, 3)
INSERT [dbo].[Product] ([IdProd], [Name], [Amount], [Measure], [Cost], [Note], [ProviderFK], [CustomerFK]) VALUES (5, N'Мыло', 30, N'Литр', 50, N'Антибактериальное, убивает 99.9% микробов', 4, 4)
INSERT [dbo].[Product] ([IdProd], [Name], [Amount], [Measure], [Cost], [Note], [ProviderFK], [CustomerFK]) VALUES (6, N'Доширак', 200, N'Грамм', 20, N'Говядина, лапша быстрого приготовления', 5, 6)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Provider] ON 

INSERT [dbo].[Provider] ([IdProv], [Name], [Phone], [Address]) VALUES (1, N'Промакт', N'4859459304', N'Архангельск')
INSERT [dbo].[Provider] ([IdProv], [Name], [Phone], [Address]) VALUES (2, N'Фальцет', N'2947504960', N'Москва')
INSERT [dbo].[Provider] ([IdProv], [Name], [Phone], [Address]) VALUES (3, N'Женевьева', N'6734895865', N'Минск')
INSERT [dbo].[Provider] ([IdProv], [Name], [Phone], [Address]) VALUES (4, N'Йорк', N'2839409596', N'Нью-Йорк')
INSERT [dbo].[Provider] ([IdProv], [Name], [Phone], [Address]) VALUES (5, N'Удача', N'2039844030', N'Ставрополь')
SET IDENTITY_INSERT [dbo].[Provider] OFF
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Customer] FOREIGN KEY([CustomerFK])
REFERENCES [dbo].[Customer] ([IdCust])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Customer]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Provider] FOREIGN KEY([ProviderFK])
REFERENCES [dbo].[Provider] ([IdProv])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Provider]
GO
USE [master]
GO
ALTER DATABASE [WholesaleDB] SET  READ_WRITE 
GO
