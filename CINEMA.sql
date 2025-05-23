USE [master]
GO
/****** Object:  Database [CINEMA]    Script Date: 04/07/2025 12:55:16 AM ******/
CREATE DATABASE [CINEMA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CINEMA', FILENAME = N'D:\Microsoft SQL SEVER\MSSQL16.SQLSERVER\MSSQL\DATA\CINEMA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CINEMA_log', FILENAME = N'D:\Microsoft SQL SEVER\MSSQL16.SQLSERVER\MSSQL\DATA\CINEMA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CINEMA] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CINEMA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CINEMA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CINEMA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CINEMA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CINEMA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CINEMA] SET ARITHABORT OFF 
GO
ALTER DATABASE [CINEMA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CINEMA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CINEMA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CINEMA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CINEMA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CINEMA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CINEMA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CINEMA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CINEMA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CINEMA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CINEMA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CINEMA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CINEMA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CINEMA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CINEMA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CINEMA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CINEMA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CINEMA] SET RECOVERY FULL 
GO
ALTER DATABASE [CINEMA] SET  MULTI_USER 
GO
ALTER DATABASE [CINEMA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CINEMA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CINEMA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CINEMA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CINEMA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CINEMA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CINEMA', N'ON'
GO
ALTER DATABASE [CINEMA] SET QUERY_STORE = ON
GO
ALTER DATABASE [CINEMA] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CINEMA]
GO
/****** Object:  Table [dbo].[CHINHANH]    Script Date: 04/07/2025 12:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHINHANH](
	[MaChiNhanh] [int] IDENTITY(1,1) NOT NULL,
	[TenChiNhanh] [nvarchar](51) NULL,
	[DiaChi] [nvarchar](100) NULL,
 CONSTRAINT [PK_CHINHANH] PRIMARY KEY CLUSTERED 
(
	[MaChiNhanh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHITIET_GHE_PHONG]    Script Date: 04/07/2025 12:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIET_GHE_PHONG](
	[IdGheDat] [int] IDENTITY(1,1) NOT NULL,
	[IdGhe] [int] NOT NULL,
	[MaPhong] [varchar](10) NOT NULL,
	[IdLoaiGhe] [int] NULL,
 CONSTRAINT [PK_CHITIET_GHE_PHONG] PRIMARY KEY CLUSTERED 
(
	[IdGheDat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHITIET_THAYDOIGIA]    Script Date: 04/07/2025 12:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIET_THAYDOIGIA](
	[MaSuatChieu] [int] NOT NULL,
	[IdThayDoi] [int] NOT NULL,
	[PhanTramThayDoi] [float] NULL,
 CONSTRAINT [PK_CHITIET_THAYDOIGIA] PRIMARY KEY CLUSTERED 
(
	[MaSuatChieu] ASC,
	[IdThayDoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DANHGIAPHIM]    Script Date: 04/07/2025 12:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHGIAPHIM](
	[MaPhim] [int] NOT NULL,
	[MaKH] [int] NOT NULL,
	[Diem] [float] NULL,
	[NgayDanhGia] [date] NULL,
 CONSTRAINT [PK_DANHGIAPHIM] PRIMARY KEY CLUSTERED 
(
	[MaPhim] ASC,
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DAODIEN]    Script Date: 04/07/2025 12:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DAODIEN](
	[IdDaoDien] [int] IDENTITY(1,1) NOT NULL,
	[TenDaoDien] [nvarchar](51) NULL,
	[AnhDaoDien] [varchar](1000) NULL,
 CONSTRAINT [PK_DAODIEN] PRIMARY KEY CLUSTERED 
(
	[IdDaoDien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIENVIEN]    Script Date: 04/07/2025 12:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIENVIEN](
	[IdDienVien] [int] IDENTITY(1,1) NOT NULL,
	[TenDienVien] [nvarchar](51) NULL,
	[AnhDienVien] [varchar](1000) NULL,
 CONSTRAINT [PK_DIENVIEN] PRIMARY KEY CLUSTERED 
(
	[IdDienVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GHE]    Script Date: 04/07/2025 12:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GHE](
	[IdGhe] [int] IDENTITY(1,1) NOT NULL,
	[TenGhe] [varchar](3) NULL,
 CONSTRAINT [PK_Ghe] PRIMARY KEY CLUSTERED 
(
	[IdGhe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACH_HANG]    Script Date: 04/07/2025 12:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACH_HANG](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[SDT] [varchar](10) NOT NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Avatar] [varchar](8000) NULL,
 CONSTRAINT [PK_KHACH_HANG] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LICH_CHIEU]    Script Date: 04/07/2025 12:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LICH_CHIEU](
	[MaSuatChieu] [int] IDENTITY(1,1) NOT NULL,
	[NgayChieu] [date] NOT NULL,
	[GioChieu] [time](0) NULL,
	[BatDauBanVe] [datetime] NULL,
	[MaPhong] [varchar](10) NOT NULL,
	[MaPhim] [int] NOT NULL,
 CONSTRAINT [PK__LICH_CHI__CF5984D2BEF146DD] PRIMARY KEY CLUSTERED 
(
	[MaSuatChieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOAIGHE]    Script Date: 04/07/2025 12:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAIGHE](
	[IdLoaiGhe] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](20) NULL,
	[Gia] [money] NULL,
 CONSTRAINT [PK_LOAIGHE] PRIMARY KEY CLUSTERED 
(
	[IdLoaiGhe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHAN_VIEN]    Script Date: 04/07/2025 12:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHAN_VIEN](
	[MaNV] [int] IDENTITY(1,1) NOT NULL,
	[TenNV] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[CMND] [varchar](12) NOT NULL,
	[SDT] [varchar](10) NOT NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[TrangThai] [bit] NOT NULL,
	[MaChiNhanh] [int] NULL,
 CONSTRAINT [PK__NHAN_VIE__2725D70A42C52C2C] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIM]    Script Date: 04/07/2025 12:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIM](
	[MaPhim] [int] IDENTITY(1,1) NOT NULL,
	[TenPhim] [nvarchar](100) NOT NULL,
	[MoTa] [nvarchar](2000) NULL,
	[NuocSX] [nvarchar](10) NULL,
	[NgayKhoiChieu] [date] NOT NULL,
	[NamSX] [int] NOT NULL,
	[ThoiLuong] [int] NULL,
	[LinkAnh] [varchar](8000) NULL,
	[LinkTrailer] [varchar](8000) NULL,
	[Diem] [float] NULL,
	[MaTT] [int] NULL,
	[IdDaoDien] [int] NULL,
 CONSTRAINT [PK__PHIM__4AC03DE3734F300D] PRIMARY KEY CLUSTERED 
(
	[MaPhim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHONG]    Script Date: 04/07/2025 12:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHONG](
	[MaPhong] [varchar](10) NOT NULL,
	[TrangThai] [bit] NOT NULL,
	[MaChiNhanh] [int] NULL,
 CONSTRAINT [PK_Phong] PRIMARY KEY CLUSTERED 
(
	[MaPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QUYEN]    Script Date: 04/07/2025 12:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QUYEN](
	[MaQuyen] [varchar](10) NOT NULL,
	[TenQuyen] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CHUC_VU] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUKIEN]    Script Date: 04/07/2025 12:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUKIEN](
	[MaSK] [int] IDENTITY(1,1) NOT NULL,
	[TenSK] [nvarchar](100) NULL,
	[MoTaSK] [ntext] NULL,
	[ChiTietSK] [ntext] NULL,
	[PosterSK] [varchar](8000) NULL,
 CONSTRAINT [PK_SUKIEN] PRIMARY KEY CLUSTERED 
(
	[MaSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 04/07/2025 12:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[Email] [varchar](50) NOT NULL,
	[MaQuyen] [varchar](10) NOT NULL,
	[Password] [char](50) NOT NULL,
 CONSTRAINT [PK__TAIKHOAN__A9D1053551FB21C0] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THAYDOIGIA]    Script Date: 04/07/2025 12:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THAYDOIGIA](
	[IdThayDoiGia] [int] IDENTITY(1,1) NOT NULL,
	[LyDoThayDoi] [nvarchar](100) NULL,
	[NgayThayDoi] [date] NULL,
 CONSTRAINT [PK_THAYDOIGIA] PRIMARY KEY CLUSTERED 
(
	[IdThayDoiGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THE_LOAI]    Script Date: 04/07/2025 12:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THE_LOAI](
	[MaTL] [int] NOT NULL,
	[TenTL] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CHI_TIET_THE_LOAI] PRIMARY KEY CLUSTERED 
(
	[MaTL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THE_LOAI_PHIM]    Script Date: 04/07/2025 12:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THE_LOAI_PHIM](
	[MaTL] [int] NOT NULL,
	[MaPhim] [int] NOT NULL,
 CONSTRAINT [PK__THE_LOAI__038903AFE6135119] PRIMARY KEY CLUSTERED 
(
	[MaTL] ASC,
	[MaPhim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VAIDIEN]    Script Date: 04/07/2025 12:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VAIDIEN](
	[MaPhim] [int] NOT NULL,
	[IdDienVien] [int] NOT NULL,
	[TenVaiDien] [nvarchar](51) NULL,
 CONSTRAINT [PK_VAIDIEN] PRIMARY KEY CLUSTERED 
(
	[MaPhim] ASC,
	[IdDienVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VE]    Script Date: 04/07/2025 12:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE](
	[MaVe] [int] IDENTITY(1,1) NOT NULL,
	[MaSuatChieu] [int] NOT NULL,
	[MaKH] [int] NULL,
	[NgayBan] [date] NOT NULL,
	[ThoiDiemThanhToan] [datetime] NULL,
	[TrangThaiDat] [bit] NULL,
	[IdGheDat] [int] NULL,
	[MaNV] [int] NULL,
 CONSTRAINT [PK__VE__2725100F3E048F2F] PRIMARY KEY CLUSTERED 
(
	[MaVe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CHINHANH] ON 

INSERT [dbo].[CHINHANH] ([MaChiNhanh], [TenChiNhanh], [DiaChi]) VALUES (1, N'Tu Tru Cinema Le Van Viet', N'97 Man Thien, Hiep Phu Ward, District 9, Thu Duc City')
INSERT [dbo].[CHINHANH] ([MaChiNhanh], [TenChiNhanh], [DiaChi]) VALUES (2, N'Tu Tru Cinema Tien Giang', N'Tran Cong Tuong Street, Ward 5, Go Cong, Tien Giang, Vietnam')
INSERT [dbo].[CHINHANH] ([MaChiNhanh], [TenChiNhanh], [DiaChi]) VALUES (3, N'Tu Tru Cinema Quang Ngai', N'b')
INSERT [dbo].[CHINHANH] ([MaChiNhanh], [TenChiNhanh], [DiaChi]) VALUES (4, N'Tu Tru Cinema Ca Mau', N'c')
SET IDENTITY_INSERT [dbo].[CHINHANH] OFF
GO
SET IDENTITY_INSERT [dbo].[CHITIET_GHE_PHONG] ON 

INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (3, 1, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (5, 2, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (6, 3, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (7, 4, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (8, 5, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (10, 6, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (12, 7, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (13, 8, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (14, 9, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (15, 10, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (16, 11, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (17, 12, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (18, 13, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (19, 14, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (20, 15, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (21, 16, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (22, 17, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (23, 18, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (24, 19, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (25, 20, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (26, 21, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (27, 22, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (28, 23, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (29, 24, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (30, 25, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (31, 26, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (32, 27, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (33, 28, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (34, 29, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (35, 30, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (36, 31, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (37, 32, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (38, 33, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (39, 34, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (40, 35, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (41, 36, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (42, 37, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (43, 38, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (44, 39, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (45, 40, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (46, 41, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (47, 42, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (48, 43, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (49, 44, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (50, 45, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (51, 46, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (52, 47, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (53, 48, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (54, 49, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (56, 50, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (57, 51, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (58, 52, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (59, 53, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (60, 54, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (61, 55, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (62, 56, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (63, 57, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (65, 58, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (66, 59, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (67, 60, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (68, 61, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (69, 62, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (70, 63, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (71, 64, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (72, 65, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (73, 66, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (74, 67, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (75, 68, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (76, 69, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (77, 70, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (78, 71, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (79, 72, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (80, 73, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (81, 74, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (82, 75, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (83, 76, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (84, 77, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (85, 78, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (86, 79, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (87, 80, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (88, 81, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (89, 82, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (91, 83, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (92, 84, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (93, 85, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (94, 86, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (95, 87, N'P01', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (96, 88, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (97, 89, N'P01', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (98, 90, N'P01', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (99, 91, N'P01', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (100, 92, N'P01', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (101, 93, N'P01', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (102, 94, N'P01', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1115, 1, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1116, 2, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1117, 3, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1118, 4, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1119, 5, N'P02', 1)
GO
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1120, 6, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1121, 7, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1122, 8, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1123, 9, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1124, 10, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1125, 741, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1126, 742, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1127, 11, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1128, 12, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1129, 13, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1130, 14, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1131, 15, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1132, 16, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1133, 17, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1134, 18, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1135, 19, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1136, 20, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1137, 743, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1138, 744, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1139, 21, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1140, 22, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1141, 23, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1142, 24, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1143, 25, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1144, 26, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1145, 27, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1146, 28, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1147, 29, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1148, 30, N'P02', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1149, 31, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1150, 32, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1151, 33, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1152, 34, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1153, 35, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1154, 36, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1155, 37, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1156, 38, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1157, 39, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1158, 40, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1159, 745, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1160, 746, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1161, 41, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1162, 42, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1163, 43, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1164, 44, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1165, 45, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1166, 46, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1167, 47, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1168, 48, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1169, 49, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1170, 50, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1171, 747, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1172, 748, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1173, 51, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1174, 52, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1175, 53, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1176, 54, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1177, 55, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1178, 56, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1179, 57, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1180, 58, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1181, 59, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1182, 60, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1183, 749, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1184, 750, N'P02', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1185, 61, N'P02', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1186, 62, N'P02', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1187, 63, N'P02', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1188, 1, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1189, 2, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1190, 3, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1191, 4, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1192, 5, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1193, 6, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1194, 7, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1195, 8, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1196, 9, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1197, 10, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1198, 11, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1199, 12, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1200, 13, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1201, 14, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1202, 15, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1203, 16, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1204, 17, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1205, 18, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1206, 19, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1207, 20, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1208, 21, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1209, 22, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1210, 23, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1211, 24, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1212, 25, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1213, 26, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1214, 27, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1215, 28, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1216, 29, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1217, 30, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1218, 31, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1219, 32, N'P03', 1)
GO
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1220, 33, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1221, 34, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1222, 35, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1223, 36, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1224, 37, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1225, 38, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1226, 39, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1227, 40, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1228, 745, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1229, 746, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1230, 41, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1231, 42, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1232, 43, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1233, 44, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1234, 45, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1235, 46, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1236, 47, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1237, 48, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1238, 49, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1239, 50, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1240, 747, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1241, 748, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1242, 51, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1243, 52, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1244, 53, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1245, 54, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1246, 55, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1247, 56, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1248, 57, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1249, 58, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1250, 59, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1251, 60, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1252, 749, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1253, 750, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1254, 61, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1255, 62, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1256, 63, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1257, 64, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1258, 65, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1259, 66, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1260, 67, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1261, 68, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1262, 69, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1263, 70, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1264, 751, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1265, 752, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1266, 71, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1267, 72, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1268, 73, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1269, 74, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1270, 75, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1271, 76, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1272, 77, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1273, 78, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1274, 79, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1275, 80, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1276, 753, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1277, 754, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1278, 755, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1279, 756, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1280, 757, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1281, 758, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1282, 759, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1283, 760, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1284, 761, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1285, 762, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1286, 763, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1287, 764, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1288, 765, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1289, 766, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1290, 81, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1291, 82, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1292, 83, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1293, 84, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1294, 85, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1295, 86, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1296, 87, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1297, 88, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1298, 89, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1299, 90, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1300, 91, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1301, 92, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1302, 93, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1303, 94, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1304, 95, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1305, 767, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1306, 768, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1307, 769, N'P03', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1308, 770, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1309, 771, N'P03', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1310, 772, N'P03', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1311, 773, N'P03', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1312, 774, N'P03', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1313, 775, N'P03', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1314, 776, N'P03', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1315, 1, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1316, 2, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1317, 3, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1318, 4, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1319, 5, N'P04', 1)
GO
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1320, 6, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1321, 7, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1322, 8, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1323, 9, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1324, 10, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1325, 11, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1326, 12, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1327, 13, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1328, 14, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1329, 15, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1330, 16, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1331, 17, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1332, 18, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1333, 19, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1334, 20, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1335, 743, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1336, 744, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1337, 21, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1338, 22, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1339, 23, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1340, 24, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1341, 25, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1342, 26, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1343, 27, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1344, 28, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1345, 29, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1346, 30, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1347, 31, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1348, 32, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1349, 33, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1350, 34, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1351, 35, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1352, 36, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1353, 37, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1354, 38, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1355, 39, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1356, 40, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1357, 745, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1358, 746, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1359, 41, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1360, 42, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1361, 43, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1362, 44, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1363, 45, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1364, 46, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1365, 47, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1366, 48, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1367, 49, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1368, 50, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1369, 747, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1370, 748, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1371, 51, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1372, 52, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1373, 53, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1374, 54, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1375, 55, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1376, 56, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1377, 57, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1378, 58, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1379, 59, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1380, 60, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1381, 749, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1382, 750, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1383, 61, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1384, 62, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1385, 63, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1386, 64, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1387, 65, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1388, 66, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1389, 67, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1390, 68, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1391, 69, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1392, 70, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1393, 751, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1394, 752, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1395, 71, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1396, 72, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1397, 73, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1398, 74, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1399, 75, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1400, 76, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1401, 77, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1402, 78, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1403, 79, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1404, 80, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1405, 753, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1406, 754, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1407, 755, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1408, 756, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1409, 757, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1410, 758, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1411, 759, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1412, 760, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1413, 761, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1414, 762, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1415, 763, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1416, 764, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1417, 765, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1418, 766, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1419, 81, N'P04', 1)
GO
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1420, 82, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1421, 83, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1422, 84, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1423, 85, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1424, 86, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1425, 87, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1426, 88, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1427, 89, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1428, 90, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1429, 777, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1430, 778, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1431, 91, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1432, 92, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1433, 93, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1434, 94, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1435, 95, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1436, 767, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1437, 768, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1438, 769, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1439, 770, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1440, 771, N'P04', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1441, 779, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1442, 780, N'P04', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1443, 772, N'P04', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1444, 773, N'P04', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1445, 774, N'P04', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1446, 775, N'P04', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1447, 776, N'P04', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1448, 1, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1449, 2, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1450, 3, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1451, 4, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1452, 5, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1453, 6, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1454, 7, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1455, 8, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1456, 9, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1457, 10, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1458, 11, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1459, 12, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1460, 13, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1461, 14, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1462, 15, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1463, 16, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1464, 17, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1465, 18, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1466, 19, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1467, 20, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1468, 21, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1469, 22, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1470, 23, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1471, 24, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1472, 25, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1473, 26, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1474, 27, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1475, 28, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1476, 29, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1477, 30, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1478, 781, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1479, 782, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1480, 31, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1481, 32, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1482, 33, N'P05', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1483, 34, N'P05', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1484, 35, N'P05', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1485, 36, N'P05', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1486, 37, N'P05', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1487, 38, N'P05', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1488, 39, N'P05', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1489, 40, N'P05', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1490, 745, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1491, 746, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1492, 41, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1493, 42, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1494, 43, N'P05', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1495, 44, N'P05', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1496, 45, N'P05', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1497, 46, N'P05', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1498, 47, N'P05', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1499, 48, N'P05', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1500, 49, N'P05', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1501, 50, N'P05', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1502, 747, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1503, 748, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1504, 51, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1505, 52, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1506, 53, N'P05', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1507, 54, N'P05', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1508, 55, N'P05', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1509, 56, N'P05', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1510, 57, N'P05', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1511, 58, N'P05', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1512, 59, N'P05', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1513, 60, N'P05', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1514, 749, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1515, 750, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1516, 61, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1517, 62, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1518, 63, N'P05', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1519, 64, N'P05', 2)
GO
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1520, 65, N'P05', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1521, 66, N'P05', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1522, 67, N'P05', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1523, 68, N'P05', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1524, 69, N'P05', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1525, 70, N'P05', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1526, 751, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1527, 752, N'P05', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1528, 71, N'P05', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1529, 72, N'P05', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1530, 73, N'P05', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1531, 74, N'P05', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1532, 1, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1533, 2, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1534, 3, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1535, 4, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1536, 5, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1537, 6, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1538, 7, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1539, 8, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1540, 11, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1541, 12, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1542, 13, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1543, 14, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1544, 15, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1545, 16, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1546, 17, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1547, 18, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1548, 21, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1549, 22, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1550, 23, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1551, 24, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1552, 25, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1553, 26, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1554, 27, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1555, 28, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1556, 29, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1557, 30, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1558, 31, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1559, 32, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1560, 33, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1561, 34, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1562, 35, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1563, 36, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1564, 37, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1565, 38, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1566, 39, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1567, 40, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1568, 41, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1569, 42, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1570, 43, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1571, 44, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1572, 45, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1573, 46, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1574, 47, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1575, 48, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1576, 49, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1577, 50, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1578, 51, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1579, 52, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1580, 53, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1581, 54, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1582, 55, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1583, 56, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1584, 57, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1585, 58, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1586, 59, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1587, 60, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1588, 61, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1589, 62, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1590, 63, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1591, 64, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1592, 65, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1593, 66, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1594, 67, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1595, 68, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1596, 69, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1597, 70, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1598, 71, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1599, 72, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1600, 73, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1601, 74, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1602, 75, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1603, 76, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1604, 77, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1605, 78, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1606, 79, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1607, 80, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1608, 755, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1609, 756, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1610, 757, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1611, 758, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1612, 759, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1613, 760, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1614, 761, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1615, 762, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1616, 763, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1617, 764, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1618, 765, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1619, 766, N'P06', 1)
GO
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1620, 81, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1621, 82, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1622, 83, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1623, 84, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1624, 85, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1625, 86, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1626, 87, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1627, 88, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1628, 89, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1629, 90, N'P06', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1630, 777, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1631, 778, N'P06', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1632, 91, N'P06', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1633, 92, N'P06', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1634, 93, N'P06', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1635, 94, N'P06', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1636, 95, N'P06', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1637, 1, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1638, 2, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1639, 3, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1640, 4, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1641, 5, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1642, 6, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1643, 7, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1644, 8, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1645, 9, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1646, 10, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1647, 11, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1648, 12, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1649, 13, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1650, 14, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1651, 15, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1652, 16, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1653, 17, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1654, 18, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1655, 19, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1656, 20, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1657, 21, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1658, 22, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1659, 23, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1660, 24, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1661, 25, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1662, 26, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1663, 27, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1664, 28, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1665, 29, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1666, 30, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1667, 781, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1668, 782, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1669, 31, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1670, 32, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1671, 33, N'P07', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1672, 34, N'P07', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1673, 35, N'P07', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1674, 36, N'P07', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1675, 37, N'P07', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1676, 38, N'P07', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1677, 39, N'P07', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1678, 40, N'P07', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1679, 745, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1680, 746, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1681, 41, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1682, 42, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1683, 43, N'P07', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1684, 44, N'P07', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1685, 45, N'P07', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1686, 46, N'P07', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1687, 47, N'P07', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1688, 48, N'P07', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1689, 49, N'P07', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1690, 50, N'P07', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1691, 747, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1692, 748, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1693, 51, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1694, 52, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1695, 53, N'P07', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1696, 54, N'P07', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1697, 55, N'P07', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1698, 56, N'P07', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1699, 57, N'P07', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1700, 58, N'P07', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1701, 59, N'P07', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1702, 60, N'P07', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1703, 749, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1704, 750, N'P07', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1705, 61, N'P07', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1706, 62, N'P07', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1707, 63, N'P07', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1708, 64, N'P07', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1709, 65, N'P07', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1710, 1, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1711, 2, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1712, 3, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1713, 4, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1714, 5, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1715, 6, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1716, 7, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1717, 8, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1718, 9, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1719, 10, N'P08', 1)
GO
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1720, 11, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1721, 12, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1722, 13, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1723, 14, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1724, 15, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1725, 16, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1726, 17, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1727, 18, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1728, 19, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1729, 20, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1730, 21, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1731, 22, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1732, 23, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1733, 24, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1734, 25, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1735, 26, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1736, 27, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1737, 28, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1738, 29, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1739, 30, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1740, 31, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1741, 32, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1742, 33, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1743, 34, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1744, 35, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1745, 36, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1746, 37, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1747, 38, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1748, 39, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1749, 40, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1750, 745, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1751, 746, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1752, 41, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1753, 42, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1754, 43, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1755, 44, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1756, 45, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1757, 46, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1758, 47, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1759, 48, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1760, 49, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1761, 50, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1762, 747, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1763, 748, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1764, 51, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1765, 52, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1766, 53, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1767, 54, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1768, 55, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1769, 56, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1770, 57, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1771, 58, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1772, 59, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1773, 60, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1774, 749, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1775, 750, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1776, 61, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1777, 62, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1778, 63, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1779, 64, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1780, 65, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1781, 66, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1782, 67, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1783, 68, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1784, 69, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1785, 70, N'P08', 2)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1786, 751, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1787, 752, N'P08', 1)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1788, 71, N'P08', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1789, 72, N'P08', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1790, 73, N'P08', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1791, 74, N'P08', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1792, 75, N'P08', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1793, 76, N'P08', 3)
INSERT [dbo].[CHITIET_GHE_PHONG] ([IdGheDat], [IdGhe], [MaPhong], [IdLoaiGhe]) VALUES (1794, 77, N'P08', 3)
SET IDENTITY_INSERT [dbo].[CHITIET_GHE_PHONG] OFF
GO
INSERT [dbo].[CHITIET_THAYDOIGIA] ([MaSuatChieu], [IdThayDoi], [PhanTramThayDoi]) VALUES (1084, 2, 0.9)
INSERT [dbo].[CHITIET_THAYDOIGIA] ([MaSuatChieu], [IdThayDoi], [PhanTramThayDoi]) VALUES (1090, 2, 0.9)
INSERT [dbo].[CHITIET_THAYDOIGIA] ([MaSuatChieu], [IdThayDoi], [PhanTramThayDoi]) VALUES (1096, 2, 0.9)
INSERT [dbo].[CHITIET_THAYDOIGIA] ([MaSuatChieu], [IdThayDoi], [PhanTramThayDoi]) VALUES (1100, 2, 0.9)
INSERT [dbo].[CHITIET_THAYDOIGIA] ([MaSuatChieu], [IdThayDoi], [PhanTramThayDoi]) VALUES (1106, 2, 0.9)
INSERT [dbo].[CHITIET_THAYDOIGIA] ([MaSuatChieu], [IdThayDoi], [PhanTramThayDoi]) VALUES (1112, 2, 0.9)
INSERT [dbo].[CHITIET_THAYDOIGIA] ([MaSuatChieu], [IdThayDoi], [PhanTramThayDoi]) VALUES (1118, 2, 0.9)
INSERT [dbo].[CHITIET_THAYDOIGIA] ([MaSuatChieu], [IdThayDoi], [PhanTramThayDoi]) VALUES (1122, 2, 0.9)
INSERT [dbo].[CHITIET_THAYDOIGIA] ([MaSuatChieu], [IdThayDoi], [PhanTramThayDoi]) VALUES (1148, 2, 0.9)
INSERT [dbo].[CHITIET_THAYDOIGIA] ([MaSuatChieu], [IdThayDoi], [PhanTramThayDoi]) VALUES (1160, 2, 0.9)
INSERT [dbo].[CHITIET_THAYDOIGIA] ([MaSuatChieu], [IdThayDoi], [PhanTramThayDoi]) VALUES (1164, 2, 0.9)
INSERT [dbo].[CHITIET_THAYDOIGIA] ([MaSuatChieu], [IdThayDoi], [PhanTramThayDoi]) VALUES (1169, 2, 0.9)
INSERT [dbo].[CHITIET_THAYDOIGIA] ([MaSuatChieu], [IdThayDoi], [PhanTramThayDoi]) VALUES (1181, 2, 0.9)
INSERT [dbo].[CHITIET_THAYDOIGIA] ([MaSuatChieu], [IdThayDoi], [PhanTramThayDoi]) VALUES (1185, 2, 0.9)
INSERT [dbo].[CHITIET_THAYDOIGIA] ([MaSuatChieu], [IdThayDoi], [PhanTramThayDoi]) VALUES (1190, 2, 0.9)
INSERT [dbo].[CHITIET_THAYDOIGIA] ([MaSuatChieu], [IdThayDoi], [PhanTramThayDoi]) VALUES (1192, 2, 0.9)
GO
INSERT [dbo].[DANHGIAPHIM] ([MaPhim], [MaKH], [Diem], [NgayDanhGia]) VALUES (2, 35, 5, CAST(N'2024-12-22' AS Date))
INSERT [dbo].[DANHGIAPHIM] ([MaPhim], [MaKH], [Diem], [NgayDanhGia]) VALUES (2, 53, 5, NULL)
INSERT [dbo].[DANHGIAPHIM] ([MaPhim], [MaKH], [Diem], [NgayDanhGia]) VALUES (2, 54, 4, NULL)
INSERT [dbo].[DANHGIAPHIM] ([MaPhim], [MaKH], [Diem], [NgayDanhGia]) VALUES (2, 56, 5, CAST(N'2024-11-07' AS Date))
INSERT [dbo].[DANHGIAPHIM] ([MaPhim], [MaKH], [Diem], [NgayDanhGia]) VALUES (3, 56, 3, CAST(N'2024-11-07' AS Date))
INSERT [dbo].[DANHGIAPHIM] ([MaPhim], [MaKH], [Diem], [NgayDanhGia]) VALUES (5, 35, 4, CAST(N'2024-12-22' AS Date))
INSERT [dbo].[DANHGIAPHIM] ([MaPhim], [MaKH], [Diem], [NgayDanhGia]) VALUES (5, 54, 5, CAST(N'2024-11-08' AS Date))
INSERT [dbo].[DANHGIAPHIM] ([MaPhim], [MaKH], [Diem], [NgayDanhGia]) VALUES (5, 56, 4, CAST(N'2024-11-07' AS Date))
INSERT [dbo].[DANHGIAPHIM] ([MaPhim], [MaKH], [Diem], [NgayDanhGia]) VALUES (13, 54, 4, CAST(N'2024-11-15' AS Date))
INSERT [dbo].[DANHGIAPHIM] ([MaPhim], [MaKH], [Diem], [NgayDanhGia]) VALUES (13, 56, 4, CAST(N'2024-11-07' AS Date))
INSERT [dbo].[DANHGIAPHIM] ([MaPhim], [MaKH], [Diem], [NgayDanhGia]) VALUES (26, 54, 3, CAST(N'2024-11-19' AS Date))
INSERT [dbo].[DANHGIAPHIM] ([MaPhim], [MaKH], [Diem], [NgayDanhGia]) VALUES (36, 35, 4, CAST(N'2024-12-22' AS Date))
INSERT [dbo].[DANHGIAPHIM] ([MaPhim], [MaKH], [Diem], [NgayDanhGia]) VALUES (36, 54, 5, CAST(N'2024-11-19' AS Date))
GO
SET IDENTITY_INSERT [dbo].[DAODIEN] ON 

INSERT [dbo].[DAODIEN] ([IdDaoDien], [TenDaoDien], [AnhDaoDien]) VALUES (1, N'Vu Ngoc Dang', N'vungocdang.jpg')
INSERT [dbo].[DAODIEN] ([IdDaoDien], [TenDaoDien], [AnhDaoDien]) VALUES (2, N'Tran Thanh', N'tranthanh.png')
INSERT [dbo].[DAODIEN] ([IdDaoDien], [TenDaoDien], [AnhDaoDien]) VALUES (3, N'Jang Jae-hyun', N'vothanhhoa.png')
INSERT [dbo].[DAODIEN] ([IdDaoDien], [TenDaoDien], [AnhDaoDien]) VALUES (4, N'Huynh Dong', NULL)
INSERT [dbo].[DAODIEN] ([IdDaoDien], [TenDaoDien], [AnhDaoDien]) VALUES (5, N'Taweewat Wantha', NULL)
INSERT [dbo].[DAODIEN] ([IdDaoDien], [TenDaoDien], [AnhDaoDien]) VALUES (6, N'Aaron Toronto', NULL)
INSERT [dbo].[DAODIEN] ([IdDaoDien], [TenDaoDien], [AnhDaoDien]) VALUES (7, N'Kazuaki Imai', NULL)
INSERT [dbo].[DAODIEN] ([IdDaoDien], [TenDaoDien], [AnhDaoDien]) VALUES (8, N'Ly Hai', N'lyhai.jpg')
INSERT [dbo].[DAODIEN] ([IdDaoDien], [TenDaoDien], [AnhDaoDien]) VALUES (9, N'David F. Sandberg', NULL)
INSERT [dbo].[DAODIEN] ([IdDaoDien], [TenDaoDien], [AnhDaoDien]) VALUES (10, N'James Cameron', NULL)
INSERT [dbo].[DAODIEN] ([IdDaoDien], [TenDaoDien], [AnhDaoDien]) VALUES (11, N'Mitsunaka Susumu', NULL)
INSERT [dbo].[DAODIEN] ([IdDaoDien], [TenDaoDien], [AnhDaoDien]) VALUES (1015, N'Victor Vu', NULL)
INSERT [dbo].[DAODIEN] ([IdDaoDien], [TenDaoDien], [AnhDaoDien]) VALUES (1026, N'Ari Aster', NULL)
INSERT [dbo].[DAODIEN] ([IdDaoDien], [TenDaoDien], [AnhDaoDien]) VALUES (1027, N'Parker Finn', NULL)
INSERT [dbo].[DAODIEN] ([IdDaoDien], [TenDaoDien], [AnhDaoDien]) VALUES (1029, N'Andy Muschietti', NULL)
INSERT [dbo].[DAODIEN] ([IdDaoDien], [TenDaoDien], [AnhDaoDien]) VALUES (1030, N'Damien Leone', NULL)
INSERT [dbo].[DAODIEN] ([IdDaoDien], [TenDaoDien], [AnhDaoDien]) VALUES (1031, N'Todd Phillips', NULL)
INSERT [dbo].[DAODIEN] ([IdDaoDien], [TenDaoDien], [AnhDaoDien]) VALUES (1032, N'Vo Thanh Hoa', N'vothanhhoa.jfif')
SET IDENTITY_INSERT [dbo].[DAODIEN] OFF
GO
SET IDENTITY_INSERT [dbo].[DIENVIEN] ON 

INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (1, N'Nadech Kugimiya', NULL)
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (2, N'Denise Jelilcha Kapaung', NULL)
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (3, N'Tien Luat', NULL)
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (4, N'Van Trang', NULL)
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (5, N'Bao Thi', NULL)
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (6, N'Kim Go-eun', NULL)
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (7, N'Choi Min-sik', NULL)
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (8, N'Lee Do-hyun', NULL)
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (9, N'Phuong Anh Dao', N'phuonganhdao.jpg')
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (10, N'Huynh Uyen An', NULL)
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (11, N'Tuan Tran', N'tuantran.jfif')
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (12, N'Diem Phuong', NULL)
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (13, N'Kim An', NULL)
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (14, N'Ly Nguyen Nha Uyen', NULL)
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (15, N'Ninh Duong Lan Ngoc', N'ninhduonglanngoc.jfif')
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (16, N'Thanh Hien', NULL)
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (17, N'Quach Ngoc Tuyen', NULL)
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (18, N'Dinh Y Nhung', NULL)
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (19, N'Tran Nghia', NULL)
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (20, N'Truc Anh', NULL)
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (21, N'Khanh Van', NULL)
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (22, N'Tran Phong', NULL)
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (23, N'Leonardo DiCaprio', N'jack.jfif')
INSERT [dbo].[DIENVIEN] ([IdDienVien], [TenDienVien], [AnhDienVien]) VALUES (24, N'Kate Winslet', N'rose.jfif')
SET IDENTITY_INSERT [dbo].[DIENVIEN] OFF
GO
SET IDENTITY_INSERT [dbo].[GHE] ON 

INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (1, N'A01')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (2, N'A02')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (3, N'A03')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (4, N'A04')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (5, N'A05')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (6, N'A06')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (7, N'A07')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (8, N'A08')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (9, N'A09')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (10, N'A10')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (741, N'A11')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (742, N'A12')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (11, N'B01')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (12, N'B02')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (13, N'B03')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (14, N'B04')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (15, N'B05')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (16, N'B06')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (17, N'B07')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (18, N'B08')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (19, N'B09')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (20, N'B10')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (743, N'B11')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (744, N'B12')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (21, N'C01')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (22, N'C02')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (23, N'C03')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (24, N'C04')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (25, N'C05')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (26, N'C06')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (27, N'C07')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (28, N'C08')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (29, N'C09')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (30, N'C10')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (781, N'C11')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (782, N'C12')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (31, N'D01')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (32, N'D02')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (33, N'D03')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (34, N'D04')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (35, N'D05')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (36, N'D06')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (37, N'D07')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (38, N'D08')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (39, N'D09')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (40, N'D10')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (745, N'D11')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (746, N'D12')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (41, N'E01')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (42, N'E02')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (43, N'E03')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (44, N'E04')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (45, N'E05')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (46, N'E06')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (47, N'E07')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (48, N'E08')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (49, N'E09')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (50, N'E10')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (747, N'E11')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (748, N'E12')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (51, N'F01')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (52, N'F02')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (53, N'F03')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (54, N'F04')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (55, N'F05')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (56, N'F06')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (57, N'F07')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (58, N'F08')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (59, N'F09')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (60, N'F10')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (749, N'F11')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (750, N'F12')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (61, N'G01')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (62, N'G02')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (63, N'G03')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (64, N'G04')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (65, N'G05')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (66, N'G06')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (67, N'G07')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (68, N'G08')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (69, N'G09')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (70, N'G10')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (751, N'G11')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (752, N'G12')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (71, N'H01')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (72, N'H02')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (73, N'H03')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (74, N'H04')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (75, N'H05')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (76, N'H06')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (77, N'H07')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (78, N'H08')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (79, N'H09')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (80, N'H10')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (753, N'H11')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (754, N'H12')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (755, N'I01')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (756, N'I02')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (757, N'I03')
GO
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (758, N'I04')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (759, N'I05')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (760, N'I06')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (761, N'I07')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (762, N'I08')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (763, N'I09')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (764, N'I10')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (765, N'I11')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (766, N'I12')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (81, N'J01')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (82, N'J02')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (83, N'J03')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (84, N'J04')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (85, N'J05')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (86, N'J06')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (87, N'J07')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (88, N'J08')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (89, N'J09')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (90, N'J10')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (777, N'J11')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (778, N'J12')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (91, N'K01')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (92, N'K02')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (93, N'K03')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (94, N'K04')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (95, N'K05')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (767, N'K06')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (768, N'K07')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (769, N'K08')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (770, N'K09')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (771, N'K10')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (779, N'K11')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (780, N'K12')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (772, N'L01')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (773, N'L02')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (774, N'L03')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (775, N'L04')
INSERT [dbo].[GHE] ([IdGhe], [TenGhe]) VALUES (776, N'L05')
SET IDENTITY_INSERT [dbo].[GHE] OFF
GO
SET IDENTITY_INSERT [dbo].[KHACH_HANG] ON 

INSERT [dbo].[KHACH_HANG] ([MaKH], [TenKH], [NgaySinh], [SDT], [DiaChi], [GioiTinh], [Email], [Avatar]) VALUES (32, N'Vo Manh Duy', CAST(N'2002-10-17' AS Date), N'0344668675', N'Ho Chi Minh', 0, N'khach@gmail.com', NULL)
INSERT [dbo].[KHACH_HANG] ([MaKH], [TenKH], [NgaySinh], [SDT], [DiaChi], [GioiTinh], [Email], [Avatar]) VALUES (35, N'Le Tran Thanh Nguyen', CAST(N'2024-06-29' AS Date), N'0229292929', N'Ho Chi Minh', 1, N'khach2@gmail.com', NULL)
INSERT [dbo].[KHACH_HANG] ([MaKH], [TenKH], [NgaySinh], [SDT], [DiaChi], [GioiTinh], [Email], [Avatar]) VALUES (51, N'Nguyen Thanh Nhan', CAST(N'2002-08-16' AS Date), N'0344448674', N'Ho Chi Minh', 1, N'thanhtrung8674@gmail.com', NULL)
INSERT [dbo].[KHACH_HANG] ([MaKH], [TenKH], [NgaySinh], [SDT], [DiaChi], [GioiTinh], [Email], [Avatar]) VALUES (52, N'Nguyen Thanh Dat', CAST(N'1996-09-16' AS Date), N'0346648674', N'Vung Tau', 1, N'khach3@gmail.com', NULL)
INSERT [dbo].[KHACH_HANG] ([MaKH], [TenKH], [NgaySinh], [SDT], [DiaChi], [GioiTinh], [Email], [Avatar]) VALUES (53, N'Nguyen Quoc Khoa', CAST(N'1997-06-06' AS Date), N'0969895549', N'Ho Chi Minh', 1, N'tranhatdong1808@gmail.com', NULL)
INSERT [dbo].[KHACH_HANG] ([MaKH], [TenKH], [NgaySinh], [SDT], [DiaChi], [GioiTinh], [Email], [Avatar]) VALUES (54, N'Nguyen Quoc Khoa', CAST(N'2003-05-03' AS Date), N'0969895549', N'Ho Chi Minh', 0, N'nguyenquockhoa5549@gmail.com', N'transparent_image.png')
INSERT [dbo].[KHACH_HANG] ([MaKH], [TenKH], [NgaySinh], [SDT], [DiaChi], [GioiTinh], [Email], [Avatar]) VALUES (55, N'Phan Thi Dieu', CAST(N'2003-03-05' AS Date), N'0229292929', N'Hà Noi', 0, N'phanthidieu@gmail.com', NULL)
INSERT [dbo].[KHACH_HANG] ([MaKH], [TenKH], [NgaySinh], [SDT], [DiaChi], [GioiTinh], [Email], [Avatar]) VALUES (56, N'Ken Nguyen', CAST(N'2003-03-05' AS Date), N'0928222211', N'Vung Tau', 1, N'abcxyz@gmail.com', NULL)
INSERT [dbo].[KHACH_HANG] ([MaKH], [TenKH], [NgaySinh], [SDT], [DiaChi], [GioiTinh], [Email], [Avatar]) VALUES (57, N'Le Tuan Nhat', CAST(N'2004-05-11' AS Date), N'0977665533', N'Ho Chi Minh', 1, N'anhdaica@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[KHACH_HANG] OFF
GO
SET IDENTITY_INSERT [dbo].[LICH_CHIEU] ON 

INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1084, CAST(N'2025-04-06' AS Date), CAST(N'08:00:00' AS Time), NULL, N'P01', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1085, CAST(N'2025-04-07' AS Date), CAST(N'10:30:00' AS Time), NULL, N'P01', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1086, CAST(N'2025-04-01' AS Date), CAST(N'13:00:00' AS Time), NULL, N'P01', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1087, CAST(N'2025-04-08' AS Date), CAST(N'15:45:00' AS Time), NULL, N'P01', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1088, CAST(N'2025-04-10' AS Date), CAST(N'18:00:00' AS Time), NULL, N'P01', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1089, CAST(N'2025-04-02' AS Date), CAST(N'20:15:00' AS Time), NULL, N'P01', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1090, CAST(N'2025-04-04' AS Date), CAST(N'08:00:00' AS Time), NULL, N'P02', 5)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1091, CAST(N'2025-04-02' AS Date), CAST(N'10:30:00' AS Time), NULL, N'P02', 5)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1092, CAST(N'2025-04-01' AS Date), CAST(N'13:45:00' AS Time), NULL, N'P02', 5)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1093, CAST(N'2025-04-02' AS Date), CAST(N'16:00:00' AS Time), NULL, N'P02', 8)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1094, CAST(N'2025-04-01' AS Date), CAST(N'18:45:00' AS Time), NULL, N'P02', 8)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1095, CAST(N'2025-04-01' AS Date), CAST(N'21:00:00' AS Time), NULL, N'P02', 8)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1096, CAST(N'2025-04-02' AS Date), CAST(N'08:00:00' AS Time), NULL, N'P03', 36)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1097, CAST(N'2025-04-02' AS Date), CAST(N'12:00:00' AS Time), NULL, N'P03', 36)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1098, CAST(N'2025-04-03' AS Date), CAST(N'16:30:00' AS Time), NULL, N'P03', 36)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1099, CAST(N'2025-04-04' AS Date), CAST(N'21:00:00' AS Time), NULL, N'P03', 36)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1100, CAST(N'2025-04-05' AS Date), CAST(N'09:00:00' AS Time), NULL, N'P04', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1101, CAST(N'2025-04-06' AS Date), CAST(N'11:30:00' AS Time), NULL, N'P04', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1102, CAST(N'2025-04-05' AS Date), CAST(N'14:00:00' AS Time), NULL, N'P04', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1104, CAST(N'2024-04-07' AS Date), CAST(N'17:00:00' AS Time), NULL, N'P04', 36)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1105, CAST(N'2025-04-08' AS Date), CAST(N'21:30:00' AS Time), NULL, N'P04', 36)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1106, CAST(N'2025-04-07' AS Date), CAST(N'08:00:00' AS Time), NULL, N'P01', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1107, CAST(N'2025-04-09' AS Date), CAST(N'10:30:00' AS Time), NULL, N'P01', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1108, CAST(N'2025-04-02' AS Date), CAST(N'13:00:00' AS Time), NULL, N'P01', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1109, CAST(N'2025-04-01' AS Date), CAST(N'15:45:00' AS Time), NULL, N'P01', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1110, CAST(N'2025-04-03' AS Date), CAST(N'18:00:00' AS Time), NULL, N'P01', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1111, CAST(N'2024-12-23' AS Date), CAST(N'20:15:00' AS Time), NULL, N'P01', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1112, CAST(N'2024-12-23' AS Date), CAST(N'08:00:00' AS Time), NULL, N'P02', 5)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1113, CAST(N'2024-12-23' AS Date), CAST(N'10:30:00' AS Time), NULL, N'P02', 5)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1114, CAST(N'2024-12-23' AS Date), CAST(N'13:45:00' AS Time), NULL, N'P02', 5)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1115, CAST(N'2024-12-23' AS Date), CAST(N'16:00:00' AS Time), NULL, N'P02', 8)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1116, CAST(N'2024-12-23' AS Date), CAST(N'18:45:00' AS Time), NULL, N'P02', 8)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1117, CAST(N'2024-12-23' AS Date), CAST(N'21:00:00' AS Time), NULL, N'P02', 8)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1118, CAST(N'2024-12-23' AS Date), CAST(N'08:00:00' AS Time), NULL, N'P03', 36)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1119, CAST(N'2024-12-23' AS Date), CAST(N'12:00:00' AS Time), NULL, N'P03', 36)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1120, CAST(N'2024-12-23' AS Date), CAST(N'16:30:00' AS Time), NULL, N'P03', 36)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1121, CAST(N'2024-12-23' AS Date), CAST(N'21:00:00' AS Time), NULL, N'P03', 36)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1122, CAST(N'2024-12-23' AS Date), CAST(N'09:00:00' AS Time), NULL, N'P04', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1123, CAST(N'2024-12-23' AS Date), CAST(N'11:30:00' AS Time), NULL, N'P04', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1124, CAST(N'2024-12-23' AS Date), CAST(N'14:00:00' AS Time), NULL, N'P04', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1125, CAST(N'2024-12-23' AS Date), CAST(N'17:00:00' AS Time), NULL, N'P04', 36)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1126, CAST(N'2024-12-23' AS Date), CAST(N'21:30:00' AS Time), NULL, N'P04', 36)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1148, CAST(N'2024-12-23' AS Date), CAST(N'08:00:00' AS Time), NULL, N'P05', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1149, CAST(N'2024-12-23' AS Date), CAST(N'10:30:00' AS Time), NULL, N'P05', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1150, CAST(N'2024-12-23' AS Date), CAST(N'13:00:00' AS Time), NULL, N'P05', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1151, CAST(N'2024-12-23' AS Date), CAST(N'15:45:00' AS Time), NULL, N'P05', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1152, CAST(N'2024-12-23' AS Date), CAST(N'18:00:00' AS Time), NULL, N'P05', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1153, CAST(N'2024-12-23' AS Date), CAST(N'20:15:00' AS Time), NULL, N'P05', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1156, CAST(N'2024-12-23' AS Date), CAST(N'13:45:00' AS Time), NULL, N'P06', 5)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1157, CAST(N'2024-12-23' AS Date), CAST(N'16:00:00' AS Time), NULL, N'P06', 8)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1158, CAST(N'2024-12-23' AS Date), CAST(N'18:45:00' AS Time), NULL, N'P06', 8)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1159, CAST(N'2024-12-23' AS Date), CAST(N'21:00:00' AS Time), NULL, N'P06', 8)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1160, CAST(N'2024-12-23' AS Date), CAST(N'08:00:00' AS Time), NULL, N'P07', 36)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1161, CAST(N'2024-12-23' AS Date), CAST(N'12:00:00' AS Time), NULL, N'P07', 36)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1162, CAST(N'2024-12-23' AS Date), CAST(N'16:30:00' AS Time), NULL, N'P07', 36)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1163, CAST(N'2024-12-23' AS Date), CAST(N'21:00:00' AS Time), NULL, N'P07', 36)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1164, CAST(N'2024-12-23' AS Date), CAST(N'09:00:00' AS Time), NULL, N'P08', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1165, CAST(N'2024-12-23' AS Date), CAST(N'11:30:00' AS Time), NULL, N'P08', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1166, CAST(N'2024-12-23' AS Date), CAST(N'14:00:00' AS Time), NULL, N'P08', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1167, CAST(N'2024-12-23' AS Date), CAST(N'17:00:00' AS Time), NULL, N'P08', 36)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1168, CAST(N'2024-12-23' AS Date), CAST(N'21:30:00' AS Time), NULL, N'P08', 36)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1169, CAST(N'2024-12-24' AS Date), CAST(N'08:00:00' AS Time), NULL, N'P05', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1170, CAST(N'2024-12-24' AS Date), CAST(N'10:30:00' AS Time), NULL, N'P05', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1171, CAST(N'2024-12-24' AS Date), CAST(N'13:00:00' AS Time), NULL, N'P05', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1172, CAST(N'2024-12-24' AS Date), CAST(N'15:45:00' AS Time), NULL, N'P05', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1173, CAST(N'2024-12-24' AS Date), CAST(N'18:00:00' AS Time), NULL, N'P05', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1174, CAST(N'2024-12-24' AS Date), CAST(N'20:15:00' AS Time), NULL, N'P05', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1177, CAST(N'2024-12-24' AS Date), CAST(N'13:45:00' AS Time), NULL, N'P06', 5)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1178, CAST(N'2024-12-24' AS Date), CAST(N'16:00:00' AS Time), NULL, N'P06', 8)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1179, CAST(N'2024-12-24' AS Date), CAST(N'18:45:00' AS Time), NULL, N'P06', 8)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1180, CAST(N'2024-12-24' AS Date), CAST(N'21:00:00' AS Time), NULL, N'P06', 8)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1181, CAST(N'2024-12-24' AS Date), CAST(N'08:00:00' AS Time), NULL, N'P07', 36)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1182, CAST(N'2024-12-24' AS Date), CAST(N'12:00:00' AS Time), NULL, N'P07', 36)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1183, CAST(N'2024-12-24' AS Date), CAST(N'16:30:00' AS Time), NULL, N'P07', 36)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1184, CAST(N'2024-12-24' AS Date), CAST(N'21:00:00' AS Time), NULL, N'P07', 36)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1185, CAST(N'2024-12-24' AS Date), CAST(N'09:00:00' AS Time), NULL, N'P08', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1186, CAST(N'2024-12-24' AS Date), CAST(N'11:30:00' AS Time), NULL, N'P08', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1187, CAST(N'2024-12-24' AS Date), CAST(N'14:00:00' AS Time), NULL, N'P08', 2)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1188, CAST(N'2025-12-24' AS Date), CAST(N'17:00:00' AS Time), NULL, N'P08', 36)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1189, CAST(N'2025-12-24' AS Date), CAST(N'21:30:00' AS Time), NULL, N'P08', 36)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1190, CAST(N'2025-01-10' AS Date), CAST(N'08:00:00' AS Time), NULL, N'P01', 29)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1191, CAST(N'2025-01-15' AS Date), CAST(N'10:00:00' AS Time), NULL, N'P01', 26)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1192, CAST(N'2025-01-14' AS Date), CAST(N'16:30:00' AS Time), NULL, N'P03', 13)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1193, CAST(N'2025-01-14' AS Date), CAST(N'12:00:00' AS Time), NULL, N'P02', 3)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1196, CAST(N'2025-01-14' AS Date), CAST(N'14:00:00' AS Time), NULL, N'P01', 13)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1197, CAST(N'2025-01-14' AS Date), CAST(N'16:00:00' AS Time), NULL, N'P01', 8)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1199, CAST(N'2025-01-13' AS Date), CAST(N'14:00:00' AS Time), NULL, N'P01', 12)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1200, CAST(N'2025-01-13' AS Date), CAST(N'18:00:00' AS Time), NULL, N'P03', 36)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1201, CAST(N'2025-01-13' AS Date), CAST(N'20:00:00' AS Time), NULL, N'P02', 13)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [GioChieu], [BatDauBanVe], [MaPhong], [MaPhim]) VALUES (1202, CAST(N'2025-01-13' AS Date), CAST(N'21:00:00' AS Time), NULL, N'P03', 6)
SET IDENTITY_INSERT [dbo].[LICH_CHIEU] OFF
GO
SET IDENTITY_INSERT [dbo].[LOAIGHE] ON 

INSERT [dbo].[LOAIGHE] ([IdLoaiGhe], [TenLoai], [Gia]) VALUES (1, N'Regular', 45000.0000)
INSERT [dbo].[LOAIGHE] ([IdLoaiGhe], [TenLoai], [Gia]) VALUES (2, N'Vip', 50000.0000)
INSERT [dbo].[LOAIGHE] ([IdLoaiGhe], [TenLoai], [Gia]) VALUES (3, N'Sweetbox', 100000.0000)
SET IDENTITY_INSERT [dbo].[LOAIGHE] OFF
GO
SET IDENTITY_INSERT [dbo].[NHAN_VIEN] ON 

INSERT [dbo].[NHAN_VIEN] ([MaNV], [TenNV], [NgaySinh], [CMND], [SDT], [DiaChi], [GioiTinh], [Email], [TrangThai], [MaChiNhanh]) VALUES (5, N'Nguyen Vu Hai', CAST(N'2001-07-09' AS Date), N'21160037', N'0814201801', N'Ca Mau', 1, N'quanly@gmail.com', 1, 1)
INSERT [dbo].[NHAN_VIEN] ([MaNV], [TenNV], [NgaySinh], [CMND], [SDT], [DiaChi], [GioiTinh], [Email], [TrangThai], [MaChiNhanh]) VALUES (25, N'Tra Nhat Dong', CAST(N'2005-06-16' AS Date), N'301721680', N'0344448674', N'Quang Ngai', 1, N'nhanvien1@gmail.com', 1, 1)
INSERT [dbo].[NHAN_VIEN] ([MaNV], [TenNV], [NgaySinh], [CMND], [SDT], [DiaChi], [GioiTinh], [Email], [TrangThai], [MaChiNhanh]) VALUES (33, N'Nguyen Quoc Khoa', CAST(N'2005-06-09' AS Date), N'301721689', N'0344448679', N'Tien Giang', 1, N'quanlyTuTruTienGiang@gmail.com', 1, 2)
SET IDENTITY_INSERT [dbo].[NHAN_VIEN] OFF
GO
SET IDENTITY_INSERT [dbo].[PHIM] ON 

INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [NuocSX], [NgayKhoiChieu], [NamSX], [ThoiLuong], [LinkAnh], [LinkTrailer], [Diem], [MaTT], [IdDaoDien]) VALUES (2, N'The Ravenous Entity', N'After Yak returned from military service, his younger sister, Yam, fell seriously ill with strange symptoms, believed to be caused by a ''vampire'' possession. The mysteries surrounding Yam''s condition led to a haunting story that lasted for more than 50 years', N'Thailand', CAST(N'2024-12-23' AS Date), 2023, 110, N'posterquyantang.jpg', N'https://www.youtube.com/watch?v=LyXDbLWEPwo', 4.75, 1, 5)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [NuocSX], [NgayKhoiChieu], [NamSX], [ThoiLuong], [LinkAnh], [LinkTrailer], [Diem], [MaTT], [IdDaoDien]) VALUES (3, N'Conan: The Halloween Bride', N'At Shibuya during Halloween, at a wedding, Inspector Satou was attacked, and Sergeant Takagi was injured while protecting her. Satou reminisces about Inspector Matsuda’s sacrifice in a bombing incident three years ago, and the criminal responsible has escaped from prison', N'Japan', CAST(N'2024-12-23' AS Date), 2023, 98, N'posterconan.jpg', N'https://www.youtube.com/watch?v=Pt38ZgehKlI', 3, 1, 11)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [NuocSX], [NgayKhoiChieu], [NamSX], [ThoiLuong], [LinkAnh], [LinkTrailer], [Diem], [MaTT], [IdDaoDien]) VALUES (4, N'Annabelle: The Diabolical Creation', N'After the local orphanage was damaged, a nun and several orphaned girls took temporary shelter at the home of a couple who made dolls. The guests soon became the target of an attack by a haunted doll created by the house owner themselves.', N'Europe', CAST(N'2025-01-12' AS Date), 2023, 102, N'posterannabelle.png', N'https://www.youtube.com/watch?v=EjZkJa6Z-SY', NULL, 1, 9)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [NuocSX], [NgayKhoiChieu], [NamSX], [ThoiLuong], [LinkAnh], [LinkTrailer], [Diem], [MaTT], [IdDaoDien]) VALUES (5, N'Fearless Playboys', N'Quan, a skilled ladies'' man, is suddenly tasked with raising a child when his ex-girlfriend Linh leaves her daughter in his care. From being a bachelor, Quan becomes focused on making a living to take care of the child. Just as he and little Tho are living happily together, Linh returns, wanting to reclaim her daughter. What will happen to their fate?', N'Vietnam', CAST(N'2024-12-23' AS Date), 2023, 108, N'posterdanchoikhongsoconroi.jpg', N'https://www.youtube.com/watch?v=YjOdbS4oMuc', 4.3299999237060547, 1, 4)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [NuocSX], [NgayKhoiChieu], [NamSX], [ThoiLuong], [LinkAnh], [LinkTrailer], [Diem], [MaTT], [IdDaoDien]) VALUES (6, N'Avatar: The Way of Water', N'Jake Sully lives with his newly formed family on the moon of Pandora, located outside the solar system. When a familiar threat returns to finish what was started before, Jake must team up with Neytiri and the Na''vi tribe’s military to protect their homeland.', N'Europe', CAST(N'2025-01-12' AS Date), 2023, 103, N'posteravatar.jpg', N'https://www.youtube.com/watch?v=-dT4h5oHahQ', NULL, 1, 10)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [NuocSX], [NgayKhoiChieu], [NamSX], [ThoiLuong], [LinkAnh], [LinkTrailer], [Diem], [MaTT], [IdDaoDien]) VALUES (7, N'Face Off 7: A Wish', N'"Lat Mat 7: A Wish" tells the touching story of Mrs. Hai, a 73-year-old single mother who raised 5 grown children. As the children grow up and have families of their own, an unexpected tragedy strikes, revealing hidden corners and the deep emotions in the heart of the mother. Who is responsible?', N'Vietnam', CAST(N'2025-01-12' AS Date), 2023, 100, N'posterlatmat7.jpg', N'https://www.youtube.com/watch?v=d1ZHdosjNX8', NULL, 1, 8)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [NuocSX], [NgayKhoiChieu], [NamSX], [ThoiLuong], [LinkAnh], [LinkTrailer], [Diem], [MaTT], [IdDaoDien]) VALUES (8, N'Raising the Dead', N'Excavating a troublesome tomb causes both material and spiritual consequences. Disturbing a peaceful resting place may provoke supernatural forces, leading to spiritual complications and drawing attention from religious groups or heritage conservationists.', N'Korea', CAST(N'2024-12-23' AS Date), 2023, 115, N'posterquatmotrungma.jpg', N'https://www.youtube.com/watch?v=5-oRO4rYNQ4', NULL, 1, 3)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [NuocSX], [NgayKhoiChieu], [NamSX], [ThoiLuong], [LinkAnh], [LinkTrailer], [Diem], [MaTT], [IdDaoDien]) VALUES (12, N'Nobita and the Earth Symphony', N'Nobita and his friends are invited to the Music Palace on the Farre planet, where music transforms into energy. Along with Micca, they search for the "virtuoso" to save the palace but face the danger of losing music, which threatens the Earth. Will they be able to save the "future of music" and the planet?', N'Japan', CAST(N'2024-12-01' AS Date), 2023, 104, N'posterdoraemon.jpg', N'https://www.youtube.com/watch?v=Yug8gbDd5EQ', NULL, 1, 7)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [NuocSX], [NgayKhoiChieu], [NamSX], [ThoiLuong], [LinkAnh], [LinkTrailer], [Diem], [MaTT], [IdDaoDien]) VALUES (13, N'Mai', N'Mai, constantly haunted by her past, is greeted by a new dawn as she embraces an unfamiliar friendship with the charming neighbor. But when her past begins to catch up with her present, what will become of her tomorrow?', N'Vietnam', CAST(N'2024-12-23' AS Date), 2023, 100, N'posterphimMai.jpg', N'https://www.youtube.com/watch?v=VweAKEjYw8c', 4, 1, 2)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [NuocSX], [NgayKhoiChieu], [NamSX], [ThoiLuong], [LinkAnh], [LinkTrailer], [Diem], [MaTT], [IdDaoDien]) VALUES (14, N'Glowing in the Darkness', N'On the final night of their grandfather''s funeral, a family is thrown into chaos when they discover that their father has squandered the family''s fortune on gambling, and the mafia has come to collect the debt. They must pay before dawn, whether with gold or with blood.', N'Vietnam', CAST(N'2024-11-24' AS Date), 2023, 107, N'posterdemtoirucro.png', N'https://www.youtube.com/watch?v=_50ay0lxkM0', NULL, 0, 6)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [NuocSX], [NgayKhoiChieu], [NamSX], [ThoiLuong], [LinkAnh], [LinkTrailer], [Diem], [MaTT], [IdDaoDien]) VALUES (24, N'Smile', N'Cười (tựa gốc tiếng Anh: Smile) là phim điện ảnh kinh dị tâm lý Mỹ năm 2022 do Parker Finn biên kịch và đạo diễn, dựa trên phim ngắn "Laura Hasn’t Slept" năm 2020 của anh. Trong phim, nữ diễn viên Sosie Bacon vào vai bác sĩ trị liệu Rose Cotter, cô gặp phải những hiện tượng siêu nhiên kỳ lạ sau khi một bệnh nhân tự tử ngay tại phòng khám. Các diễn viên khác gồm có Jessie T. Usher, Kyle Gallner, Caitlin Stasey, Kal Penn và Rob Morgan.', N'US', CAST(N'2024-11-24' AS Date), 2022, 106, N'postercuoi.jpg', N'https://www.youtube.com/watch?v=_CR6oXzoujk', NULL, 0, 1027)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [NuocSX], [NgayKhoiChieu], [NamSX], [ThoiLuong], [LinkAnh], [LinkTrailer], [Diem], [MaTT], [IdDaoDien]) VALUES (25, N'Blue Eyes', N'Smile (original title: Smile) is a 2022 American psychological horror film written and directed by Parker Finn, based on his 2020 short film Laura Hasn’t Slept. In the film, actress Sosie Bacon plays therapist Rose Cotter, who experiences strange supernatural phenomena after a patient commits suicide right in her office. Other cast members include Jessie T. Usher, Kyle Gallner, Caitlin Stasey, Kal Penn, and Rob Morgan.', N'Vietnam', CAST(N'2024-11-24' AS Date), 2022, 100, N'postermatbiec.jpg', N'https://www.youtube.com/watch?v=ITlQ0oU7tDA', NULL, 0, 1015)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [NuocSX], [NgayKhoiChieu], [NamSX], [ThoiLuong], [LinkAnh], [LinkTrailer], [Diem], [MaTT], [IdDaoDien]) VALUES (26, N'Inheritance', N'The miniature artist Annie Graham lives with her husband, psychiatrist Steve, and their two children, 16-year-old son Peter and 13-year-old daughter Charlie. The family attends the secret funeral of Annie’s mother, Ellen, where Annie is surprised by the number of mourners in attendance. She joins a grief support group, revealing her troubled childhood and the complicated relationship she had with her mother, which became even more strained after Charlie was born, as Ellen played a significant role in raising her.', N'US', CAST(N'2025-02-10' AS Date), 2024, 108, N'posterditruyen.jpg', N'https://www.youtube.com/watch?v=V6wWKNij_1M', 3, 1, 1026)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [NuocSX], [NgayKhoiChieu], [NamSX], [ThoiLuong], [LinkAnh], [LinkTrailer], [Diem], [MaTT], [IdDaoDien]) VALUES (28, N'The Sinister Clown 2', N'In 2016, in the town of Derry, Maine, Don Hagarty witnesses his boyfriend Adrian Mellon being killed by Pennywise after a homophobic gang assaults them and throws Adrian off a bridge. Mike Hanlon discovers that the clown Pennywise has returned and calls his childhood friends—Bill Denbrough, Beverly Marsh, Ben Hanscom, Richie Tozier, Eddie Kaspbrak, and Stanley "Stan" Uris—to return to Derry to fulfill their promise from 1989 to kill the clown if he ever returns.', N'US', CAST(N'2024-11-24' AS Date), 2023, 120, N'postergahedienloan.jpg', N'https://www.youtube.com/watch?v=qblBGRBtmU0', NULL, 1, 1029)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [NuocSX], [NgayKhoiChieu], [NamSX], [ThoiLuong], [LinkAnh], [LinkTrailer], [Diem], [MaTT], [IdDaoDien]) VALUES (29, N'The Mad Clown', N'
Terrifier is a 2016 American slasher film written, edited, co-produced, and directed by Damien Leone. The film stars Jenna Kanell, Samantha Scaffidi, Catherine Corcoran, and David Howard Thornton.', N'US', CAST(N'2025-02-10' AS Date), 2023, 113, N'postergahedienloan.jpg', N'https://www.youtube.com/watch?v=fN5j1MtGO2Q', NULL, 1, 1030)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [NuocSX], [NgayKhoiChieu], [NamSX], [ThoiLuong], [LinkAnh], [LinkTrailer], [Diem], [MaTT], [IdDaoDien]) VALUES (35, N'Joker', N'Arthur Fleck lives with his mother, Penny, in Gotham City. Gotham is riddled with crime and unemployment, leaving many citizens disenfranchised and impoverished. Arthur suffers from a neurological disorder that causes him to laugh at inappropriate moments and depends on a social worker to get medication. After being attacked by a group of young men in an alley, Arthur’s coworker, Randall, lends him a gun. Arthur meets his neighbor, the single mother Sophie Dumond, and invites her to see his stand-up comedy show, and they start dating. While performing at a children’s hospital, Arthur’s gun falls out of his pocket. Arthur is fired, and Randall lies, claiming Arthur bought the gun himself.', N'US', CAST(N'2025-02-10' AS Date), 2023, 117, N'posterjoker.jfif', N'https://www.youtube.com/watch?v=gxWLZoMT2MU', NULL, 1, 1031)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [NuocSX], [NgayKhoiChieu], [NamSX], [ThoiLuong], [LinkAnh], [LinkTrailer], [Diem], [MaTT], [IdDaoDien]) VALUES (36, N'Titanic - The Fateful Voyage', N'In 1996, treasure hunter Brock Lovett and his team board the research ship Akademik Mstislav Keldysh to the site of the legendary RMS Titanic wreck in the Atlantic Ocean, seeking a rare diamond necklace, the Heart of the Ocean.', N'US', CAST(N'2024-12-23' AS Date), 1997, 101, N'postertitanic.jfif', N'https://www.youtube.com/watch?v=kVrqfYjkTdQ', 4.5, 1, 10)
SET IDENTITY_INSERT [dbo].[PHIM] OFF
GO
INSERT [dbo].[PHONG] ([MaPhong], [TrangThai], [MaChiNhanh]) VALUES (N'P01', 0, 1)
INSERT [dbo].[PHONG] ([MaPhong], [TrangThai], [MaChiNhanh]) VALUES (N'P02', 0, 1)
INSERT [dbo].[PHONG] ([MaPhong], [TrangThai], [MaChiNhanh]) VALUES (N'P03', 0, 1)
INSERT [dbo].[PHONG] ([MaPhong], [TrangThai], [MaChiNhanh]) VALUES (N'P04', 0, 1)
INSERT [dbo].[PHONG] ([MaPhong], [TrangThai], [MaChiNhanh]) VALUES (N'P05', 0, 2)
INSERT [dbo].[PHONG] ([MaPhong], [TrangThai], [MaChiNhanh]) VALUES (N'P06', 0, 2)
INSERT [dbo].[PHONG] ([MaPhong], [TrangThai], [MaChiNhanh]) VALUES (N'P07', 0, 2)
INSERT [dbo].[PHONG] ([MaPhong], [TrangThai], [MaChiNhanh]) VALUES (N'P08', 0, 2)
GO
INSERT [dbo].[QUYEN] ([MaQuyen], [TenQuyen]) VALUES (N'KH', N'Customer')
INSERT [dbo].[QUYEN] ([MaQuyen], [TenQuyen]) VALUES (N'NV', N'Staff')
INSERT [dbo].[QUYEN] ([MaQuyen], [TenQuyen]) VALUES (N'QL', N'Manager')
GO
SET IDENTITY_INSERT [dbo].[SUKIEN] ON 

INSERT [dbo].[SUKIEN] ([MaSK], [TenSK], [MoTaSK], [ChiTietSK], [PosterSK]) VALUES (1, N'
Happy Wednesday - Super Cheap Wednesday', N'
Every Wednesday, Tu Trụ Cinema offers a 20% discount on all bills.', N'<div class="row"> <div class="col-md-6 mx-auto"> <img src="images/posterngangthutu.png" class="w-100" alt=""> </div> </div> <hr> <br> <p>Did you know? Every Wednesday, Tu Tru Cinema brings you an unforgettable cinematic experience with our promotion <strong>Fun Wednesday - Super Cheap Wednesday!</strong></p> <div class="text-center"> <img src="images/icon-bap.gif" class="icon-bap"> <p class="col_red"><b>Promotion Details</b></p> <ul> <li><strong>20% off</strong> the total bill</li> <li>Applicable to all movies and showtimes</li> <li>No limit on the number of tickets purchased</li> </ul> <div class="row"> <div class="col-md-6 mx-auto"> <img src="images/eventsale20%25.png" class="w-75" alt=""> </div> </div> <br> <img src="images/icon-traitim.gif" class="icon-traitim"> <p class="col_red"><b>Why Should You Visit Tu Tru Cinema on Wednesdays?</b></p> <ul> <li><strong>Modern theaters</strong>: Top-notch sound and picture quality</li> <li><strong>Comfortable space</strong>: Cozy and spacious seats</li> <li><strong>Caring service</strong>: Friendly and attentive staff</li> <li><strong>Attractive offers</strong>: Save on costs while enjoying the full experience</li> </ul> <div class="row"> <div class="col-md-6 mx-auto"> <img src="images/phongchieuphim.png" class="w-75" alt=""> </div> </div> <br> <img src="images/icon-moigoi.gif" class="icon-moigoi"> <p class="col_red"><b>Come Now and Experience!</b></p> </div> <p>What are you waiting for? Plan your visit now to enjoy a fun and affordable Wednesday at Tu Tru Cinema. Bring your family and friends to watch blockbuster movies and take advantage of this fantastic offer!</p> <p class="text-center"><strong>Tu Tru Cinema - The perfect destination for movie lovers!</strong></p> <p class="text-center"><strong>Tu Tru Cinema - Where emotions meet!</strong></p> <hr> <br>', N'http://localhost:9999/DoAnWebCinema/images/eventsale20%25.png')
INSERT [dbo].[SUKIEN] ([MaSK], [TenSK], [MoTaSK], [ChiTietSK], [PosterSK]) VALUES (2, N'Tu Tru Goes to the Highlands', N'Bringing movies to the highlands is a meaningful and humane activity, aiming to bring joy to children in remote areas.', N'<div class="row"> <div class="col-md-6 mx-auto"> <img src="images/posterngangtutrulenvungcao.jpg" class="w-100" alt=""> </div> </div> <hr> <br> <div class="text-center"> <p class="col_red"><b>Tu Tru Goes to the Highlands: A Mission of Culture and Humanity</b></p> </div> <p>Have you ever imagined that each step you take in the world of cinema could bring joy and knowledge to children in remote areas? Let Tu Tru Cinema turn that dream into reality with our special event <span class="highlight">"Tu Tru Goes to the Highlands"!</span></p> <div class="text-center"> <p class="col_red"><b>Cultural Mission</b></p> </div> <p>Tu Tru Cinema is not only a place of entertainment but also a cultural heart, where we honor human values and inspire the future. We believe that every child, no matter where they are, deserves access to joy and knowledge through the art of cinema.</p> <div class="text-center"> <p class="col_red"><b>Objective</b></p> </div> <p>Our goal is to bring quality and meaningful films to highland areas, where access to culture and education is often limited. We aim to create a memorable and meaningful cinematic experience for children, helping them dream and explore the world around them.</p> <div class="text-center"> <p class="col_red"><b>Event Schedule</b></p> </div> <ul> <li><strong>Date:</strong> July 20th</li> <li><strong>Location:</strong> Highland areas in the North, Central, and South regions</li> <li><strong>Program:</strong> Free screenings of age-appropriate films, along with cultural activities, games, and surprise gifts.</li> </ul> <p>Join and Contribute to help Tu Tru Cinema spread love and care to the community by participating and contributing to the <span class="highlight">"Tu Tru Goes to the Highlands"</span> event. You can support us by contributing gifts, time, or financial resources so that we can bring joy and knowledge to children in the most remote areas.</p> <div class="text-center"> <div class="row"> <div class="col-md-6 mx-auto"> <img src="images/eventmangphimlenvungcao.png" class="w-75" alt=""> </div> </div> <br> <p class="highlight"><b>Let''s Together Create a Bright Future for the Next Generations!</b></p> <p><strong>Tu Tru Cinema - Connecting Love and Knowledge!</strong></p> <p class="highlight"><b>Tu Tru Cinema - Where emotions meet!</b></p> </div>', N'http://localhost:9999/DoAnWebCinema/images/eventmangphimlenvungcao.png')
INSERT [dbo].[SUKIEN] ([MaSK], [TenSK], [MoTaSK], [ChiTietSK], [PosterSK]) VALUES (3, N'
Tu Tru Lures In', N'
What Does Tu Trụ Cinema Have That Lures You In?', N'<div class="row"> <div class="col-md-6 mx-auto"> <img src="images/posterngangchieudu.png" class="w-100" alt=""> </div> </div> <hr> <br> <div class="text-center"> <p class="col_red"><b>Elegant and Modern Space</b></p> </div> <p>From the moment you step into Tu Tru Cinema, you will feel the elegant and modern atmosphere. The interior design is refined, with soft lighting and luxurious amenities that make you feel as though you''ve entered an entirely different world, where every detail is meticulously crafted to provide the best experience for the audience.</p> <div class="text-center"> <p class="col_red"><b>High-Quality Sound and Visuals</b></p> </div> <p>Tu Tru Cinema is not just an entertainment venue; it is also the cultural heart, where we celebrate human values and inspire the future. We believe that every child, no matter where they are, deserves access to joy and knowledge through the art of cinema.</p> <div class="text-center"> <p class="col_red"><b>Goal</b></p> </div> <p>Tu Tru Cinema is proud to possess a state-of-the-art surround sound system and high-quality 4K screens, providing vibrant visuals and the most realistic sound. You will be immersed in every frame, clearly feeling every sound, from the gentle breeze to intense action scenes.</p> <div class="text-center"> <p class="col_red"><b>Diverse Film Selection</b></p> </div> <p>Tu Tru Cinema always updates the latest films, from Hollywood blockbusters to outstanding art films, from thrilling action movies to romantic dramas. You will always have a wide range of choices to satisfy your passion for cinema.</p> <div class="text-center"> <p class="col_red"><b>Comfortable Seating</b></p> </div> <p>One of the highlights of Tu Tru Cinema is the extremely comfortable seating system. The seats are made from high-quality materials and are adjustable to suit any sitting posture, ensuring that you can fully relax throughout the movie.</p> <div class="text-center"> <p class="col_red"><b>Attentive Customer Service</b></p> </div> <p>The staff at Tu Tru Cinema are always ready to assist and serve you in the most dedicated manner. From guiding seating, assisting with ticket reservations, to answering any inquiries, everything is done with professionalism and friendliness, ensuring that you feel comfortable and satisfied.</p> <div class="text-center"> <p class="col_red"><b>Attractive Promotions</b></p> </div> <p>In addition to high-quality services and facilities, Tu Tru Cinema frequently offers attractive promotions for audiences, such as ticket discounts, complimentary popcorn and soft drinks, or special events with famous actors and directors. This is a great opportunity to save on costs while enjoying exciting experiences. Beyond just watching movies, Tu Tru Cinema also integrates modern dining and entertainment areas. You can enjoy delicious food, sip on aromatic coffee, or participate in fun recreational activities with friends and family.</p> <div class="text-center"> <br> <p class="highlight"><b>Tu Tru Cinema - Where emotions meet!</b></p> </div>', N'http://localhost:9999/DoAnWebCinema/images/posterdocchieudu.png')
SET IDENTITY_INSERT [dbo].[SUKIEN] OFF
GO
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'abcxyz@gmail.com', N'KH', N'ed1b95b0728d4e8e4496598550e2fb9d                  ')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'anhdaica@gmail.com', N'KH', N'e10adc3949ba59abbe56e057f20f883e                  ')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'khach@gmail.com', N'KH', N'827ccb0eea8a706c4c34a16891f84e7b                  ')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'khach2@gmail.com', N'KH', N'827ccb0eea8a706c4c34a16891f84e7b                  ')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'khach3@gmail.com', N'KH', N'2e9ec317e197819358fbc43afca7d837                  ')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'nguyenquockhoa5549@gmail.com', N'KH', N'880c58e1e87a98b208f71b5ddab3ae57                  ')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'nhanvien1@gmail.com', N'NV', N'81dc9bdb52d04dc20036dbd8313ed055                  ')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'nhanvien2@gmail.com', N'NV', N'827ccb0eea8a706c4c34a16891f84e7b                  ')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'nhanvien3@gmail.com', N'NV', N'81dc9bdb52d04dc20036dbd8313ed055                  ')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'phanthidieu@gmail.com', N'KH', N'4facb2794b7b95a9997b09727d3ea8ce                  ')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'quanly@gmail.com', N'QL', N'202cb962ac59075b964b07152d234b70                  ')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'quanlyTuTruTienGiang@gmail.com', N'QL', N'81dc9bdb52d04dc20036dbd8313ed055                  ')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'thanhtrung8674@gmail.com', N'KH', N'827ccb0eea8a706c4c34a16891f84e7b                  ')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'tranhatdong1808@gmail.com', N'KH', N'185317219bbdc2991a9e6f518affd353                  ')
GO
SET IDENTITY_INSERT [dbo].[THAYDOIGIA] ON 

INSERT [dbo].[THAYDOIGIA] ([IdThayDoiGia], [LyDoThayDoi], [NgayThayDoi]) VALUES (1, N'
Late-night discount', NULL)
INSERT [dbo].[THAYDOIGIA] ([IdThayDoiGia], [LyDoThayDoi], [NgayThayDoi]) VALUES (2, N'
Gentle morning', NULL)
SET IDENTITY_INSERT [dbo].[THAYDOIGIA] OFF
GO
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (1, N'Comedy')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (2, N'Action')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (3, N'School Life')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (4, N'Animation')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (5, N'Horror')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (6, N'Science Fiction')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (7, N'Romance')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (8, N'Adventure')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (9, N'Documentary')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (10, N'Drama')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (11, N'Psychology')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (12, N'Psychological Romance')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (13, N'Mythology')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (14, N'Spiritual')
GO
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (1, 5)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (1, 12)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (1, 13)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (2, 2)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (2, 4)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (2, 14)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (2, 24)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (2, 26)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (2, 28)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (2, 29)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (2, 35)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (3, 25)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (4, 3)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (4, 12)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (5, 2)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (5, 3)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (5, 4)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (5, 8)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (5, 24)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (5, 26)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (5, 28)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (5, 29)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (5, 35)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (6, 6)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (7, 5)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (7, 13)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (7, 25)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (7, 36)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (8, 8)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (8, 36)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (10, 5)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (10, 13)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (10, 25)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (10, 36)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (11, 2)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (11, 3)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (11, 4)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (11, 5)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (11, 7)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (11, 8)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (11, 13)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (11, 14)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (11, 24)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (11, 26)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (11, 28)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (11, 29)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (11, 35)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (11, 36)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (12, 5)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (12, 13)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (12, 36)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (14, 2)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (14, 8)
GO
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (2, 1, N'')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (2, 2, N'')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (3, 16, N'')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (3, 17, N'')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (3, 23, N'')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (4, 2, N'')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (4, 5, N'')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (4, 12, N'')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (5, 3, N'Quan')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (5, 4, N'Quan''s Ex-Lover')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (5, 5, N'Child of Quan and Ex-Lover')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (7, 16, N'Mrs. Hai')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (7, 17, N'Mr. Lanh')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (7, 18, N'Tu Hau')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (8, 6, N'')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (8, 7, N'')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (8, 8, N'')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (12, 1, N'')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (12, 9, N'')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (12, 16, N'')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (13, 9, N'Mai')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (13, 10, N'Binh Minh')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (13, 11, N'Sau')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (14, 12, N'')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (14, 13, N'')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (14, 14, N'')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (25, 19, N'Ngan')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (25, 20, N'Ha Lan')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (25, 21, N'Tra Long')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (25, 22, N'Dung')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (26, 14, N'')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (26, 16, N'')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (26, 17, N'')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (28, 10, N'')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (28, 12, N'')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (29, 11, N'')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (29, 18, N'')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (29, 23, N'')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (35, 15, N'')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (35, 16, N'')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (35, 24, N'')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (36, 23, N'Jack Dawson')
INSERT [dbo].[VAIDIEN] ([MaPhim], [IdDienVien], [TenVaiDien]) VALUES (36, 24, N'Rose DeWitt Bukater')
GO
SET IDENTITY_INSERT [dbo].[VE] ON 

INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [NgayBan], [ThoiDiemThanhToan], [TrangThaiDat], [IdGheDat], [MaNV]) VALUES (4553, 1102, 54, CAST(N'2025-04-05' AS Date), NULL, 0, 1444, NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [NgayBan], [ThoiDiemThanhToan], [TrangThaiDat], [IdGheDat], [MaNV]) VALUES (4554, 1102, NULL, CAST(N'2025-04-05' AS Date), NULL, 0, 1436, NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [NgayBan], [ThoiDiemThanhToan], [TrangThaiDat], [IdGheDat], [MaNV]) VALUES (4555, 1102, NULL, CAST(N'2025-04-05' AS Date), NULL, 0, 1437, NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [NgayBan], [ThoiDiemThanhToan], [TrangThaiDat], [IdGheDat], [MaNV]) VALUES (4556, 1102, 54, CAST(N'2025-04-05' AS Date), NULL, 1, 1443, NULL)
SET IDENTITY_INSERT [dbo].[VE] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_CHITIET_GHE_PHONG]    Script Date: 04/07/2025 12:55:16 AM ******/
ALTER TABLE [dbo].[CHITIET_GHE_PHONG] ADD  CONSTRAINT [UK_CHITIET_GHE_PHONG] UNIQUE NONCLUSTERED 
(
	[IdGhe] ASC,
	[MaPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_TENGHE]    Script Date: 04/07/2025 12:55:16 AM ******/
ALTER TABLE [dbo].[GHE] ADD  CONSTRAINT [UK_TENGHE] UNIQUE NONCLUSTERED 
(
	[TenGhe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_GHE]    Script Date: 04/07/2025 12:55:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_GHE] ON [dbo].[GHE]
(
	[TenGhe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Khach_Hang]    Script Date: 04/07/2025 12:55:16 AM ******/
ALTER TABLE [dbo].[KHACH_HANG] ADD  CONSTRAINT [IX_Khach_Hang] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_MaPhim_GioChieu]    Script Date: 04/07/2025 12:55:16 AM ******/
ALTER TABLE [dbo].[LICH_CHIEU] ADD  CONSTRAINT [UK_MaPhim_GioChieu] UNIQUE NONCLUSTERED 
(
	[MaPhim] ASC,
	[GioChieu] ASC,
	[NgayChieu] ASC,
	[MaPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_NHAN_VIEN]    Script Date: 04/07/2025 12:55:16 AM ******/
ALTER TABLE [dbo].[NHAN_VIEN] ADD  CONSTRAINT [IX_NHAN_VIEN] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_NHAN_VIEN_cmnd]    Script Date: 04/07/2025 12:55:16 AM ******/
ALTER TABLE [dbo].[NHAN_VIEN] ADD  CONSTRAINT [IX_NHAN_VIEN_cmnd] UNIQUE NONCLUSTERED 
(
	[CMND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_GHEDAT_KHACHHANG]    Script Date: 04/07/2025 12:55:16 AM ******/
ALTER TABLE [dbo].[VE] ADD  CONSTRAINT [UK_GHEDAT_KHACHHANG] UNIQUE NONCLUSTERED 
(
	[MaSuatChieu] ASC,
	[MaKH] ASC,
	[IdGheDat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PHIM] ADD  CONSTRAINT [DF_PHIM_Diem]  DEFAULT ((2)) FOR [Diem]
GO
ALTER TABLE [dbo].[VE] ADD  CONSTRAINT [DF_VE_TrangThaiDat]  DEFAULT ((0)) FOR [TrangThaiDat]
GO
ALTER TABLE [dbo].[CHITIET_GHE_PHONG]  WITH CHECK ADD  CONSTRAINT [FK_CHITIET_GHE_PHONG_GHE] FOREIGN KEY([IdGhe])
REFERENCES [dbo].[GHE] ([IdGhe])
GO
ALTER TABLE [dbo].[CHITIET_GHE_PHONG] CHECK CONSTRAINT [FK_CHITIET_GHE_PHONG_GHE]
GO
ALTER TABLE [dbo].[CHITIET_GHE_PHONG]  WITH CHECK ADD  CONSTRAINT [FK_CHITIET_GHE_PHONG_LOAIGHE] FOREIGN KEY([IdLoaiGhe])
REFERENCES [dbo].[LOAIGHE] ([IdLoaiGhe])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CHITIET_GHE_PHONG] CHECK CONSTRAINT [FK_CHITIET_GHE_PHONG_LOAIGHE]
GO
ALTER TABLE [dbo].[CHITIET_GHE_PHONG]  WITH CHECK ADD  CONSTRAINT [FK_CHITIET_GHE_PHONG_PHONG] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[PHONG] ([MaPhong])
GO
ALTER TABLE [dbo].[CHITIET_GHE_PHONG] CHECK CONSTRAINT [FK_CHITIET_GHE_PHONG_PHONG]
GO
ALTER TABLE [dbo].[CHITIET_THAYDOIGIA]  WITH CHECK ADD  CONSTRAINT [FK_CHITIET_THAYDOIGIA_LICH_CHIEU] FOREIGN KEY([MaSuatChieu])
REFERENCES [dbo].[LICH_CHIEU] ([MaSuatChieu])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CHITIET_THAYDOIGIA] CHECK CONSTRAINT [FK_CHITIET_THAYDOIGIA_LICH_CHIEU]
GO
ALTER TABLE [dbo].[CHITIET_THAYDOIGIA]  WITH CHECK ADD  CONSTRAINT [FK_CHITIET_THAYDOIGIA_THAYDOIGIA] FOREIGN KEY([IdThayDoi])
REFERENCES [dbo].[THAYDOIGIA] ([IdThayDoiGia])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CHITIET_THAYDOIGIA] CHECK CONSTRAINT [FK_CHITIET_THAYDOIGIA_THAYDOIGIA]
GO
ALTER TABLE [dbo].[DANHGIAPHIM]  WITH CHECK ADD  CONSTRAINT [FK_DANHGIAPHIM_KHACH_HANG] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACH_HANG] ([MaKH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DANHGIAPHIM] CHECK CONSTRAINT [FK_DANHGIAPHIM_KHACH_HANG]
GO
ALTER TABLE [dbo].[DANHGIAPHIM]  WITH CHECK ADD  CONSTRAINT [FK_DANHGIAPHIM_PHIM] FOREIGN KEY([MaPhim])
REFERENCES [dbo].[PHIM] ([MaPhim])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DANHGIAPHIM] CHECK CONSTRAINT [FK_DANHGIAPHIM_PHIM]
GO
ALTER TABLE [dbo].[KHACH_HANG]  WITH CHECK ADD  CONSTRAINT [FK_KHACH_HANG_TAIKHOAN] FOREIGN KEY([Email])
REFERENCES [dbo].[TAIKHOAN] ([Email])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[KHACH_HANG] CHECK CONSTRAINT [FK_KHACH_HANG_TAIKHOAN]
GO
ALTER TABLE [dbo].[LICH_CHIEU]  WITH CHECK ADD  CONSTRAINT [FK_LICH_CHIEU_PHIM] FOREIGN KEY([MaPhim])
REFERENCES [dbo].[PHIM] ([MaPhim])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[LICH_CHIEU] CHECK CONSTRAINT [FK_LICH_CHIEU_PHIM]
GO
ALTER TABLE [dbo].[LICH_CHIEU]  WITH CHECK ADD  CONSTRAINT [FK_LICH_CHIEU_Phong] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[PHONG] ([MaPhong])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[LICH_CHIEU] CHECK CONSTRAINT [FK_LICH_CHIEU_Phong]
GO
ALTER TABLE [dbo].[NHAN_VIEN]  WITH CHECK ADD  CONSTRAINT [FK_NHAN_VIEN_CHINHANH] FOREIGN KEY([MaChiNhanh])
REFERENCES [dbo].[CHINHANH] ([MaChiNhanh])
GO
ALTER TABLE [dbo].[NHAN_VIEN] CHECK CONSTRAINT [FK_NHAN_VIEN_CHINHANH]
GO
ALTER TABLE [dbo].[NHAN_VIEN]  WITH CHECK ADD  CONSTRAINT [FK_NHAN_VIEN_TAIKHOAN] FOREIGN KEY([Email])
REFERENCES [dbo].[TAIKHOAN] ([Email])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[NHAN_VIEN] CHECK CONSTRAINT [FK_NHAN_VIEN_TAIKHOAN]
GO
ALTER TABLE [dbo].[PHIM]  WITH CHECK ADD  CONSTRAINT [FK_PHIM_DAODIEN] FOREIGN KEY([IdDaoDien])
REFERENCES [dbo].[DAODIEN] ([IdDaoDien])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PHIM] CHECK CONSTRAINT [FK_PHIM_DAODIEN]
GO
ALTER TABLE [dbo].[PHONG]  WITH CHECK ADD  CONSTRAINT [FK_PHONG_CHINHANH] FOREIGN KEY([MaChiNhanh])
REFERENCES [dbo].[CHINHANH] ([MaChiNhanh])
GO
ALTER TABLE [dbo].[PHONG] CHECK CONSTRAINT [FK_PHONG_CHINHANH]
GO
ALTER TABLE [dbo].[TAIKHOAN]  WITH CHECK ADD  CONSTRAINT [FK_TAIKHOAN_Quyen] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[QUYEN] ([MaQuyen])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TAIKHOAN] CHECK CONSTRAINT [FK_TAIKHOAN_Quyen]
GO
ALTER TABLE [dbo].[THE_LOAI_PHIM]  WITH CHECK ADD  CONSTRAINT [FK__THE_LOAI_P__MaTL__1AD3FDA4] FOREIGN KEY([MaTL])
REFERENCES [dbo].[THE_LOAI] ([MaTL])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[THE_LOAI_PHIM] CHECK CONSTRAINT [FK__THE_LOAI_P__MaTL__1AD3FDA4]
GO
ALTER TABLE [dbo].[THE_LOAI_PHIM]  WITH CHECK ADD  CONSTRAINT [FK_THE_LOAI_PHIM_PHIM] FOREIGN KEY([MaPhim])
REFERENCES [dbo].[PHIM] ([MaPhim])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[THE_LOAI_PHIM] CHECK CONSTRAINT [FK_THE_LOAI_PHIM_PHIM]
GO
ALTER TABLE [dbo].[VAIDIEN]  WITH CHECK ADD  CONSTRAINT [FK_VAIDIEN_DIENVIEN] FOREIGN KEY([IdDienVien])
REFERENCES [dbo].[DIENVIEN] ([IdDienVien])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[VAIDIEN] CHECK CONSTRAINT [FK_VAIDIEN_DIENVIEN]
GO
ALTER TABLE [dbo].[VAIDIEN]  WITH CHECK ADD  CONSTRAINT [FK_VAIDIEN_PHIM] FOREIGN KEY([MaPhim])
REFERENCES [dbo].[PHIM] ([MaPhim])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[VAIDIEN] CHECK CONSTRAINT [FK_VAIDIEN_PHIM]
GO
ALTER TABLE [dbo].[VE]  WITH CHECK ADD  CONSTRAINT [FK__VE__MaKH__2E1BDC42] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACH_HANG] ([MaKH])
GO
ALTER TABLE [dbo].[VE] CHECK CONSTRAINT [FK__VE__MaKH__2E1BDC42]
GO
ALTER TABLE [dbo].[VE]  WITH CHECK ADD  CONSTRAINT [FK__VE__MaSuatChieu__0F624AF8] FOREIGN KEY([MaSuatChieu])
REFERENCES [dbo].[LICH_CHIEU] ([MaSuatChieu])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[VE] CHECK CONSTRAINT [FK__VE__MaSuatChieu__0F624AF8]
GO
ALTER TABLE [dbo].[VE]  WITH CHECK ADD  CONSTRAINT [FK_VE_CHITIET_GHE_PHONG] FOREIGN KEY([IdGheDat])
REFERENCES [dbo].[CHITIET_GHE_PHONG] ([IdGheDat])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[VE] CHECK CONSTRAINT [FK_VE_CHITIET_GHE_PHONG]
GO
ALTER TABLE [dbo].[VE]  WITH CHECK ADD  CONSTRAINT [FK_VE_NHAN_VIEN] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NHAN_VIEN] ([MaNV])
GO
ALTER TABLE [dbo].[VE] CHECK CONSTRAINT [FK_VE_NHAN_VIEN]
GO
ALTER TABLE [dbo].[PHIM]  WITH CHECK ADD  CONSTRAINT [CK_PHIM_Diem] CHECK  (([Diem]<=(5)))
GO
ALTER TABLE [dbo].[PHIM] CHECK CONSTRAINT [CK_PHIM_Diem]
GO
/****** Object:  StoredProcedure [dbo].[Check_TrangThaiPhong]    Script Date: 04/07/2025 12:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Check_TrangThaiPhong]
    @MaPhim INT,
    @GioChieu TIME,
    @NgayChieu DATE,
    @MaPhong VARCHAR(10)
AS
BEGIN
    DECLARE @ThoiLuongPhim INT;
    DECLARE @BatDau DATETIME, @KetThuc DATETIME;
    DECLARE @BatDauCu DATETIME, @KetThucCu DATETIME;
    DECLARE @MaPhimCu INT;
    DECLARE @Result INT;

    SELECT @ThoiLuongPhim = ThoiLuong
    FROM Phim
    WHERE MaPhim = @MaPhim;

    SET @BatDau = CAST(@NgayChieu AS DATETIME) + CAST(@GioChieu AS DATETIME);
    SET @KetThuc = DATEADD(MINUTE, @ThoiLuongPhim + 10, @BatDau);

    PRINT 'ThoiLuongPhim: ' + CAST(@ThoiLuongPhim AS VARCHAR);
    PRINT 'BatDau: ' + CAST(@BatDau AS VARCHAR);
    PRINT 'KetThuc: ' + CAST(@KetThuc AS VARCHAR);

    DECLARE cur CURSOR FOR
    SELECT MaPhim, GioChieu
    FROM LICH_CHIEU
    WHERE MaPhong = @MaPhong
    AND NgayChieu = @NgayChieu;

    OPEN cur;
    FETCH NEXT FROM cur INTO @MaPhimCu, @GioChieu;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SELECT @ThoiLuongPhim = ThoiLuong
        FROM Phim
        WHERE MaPhim = @MaPhimCu;

        SET @BatDauCu = CAST(@NgayChieu AS DATETIME) + CAST(@GioChieu AS DATETIME);
        SET @KetThucCu = DATEADD(MINUTE, @ThoiLuongPhim + 10, @BatDauCu);

        PRINT 'ThoiLuongPhim Cu: ' + CAST(@ThoiLuongPhim AS VARCHAR);
        PRINT 'BatDauCu: ' + CAST(@BatDauCu AS VARCHAR);
        PRINT 'KetThucCu: ' + CAST(@KetThucCu AS VARCHAR);

        IF (@BatDau < @KetThucCu AND @KetThuc > @BatDauCu)
        BEGIN
            PRINT N'Phòng đã có suất chiếu trong khoảng thời gian này.';
            SET @Result = 0;
            CLOSE cur;
            DEALLOCATE cur;
            SELECT @Result AS Result;  -- Trả về giá trị thông qua SELECT
            RETURN;
        END

        FETCH NEXT FROM cur INTO @MaPhimCu, @GioChieu;
    END

    CLOSE cur;
    DEALLOCATE cur;

    PRINT N'Phòng có thể được sử dụng cho suất chiếu mới.';
    SET @Result = 1;
    SELECT @Result AS Result;  -- Trả về giá trị thông qua SELECT
END;

GO
/****** Object:  StoredProcedure [dbo].[GetMovieRecommendations]    Script Date: 04/07/2025 12:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMovieRecommendations]
    @favorite_genre NVARCHAR(50), -- Thể loại yêu thích
    @favorite_time NVARCHAR(20)   -- Khung giờ yêu thích
AS
BEGIN
    SELECT TOP 3 p.TenPhim, lc.GioChieu
    FROM PHIM p
    JOIN LICH_CHIEU lc ON p.MaPhim = lc.MaPhim
    JOIN THE_LOAI_PHIM tlp ON p.MaPhim = tlp.MaPhim
    JOIN THE_LOAI tl ON tlp.MaTL = tl.MaTL
    WHERE tl.TenTL = @favorite_genre -- Thể loại yêu thích
    AND (
        (@favorite_time = N'Buổi tối' AND DATEPART(HOUR, lc.GioChieu) BETWEEN 18 AND 23) OR
        (@favorite_time = N'Buổi chiều' AND DATEPART(HOUR, lc.GioChieu) BETWEEN 12 AND 17) OR
        (@favorite_time = N'Buổi sáng' AND DATEPART(HOUR, lc.GioChieu) BETWEEN 6 AND 11)
    )
    ORDER BY NEWID() -- Gợi ý ngẫu nhiên
END

GO
/****** Object:  StoredProcedure [dbo].[SP_CapNhatTrangThaiPhim]    Script Date: 04/07/2025 12:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CapNhatTrangThaiPhim]
AS
BEGIN
    UPDATE Phim
    SET MaTT = 1
    WHERE NgayKhoiChieu <= GETDATE() 
          AND MaTT <> 0;

    UPDATE Phim
    SET MaTT = 2
    WHERE NgayKhoiChieu > GETDATE()
          AND MaTT <> 0;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TimKiemChiNhanhHayDatVe]    Script Date: 04/07/2025 12:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TimKiemChiNhanhHayDatVe]
    @MaKH INT
AS
BEGIN
    SELECT CN.MaChiNhanh, CN.TenChiNhanh, CN.DiaChi, COUNT(*) AS SoLuongDatVe
    FROM VE V
    JOIN LICH_CHIEU LC ON V.MaSuatChieu = LC.MaSuatChieu
    JOIN PHONG P ON LC.MaPhong = P.MaPhong
    JOIN CHINHANH CN ON P.MaChiNhanh = CN.MaChiNhanh
    WHERE V.MaKH = @MaKH
    GROUP BY CN.MaChiNhanh, CN.TenChiNhanh, CN.DiaChi
    ORDER BY SoLuongDatVe DESC
END
GO
/****** Object:  StoredProcedure [dbo].[ThongKeDanhGiaTheoPhim]    Script Date: 04/07/2025 12:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThongKeDanhGiaTheoPhim]
    @maPhim INT
AS
BEGIN
    SELECT 
        SUM(CASE WHEN Diem = 1 THEN 1 ELSE 0 END) AS SoLuong1Sao,
        SUM(CASE WHEN Diem = 2 THEN 1 ELSE 0 END) AS SoLuong2Sao,
        SUM(CASE WHEN Diem = 3 THEN 1 ELSE 0 END) AS SoLuong3Sao,
        SUM(CASE WHEN Diem = 4 THEN 1 ELSE 0 END) AS SoLuong4Sao,
        SUM(CASE WHEN Diem = 5 THEN 1 ELSE 0 END) AS SoLuong5Sao
    FROM DanhGiaPhim
    WHERE MaPhim = @maPhim
END

GO
/****** Object:  StoredProcedure [dbo].[ThongKePhim]    Script Date: 04/07/2025 12:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThongKePhim]
AS
BEGIN
    SELECT 
        p.TenPhim,
        COUNT(v.MaVe) AS SoVeBanRa,
        ISNULL(p.Diem, 0) AS Diem,
        (COUNT(v.MaVe) * 0.7 + ISNULL(p.Diem, 0) * 0.3) AS DiemTongHop
    FROM 
        PHIM p
    INNER JOIN 
        LICH_CHIEU lc ON p.MaPhim = lc.MaPhim
    LEFT JOIN 
        VE v ON lc.MaSuatChieu = v.MaSuatChieu
    WHERE p.MaTT = 1
    GROUP BY 
        p.MaPhim, p.TenPhim, p.Diem
    ORDER BY 
        DiemTongHop DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[ThongKePhimBanChayNhat]    Script Date: 04/07/2025 12:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThongKePhimBanChayNhat]
AS
BEGIN
    WITH DiemTongHopCTE AS (
        SELECT 
            p.MaPhim,
            p.TenPhim,
            COUNT(v.MaVe) AS SoLuongVe, 
			ISNULL(p.Diem, 0) AS Diem,
			(COUNT(v.MaVe) * 0.7 + ISNULL(p.Diem, 0) * 0.3) AS DiemTongHop
        FROM PHIM p
        INNER JOIN LICH_CHIEU lc ON p.MaPhim = lc.MaPhim
        LEFT JOIN VE v ON lc.MaSuatChieu = v.MaSuatChieu
        WHERE p.MaTT = 1
        GROUP BY p.MaPhim, p.TenPhim, p.Diem
    )
    SELECT TOP 1
        MaPhim,
        TenPhim,
        SoLuongVe,
        Diem,
        DiemTongHop
    FROM DiemTongHopCTE
    ORDER BY DiemTongHop DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateTrangThaiPhong]    Script Date: 04/07/2025 12:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateTrangThaiPhong]
AS
BEGIN
    DECLARE @MaPhim INT, @GioChieu TIME, @ThoiLuong INT, @NgayChieu DATE, @MaPhong VARCHAR(10);
    DECLARE @ThoiLuongPhim INT;
    DECLARE @BatDau DATETIME, @KetThuc DATETIME;
    
    DECLARE cur CURSOR FOR
    SELECT MaPhim, GioChieu, NgayChieu, MaPhong
    FROM LICH_CHIEU
    WHERE NgayChieu = CAST(GETDATE() AS DATE);

    OPEN cur;

    FETCH NEXT FROM cur INTO @MaPhim, @GioChieu, @NgayChieu, @MaPhong;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SELECT @ThoiLuongPhim = ThoiLuong
        FROM Phim
        WHERE MaPhim = @MaPhim;

        SET @BatDau = CAST(@NgayChieu AS DATETIME) + CAST(@GioChieu AS DATETIME);
        SET @KetThuc = DATEADD(MINUTE, @ThoiLuongPhim + 10, @BatDau);

        IF @BatDau <= GETDATE() AND @KetThuc >= GETDATE()
        BEGIN
            UPDATE Phong
            SET TrangThai = 1
            WHERE MaPhong = @MaPhong AND TrangThai != 1;
        END
        ELSE IF @KetThuc <= GETDATE()
        BEGIN
            UPDATE Phong
            SET TrangThai = 0 
            WHERE MaPhong = @MaPhong AND TrangThai != 0;
        END
        FETCH NEXT FROM cur INTO @MaPhim, @GioChieu, @NgayChieu, @MaPhong;
    END

    CLOSE cur;
    DEALLOCATE cur;
END;

GO
USE [master]
GO
ALTER DATABASE [CINEMA] SET  READ_WRITE 
GO
