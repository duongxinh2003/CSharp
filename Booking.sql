USE [master]
GO
/****** Object:  Database [Booking]    Script Date: 03/20/2017 19:26:52 ******/
CREATE DATABASE [Booking] ON  PRIMARY 
( NAME = N'Booking', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\Booking.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Booking_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\Booking_log.LDF' , SIZE = 768KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
ALTER DATABASE [Booking] SET  ENABLE_BROKER
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
/****** Object:  StoredProcedure [dbo].[s0]    Script Date: 03/20/2017 19:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[s0]
@makh varchar(4) 
as 
begin 
 select s.MaSV,s.HoSV,s.TenSV,s.NgaySinh
 from SINHVIEN s
 where @makh =s.MaKH 
end 
exec s0 'httt'
GO
/****** Object:  Table [dbo].[National]    Script Date: 03/20/2017 19:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[National](
	[national_Id] [nvarchar](50) NOT NULL,
	[nationnal_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_National] PRIMARY KEY CLUSTERED 
(
	[national_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[National] ([national_Id], [nationnal_Name]) VALUES (N'0', N'No national')
INSERT [dbo].[National] ([national_Id], [nationnal_Name]) VALUES (N'0212', NULL)
INSERT [dbo].[National] ([national_Id], [nationnal_Name]) VALUES (N'135', NULL)
INSERT [dbo].[National] ([national_Id], [nationnal_Name]) VALUES (N'2468', NULL)
INSERT [dbo].[National] ([national_Id], [nationnal_Name]) VALUES (N'247', NULL)
INSERT [dbo].[National] ([national_Id], [nationnal_Name]) VALUES (N'468', NULL)
INSERT [dbo].[National] ([national_Id], [nationnal_Name]) VALUES (N'8206', NULL)
INSERT [dbo].[National] ([national_Id], [nationnal_Name]) VALUES (N'9088', NULL)
INSERT [dbo].[National] ([national_Id], [nationnal_Name]) VALUES (N'N001', N'VietNam')
INSERT [dbo].[National] ([national_Id], [nationnal_Name]) VALUES (N'N002', N'Lao')
INSERT [dbo].[National] ([national_Id], [nationnal_Name]) VALUES (N'N003', N'ThaiLan')
INSERT [dbo].[National] ([national_Id], [nationnal_Name]) VALUES (N'N004', N'USA')
INSERT [dbo].[National] ([national_Id], [nationnal_Name]) VALUES (N'N005', N'Japan')
INSERT [dbo].[National] ([national_Id], [nationnal_Name]) VALUES (N'N006', N'China')
INSERT [dbo].[National] ([national_Id], [nationnal_Name]) VALUES (N'N007', N'England')
INSERT [dbo].[National] ([national_Id], [nationnal_Name]) VALUES (N'N123', NULL)
INSERT [dbo].[National] ([national_Id], [nationnal_Name]) VALUES (N'N456', NULL)
INSERT [dbo].[National] ([national_Id], [nationnal_Name]) VALUES (N'Test01', NULL)
/****** Object:  StoredProcedure [dbo].[s1]    Script Date: 03/20/2017 19:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[s1]
@masv varchar(5) 
as 
begin 
 select m.MaMH, m.SoTiet,m.TenMH
 from MONHOC m
 where @masv = m.MaMH
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateSLSV]    Script Date: 03/20/2017 19:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateSLSV]
as
begin
	update KHOA
	set SLSV = (select COUNT (*)
	from SINHVIEN where SINHVIEN.MaKH = KHOA.MaKH)
end
GO
/****** Object:  StoredProcedure [dbo].[s5]    Script Date: 03/20/2017 19:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[s5]
as
begin 
  select k.MaKH,s1.HocBong
  from SINHVIEN s1, KHOA k 
  where s1.MaKH = k.MaKH 
  and s1.HocBong = ( select MAX (s2.HocBong) from SINHVIEN s2 
  where 
  s1.MaKH =s2.MaKH )
end
GO
/****** Object:  StoredProcedure [dbo].[ViewStudentResult]    Script Date: 03/20/2017 19:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--store return number of passed courses and 
--average of passed courses 
create proc [dbo].[ViewStudentResult]
@masv varchar(4),
@cnt int output,
@diemtb real output
as
begin 
	set @diemtb = (select DiemTB
	from SINHVIEN where MaSV = @masv)
	set @cnt = (select COUNT(k1.MaSV)
	from KETQUA  k1 where k1.MaSV = @masv
	and k1.Diem >=5 and 
	k1.LanThi = (select MAX(k2.LanThi) from KETQUA k2
	where k1.MaSV = k2.MaSV and k1.MaMH = k2.MaMH))
end
GO
/****** Object:  StoredProcedure [dbo].[ViewStudentGPA]    Script Date: 03/20/2017 19:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--store return the GPA of a student
create proc [dbo].[ViewStudentGPA]
@masv varchar (4)
as begin 
	--diemtb <=5 -> GPA = Ordinary
	--diemtb >5 && diemtb <8 -> GPA = FAir good
	--diemtb >=8 -> GPA = Good
	declare @diemtb real
	set @diemtb = (select AVG(k1.Diem)
	from KETQUA k1 where k1.MaSV = @masv
	and k1.LanThi = (select MAX(k2.LanThi)
	from KETQUA k2 where k1.MaSV = k2.MaSV
	and k1.MaMH = k2.MaMH))
	if @diemtb <=5
	begin
		return 'Ordinary'
	end
	else if @diemtb > 5 and @diemtb <8
	begin
		return 'Fair Good'
	end
	else
	begin
		return 'Good'
	end	
end
GO
/****** Object:  StoredProcedure [dbo].[s7]    Script Date: 03/20/2017 19:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[s7]
as
begin
	select k.MaMH, sv.TenSV, Diem
	from SINHVIEN sv, KETQUA k, (select MaMH, MAX(Diem) as maxdiem
	from KETQUA
	group by MaMH) a
	where k.MaMH = a.MaMH and Diem = a.maxdiem and sv.MaSV = k.MaSV
end
GO
/****** Object:  StoredProcedure [dbo].[s6]    Script Date: 03/20/2017 19:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[s6]
as
begin
	select top 2 s.MaSV, s.HoSV, s.TenSV, s.NgaySinh, COUNT(distinct k.MaMH) "Tong Mon" 
	from SINHVIEN s, KETQUA k
	where s.MaSV = k.MaSV
	group by s.MaSV, s.HoSV, s.TenSV, s.NgaySinh
	order by COUNT(distinct k.MaMH) desc
end
GO
/****** Object:  StoredProcedure [dbo].[s4]    Script Date: 03/20/2017 19:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[s4]
@masv varchar(4)
as
begin
	declare @max real
	set @max = (select MAX(k.Diem) from KETQUA k where k.MaSV = @masv and k.Diem >=5)
	declare @min real
	set @min = (select MIN(k.Diem) from KETQUA k where k.MaSV = @masv and k.Diem >=5)
	select k.MaSV, k.Diem, k.MaMH
	from KETQUA k
	where k.MaSV = @masv and (k.Diem = @max or k.Diem = @min)
end
GO
/****** Object:  StoredProcedure [dbo].[s3]    Script Date: 03/20/2017 19:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[s3]
@masv varchar(4)
as
begin
	declare @count int
	set @count = (
	select COUNT(distinct k.MaMH) from KETQUA k
	where k.MaSV = @masv)
	select @count "Result"
end
GO
/****** Object:  StoredProcedure [dbo].[s2]    Script Date: 03/20/2017 19:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[s2] 
@masv varchar(4)
as 
begin  
   update KETQUA
   set KQ = case
   when Diem <= 5 then 'D' 
   else 'K' 
   end 
   where MaSV= @masv 
   select * from KETQUA 
   where MaSV =@masv 
end
GO
/****** Object:  StoredProcedure [dbo].[displayAllKhoa]    Script Date: 03/20/2017 19:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--store  to display information of all Khoa
create proc [dbo].[displayAllKhoa]
as 
begin
	if not exists (select * from KHOA)
	begin 
		print 'The Khoa table is empty'
		end 
		else
		begin
			select * from KHOA
		end
end
--exec store
exec displayAllKhoa
GO
/****** Object:  StoredProcedure [dbo].[CalDiemTB]    Script Date: 03/20/2017 19:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--store calculate DiemTB of student st
create proc [dbo].[CalDiemTB]
@masv varchar (4)
as
begin
	declare @diemtb real
	set @diemtb = (select AVG(diem) from KETQUA k1
	where MaSV = @masv and LanThi = (select MAX (lanthi) from KETQUA k2 where
	k1.MaSV = k2.MaSV and k1.MaSV = k2.MaSV )
	)
	--update diemtb to Sinhvien
	update SINHVIEN
	set DiemTB = @diemtb
	where MaSV = @masv
end
--exec CalDiemTB
exec CalDiemTB 'sv01'
GO
/****** Object:  Table [dbo].[Account]    Script Date: 03/20/2017 19:26:53 ******/
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
CREATE NONCLUSTERED INDEX [IX_Account] ON [dbo].[Account] 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password], [role_Id]) VALUES (N'admin', N'admin', 0)
INSERT [dbo].[Account] ([username], [password], [role_Id]) VALUES (N'master', N'master', 0)
INSERT [dbo].[Account] ([username], [password], [role_Id]) VALUES (N'sonnh', N'sonnh', 1)
INSERT [dbo].[Account] ([username], [password], [role_Id]) VALUES (N'test1', N'test1', 1)
INSERT [dbo].[Account] ([username], [password], [role_Id]) VALUES (N'test2', N'test2', 1)
INSERT [dbo].[Account] ([username], [password], [role_Id]) VALUES (N'test3', N'test3', 1)
INSERT [dbo].[Account] ([username], [password], [role_Id]) VALUES (N'test4', N'test4', 1)
INSERT [dbo].[Account] ([username], [password], [role_Id]) VALUES (N'username', N'username', 1)
/****** Object:  Table [dbo].[Passenger]    Script Date: 03/20/2017 19:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passenger](
	[passenger_Id] [int] IDENTITY(1,1) NOT NULL,
	[passenger_Name] [nvarchar](50) NOT NULL,
	[passenger_Create] [date] NOT NULL,
	[national_Id] [nvarchar](50) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Passenger] PRIMARY KEY CLUSTERED 
(
	[passenger_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Passenger] ON
INSERT [dbo].[Passenger] ([passenger_Id], [passenger_Name], [passenger_Create], [national_Id], [username]) VALUES (1, N'SonNH', CAST(0x8C3C0B00 AS Date), N'0', N'username')
INSERT [dbo].[Passenger] ([passenger_Id], [passenger_Name], [passenger_Create], [national_Id], [username]) VALUES (2, N'Test02', CAST(0x8C3C0B00 AS Date), N'Test01', N'test1')
INSERT [dbo].[Passenger] ([passenger_Id], [passenger_Name], [passenger_Create], [national_Id], [username]) VALUES (3, N'test123', CAST(0x8C3C0B00 AS Date), N'N456', N'username')
INSERT [dbo].[Passenger] ([passenger_Id], [passenger_Name], [passenger_Create], [national_Id], [username]) VALUES (4, N'Test456', CAST(0x8C3C0B00 AS Date), N'N001', N'username')
INSERT [dbo].[Passenger] ([passenger_Id], [passenger_Name], [passenger_Create], [national_Id], [username]) VALUES (5, N'test123', CAST(0x8C3C0B00 AS Date), N'N001', N'username')
INSERT [dbo].[Passenger] ([passenger_Id], [passenger_Name], [passenger_Create], [national_Id], [username]) VALUES (7, N'sonnh', CAST(0x8C3C0B00 AS Date), N'N001', N'test1')
INSERT [dbo].[Passenger] ([passenger_Id], [passenger_Name], [passenger_Create], [national_Id], [username]) VALUES (9, N'sonnh', CAST(0x8C3C0B00 AS Date), N'247', N'test1')
INSERT [dbo].[Passenger] ([passenger_Id], [passenger_Name], [passenger_Create], [national_Id], [username]) VALUES (11, N'test21358', CAST(0x8C3C0B00 AS Date), N'N005', N'test2')
INSERT [dbo].[Passenger] ([passenger_Id], [passenger_Name], [passenger_Create], [national_Id], [username]) VALUES (13, N'test2468', CAST(0x8C3C0B00 AS Date), N'2468', N'test2')
INSERT [dbo].[Passenger] ([passenger_Id], [passenger_Name], [passenger_Create], [national_Id], [username]) VALUES (14, N'test2135', CAST(0x8C3C0B00 AS Date), N'8206', N'test1')
INSERT [dbo].[Passenger] ([passenger_Id], [passenger_Name], [passenger_Create], [national_Id], [username]) VALUES (16, N'test168', CAST(0x8C3C0B00 AS Date), N'N001', N'test1')
SET IDENTITY_INSERT [dbo].[Passenger] OFF
/****** Object:  StoredProcedure [dbo].[abcd]    Script Date: 03/20/2017 19:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--store calculate DiemTB of student st
create proc [dbo].[abcd]
@masv varchar (4)
as
begin
	declare @diemtb real
	set @diemtb = (select AVG(diem) from KETQUA k1
	where MaSV = @masv and LanThi = (select MAX (lanthi) from KETQUA k2 where
	k1.MaSV = k2.MaSV and k1.MaSV = k2.MaSV )
	)
	--update diemtb to Sinhvien
	update SINHVIEN
	set DiemTB = @diemtb
	where MaSV = @masv
end
--exec CalDiemTB
exec CalDiemTB 'sv01'
---
select * from SINHVIEN
GO
/****** Object:  Table [dbo].[City]    Script Date: 03/20/2017 19:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[city_Id] [int] IDENTITY(1,1) NOT NULL,
	[national_Id] [nvarchar](50) NULL,
	[city_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_City_1] PRIMARY KEY CLUSTERED 
(
	[city_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[City] ON
INSERT [dbo].[City] ([city_Id], [national_Id], [city_Name]) VALUES (1, N'N001', N'No City')
INSERT [dbo].[City] ([city_Id], [national_Id], [city_Name]) VALUES (2, N'N001', N'Ha Noi')
INSERT [dbo].[City] ([city_Id], [national_Id], [city_Name]) VALUES (3, N'N001', N'Ho Chi Minh')
INSERT [dbo].[City] ([city_Id], [national_Id], [city_Name]) VALUES (4, N'N001', N'Da Nang')
INSERT [dbo].[City] ([city_Id], [national_Id], [city_Name]) VALUES (5, N'N001', N'Hue')
INSERT [dbo].[City] ([city_Id], [national_Id], [city_Name]) VALUES (6, N'N001', N'Hai Phong')
INSERT [dbo].[City] ([city_Id], [national_Id], [city_Name]) VALUES (7, N'N001', N'Vinh')
INSERT [dbo].[City] ([city_Id], [national_Id], [city_Name]) VALUES (8, N'N001', N'Nam Dinh')
INSERT [dbo].[City] ([city_Id], [national_Id], [city_Name]) VALUES (9, N'N002', N'Vien Chan')
INSERT [dbo].[City] ([city_Id], [national_Id], [city_Name]) VALUES (10, N'N002', N'Sekong')
INSERT [dbo].[City] ([city_Id], [national_Id], [city_Name]) VALUES (11, N'N003', N'Bang Coc')
INSERT [dbo].[City] ([city_Id], [national_Id], [city_Name]) VALUES (12, N'N004', N'New York')
INSERT [dbo].[City] ([city_Id], [national_Id], [city_Name]) VALUES (13, N'N005', N'Washington')
INSERT [dbo].[City] ([city_Id], [national_Id], [city_Name]) VALUES (15, N'N006', N'Bac Kinh')
INSERT [dbo].[City] ([city_Id], [national_Id], [city_Name]) VALUES (17, N'N003', N'Phu Ket')
SET IDENTITY_INSERT [dbo].[City] OFF
/****** Object:  Table [dbo].[Route]    Script Date: 03/20/2017 19:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Route](
	[route_Id] [nvarchar](50) NOT NULL,
	[from_City] [int] NOT NULL,
	[to_City] [int] NOT NULL,
	[duration] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[route_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Route] ([route_Id], [from_City], [to_City], [duration]) VALUES (N'D9E7J', 2, 15, N'50')
INSERT [dbo].[Route] ([route_Id], [from_City], [to_City], [duration]) VALUES (N'K3HV1', 8, 6, N'25')
INSERT [dbo].[Route] ([route_Id], [from_City], [to_City], [duration]) VALUES (N'R000', 1, 1, N'0')
INSERT [dbo].[Route] ([route_Id], [from_City], [to_City], [duration]) VALUES (N'R001', 2, 3, N'35')
INSERT [dbo].[Route] ([route_Id], [from_City], [to_City], [duration]) VALUES (N'R002', 3, 2, N'35')
INSERT [dbo].[Route] ([route_Id], [from_City], [to_City], [duration]) VALUES (N'R004', 2, 4, N'30')
INSERT [dbo].[Route] ([route_Id], [from_City], [to_City], [duration]) VALUES (N'R005', 3, 4, N'10')
INSERT [dbo].[Route] ([route_Id], [from_City], [to_City], [duration]) VALUES (N'R006', 4, 3, N'10')
/****** Object:  Table [dbo].[Bus]    Script Date: 03/20/2017 19:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bus](
	[bus_Id] [nvarchar](50) NOT NULL,
	[route_Id] [nvarchar](50) NULL,
	[fare] [nchar](10) NULL,
 CONSTRAINT [PK_Bus] PRIMARY KEY CLUSTERED 
(
	[bus_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 03/20/2017 19:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[booking_Id] [nvarchar](10) NOT NULL,
	[passenger_Id] [int] NULL,
	[booking_Closed] [bit] NULL,
	[booking_Date] [date] NULL,
	[departure_Date] [date] NULL,
	[departure_Time] [time](7) NULL,
	[arrival_Date] [date] NULL,
	[arrival_Time] [time](7) NULL,
	[bus_Id] [nvarchar](50) NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[booking_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Passenger_Account]    Script Date: 03/20/2017 19:26:53 ******/
