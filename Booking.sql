USE [master]
GO
/****** Object:  Database [Booking]    Script Date: 03/05/2017 23:56:05 ******/
CREATE DATABASE [Booking] ON  PRIMARY 
( NAME = N'Booking', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\Booking.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Booking_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\Booking_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Booking] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Booking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Booking] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Booking] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Booking] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Booking] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Booking] SET ARITHABORT OFF
GO
ALTER DATABASE [Booking] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Booking] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Booking] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Booking] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Booking] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Booking] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Booking] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Booking] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Booking] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Booking] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Booking] SET  DISABLE_BROKER
GO
ALTER DATABASE [Booking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Booking] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Booking] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Booking] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Booking] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Booking] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Booking] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Booking] SET  READ_WRITE
GO
ALTER DATABASE [Booking] SET RECOVERY FULL
GO
ALTER DATABASE [Booking] SET  MULTI_USER
GO
ALTER DATABASE [Booking] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Booking] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'Booking', N'ON'
GO
USE [Booking]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 03/05/2017 23:56:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[role_Id] [bit] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 03/05/2017 23:56:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[username] [nvarchar](50) NOT NULL,
	[national_Id] [nvarchar](50) NOT NULL,
	[city_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[national_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Route]    Script Date: 03/05/2017 23:56:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Route](
	[route_Id] [int] NOT NULL,
	[from_City] [nvarchar](50) NULL,
	[to_City] [nvarchar](50) NULL,
	[route] [nvarchar](50) NULL,
	[duration] [int] NULL,
 CONSTRAINT [PK_Route] PRIMARY KEY CLUSTERED 
(
	[route_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Passenger]    Script Date: 03/05/2017 23:56:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passenger](
	[passenger_Name] [nvarchar](50) NOT NULL,
	[national_Id] [nvarchar](50) NULL,
	[username] [nvarchar](50) NULL,
 CONSTRAINT [PK_Passenger] PRIMARY KEY CLUSTERED 
(
	[passenger_Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bus]    Script Date: 03/05/2017 23:56:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bus](
	[bus_Id] [nvarchar](50) NOT NULL,
	[route_Id] [int] NULL,
	[fare] [money] NULL,
	[departure_Time] [time](7) NULL,
 CONSTRAINT [PK_Bus] PRIMARY KEY CLUSTERED 
(
	[bus_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 03/05/2017 23:56:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[username] [nvarchar](50) NULL,
	[booking_Id] [nvarchar](50) NOT NULL,
	[passenger_Name] [nvarchar](50) NULL,
	[booking_Closed] [bit] NULL,
	[booking_Date] [date] NULL,
	[from_City] [nvarchar](50) NULL,
	[to_City] [nvarchar](50) NULL,
	[bus_Id] [nvarchar](50) NULL,
	[departure_Date] [date] NULL,
	[departure_Time] [time](7) NULL,
	[arrival_Date] [date] NULL,
	[arrival_Time] [time](7) NULL,
	[route] [nvarchar](50) NULL,
	[fare] [money] NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[booking_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Passenger_Account]    Script Date: 03/05/2017 23:56:06 ******/
ALTER TABLE [dbo].[Passenger]  WITH CHECK ADD  CONSTRAINT [FK_Passenger_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Passenger] CHECK CONSTRAINT [FK_Passenger_Account]
GO
/****** Object:  ForeignKey [FK_Passenger_City]    Script Date: 03/05/2017 23:56:06 ******/
ALTER TABLE [dbo].[Passenger]  WITH CHECK ADD  CONSTRAINT [FK_Passenger_City] FOREIGN KEY([national_Id])
REFERENCES [dbo].[City] ([national_Id])
GO
ALTER TABLE [dbo].[Passenger] CHECK CONSTRAINT [FK_Passenger_City]
GO
/****** Object:  ForeignKey [FK_Bus_Route]    Script Date: 03/05/2017 23:56:06 ******/
ALTER TABLE [dbo].[Bus]  WITH CHECK ADD  CONSTRAINT [FK_Bus_Route] FOREIGN KEY([route_Id])
REFERENCES [dbo].[Route] ([route_Id])
GO
ALTER TABLE [dbo].[Bus] CHECK CONSTRAINT [FK_Bus_Route]
GO
/****** Object:  ForeignKey [FK_Booking_Bus]    Script Date: 03/05/2017 23:56:06 ******/
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Bus] FOREIGN KEY([bus_Id])
REFERENCES [dbo].[Bus] ([bus_Id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Bus]
GO
/****** Object:  ForeignKey [FK_Booking_Passenger]    Script Date: 03/05/2017 23:56:06 ******/
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Passenger] FOREIGN KEY([passenger_Name])
REFERENCES [dbo].[Passenger] ([passenger_Name])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Passenger]
GO
