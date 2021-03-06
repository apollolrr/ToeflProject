USE [master]
GO
/****** Object:  Database [ToeflDB]    Script Date: 10/29/2013 16:39:53 ******/
CREATE DATABASE [ToeflDB] ON  PRIMARY 
( NAME = N'ToeflDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MYSQLSERVER\MSSQL\DATA\ToeflDB.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ToeflDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MYSQLSERVER\MSSQL\DATA\ToeflDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ToeflDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ToeflDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ToeflDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ToeflDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ToeflDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ToeflDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ToeflDB] SET ARITHABORT OFF
GO
ALTER DATABASE [ToeflDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ToeflDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ToeflDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ToeflDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ToeflDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ToeflDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ToeflDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ToeflDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ToeflDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ToeflDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ToeflDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [ToeflDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ToeflDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ToeflDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ToeflDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ToeflDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ToeflDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ToeflDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ToeflDB] SET  READ_WRITE
GO
ALTER DATABASE [ToeflDB] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ToeflDB] SET  MULTI_USER
GO
ALTER DATABASE [ToeflDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ToeflDB] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'ToeflDB', N'ON'
GO
USE [ToeflDB]
GO
/****** Object:  Table [dbo].[DeThi]    Script Date: 10/29/2013 16:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeThi](
	[MaDe] [int] IDENTITY(1,1) NOT NULL,
	[NgayThi] [date] NOT NULL,
 CONSTRAINT [PK_DeThi] PRIMARY KEY CLUSTERED 
(
	[MaDe] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 10/29/2013 16:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[MaQuyen] [int] NOT NULL,
	[TenQuyen] [nvarchar](50) NOT NULL,
	[GhiChu] [nvarchar](200) NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [GhiChu]) VALUES (1, N'Quyền quản trị', N'Quản trị tất cả người dùng')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [GhiChu]) VALUES (2, N'Quyền cập nhật đề thi', N'Có quyền thêm , xóa , sửa đề thi')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [GhiChu]) VALUES (3, N'Quyền người dùng', N'Người đi thi')
/****** Object:  Table [dbo].[Loai]    Script Date: 10/29/2013 16:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Loai](
	[MaLoai] [int] NOT NULL,
	[TenLoai] [int] NOT NULL,
	[HuongDan] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Loai] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HDChuDe]    Script Date: 10/29/2013 16:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HDChuDe](
	[MaHD] [int] NOT NULL,
	[MaLoai] [int] NOT NULL,
	[Audio] [varchar](255) NOT NULL,
	[Text] [varchar](max) NOT NULL,
 CONSTRAINT [PK_HDChuDe] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhanThi]    Script Date: 10/29/2013 16:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanThi](
	[MaPT] [int] IDENTITY(1,1) NOT NULL,
	[MaLoai] [int] NOT NULL,
	[MaDe] [int] NOT NULL,
 CONSTRAINT [PK_PhanThi] PRIMARY KEY CLUSTERED 
(
	[MaPT] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 10/29/2013 16:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[MaND] [int] IDENTITY(1,1) NOT NULL,
	[TenND] [nvarchar](100) NOT NULL,
	[GioiTinh] [bit] NULL,
	[NgaySinh] [date] NOT NULL,
	[DiaChi] [nvarchar](255) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[MaQuyen] [int] NOT NULL,
	[HinhAnh] [nvarchar](50) NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[MaND] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[NguoiDung] ON
INSERT [dbo].[NguoiDung] ([MaND], [TenND], [GioiTinh], [NgaySinh], [DiaChi], [MatKhau], [MaQuyen], [HinhAnh]) VALUES (3, N'Trần Thảo Nguyên', 0, CAST(0x7F170B00 AS Date), N'Tân Bình', N'123456', 2, N'602612_538870509461143_1518809616_n.jpg')
INSERT [dbo].[NguoiDung] ([MaND], [TenND], [GioiTinh], [NgaySinh], [DiaChi], [MatKhau], [MaQuyen], [HinhAnh]) VALUES (4, N'Nguyễn Trọng Nhân', 1, CAST(0x6D180B00 AS Date), N'Sa Đéc', N'123456', 3, N'0fd4faa4d2c6ddf3908678bc83252675_44687208.37.jpg')
INSERT [dbo].[NguoiDung] ([MaND], [TenND], [GioiTinh], [NgaySinh], [DiaChi], [MatKhau], [MaQuyen], [HinhAnh]) VALUES (9, N'Cao Sơn Trí', 0, CAST(0x30170B00 AS Date), N'Biên Hòa', N'1973', 3, N'2.2.1319912056.jpg')
INSERT [dbo].[NguoiDung] ([MaND], [TenND], [GioiTinh], [NgaySinh], [DiaChi], [MatKhau], [MaQuyen], [HinhAnh]) VALUES (11, N'Đặng Thành Lợi', 1, CAST(0x84170B00 AS Date), N'Vĩnh Long', N'sapassword', 1, N'Slifer-the-Sky-Dragon.jpg')
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
/****** Object:  Table [dbo].[LuotThi]    Script Date: 10/29/2013 16:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LuotThi](
	[MaDe] [int] NOT NULL,
	[MaND] [int] NOT NULL,
	[DiemNghe] [int] NULL,
	[DiemNoi] [int] NULL,
	[DiemDoc] [int] NULL,
	[DiemViet] [int] NULL,
	[DiemQuyDoi] [int] NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_LuotThi_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[MaDe] ASC,
	[MaND] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuDe]    Script Date: 10/29/2013 16:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChuDe](
	[MaCD] [int] IDENTITY(1,1) NOT NULL,
	[Text] [varchar](max) NOT NULL,
	[Audio] [varchar](255) NOT NULL,
	[MaPT] [int] NOT NULL,
 CONSTRAINT [PK_ChuDe] PRIMARY KEY CLUSTERED 
(
	[MaCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CauHoi]    Script Date: 10/29/2013 16:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CauHoi](
	[MaCH] [int] IDENTITY(1,1) NOT NULL,
	[MaCD] [int] NOT NULL,
	[NoiDung] [varchar](255) NOT NULL,
 CONSTRAINT [PK_CauHoi] PRIMARY KEY CLUSTERED 
(
	[MaCH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TraLoi]    Script Date: 10/29/2013 16:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TraLoi](
	[MaTL] [int] IDENTITY(1,1) NOT NULL,
	[MaCH] [int] NOT NULL,
	[DocNghe] [varchar](20) NOT NULL,
	[Noi] [varchar](255) NOT NULL,
	[Viet] [varchar](max) NOT NULL,
 CONSTRAINT [PK_TraLoi] PRIMARY KEY CLUSTERED 
(
	[MaTL] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DapAn]    Script Date: 10/29/2013 16:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DapAn](
	[MaDA] [int] IDENTITY(1,1) NOT NULL,
	[MaCH] [int] NOT NULL,
	[NoiDung] [varchar](255) NOT NULL,
	[TrangThai] [bit] NOT NULL,
 CONSTRAINT [PK_DapAn] PRIMARY KEY CLUSTERED 
(
	[MaDA] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_HDChuDe_Loai]    Script Date: 10/29/2013 16:39:55 ******/
ALTER TABLE [dbo].[HDChuDe]  WITH CHECK ADD  CONSTRAINT [FK_HDChuDe_Loai] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[Loai] ([MaLoai])
GO
ALTER TABLE [dbo].[HDChuDe] CHECK CONSTRAINT [FK_HDChuDe_Loai]
GO
/****** Object:  ForeignKey [FK_PhanThi_DeThi]    Script Date: 10/29/2013 16:39:55 ******/
ALTER TABLE [dbo].[PhanThi]  WITH CHECK ADD  CONSTRAINT [FK_PhanThi_DeThi] FOREIGN KEY([MaDe])
REFERENCES [dbo].[DeThi] ([MaDe])
GO
ALTER TABLE [dbo].[PhanThi] CHECK CONSTRAINT [FK_PhanThi_DeThi]
GO
/****** Object:  ForeignKey [FK_PhanThi_Loai]    Script Date: 10/29/2013 16:39:55 ******/
ALTER TABLE [dbo].[PhanThi]  WITH CHECK ADD  CONSTRAINT [FK_PhanThi_Loai] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[Loai] ([MaLoai])
GO
ALTER TABLE [dbo].[PhanThi] CHECK CONSTRAINT [FK_PhanThi_Loai]
GO
/****** Object:  ForeignKey [FK_NguoiDung_Quyen]    Script Date: 10/29/2013 16:39:55 ******/
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_NguoiDung_Quyen] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[Quyen] ([MaQuyen])
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_NguoiDung_Quyen]
GO
/****** Object:  ForeignKey [FK_LuotThi_DeThi]    Script Date: 10/29/2013 16:39:55 ******/
ALTER TABLE [dbo].[LuotThi]  WITH CHECK ADD  CONSTRAINT [FK_LuotThi_DeThi] FOREIGN KEY([MaDe])
REFERENCES [dbo].[DeThi] ([MaDe])
GO
ALTER TABLE [dbo].[LuotThi] CHECK CONSTRAINT [FK_LuotThi_DeThi]
GO
/****** Object:  ForeignKey [FK_LuotThi_NguoiDung_NguoiDung]    Script Date: 10/29/2013 16:39:55 ******/
ALTER TABLE [dbo].[LuotThi]  WITH CHECK ADD  CONSTRAINT [FK_LuotThi_NguoiDung_NguoiDung] FOREIGN KEY([MaND])
REFERENCES [dbo].[NguoiDung] ([MaND])
GO
ALTER TABLE [dbo].[LuotThi] CHECK CONSTRAINT [FK_LuotThi_NguoiDung_NguoiDung]
GO
/****** Object:  ForeignKey [FK_ChuDe_PhanThi]    Script Date: 10/29/2013 16:39:55 ******/
ALTER TABLE [dbo].[ChuDe]  WITH CHECK ADD  CONSTRAINT [FK_ChuDe_PhanThi] FOREIGN KEY([MaPT])
REFERENCES [dbo].[PhanThi] ([MaPT])
GO
ALTER TABLE [dbo].[ChuDe] CHECK CONSTRAINT [FK_ChuDe_PhanThi]
GO
/****** Object:  ForeignKey [FK_CauHoi_ChuDe]    Script Date: 10/29/2013 16:39:55 ******/
ALTER TABLE [dbo].[CauHoi]  WITH CHECK ADD  CONSTRAINT [FK_CauHoi_ChuDe] FOREIGN KEY([MaCD])
REFERENCES [dbo].[ChuDe] ([MaCD])
GO
ALTER TABLE [dbo].[CauHoi] CHECK CONSTRAINT [FK_CauHoi_ChuDe]
GO
/****** Object:  ForeignKey [FK_TraLoi_CauHoi]    Script Date: 10/29/2013 16:39:55 ******/
ALTER TABLE [dbo].[TraLoi]  WITH CHECK ADD  CONSTRAINT [FK_TraLoi_CauHoi] FOREIGN KEY([MaCH])
REFERENCES [dbo].[CauHoi] ([MaCH])
GO
ALTER TABLE [dbo].[TraLoi] CHECK CONSTRAINT [FK_TraLoi_CauHoi]
GO
/****** Object:  ForeignKey [FK_DapAn_CauHoi]    Script Date: 10/29/2013 16:39:55 ******/
ALTER TABLE [dbo].[DapAn]  WITH CHECK ADD  CONSTRAINT [FK_DapAn_CauHoi] FOREIGN KEY([MaCH])
REFERENCES [dbo].[CauHoi] ([MaCH])
GO
ALTER TABLE [dbo].[DapAn] CHECK CONSTRAINT [FK_DapAn_CauHoi]
GO