ALTER TABLE [dbo].[Passenger]  WITH CHECK ADD  CONSTRAINT [FK_Passenger_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Passenger] CHECK CONSTRAINT [FK_Passenger_Account]
GO
/****** Object:  ForeignKey [FK_Passenger_National]    Script Date: 03/20/2017 19:26:53 ******/
ALTER TABLE [dbo].[Passenger]  WITH CHECK ADD  CONSTRAINT [FK_Passenger_National] FOREIGN KEY([national_Id])
REFERENCES [dbo].[National] ([national_Id])
GO
ALTER TABLE [dbo].[Passenger] CHECK CONSTRAINT [FK_Passenger_National]
GO
/****** Object:  ForeignKey [FK_City_1_National]    Script Date: 03/20/2017 19:26:53 ******/
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_1_National] FOREIGN KEY([national_Id])
REFERENCES [dbo].[National] ([national_Id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_1_National]
GO
/****** Object:  ForeignKey [FK_Route_City]    Script Date: 03/20/2017 19:26:53 ******/
ALTER TABLE [dbo].[Route]  WITH CHECK ADD  CONSTRAINT [FK_Route_City] FOREIGN KEY([from_City])
REFERENCES [dbo].[City] ([city_Id])
GO
ALTER TABLE [dbo].[Route] CHECK CONSTRAINT [FK_Route_City]
GO
/****** Object:  ForeignKey [FK_Route_City1]    Script Date: 03/20/2017 19:26:53 ******/
ALTER TABLE [dbo].[Route]  WITH CHECK ADD  CONSTRAINT [FK_Route_City1] FOREIGN KEY([to_City])
REFERENCES [dbo].[City] ([city_Id])
GO
ALTER TABLE [dbo].[Route] CHECK CONSTRAINT [FK_Route_City1]
GO
/****** Object:  ForeignKey [FK_Bus_Route]    Script Date: 03/20/2017 19:26:53 ******/
ALTER TABLE [dbo].[Bus]  WITH CHECK ADD  CONSTRAINT [FK_Bus_Route] FOREIGN KEY([route_Id])
REFERENCES [dbo].[Route] ([route_Id])
GO
ALTER TABLE [dbo].[Bus] CHECK CONSTRAINT [FK_Bus_Route]
GO
/****** Object:  ForeignKey [FK_Booking_Bus]    Script Date: 03/20/2017 19:26:53 ******/
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Bus] FOREIGN KEY([bus_Id])
REFERENCES [dbo].[Bus] ([bus_Id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Bus]
GO
/****** Object:  ForeignKey [FK_Booking_Passenger]    Script Date: 03/20/2017 19:26:53 ******/
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Passenger] FOREIGN KEY([passenger_Id])
REFERENCES [dbo].[Passenger] ([passenger_Id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Passenger]
GO
