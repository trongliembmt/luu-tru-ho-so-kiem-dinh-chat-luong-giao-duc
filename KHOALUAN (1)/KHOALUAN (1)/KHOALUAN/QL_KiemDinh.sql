CREATE DATABASE [QL_KIEMDINH]
GO
USE [QL_KIEMDINH]
GO
--Tao bang 
CREATE TABLE [dbo].[KEHOACHCAITIEN](
	[MAKH] [int] IDENTITY(1,1) NOT NULL,
	[TENKH] [nvarchar](50) NULL,
	[DUONGDAN] [nvarchar](50) NULL,
	[MA_TC] [int] 
 CONSTRAINT [PK_KHCAITIEN] PRIMARY KEY CLUSTERED 
(
	[MAKH] ASC
))

GO
CREATE TABLE [dbo].[VANBAN](
	[MAVB] [int] IDENTITY(1,1) NOT NULL,
	[TENVB] [nvarchar](50) NULL,
	[LOAIVB] [nvarchar](50) NULL,
	[CHUANQUIDINH] int NULL,
 CONSTRAINT [PK_VANBAN] PRIMARY KEY CLUSTERED 
(
	[MAVB] ASC
))

GO
CREATE TABLE [dbo].[CHUCVU](
	[MA_CV] [int] IDENTITY(1,1) NOT NULL,
	[TEN_CV] [nvarchar](50) NULL,
 CONSTRAINT [PK_CHUCVU] PRIMARY KEY CLUSTERED 
(
	[MA_CV] ASC
))

GO
CREATE TABLE [dbo].[HOSOBC](
	[MABAOCAO] [int] IDENTITY(1,1) NOT NULL,
	[DONVI_BC] [nvarchar](500) NULL,
	[CHUDE_BC] [nvarchar](500) NULL,
	[GIAIDOAN_BC] [nvarchar](500) NULL,
 CONSTRAINT [PK_HOSO] PRIMARY KEY CLUSTERED 
(
	[MABAOCAO] ASC
))

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KQ_DANHGIA_PHAN1](
	[MA_KQ] [int] IDENTITY(1,1) NOT NULL,
	[DIEM_DG] [int] NULL,
	[GHICHU] [nvarchar](500) NULL,
	[NGAYDG] [datetime] NULL,
	[MATP] [int] NULL,
	[MANDG] [int] NULL,
 CONSTRAINT [KQ_DANHGIA_P1] PRIMARY KEY CLUSTERED 
(
	[MA_KQ] ASC
))

GO

CREATE TABLE [dbo].[KQ_DANHGIA_PHAN3](
	[MA_KQ] [int] IDENTITY(1,1) NOT NULL,
	[DIEM_DG] [int] NULL,
	[GHICHU] [nvarchar](500) NULL,
	[NGAYDG] [datetime] NULL,
	[MATP] [int] NULL,
	[MANDG] [int] NULL,
 CONSTRAINT [KQ_DANHGIA_P3] PRIMARY KEY CLUSTERED 
(
	[MA_KQ] ASC
))

GO

CREATE TABLE [dbo].[KQ_DANHGIA_PHAN4](
	[MA_KQ] [int] IDENTITY(1,1) NOT NULL,
	[DIEM_DG] [int] NULL,
	[GHICHU] [nvarchar](500) NULL,
	[NGAYDG] [datetime] NULL,
	[MAPL] [int] NULL,
	[MANDG] [int] NULL,
 CONSTRAINT [KQ_DANHGIA_P4] PRIMARY KEY CLUSTERED 
(
	[MA_KQ] ASC
))

GO

CREATE TABLE [dbo].[KQ_DANHGIA_TIEUCHI](
	[MA_KQ] [int] IDENTITY(1,1) NOT NULL,
	[DIEM_DG] [int] NULL,
	[GHICHU] [nvarchar](500) NULL,
	[NGAYDG] [datetime] NULL,
	[MATIEUCHI] [int] NULL,
	[MANDG] [int] NULL,
 CONSTRAINT [KQ_DANHGIA_TC] PRIMARY KEY CLUSTERED 
(
	[MA_KQ] ASC
))

GO

CREATE TABLE [dbo].[KQ_KIEMDUYET_PHAN1](
	[MA_KQ] [int] IDENTITY(1,1) NOT NULL,
	[TINHTRANG] [nvarchar](50) NULL,
	[GHICHU] [nvarchar](500) NULL,
	[NGAYKD] [datetime] NULL,
	[MATP] [int] NULL,
 CONSTRAINT [KQ_KIEMDUYET_P1] PRIMARY KEY CLUSTERED 
(
	[MA_KQ] ASC
))

GO

CREATE TABLE [dbo].[KQ_KIEMDUYET_PHAN3](
	[MA_KQ] [int] IDENTITY(1,1) NOT NULL,
	[TINHTRANG] [nvarchar](50) NULL,
	[GHICHU] [nvarchar](500) NULL,
	[NGAYKD] [datetime] NULL,
	[MATP] [int] NULL,
 CONSTRAINT [KQ_KIEMDUYET_P3] PRIMARY KEY CLUSTERED 
(
	[MA_KQ] ASC
))

GO

CREATE TABLE [dbo].[KQ_KIEMDUYET_PHAN4](
	[MA_KQ] [int] IDENTITY(1,1) NOT NULL,
	[TINHTRANG] [nvarchar](50) NULL,
	[GHICHU] [nvarchar](500) NULL,
	[NGAYKD] [datetime] NULL,
	[MAPL] [int] NULL,
 CONSTRAINT [KQ_KIEMDUYET_P4] PRIMARY KEY CLUSTERED 
(
	[MA_KQ] ASC
))
GO

CREATE TABLE [dbo].[KQ_KIEMDUYET_TIEUCCHI](
	[MA_KQ] [int] IDENTITY(1,1) NOT NULL,
	[TINHTRANG] [nvarchar](50) NULL,
	[GHICHU] [nvarchar](500) NULL,
	[NGAYKD] [datetime] NULL,
	[MATIEUCHI] [int] NULL,
 CONSTRAINT [KQ_KIEMDUYET_TC] PRIMARY KEY CLUSTERED 
(
	[MA_KQ] ASC
))
GO

CREATE TABLE [dbo].[MINHCHUNG](
	[MAMINHCHUNG] [char](20) NOT NULL,
	[TENMINHCHUNG] [nvarchar](1000) NULL,
	[MATIEUCHI] [int] NULL,
	[DUONGDAN_ND] [nvarchar](500) NULL,
 CONSTRAINT [PK_MINHCHUNG] PRIMARY KEY CLUSTERED 
(
	[MAMINHCHUNG] ASC
))
GO

CREATE TABLE [dbo].[NHANSU](
	[MA_NS] [int] IDENTITY(1,1) NOT NULL,
	[TEN_NS] [nvarchar](50) NULL,
	[SDT] [char](10) NULL,
	[EMAIL] [nvarchar](50) NULL,
	[GIOITINH] [nvarchar](10) NULL,
	[NGAYSINH] [date] NULL,
	[DIACHI] [nvarchar](500) NULL,
	[TAIKHOAN] [varchar](50) NULL,
	[MATKHAU] [varchar](50) NULL,
	[HINHANH] [varchar](500) NULL,
	[MA_CV] [int] NULL,
	[MA_NH] [int] NULL,
	[MA_NQ] [int] NULL,
 CONSTRAINT [PK_NHANSU] PRIMARY KEY CLUSTERED 
(
	[MA_NS] ASC
))
GO

CREATE TABLE [dbo].[NHOM](
	[MA_NH] [int] IDENTITY(1,1) NOT NULL,
	[TEN_NH] [nvarchar](50) NULL,
	[KYHIEU] [nvarchar](50) NULL,
 CONSTRAINT [PK_NHOM] PRIMARY KEY CLUSTERED 
(
	[MA_NH] ASC
))
GO

CREATE TABLE [dbo].[NHOMQUYEN](
	[MA_NQ] [int] IDENTITY(1,1) NOT NULL,
	[TEN_NQ] [nvarchar](50) NULL,
 CONSTRAINT [PK_NHOMQUYEN] PRIMARY KEY CLUSTERED 
(
	[MA_NQ] ASC
))
GO

CREATE TABLE [dbo].[P1_KHAIQUAT](
	[MATP] [int] IDENTITY(1,1) NOT NULL,
	[TEN_TP] [nvarchar](500) NULL,
	[NOIDUNG_TP] [ntext] NULL,
	[MABAOCAO] [int] NULL,
 CONSTRAINT [PK_KHAIQUAT] PRIMARY KEY CLUSTERED 
(
	[MATP] ASC
))
GO

CREATE TABLE [dbo].[P2_DANHGIA](
	[MADANHGIA] [int] IDENTITY(1,1) NOT NULL,
	[MATIEUCHUAN] [int] NULL,
	[MABAOCAO] [int] NULL,
	[TEN_TP] [nvarchar](500) NULL,
 CONSTRAINT [PK_DANHGIA] PRIMARY KEY CLUSTERED 
(
	[MADANHGIA] ASC
))
GO

CREATE TABLE [dbo].[P3_KETLUAN](
	[MATP] [int] IDENTITY(1,1) NOT NULL,
	[TEN_TP] [nvarchar](500) NULL,
	[NOIDUNG_TP] [ntext] NULL,
	[MABAOCAO] [int] NULL,
 CONSTRAINT [PK_KETLUAN] PRIMARY KEY CLUSTERED 
(
	[MATP] ASC
))
GO

CREATE TABLE [dbo].[P4_PHULUC](
	[MAPL] [int] IDENTITY(1,1) NOT NULL,
	[TEN_PL] [nvarchar](500) NULL,
	[NOIDUNG_PL] [ntext] NULL,
	[MABAOCAO] [int] NULL,
 CONSTRAINT [PK_PHULUC] PRIMARY KEY CLUSTERED 
(
	[MAPL] ASC
))
GO

CREATE TABLE [dbo].[PHANCONG_BC_TV](
	[MAPHANCONG_TV] [int] IDENTITY(1,1) NOT NULL,
	[NGAYPHANCONG] [date] NULL,
	[NOIDUNG_PC] [nvarchar](500) NULL,
	[THOIHAN] [date] NULL,
	[MA_NS] [int] NULL,
	[MABAOCAO] [int] NULL,
 CONSTRAINT [PK_PHANCONG_BC] PRIMARY KEY CLUSTERED 
(
	[MAPHANCONG_TV] ASC
))
GO

CREATE TABLE [dbo].[QUYEN](
	[MA_Q] [int] IDENTITY(1,1) NOT NULL,
	[TEN_Q] [nvarchar](50) NULL,
	[MA_NQ] [int] NULL,
 CONSTRAINT [PK_QUYEN] PRIMARY KEY CLUSTERED 
(
	[MA_Q] ASC
))
GO

CREATE TABLE [dbo].[TIEUCHI](
	[MATIEUCHI] [int] IDENTITY(1,1) NOT NULL,
	[TIEUDETIEUCHI] [nvarchar](1000) NULL,
	[MATIEUCHUAN] [int] NULL,
	[DUONGDAN_ND] [nvarchar](500) NULL,
	[DUONGDAN_CHINHSUA] [nvarchar](500) NULL,
 CONSTRAINT [PK_TIEUCHI] PRIMARY KEY CLUSTERED 
(
	[MATIEUCHI] ASC
))
GO

CREATE TABLE [dbo].[TIEUCHUAN](
	[MATIEUCHUAN] [int] IDENTITY(1,1) NOT NULL,
	[TIEUDETIEUCHUAN] [nvarchar](500) NULL,
 CONSTRAINT [PK_TIEUCHUAN] PRIMARY KEY CLUSTERED 
(
	[MATIEUCHUAN] ASC
))

GO
--Nhap lieu bang Chuc Vu

SET IDENTITY_INSERT [dbo].[CHUCVU] ON 
INSERT [dbo].[CHUCVU] ([MA_CV], [TEN_CV]) VALUES (1, N'Trưởng Khoa')
INSERT [dbo].[CHUCVU] ([MA_CV], [TEN_CV]) VALUES (2, N'Phó Trưởng Khoa')
INSERT [dbo].[CHUCVU] ([MA_CV], [TEN_CV]) VALUES (3, N'Thư ký chương trình')
INSERT [dbo].[CHUCVU] ([MA_CV], [TEN_CV]) VALUES (4, N'Giáo viên')
INSERT [dbo].[CHUCVU] ([MA_CV], [TEN_CV]) VALUES (5, N'Trưởng nhóm CTCT 1')
INSERT [dbo].[CHUCVU] ([MA_CV], [TEN_CV]) VALUES (6, N'Trưởng nhóm CTCT 2')
INSERT [dbo].[CHUCVU] ([MA_CV], [TEN_CV]) VALUES (7, N'Trưởng nhóm CTCT 3')
INSERT [dbo].[CHUCVU] ([MA_CV], [TEN_CV]) VALUES (8, N'Trưởng nhóm CTCT 4')
INSERT [dbo].[CHUCVU] ([MA_CV], [TEN_CV]) VALUES (9, N'Trưởng nhóm CTCT 5')
INSERT [dbo].[CHUCVU] ([MA_CV], [TEN_CV]) VALUES (10, N'Sinh viên')
INSERT [dbo].[CHUCVU] ([MA_CV], [TEN_CV]) VALUES (11, N'Nhóm đánh giá')
SET IDENTITY_INSERT [dbo].[CHUCVU] OFF
GO
--Nhap lieu bang Ho So Bao Cao

SET IDENTITY_INSERT [dbo].[HOSOBC] ON 
INSERT [dbo].[HOSOBC] ([MABAOCAO], [DONVI_BC], [CHUDE_BC], [GIAIDOAN_BC]) VALUES (1, NULL, N'Phần 1. Khái Quát', NULL)
INSERT [dbo].[HOSOBC] ([MABAOCAO], [DONVI_BC], [CHUDE_BC], [GIAIDOAN_BC]) VALUES (2, NULL, N'Phần 2. Tự Đánh Giá', NULL)
INSERT [dbo].[HOSOBC] ([MABAOCAO], [DONVI_BC], [CHUDE_BC], [GIAIDOAN_BC]) VALUES (3, NULL, N'Phần 3. Kết Luận', NULL)
INSERT [dbo].[HOSOBC] ([MABAOCAO], [DONVI_BC], [CHUDE_BC], [GIAIDOAN_BC]) VALUES (4, NULL, N'Phần 4. Phụ Lục', NULL)
SET IDENTITY_INSERT [dbo].[HOSOBC] OFF

GO
--Nhap lieu bang Ket Qua Danh Gia Phan 1


SET IDENTITY_INSERT [dbo].[KQ_DANHGIA_PHAN1] ON 
INSERT [dbo].[KQ_DANHGIA_PHAN1] ([MA_KQ], [DIEM_DG], [GHICHU], [NGAYDG], [MATP], [MANDG]) VALUES (14, NULL, N'Tốt', CAST(N'2022-11-18 09:50:52.000' AS DateTime), NULL, 1019)
INSERT [dbo].[KQ_DANHGIA_PHAN1] ([MA_KQ], [DIEM_DG], [GHICHU], [NGAYDG], [MATP], [MANDG]) VALUES (15, 7, N'Tốt', CAST(N'2022-11-18 09:55:10.000' AS DateTime), NULL, 1020)
INSERT [dbo].[KQ_DANHGIA_PHAN1] ([MA_KQ], [DIEM_DG], [GHICHU], [NGAYDG], [MATP], [MANDG]) VALUES (16, 6, N'Đạt', CAST(N'2022-11-18 15:50:14.000' AS DateTime), NULL, 1021)
SET IDENTITY_INSERT [dbo].[KQ_DANHGIA_PHAN1] OFF

GO
--Nhap lieu bang Ket Qua Danh Gia Phan 3

SET IDENTITY_INSERT [dbo].[KQ_DANHGIA_PHAN3] ON 
INSERT [dbo].[KQ_DANHGIA_PHAN3] ([MA_KQ], [DIEM_DG], [GHICHU], [NGAYDG], [MATP], [MANDG]) VALUES (6, NULL, N'Tốt', CAST(N'2022-11-18 09:51:46.000' AS DateTime), NULL, 1019)
INSERT [dbo].[KQ_DANHGIA_PHAN3] ([MA_KQ], [DIEM_DG], [GHICHU], [NGAYDG], [MATP], [MANDG]) VALUES (7, 5, N'Tốt', CAST(N'2022-11-18 09:55:21.000' AS DateTime), NULL, 1020)
INSERT [dbo].[KQ_DANHGIA_PHAN3] ([MA_KQ], [DIEM_DG], [GHICHU], [NGAYDG], [MATP], [MANDG]) VALUES (8, 7, N'Đạt', CAST(N'2022-11-18 15:50:30.000' AS DateTime), NULL, 1021)
SET IDENTITY_INSERT [dbo].[KQ_DANHGIA_PHAN3] OFF

GO
--Nhap lieu bang Ket Qua Danh Gia Phan 4

SET IDENTITY_INSERT [dbo].[KQ_DANHGIA_PHAN4] ON 
INSERT [dbo].[KQ_DANHGIA_PHAN4] ([MA_KQ], [DIEM_DG], [GHICHU], [NGAYDG], [MAPL], [MANDG]) VALUES (8, NULL, N'Tốt', CAST(N'2022-11-18 09:51:57.000' AS DateTime), NULL, 1019)
INSERT [dbo].[KQ_DANHGIA_PHAN4] ([MA_KQ], [DIEM_DG], [GHICHU], [NGAYDG], [MAPL], [MANDG]) VALUES (9, 4, N'Tốt', CAST(N'2022-11-18 09:55:30.000' AS DateTime), NULL, 1020)
INSERT [dbo].[KQ_DANHGIA_PHAN4] ([MA_KQ], [DIEM_DG], [GHICHU], [NGAYDG], [MAPL], [MANDG]) VALUES (10, 3, N'Chưa Đạt', CAST(N'2022-11-18 15:51:11.000' AS DateTime), NULL, 1021)
SET IDENTITY_INSERT [dbo].[KQ_DANHGIA_PHAN4] OFF

GO
--Nhap lieu bang Ket Qua Danh Gia Tieu Chi

SET IDENTITY_INSERT [dbo].[KQ_DANHGIA_TIEUCHI] ON 
INSERT [dbo].[KQ_DANHGIA_TIEUCHI] ([MA_KQ], [DIEM_DG], [GHICHU], [NGAYDG], [MATIEUCHI], [MANDG]) VALUES (23, NULL, N'Tốt', CAST(N'2022-11-18 09:51:09.000' AS DateTime), 9, 1019)
INSERT [dbo].[KQ_DANHGIA_TIEUCHI] ([MA_KQ], [DIEM_DG], [GHICHU], [NGAYDG], [MATIEUCHI], [MANDG]) VALUES (24, NULL, N'Tốt', CAST(N'2022-11-18 09:51:15.000' AS DateTime), 10, 1019)
INSERT [dbo].[KQ_DANHGIA_TIEUCHI] ([MA_KQ], [DIEM_DG], [GHICHU], [NGAYDG], [MATIEUCHI], [MANDG]) VALUES (25, 5, N'Tốt', CAST(N'2022-11-18 09:55:40.000' AS DateTime), 9, 1020)
INSERT [dbo].[KQ_DANHGIA_TIEUCHI] ([MA_KQ], [DIEM_DG], [GHICHU], [NGAYDG], [MATIEUCHI], [MANDG]) VALUES (26, 7, N'Tốt', CAST(N'2022-11-18 09:55:47.000' AS DateTime), 10, 1020)
INSERT [dbo].[KQ_DANHGIA_TIEUCHI] ([MA_KQ], [DIEM_DG], [GHICHU], [NGAYDG], [MATIEUCHI], [MANDG]) VALUES (27, 6, N'Cần thêm minh chứng', CAST(N'2022-11-18 13:45:45.000' AS DateTime), 1031, 1020)
INSERT [dbo].[KQ_DANHGIA_TIEUCHI] ([MA_KQ], [DIEM_DG], [GHICHU], [NGAYDG], [MATIEUCHI], [MANDG]) VALUES (28, 5, N'Đạt', CAST(N'2022-11-18 15:48:59.000' AS DateTime), 1020, 1020)
INSERT [dbo].[KQ_DANHGIA_TIEUCHI] ([MA_KQ], [DIEM_DG], [GHICHU], [NGAYDG], [MATIEUCHI], [MANDG]) VALUES (29, 2, N'Chưa Đạt', CAST(N'2022-11-18 15:50:43.000' AS DateTime), 12, 1021)
SET IDENTITY_INSERT [dbo].[KQ_DANHGIA_TIEUCHI] OFF

GO
--Nhap lieu bang Ket Qua Kiem Duyet Phan 1

SET IDENTITY_INSERT [dbo].[KQ_KIEMDUYET_PHAN1] ON 
INSERT [dbo].[KQ_KIEMDUYET_PHAN1] ([MA_KQ], [TINHTRANG], [GHICHU], [NGAYKD], [MATP]) VALUES (2, N'Duyệt', N'Đạt', CAST(N'2022-11-18 09:34:02.000' AS DateTime), NULL)
INSERT [dbo].[KQ_KIEMDUYET_PHAN1] ([MA_KQ], [TINHTRANG], [GHICHU], [NGAYKD], [MATP]) VALUES (3, N'Chưa Duyệt', N'Cần chữ đỏ', CAST(N'2022-11-18 13:41:35.000' AS DateTime), NULL)
INSERT [dbo].[KQ_KIEMDUYET_PHAN1] ([MA_KQ], [TINHTRANG], [GHICHU], [NGAYKD], [MATP]) VALUES (4, N'Duyệt', N'Đồng Ý', CAST(N'2022-11-18 13:42:50.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[KQ_KIEMDUYET_PHAN1] OFF

GO
--Nhap lieu bang Ket Qua Kiem Duyet Phan 3

SET IDENTITY_INSERT [dbo].[KQ_KIEMDUYET_PHAN3] ON 
INSERT [dbo].[KQ_KIEMDUYET_PHAN3] ([MA_KQ], [TINHTRANG], [GHICHU], [NGAYKD], [MATP]) VALUES (1, N'Duyệt', N'Tốt', CAST(N'2022-11-18 09:35:01.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[KQ_KIEMDUYET_PHAN3] OFF

GO
--Nhap lieu bang Ket Qua Kiem Duyet Phan 4

SET IDENTITY_INSERT [dbo].[KQ_KIEMDUYET_PHAN4] ON 
INSERT [dbo].[KQ_KIEMDUYET_PHAN4] ([MA_KQ], [TINHTRANG], [GHICHU], [NGAYKD], [MAPL]) VALUES (1, N'CHƯA Duyệt', N'P4_CHỈNH SỬA THÊM', CAST(N'2022-11-18 09:35:16.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[KQ_KIEMDUYET_PHAN4] OFF

GO
--Nhap lieu bang Ket Qua Kiem Duyet Tieu Chi

SET IDENTITY_INSERT [dbo].[KQ_KIEMDUYET_TIEUCCHI] ON 
INSERT [dbo].[KQ_KIEMDUYET_TIEUCCHI] ([MA_KQ], [TINHTRANG], [GHICHU], [NGAYKD], [MATIEUCHI]) VALUES (1003, N'Chưa Duyệt', N'TC1.1_Chưa Duyệt', CAST(N'2022-11-18 09:34:27.000' AS DateTime), 9)
INSERT [dbo].[KQ_KIEMDUYET_TIEUCCHI] ([MA_KQ], [TINHTRANG], [GHICHU], [NGAYKD], [MATIEUCHI]) VALUES (1004, N'Duyệt', N'TC1.2_Đạt', CAST(N'2022-11-18 09:34:45.000' AS DateTime), 10)
SET IDENTITY_INSERT [dbo].[KQ_KIEMDUYET_TIEUCCHI] OFF
GO
--Nhap lieu bang Minh Chung
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'1                   ', N'Minh chứng 2.1.1', 1051, N'https://drive.google.com/file/d/1rh8pXnQXkNzt3Mnartbhs7r19szWMdd3/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H1.01.01.01         ', N'Đề án thành lập Trường Đại học Công nghiệp Thực phẩm Thành phố Hồ Chí Minh trên cơ sở nâng cấp Trường Cao đẳng Công nghiệp Thực  phẩm Thành phố Hồ Chí Minh', 9, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H1.01.01.02         ', N'Tầm nhìn 2020, sứ mạng 2015, chính sách chất lượng 2013 của Trường Đại học Công nghiệp Thực phẩm Thành phố Hồ Chí Minh', 9, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H1.01.02.01         ', N'Công văn 2196/BGDĐT-GDĐH về việc hướng dẫn xây dựng và công bố chuẩn đầu ra	', 10, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H1.01.02.03         ', N'Quyết định về việc phê duyệt tầm nhìn, sứ mạng, giá trị cốt lõi và triết lý giáo dục của Trường Đại học Công nghiệp Thực phẩm TP. Hồ Chí Minh', 10, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H10.10.01.01        ', N'Quy chế đào tạo đại học của trường ĐH CNTP', 1039, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H10.10.01.02        ', N'Quyết định ban hành chuẩn đầu ra các ngành đào tạo đại học', 1039, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H10.10.02.02        ', N'Kế hoạch thực hiện cập nhật, đánh giá  chương trình đào tạo', 1040, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H10.10.03.01        ', N'Đề cương học phần', 1041, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H10.10.04.01        ', N'Kỷ yếu nghiên cứu khoa học cấp khoa.', 1042, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H10.10.05.03        ', N'Phiếu đề nghị bổ sung sách, giáo trình, tài liệu, học liệu phục vụ  chuyên ngành CNTT', 1043, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H10.10.06.01        ', N'Quy  định  về  công  tác  giáo  viên  chủ nhiệm', 1044, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H11.11.01.01        ', N'Qui chế đào tạo tín chỉ', 1045, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H11.11.02.01        ', N'Niêm giám đào tạo', 1046, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H11.11.03.01        ', N'–   Kế hoạch thu thập, kết quả việc làm của sinh viên sau tốt nghiệp –   Bổ  sung  văn  bản	thành  lập/giao nhiệm vụ phòng đảm bảo chất lượng Báo cáo tổng kết/đánh giá tỉ lệ tốt nghiệp  về  người  tốt	nghiệp  (trong vòng 2 năm sau khi tốt nghiệp) trong đó có số liệu thống kê, theo dõi, báo cáo tổng kết/đánh giá tỉ lệ tốt nghiệp, tỉ lệ có việc làm, thu nhập bình quân của 5 khóa tốt nghiệp	', 1047, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H11.11.04.01        ', N'Quy chế NCKH dành cho sinh viên.', 1048, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H11.11.05.01        ', N'Các quy định về phương pháp đo lường sự hài lòng của các bên liên quan', 1049, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H2.02.02.01         ', N'Biễu mẫu đề cương chi tiết học phần ban hành', 11, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H2.02.02.02         ', N'Bản mô tả CTĐT (Ma trận chương trình đào tạo – chuẩn đầu ra của học phần)', 11, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H2.02.03.01         ', N'Đề án tuyển sinh đi kèm với chương trình tư vấn hướng nghiệp', 12, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H2.02.03.02         ', N'Thông báo về việc khảo sát sự hài lòng của người học đối với học phần', 12, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H3.03.01.01         ', N'Quyết định ban hành Quy định về Quy chế đào tạo theo hê thống tín chỉ', 14, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H3.03.01.02         ', N'Quyết định về ban hành Quy định về quy trình  xây  dựng,  thẩm  định,  ban  hành  chương trình đào tạo trình độ đại học và  quy  định  về  khối  lượng  kiến  thức  tối  thiểu, yêu cầu về năng lực mà người học  đạt được sau khi tốt nghiệp đối với trình  độ đào tạo đại học.', 14, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H3.03.02.01         ', N'Quyết định về ban hành Quy định về quy trình  xây  dựng,  thẩm  định,  ban  hành chương trình đào tạo trình độ đại học và quy  định  về  khối  lượng  kiến  thức  tối  thiểu, yêu cầu về năng lực mà người học  đạt được sau khi tốt nghiệp đối với trình độ đào tạo đại học', 15, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H3.03.02.02         ', N'Bản mô tả CTĐT đại học ngành CNTT hệ  chính  quy  (phần  chuẩn  đầu  ra  của CTĐT)', 15, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H3.03.03.01         ', N'Thông tư số 07/2015/TT-BGDĐT V/v Ban hành quy định về khối lượng kiến thức tối thiểu, yêu cầu về năng lực mà người học đạt được sau khi tốt nghiệp đối với mỗi trình độ đào tạo của giáo dục  đại  học  và  quy  trình  xây  dựng,  thẩm định,  ban  hành  chương  trình  đào  tạo trình độ Đại học, Thạc sĩ, Tiến sĩ', 1008, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H3.03.03.02         ', N'Bản mô tả CTĐT ngành CNTT (phần nội dung chương trình)', 1008, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H4.04.01.01         ', N'Quyết định về việc phê duyệt tầm nhìn, sứ mạng, giá trị cốt lõi và triết lý giáo dục của Trường  Đại  học Công nghiệp  Thực phẩm TP. Hồ Chí Minh', 1009, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H4.04.01.02         ', N'Quyết định thành lập khoa', 1009, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H4.04.02.01         ', N'Quyết định ban hành Qui định về công tác giảng dạy', 1010, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H4.04.02.02         ', N'Quyết định ban hành danh sách học phần – cách đánh giá thuộc Khoa/Trung tâm  quản lý', 1010, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H4.04.03.01         ', N'Đề cương chi tiết học phần', 1011, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H4.04.03.02         ', N'Tầm nhìn, sứ mạng, giá trị cốt lõi của Trường.', 1011, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H5.05.01.01         ', N'Qui chế đào tạo tín chỉ', 1012, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H5.05.01.02         ', N'Qui định thi kiểm tra', 1012, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H5.05.02.01         ', N'Niên giám đào tạo', 1013, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H5.05.02.02         ', N'Cổng thông tin sinh viên: http://sinhvien.hufi.edu.vn		 		', 1013, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H5.05.03.01         ', N'Quy chế đào tạo tín chỉ', 1014, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H5.05.03.02         ', N'Qui định thi kiểm tra', 1014, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H5.05.04.01         ', N'Qui chế đào tạo tín chỉ', 1015, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H5.05.04.02         ', N'Qui định thi kiểm tra', 1015, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H5.05.05.01         ', N'Quyết định về việc ban hành Quy định thi, kiểm tra', 1016, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H5.05.05.02         ', N'Quyết định ban hành công tác giảng viên cố vấn của trường đại học Công nghiệp  Thực phẩm TPHCM', 1016, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H6.06.01.01         ', N'Quy chế về việc tuyển dụng và sử dụng viên  chức  của  Trường  Đại  học  Công nghiệp Thực phẩm TP. Hồ Chí Minh', 1017, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H6.06.01.02         ', N'Quy chế chi tiêu nội bộ', 1017, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H6.06.02.01         ', N'Quy  định  đánh  giá,  phân  loại  thi  đua hằng tháng đối với công chức, viên chức và người lao động trường Đại học Công nghiệp Thực phẩm TP. Hồ Chí Minh_Năm 2016	', 1018, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H6.06.02.02         ', N'Quy định về việc xác định chỉ tiêu tuyển  sinh đối với các cơ sở giáo dục đại học', 1018, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H6.06.03.01         ', N'Tiêu chí tuyển dụng giảng viên, nghiên cứu viên', 1019, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H6.06.03.02         ', N'Kế hoạch tuyển dụng giảng viên', 1019, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H6.06.04.01         ', N'Quy định về công tác giảng dạy', 1020, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H6.06.04.02         ', N'Quyết định tuyển dụng giảng viên', 1020, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H6.06.05.01         ', N'Thông báo mở các lớp học bồi dưỡng nhà trường tổ chức', 1021, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H6.06.05.02         ', N'Kế hoạch các lớp liên kết học tập nâng cao trình độ cho giảng viên', 1021, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H6.06.06.01         ', N'Kế hoạch khối lượng giảng dạy năm', 1022, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H6.06.06.02         ', N'Biên bản họp Seminar cấp khoa', 1022, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H6.06.07.01         ', N'Báo cáo tổng kết công tác năm học cũ, phương hướng, nhiệm vụ năm học mới', 1023, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H6.06.07.02         ', N'Bảng tổng hợp hình thức và số lượng ấn phẩm nghiên cứu khoa học', 1023, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H7.07.01.01         ', N'Kế  hoạch  phát  triển  trường  giai  đoạn  2010 – 2015 tầm nhìn 2030', 1024, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H7.07.01.02         ', N'Đề án vị trí việc làm, danh mục vị trí việc làm và cơ cấu viên chức theo chức  danh  nghề  nghiệp  trường  ĐH  CNTP   TPHCM', 1024, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H7.07.02.01         ', N'Quy   định   về   bổ   nhiệm   lại,   luân  chuyển, miễn nhiệm cán bộ.', 1025, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H7.07.02.02         ', N'Bản mô tả công việc của nhân viên', 1025, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H7.07.03.01         ', N'Bảng mô tả vị trí công việc', 1026, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H7.07.03.02         ', N'Quy định về đánh giá, xếp loại thi đua hàng tháng đối với công chức, viên chức và  người  lao  động  trường  ĐH  CNTP  TPHCM.', 1026, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H7.07.04.01         ', N'Kế  hoạch  tuyển  dụng.', 1027, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H7.07.04.02         ', N'Danh  sách  lớp  học  nâng  cao  trình  độ nhân viên.', 1027, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H7.07.05.01         ', N'Kế   hoạch   hoạt   động   tháng   của khoa CNTT', 1028, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H7.07.05.02         ', N'Bảng phân công công việc khoa CNTT', 1028, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H8.08.01.01         ', N'Quy chế tuyển sinh đại học, cao đẳng của Bộ Giáo dục và đào tạo', 1029, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H8.08.01.02         ', N'Quyết định ban hành Quy chế tuyển sinh đại học, cao đẳng', 1029, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H8.08.02.01         ', N'Quy chế tuyển sinh đại học, cao đẳng của Bộ Giáo dục và đào tạo', 1030, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H8.08.02.02         ', N'Dữ liệu về ý kiến của các bên liên quan trong việc xây dựng tiêu chí và phương pháp tuyển chọn người học', 1030, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H8.08.03.01         ', N'Các quyết định về quy định đánh giá kết   quả rèn luyện của sinh viên trường Đại  học Công nghiệp Thực phẩm tp. Hồ Chí  Minh', 1031, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H8.08.03.02         ', N'Quyết định ban hành Quy định về Quy chế  đào tạo  theo  hê  thống tín chỉ', 1031, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H8.08.04.02         ', N'Danh sách Giảng viên được phân công CVHT cho các lớp tại khoa CNTT', 1032, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H8.08.04.05         ', N'Biên bản SHL có nội dung tư vấn đăng ký học phần, điều chỉnh học phần trong các tháng đầu và cuối mỗi học kỳ.', 1032, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H8.08.05.01         ', N'Quy định văn hóa và quan hệ công sở', 1033, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H8.08.05.02         ', N'Sơ đồ Sơ đồ bố trí khu hiệu bộ, giảng đường, các phòng/khoa, hội trường, thư viện, khu thực hành, thực tập… ký túc  xá.', 1033, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H9.09.01.01         ', N'Sơ đồ phòng làm việc khoa CNTT', 1034, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H9.09.01.02         ', N'Biên bản kiểm kê tài sản cố định của khoa CNTT', 1034, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H9.09.02.01         ', N'Quyết định thành lập thư viện', 1035, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H9.09.02.02         ', N'Bản kiểm kê tài sản thư viện', 1035, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H9.09.03.01         ', N'Đơn  đề  xuất  xây  dựng  phòng  máy chuyên ngành, phòng công nghệ 4.0', 1036, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H9.09.04.01         ', N'Sơ đồ lắp đặt wifi Trường/Khoa', 1037, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
INSERT [dbo].[MINHCHUNG] ([MAMINHCHUNG], [TENMINHCHUNG], [MATIEUCHI], [DUONGDAN_ND]) VALUES (N'H9.09.05.01         ', N'Kế hoạch khám sức khỏe định kỳ hàng năm cho CB và SV.', 1038, N'https://drive.google.com/file/d/1blPiU3iJWOk_vlQdY6BcdSwnQHHH8nm2/preview')
GO
--Nhap lieu bang Nhan Su

SET IDENTITY_INSERT [dbo].[NHANSU] ON 
INSERT [dbo].[NHANSU] ([MA_NS], [TEN_NS], [SDT], [EMAIL], [GIOITINH], [NGAYSINH], [DIACHI], [TAIKHOAN], [MATKHAU], [HINHANH], [MA_CV], [MA_NH], [MA_NQ]) VALUES (8, N'Duy Khang', N'0909009990', N'duykhangnguyen21@gmail.com', N'NAM', CAST(N'2001-11-18' AS Date), N'TP.HCM', N'admin', N'123456', N'yooo.jpg', 10, 10, 1)
INSERT [dbo].[NHANSU] ([MA_NS], [TEN_NS], [SDT], [EMAIL], [GIOITINH], [NGAYSINH], [DIACHI], [TAIKHOAN], [MATKHAU], [HINHANH], [MA_CV], [MA_NH], [MA_NQ]) VALUES (1018, N'Phương Bình', N'0909009990', N'phuongbinhtran123@gmail.com', N'Nam', CAST(N'2001-11-18' AS Date), N'TPHCM', N'nhomtruong', N'123456', N'139612281_881649955944833_1095641408821746026_n.jpg', 5, 2, 4)
INSERT [dbo].[NHANSU] ([MA_NS], [TEN_NS], [SDT], [EMAIL], [GIOITINH], [NGAYSINH], [DIACHI], [TAIKHOAN], [MATKHAU], [HINHANH], [MA_CV], [MA_NH], [MA_NQ]) VALUES (1019, N'Trọng Liêm', N'0909009990', N'tronliembmt123@gmail.com', N'Nam', CAST(N'2001-11-18' AS Date), N'TPHCM', N'danhgiakhoa', N'123456', N'1.kiemdinhchatluong.png', 4, 7, 5)
INSERT [dbo].[NHANSU] ([MA_NS], [TEN_NS], [SDT], [EMAIL], [GIOITINH], [NGAYSINH], [DIACHI], [TAIKHOAN], [MATKHAU], [HINHANH], [MA_CV], [MA_NH], [MA_NQ]) VALUES (1020, N'BOT01', N'0909009990', N'bot01@gmail.com', N'Nam', CAST(N'2022-11-18' AS Date), N'TPHCM', N'danhgiatruong', N'123456', N'kdclgg.jpg', 4, 8, 5)
INSERT [dbo].[NHANSU] ([MA_NS], [TEN_NS], [SDT], [EMAIL], [GIOITINH], [NGAYSINH], [DIACHI], [TAIKHOAN], [MATKHAU], [HINHANH], [MA_CV], [MA_NH], [MA_NQ]) VALUES (1021, N'BOT02', N'0909009990', N'bot02@gmail.com', N'Nữ', CAST(N'2022-11-18' AS Date), N'TPHCM', N'danhgiangoai', N'123456', N'bctu.jpg', 4, 9, 5)
INSERT [dbo].[NHANSU] ([MA_NS], [TEN_NS], [SDT], [EMAIL], [GIOITINH], [NGAYSINH], [DIACHI], [TAIKHOAN], [MATKHAU], [HINHANH], [MA_CV], [MA_NH], [MA_NQ]) VALUES (1022, N'BOT03', N'0909009990', N'bot03@gmail.com', N'Nữ', CAST(N'2022-11-18' AS Date), N'TPHCM', N'nhansu1', N'123456', N'1.kiemdinhchatluong.png', 4, 2, 2)
INSERT [dbo].[NHANSU] ([MA_NS], [TEN_NS], [SDT], [EMAIL], [GIOITINH], [NGAYSINH], [DIACHI], [TAIKHOAN], [MATKHAU], [HINHANH], [MA_CV], [MA_NH], [MA_NQ]) VALUES (1023, N'BOT04', N'0909009990', N'bot04@gmail.com', N'Nam', CAST(N'2022-11-18' AS Date), N'TPHCM', N'nhansu2', N'123456', N'1.kiemdinhchatluong.png', 4, 3, 2)
INSERT [dbo].[NHANSU] ([MA_NS], [TEN_NS], [SDT], [EMAIL], [GIOITINH], [NGAYSINH], [DIACHI], [TAIKHOAN], [MATKHAU], [HINHANH], [MA_CV], [MA_NH], [MA_NQ]) VALUES (1024, N'BOT05', N'0909009990', N'bot05@gmail.com', N'Nam', CAST(N'2022-11-18' AS Date), N'TPHCM', N'nhansu3', N'123456', N'1.kiemdinhchatluong.png', 4, 4, 2)
INSERT [dbo].[NHANSU] ([MA_NS], [TEN_NS], [SDT], [EMAIL], [GIOITINH], [NGAYSINH], [DIACHI], [TAIKHOAN], [MATKHAU], [HINHANH], [MA_CV], [MA_NH], [MA_NQ]) VALUES (1025, N'BOT06', N'0909009990', N'bot06@gmail.com', N'Nam', CAST(N'2022-11-18' AS Date), N'TPHCM', N'hoidong1', N'123456', N'kdclgg.jpg', 4, 1, 3)
INSERT [dbo].[NHANSU] ([MA_NS], [TEN_NS], [SDT], [EMAIL], [GIOITINH], [NGAYSINH], [DIACHI], [TAIKHOAN], [MATKHAU], [HINHANH], [MA_CV], [MA_NH], [MA_NQ]) VALUES (1026, N'BOT07', N'0909009990', N'bot07@gmail.com', N'Nữ', CAST(N'2022-11-18' AS Date), N'TPHCM', N'hoidong2', N'123456', N'kdclgg.jpg', 4, 1, 3)
INSERT [dbo].[NHANSU] ([MA_NS], [TEN_NS], [SDT], [EMAIL], [GIOITINH], [NGAYSINH], [DIACHI], [TAIKHOAN], [MATKHAU], [HINHANH], [MA_CV], [MA_NH], [MA_NQ]) VALUES (1027, N'BOT08', N'0909009990', N'bot08@gmail.com', N'Nữ', CAST(N'2022-11-18' AS Date), N'TPHCM', N'duy1234', N'123456', N'1.kiemdinhchatluong.png', 4, 2, 2)
SET IDENTITY_INSERT [dbo].[NHANSU] OFF
GO
--Nhap lieu bang Nhom

SET IDENTITY_INSERT [dbo].[NHOM] ON 
INSERT [dbo].[NHOM] ([MA_NH], [TEN_NH], [KYHIEU]) VALUES (1, N'Nhóm hội đồng', N'hd')
INSERT [dbo].[NHOM] ([MA_NH], [TEN_NH], [KYHIEU]) VALUES (2, N'Nhóm báo cáo 1', N'bc')
INSERT [dbo].[NHOM] ([MA_NH], [TEN_NH], [KYHIEU]) VALUES (3, N'Nhóm báo cáo 2', N'bc')
INSERT [dbo].[NHOM] ([MA_NH], [TEN_NH], [KYHIEU]) VALUES (4, N'Nhóm báo cáo 3', N'bc')
INSERT [dbo].[NHOM] ([MA_NH], [TEN_NH], [KYHIEU]) VALUES (5, N'Nhóm báo cáo 4', N'bc')
INSERT [dbo].[NHOM] ([MA_NH], [TEN_NH], [KYHIEU]) VALUES (6, N'Nhóm báo cáo 5', N'bc')
INSERT [dbo].[NHOM] ([MA_NH], [TEN_NH], [KYHIEU]) VALUES (7, N'Nhóm đánh giá cấp Khoa', N'dg')
INSERT [dbo].[NHOM] ([MA_NH], [TEN_NH], [KYHIEU]) VALUES (8, N'Nhóm đánh giá cấp Trường', N'dg')
INSERT [dbo].[NHOM] ([MA_NH], [TEN_NH], [KYHIEU]) VALUES (9, N'Nhóm đánh giá ngoài', N'dg')
INSERT [dbo].[NHOM] ([MA_NH], [TEN_NH], [KYHIEU]) VALUES (10, N'Nhóm hỗ trợ', N'ht')
SET IDENTITY_INSERT [dbo].[NHOM] OFF
GO
--Nhap lieu bang Nhom Quyen

SET IDENTITY_INSERT [dbo].[NHOMQUYEN] ON 
INSERT [dbo].[NHOMQUYEN] ([MA_NQ], [TEN_NQ]) VALUES (1, N'Nhóm admin')
INSERT [dbo].[NHOMQUYEN] ([MA_NQ], [TEN_NQ]) VALUES (2, N'Nhóm báo cáo')
INSERT [dbo].[NHOMQUYEN] ([MA_NQ], [TEN_NQ]) VALUES (3, N'Nhóm hội đồng')
INSERT [dbo].[NHOMQUYEN] ([MA_NQ], [TEN_NQ]) VALUES (4, N'Nhóm trưởng')
INSERT [dbo].[NHOMQUYEN] ([MA_NQ], [TEN_NQ]) VALUES (5, N'Nhóm đánh giá')
SET IDENTITY_INSERT [dbo].[NHOMQUYEN] OFF
GO	
--Nhap lieu bang Phan 1: Khai Quat

SET IDENTITY_INSERT [dbo].[P1_KHAIQUAT] ON 
INSERT [dbo].[P1_KHAIQUAT] ([MATP], [TEN_TP], [NOIDUNG_TP], [MABAOCAO]) VALUES (1, N'1.ĐẶT VẤN ĐỀ', N'1.ĐẶT VẤN ĐỀ', 1)
INSERT [dbo].[P1_KHAIQUAT] ([MATP], [TEN_TP], [NOIDUNG_TP], [MABAOCAO]) VALUES (2, N'2.TỔNG QUAN CHUNG', N'1.ĐẶT VẤN ĐỀ', 1)
SET IDENTITY_INSERT [dbo].[P1_KHAIQUAT] OFF
GO
--Nhap lieu bang Phan 2: Danh Gia

SET IDENTITY_INSERT [dbo].[P2_DANHGIA] ON 
INSERT [dbo].[P2_DANHGIA] ([MADANHGIA], [MATIEUCHUAN], [MABAOCAO], [TEN_TP]) VALUES (1, 1, 2, N'TIÊU CHUẨN 1: MỤC TIÊU VÀ CHUẨN ĐẦU RA CỦA CHƯƠNG TRÌNH ĐÀO TẠO')
INSERT [dbo].[P2_DANHGIA] ([MADANHGIA], [MATIEUCHUAN], [MABAOCAO], [TEN_TP]) VALUES (2, 2, 2, N'TIÊU CHUẨN 2: BẢN MÔ TẢ CHƯƠNG TRÌNH ĐÀO TẠO')
INSERT [dbo].[P2_DANHGIA] ([MADANHGIA], [MATIEUCHUAN], [MABAOCAO], [TEN_TP]) VALUES (3, 3, 2, N'TIÊU CHUẨN 3: CẤU TRÚC VÀ NỘI DUNG CHƯƠNG TRÌNH DẠY HỌC')
INSERT [dbo].[P2_DANHGIA] ([MADANHGIA], [MATIEUCHUAN], [MABAOCAO], [TEN_TP]) VALUES (4, 4, 2, N'TIÊU CHUẨN 4: PHƯƠNG PHÁP TIẾP CẬN TRONG DẠY VÀ HỌC')
INSERT [dbo].[P2_DANHGIA] ([MADANHGIA], [MATIEUCHUAN], [MABAOCAO], [TEN_TP]) VALUES (5, 5, 2, N'TIÊU CHUẨN 5: ĐÁNH GIÁ KẾT QUẢ HỌC TẬP CỦA NGƯỜI HỌC')
INSERT [dbo].[P2_DANHGIA] ([MADANHGIA], [MATIEUCHUAN], [MABAOCAO], [TEN_TP]) VALUES (6, 6, 2, N'TIÊU CHUẨN 6: ĐỘI NGŨ GIẢNG VIÊN, NGHIÊN CỨU VIÊN')
INSERT [dbo].[P2_DANHGIA] ([MADANHGIA], [MATIEUCHUAN], [MABAOCAO], [TEN_TP]) VALUES (7, 7, 2, N'TIÊU CHUẨN 7: ĐỘI NGŨ NHÂN VIÊN')
INSERT [dbo].[P2_DANHGIA] ([MADANHGIA], [MATIEUCHUAN], [MABAOCAO], [TEN_TP]) VALUES (8, 8, 2, N'TIÊU CHUẨN 8: NGƯỜI HỌC VÀ HOẠT ĐỘNG HỖ TRỢ NGƯỜI HỌC')
INSERT [dbo].[P2_DANHGIA] ([MADANHGIA], [MATIEUCHUAN], [MABAOCAO], [TEN_TP]) VALUES (9, 9, 2, N'TIÊU CHUẨN 9: CƠ SỞ VẬT CHẤT VÀ TRANG THIẾT BỊ')
INSERT [dbo].[P2_DANHGIA] ([MADANHGIA], [MATIEUCHUAN], [MABAOCAO], [TEN_TP]) VALUES (10, 10, 2, N'TIÊU CHUẨN 10: NÂNG CAO CHẤT LƯỢNG')
INSERT [dbo].[P2_DANHGIA] ([MADANHGIA], [MATIEUCHUAN], [MABAOCAO], [TEN_TP]) VALUES (11, 11, 2, N'TIÊU CHUẨN 11: KẾT QUẢ ĐẦU RA')
SET IDENTITY_INSERT [dbo].[P2_DANHGIA] OFF
GO
--Nhap lieu bang Phan 3: Ket Luan

SET IDENTITY_INSERT [dbo].[P3_KETLUAN] ON 
INSERT [dbo].[P3_KETLUAN] ([MATP], [TEN_TP], [NOIDUNG_TP], [MABAOCAO]) VALUES (1, N'1.Kết luận chung về công tác tự đánh giá CTĐT ngành CNTT', N'1.Kết luận chung về công tác tự đánh giá CTĐT ngành CNTT', 3)
INSERT [dbo].[P3_KETLUAN] ([MATP], [TEN_TP], [NOIDUNG_TP], [MABAOCAO]) VALUES (2, N'2.Những điểm mạnh của CTĐT ngành CNTT', N'2.Những điểm mạnh của CTĐT ngành CNTT', 3)
INSERT [dbo].[P3_KETLUAN] ([MATP], [TEN_TP], [NOIDUNG_TP], [MABAOCAO]) VALUES (3, N'3.Những điểm tồn tại của CTĐT ngành CNTT', N'3.Những điểm tồn tại của CTĐT ngành CNTT', 3)
INSERT [dbo].[P3_KETLUAN] ([MATP], [TEN_TP], [NOIDUNG_TP], [MABAOCAO]) VALUES (4, N'4.Kế hoạch cải tiến chất lượng', N'4.Kế hoạch cải tiến chất lượng', 3)
INSERT [dbo].[P3_KETLUAN] ([MATP], [TEN_TP], [NOIDUNG_TP], [MABAOCAO]) VALUES (5, N'5.Tổng hợp kết quả đánh giá CTĐT', N'5.Tổng hợp kết quả đánh giá CTĐT', 3)
SET IDENTITY_INSERT [dbo].[P3_KETLUAN] OFF
GO
--Nhap lieu bang Phan 4: Phu Luc

SET IDENTITY_INSERT [dbo].[P4_PHULUC] ON 
INSERT [dbo].[P4_PHULUC] ([MAPL], [TEN_PL], [NOIDUNG_PL], [MABAOCAO]) VALUES (1, N'PHỤ LỤC 1: Cơ Sở Dữ Liệu Kiểm Định Chất Lượng CTĐT', N'PHỤ LỤC 1: Cơ Sở Dữ Liệu Kiểm Định Chất Lượng CTĐT', 4)
INSERT [dbo].[P4_PHULUC] ([MAPL], [TEN_PL], [NOIDUNG_PL], [MABAOCAO]) VALUES (2, N'PHỤ LỤC 2: Quyết Định Thành Lập Hội Đồng Tự Đánh Giá Cấp Trường', N'PHỤ LỤC 2: Quyết Định Thành Lập Hội Đồng Tự Đánh Giá Cấp Trường', 4)
INSERT [dbo].[P4_PHULUC] ([MAPL], [TEN_PL], [NOIDUNG_PL], [MABAOCAO]) VALUES (3, N'PHỤ LỤC 3: Quyết Định Thành Lập Hội Đồng Tự Đánh Giá Cấp Khoa', N'PHỤ LỤC 3: Quyết Định Thành Lập Hội Đồng Tự Đánh Giá Cấp Khoa', 4)
INSERT [dbo].[P4_PHULUC] ([MAPL], [TEN_PL], [NOIDUNG_PL], [MABAOCAO]) VALUES (4, N'PHỤ LỤC 4: Kế Hoạch Tự Đánh Giá Cấp Trường Và Ngành CNTT', N'PHỤ LỤC 4: Kế Hoạch Tự Đánh Giá Cấp Trường Và Ngành CNTT', 4)
SET IDENTITY_INSERT [dbo].[P4_PHULUC] OFF
GO
--Nhap lieu bang Phan Cong Bao Cao Thanh Vien

SET IDENTITY_INSERT [dbo].[PHANCONG_BC_TV] ON 
INSERT [dbo].[PHANCONG_BC_TV] ([MAPHANCONG_TV], [NGAYPHANCONG], [NOIDUNG_PC], [THOIHAN], [MA_NS], [MABAOCAO]) VALUES (1023, CAST(N'2022-11-18' AS Date), N'2.TỔNG QUAN CHUNG', CAST(N'2022-11-30' AS Date), 1025, 1)
INSERT [dbo].[PHANCONG_BC_TV] ([MAPHANCONG_TV], [NGAYPHANCONG], [NOIDUNG_PC], [THOIHAN], [MA_NS], [MABAOCAO]) VALUES (1024, CAST(N'2022-11-18' AS Date), N'3.Những điểm tồn tại của CTĐT ngành CNTT', CAST(N'2022-11-30' AS Date), 1026, 3)
INSERT [dbo].[PHANCONG_BC_TV] ([MAPHANCONG_TV], [NGAYPHANCONG], [NOIDUNG_PC], [THOIHAN], [MA_NS], [MABAOCAO]) VALUES (1025, CAST(N'2022-11-18' AS Date), N'PHỤ LỤC 1: Cơ Sở Dữ Liệu Kiểm Định Chất Lượng CTĐT', CAST(N'2022-11-30' AS Date), 1026, 4)
INSERT [dbo].[PHANCONG_BC_TV] ([MAPHANCONG_TV], [NGAYPHANCONG], [NOIDUNG_PC], [THOIHAN], [MA_NS], [MABAOCAO]) VALUES (1026, CAST(N'2022-11-30' AS Date), N'Tiêu chí 5.3 : Phương pháp đánh giá kết quả học tập đa dạng, đảm bảo độ giá trị, độ tin cậy và sự công bằng.', CAST(N'2022-12-06' AS Date), 1022, 2)
INSERT [dbo].[PHANCONG_BC_TV] ([MAPHANCONG_TV], [NGAYPHANCONG], [NOIDUNG_PC], [THOIHAN], [MA_NS], [MABAOCAO]) VALUES (1027, CAST(N'2022-11-18' AS Date), N'Tiêu chí 8.3 : Có hệ thống giám sát phù hợp về sự tiến bộ trong học tập và rèn luyện, kết quả học tập, khối lượng học tập của người học.', CAST(N'2022-02-06' AS Date), 1024, 2)
INSERT [dbo].[PHANCONG_BC_TV] ([MAPHANCONG_TV], [NGAYPHANCONG], [NOIDUNG_PC], [THOIHAN], [MA_NS], [MABAOCAO]) VALUES (1028, CAST(N'2022-11-18' AS Date), N'Tiêu chí 2.2 : Đề cương các học phần đầy đủ thông tin và cập nhật.', CAST(N'2022-11-28' AS Date), 1027, 2)
INSERT [dbo].[PHANCONG_BC_TV] ([MAPHANCONG_TV], [NGAYPHANCONG], [NOIDUNG_PC], [THOIHAN], [MA_NS], [MABAOCAO]) VALUES (1029, CAST(N'2022-11-18' AS Date), N'Tiêu chí 2.3 : Bản mô tả CTĐT và đề cương các học phần được công bố công khai và các bên liên quan dễ dàng tiếp cận.', CAST(N'2022-01-29' AS Date), 1027, 2)
SET IDENTITY_INSERT [dbo].[PHANCONG_BC_TV] OFF
GO
--Nhap lieu bang Tieu Chi

SET IDENTITY_INSERT [dbo].[TIEUCHI] ON 
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (9, N'Tiêu chí 1.1 : Mục tiêu của chương trình đào tạo được xác định rõ ràng, phù hợp với sứ mạng và tầm nhìn của cơ sở giáo dục đại học, phù hợp với mục tiêu của giáo dục đại học quy định tại Luật giáo dục đại học.', 1, N'https://drive.google.com/file/d/1RekpBYQqrRqGf4Wa44zIv-_2SMzgJIYb/preview', N'https://docs.google.com/document/d/1EA7Cx0aZ7iRB_f_etqExpYcYIgKlec7Ea85i4vozRx8/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (10, N'Tiêu chí 1.2 : Chuẩn đầu ra của CTĐT được xác định rõ ràng, bao quát được cả các yêu cầu chung và yêu cầu chuyên biệt mà người học cần đạt được sau khi hoàn thành CTĐT.', 1, N'https://drive.google.com/file/d/1Xn-noNAoJTdbI4jW8BVtUD8k_qgdMZFh/preview', N'https://docs.google.com/document/d/1aoYRzWuOZCcCNwBAYqb2FcPytQQkCtPApk1s3lzBYT8/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (16, N'Tiêu chí 1.3 : Chuẩn đầu ra của CTĐT phản ánh được yêu cầu của các bên liên quan, được định kỳ rà soát, điều chỉnh và được công bố công khai.', 1, N'https://drive.google.com/file/d/10KO4h74yf7NhrAn0PUoCnxyL6tvbIrOi/preview', N'https://docs.google.com/document/d/1ObGmtaFB1Tuetgs5yw2s0LP7L2g-w2FviNEYYPmB0vU/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1051, N'Tiêu chí 2.1: Bản mô tả CTĐT đầy đủ thông tin và cập nhật. ', 2, N'https://drive.google.com/file/d/1rh8pXnQXkNzt3Mnartbhs7r19szWMdd3/preview', N'https://docs.google.com/document/d/1jURX1UuDzh23N857xlYpiIwDmAsGJldh3aTXf08Lc-w/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (11, N'Tiêu chí 2.2 : Đề cương các học phần đầy đủ thông tin và cập nhật.', 2, N'https://drive.google.com/file/d/14pqSwYChp3hdmXb-rn6wKM9LPNSxVgmt/preview', N'https://docs.google.com/document/d/1JuGoePCb6V_Fcv1am7a_i4Bg7_swZEQUWkXjEcQq1HQ/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (12, N'Tiêu chí 2.3 : Bản mô tả CTĐT và đề cương các học phần được công bố công khai và các bên liên quan dễ dàng tiếp cận.', 2, N'https://drive.google.com/file/d/1OyqTjqZNmzuSGjbw6mnfXgLE9jFRfS7I/preview', N'https://docs.google.com/document/d/15Sdng5gbBBy3skveRVeTpWgqxd_KN0BC7E_Yvu4EMnI/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (14, N'Tiêu chí 3.1 : Chương trình dạy học được thiết kế dựa trên chuẩn đầu ra.', 3, N'https://drive.google.com/file/d/11QoEbb4lh-rtZtj3pN82TiyuvAmLVVJ-/preview', N'https://docs.google.com/document/d/1kiyvP5vv1-iODHgw2e8hUl66MfUu0OZduO-otbX2qk4/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (15, N'Tiêu chí 3.2 : Đóng góp của mỗi học phần trong việc đạt được chuẩn đầu ra là rõ ràng.', 3, N'https://drive.google.com/file/d/1V_4PN6fW08javw0QgLKQ04sA0vPPFvjK/preview', N'https://docs.google.com/document/d/1-w2VMgCjuKni5APp8yd76Yndb939gxp-jT8O51Y1Rl8/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1008, N'Tiêu chí 3.3 : Chương trình dạy học có cấu trúc, trình tự logic; nội dung cập nhật và có tính tích hợp.', 3, N'https://drive.google.com/file/d/15LzHHWCFmHsebXLB_zIOT2_KnHD4iXBo/preview', N'https://docs.google.com/document/d/1zis89oB_OQaRU2PliSDC1sJWQcCwFzm8z7auFKxp6nE/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1009, N'Tiêu chí 4.1 : Triết lý giáo dục hoặc mục tiêu giáo dục được tuyên bố rõ ràng và được phổ biến tới các bên liên quan.', 4, N'https://drive.google.com/file/d/1tIHniXzuKHX42LsllTLQNB4v3rVzQhZx/preview', N'https://docs.google.com/document/d/1EaPQ-mhNlJhcwx-rP7PP-rUdi7RyiPmnDRn82phIHVY/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1010, N'Tiêu chí 4.2 : Các hoạt động dạy và học được thiết kế phù hợp để đạt được chuẩn đầu ra.', 4, N'https://drive.google.com/file/d/1u05-yAmpPFaPPpgP8xZA_M9nycHLRoOZ/preview', N'https://docs.google.com/document/d/1o0bgBHpy0xnJ2pe9qCBJUDY9FOh5Acs85YQNBxJxmG4/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1011, N'Tiêu chí 4.3 : Các hoạt động dạy và học thúc đẩy việc rèn luyện các kỹ năng, nâng cao khả năng học tập suốt đời của người học.', 4, N'https://drive.google.com/file/d/13mtlfBXmeRU0XpesOHLqIQhrYFgmlxdd/preview', N'https://docs.google.com/document/d/1KTaN35p2DfbsW-NUCJCUMKpS05thIKxdnaJUP5ZwPNM/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1012, N'Tiêu chí 5.1 : Việc đánh giá kết quả học tập của người học được thiết kế phù hợp với mức độ đạt được chuẩn đầu ra.', 5, N'https://drive.google.com/file/d/119W9AnZUxb-dwOH2nhYOrDDQkrxbT4fP/preview', N'https://docs.google.com/document/d/1BPrnxvCk8L5Mw5Gqww4dHV_ADossErXg5Bf584ZL96s/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1013, N'Tiêu chí 5.2 : Các quy định về đánh giá kết quả học tập của người học (bao gồm thời gian, phương pháp, tiêu chí, trọng số, cơ chế phản hồi và các nội dung liên quan) rõ ràng và được thông báo công khai tới người học.', 5, N'https://drive.google.com/file/d/1IfbcaKVZux5q9-wEHSfMQdSPPT07yyEO/preview', N'https://docs.google.com/document/d/1vvZw-dRDq0GDd0s66U4Le9ZUSxMQmcAO2kTwmObS_io/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1014, N'Tiêu chí 5.3 : Phương pháp đánh giá kết quả học tập đa dạng, đảm bảo độ giá trị, độ tin cậy và sự công bằng.', 5, N'https://drive.google.com/file/d/16bJP3Sdocj_Z9d3Pz72G6bLkgPxgESfW/preview', N'https://docs.google.com/document/d/1LG4qpetAYaUANsmRhs701vf7An7JmmWOT5-Ef2-ub9E/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1015, N'Tiêu chí 5.4 : Kết quả đánh giá được phản hồi kịp thời để người học cải thiện việc học tập.', 5, N'https://drive.google.com/file/d/1svuXwYqMuK1yBjTCnRbWXGjMJZipwtLE/preview', N'https://docs.google.com/document/d/1qtD5bzELHjrva9_zaS8XDqA87pUUAQqqDulthK1xExk/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1016, N'Tiêu chí 5.5 : Người học tiếp cận dễ dàng với quy trình khiếu nại về kết quả học tập.', 5, N'https://drive.google.com/file/d/120gVXAsWokuh1bv1mrY8XK7IwPQzqfv7/preview', N'https://docs.google.com/document/d/1myu59IMKa8FmomnV8CynUpk_wTJ7FfGdxhoB3yZXukw/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1017, N'Tiêu chí 6.1 : Việc quy hoạch đội ngũ giảng viên, nghiên cứu viên (bao gồm việc thu hút, tiếp nhận, bổ nhiệm, bố trí, chấm dứt hợp đồng và cho nghỉ hưu) được thực hiện đáp ứng nhu cầu về đào tạo, nghiên cứu khoa học và các hoạt động phục vụ cộng đồng.', 6, N'https://drive.google.com/file/d/1PBFw5xaAMaio7mNzCWZZnLadjM3A2zoG/preview', N'https://docs.google.com/document/d/1QrT3_WgkPAXou8sCVINM83jDK2zr6Lo8_JEfjZJKu34/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1018, N'Tiêu chí 6.2 : Tỉ lệ giảng viên/người học và khối lượng công việc của đội ngũ giảng viên, nghiên cứu viên được đo lường, giám sát làm căn cứ cải tiến chất lượng hoạt động đào tạo, nghiên cứu khoa học và các hoạt động phục vụ cộng đồng.', 6, N'https://drive.google.com/file/d/1PBFw5xaAMaio7mNzCWZZnLadjM3A2zoG/preview', N'https://docs.google.com/document/d/1Qa4-LLi0pXDB2C0yJtXtC8V5LUbPUyX7ezvGgl-_dLU/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1019, N'Tiêu chí 6.3 : Các tiêu chí tuyển dụng và lựa chọn giảng viên, nghiên cứu viên (bao gồm cả đạo đức và năng lực học thuật) để bổ nhiệm, điều chuyển được xác định và phổ biến công khai.', 6, N'https://drive.google.com/file/d/1F5QqQ3CyUi27efBx7IaxUAb4Pu0dgqHp/preview', N'https://docs.google.com/document/d/1MczGT553fo2wKAsrwcGa4y1GpiBI76GiQJ84up6gnb4/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1020, N'Tiêu chí 6.4 : Năng lực của đội ngũ giảng viên, nghiên cứu viên được xác định và được đánh giá.', 6, N'https://drive.google.com/file/d/1XEDeepJTpjS91qqVi1IJW7yxxn0L2gkt/preview', N'https://docs.google.com/document/d/1z8CImjRVZdzc8E-_vrKXGQmv-IIu2EkUcsjNqrijJsE/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1021, N'Tiêu chí 6.5 : Nhu cầu về đào tạo và phát triển chuyên môn của đội ngũ giảng viên, nghiên cứu viên được xác định và có các hoạt động triển khai để đáp ứng nhu cầu đó.', 6, N'https://drive.google.com/file/d/18sFRb32g3XG2FSe2j3xVjLA2DQbWBhAF/preview', N'https://docs.google.com/document/d/1MxEWld5p6tLHTwGIvnBpK5hH26DBWM6AJv1Lj0s29z0/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1022, N'Tiêu chí 6.6 : Việc quản trị theo kết quả công việc của giảng viên, nghiên cứu viên (gồm cả khen thưởng và công nhận) được triển khai để tạo động lực và hỗ trợ cho đào tạo, nghiên cứu khoa học và các hoạt động phục vụ cộng đồng.', 6, N'https://drive.google.com/file/d/1YwRAqMu39JbmUleqxJimXxTfgZLa3mk5/preview', N'https://docs.google.com/document/d/1_sJM3U1NTLXr1-WmTcqjL4hfysgQuzu6GnLw9jRkJtA/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1023, N'Tiêu chí 6.7 : Các loại hình và số lượng các hoạt động nghiên cứu của giảng viên và nghiên cứu viên được xác lập, giám sát và đối sánh để cải tiến chất lượng.', 6, N'https://drive.google.com/file/d/1p8JrTu8CXWTRcwCcV85MZnEuWvVSymex/preview', N'https://docs.google.com/document/d/1G7dDEC6QpoCd9uQRT6Em2BlI6CpwEKr2E0G3A0Dk__w/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1024, N'Tiêu chí 7.1 : Việc quy hoạch đội ngũ nhân viên (làm việc tại thư viện, phòng thí nghiệm, hệ thống công nghệ thông tin và các dịch vụ hỗ trợ khác) được thực hiện đáp ứng nhu cầu về đào tạo, nghiên cứu khoa học và các hoạt động phục vụ cộng đồng.', 7, N'https://drive.google.com/file/d/1famsOijPvv_5-HNGBnZos-p4wdaStUtV/preview', N'https://docs.google.com/document/d/1KjJsM1R6WvKVPg8yMIDbAejoKUHW0XjRe_mq_aPqma0/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1025, N'Tiêu chí 7.2 : Các tiêu chí tuyển dụng và lựa chọn nhân viên để bổ nhiệm, điều chuyển được xác định và phổ biến công khai.', 7, N'https://drive.google.com/file/d/1NW_i1Jyi8QDK3X8c9moOwNF1aDAa6Bgd/preview', N'https://docs.google.com/document/d/1-C22ugC_0dWxX3aCtVlyft7JfSDqLlaTIKLDLo1aKx8/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1026, N'Tiêu chí 7.3 : Năng lực của đội ngũ nhân viên được xác định và được đánh giá.', 7, N'https://drive.google.com/file/d/13NjUzSv7fFLNTX5gpGHt8iXxXax-sn3q/preview', N'https://docs.google.com/document/d/1NcgFWPvqplnl6M77ulU91wanRy9Q8E-tXw4jqaZDVVA/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1027, N'Tiêu chí 7.4 : Nhu cầu về đào tạo và phát triển chuyên môn, nghiệp vụ của nhân viên được xác định và có các hoạt động triển khai để đáp ứng nhu cầu đó.', 7, N'https://drive.google.com/file/d/1bBtNG_6rFYZkVOZMlA_75VJ8Lmmfn3LA/preview', N'https://docs.google.com/document/d/1gky7UaRowHb5I2iAWVBlrnYK8P8CF6c-RYHc3-PjP50/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1028, N'Tiêu chí 7.5 : Việc quản trị theo kết quả công việc của nhân viên (gồm cả khen thưởng và công nhận) được triển khai để tạo động lực và hỗ trợ cho đào tạo, nghiên cứu khoa học và các hoạt động phục vụ cộng đồng.', 7, N'https://drive.google.com/file/d/1cI32b2dX3zJPjGHppvVoGdjgo1bdzlzc/preview', N'https://docs.google.com/document/d/1Vk8ZODWs8aixKwgGwA4DFmbHux_978gFPcFFk5i6E04/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1029, N'Tiêu chí 8.1 : Chính sách tuyển sinh được xác định rõ ràng, được công bố công khai và được cập nhật.', 8, N'https://drive.google.com/file/d/1TxhbOxmn9qy776-IAz3GxqLjzUTTuZcA/preview', N'https://docs.google.com/document/d/1RA4Lc-AP7uJW7YmN_l4t-gX6AiJFQ6qyKKUqgvYk4Tk/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1030, N'Tiêu chí 8.2 : Tiêu chí và phương pháp tuyển chọn người học được xác định rõ ràng và được đánh giá.', 8, N'https://drive.google.com/file/d/1XhQAW8lJV7pDcl0-PtCsI9RBqlfaV0Ue/preview', N'https://docs.google.com/document/d/1l2x7ruYwUp4u42CsQ_T0LhnQw7IzEGayL7rZC9iY0Ng/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1031, N'Tiêu chí 8.3 : Có hệ thống giám sát phù hợp về sự tiến bộ trong học tập và rèn luyện, kết quả học tập, khối lượng học tập của người học.', 8, N'https://drive.google.com/file/d/1hr5hvIg7heFOseldpbzln3weHd9ZMlaK/preview', N'https://docs.google.com/document/d/1ywmswKyTa4cZxcUKzuB48SVVpJNT-RDzys9Y2b6hjKg/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1032, N'Tiêu chí 8.4 : Có các hoạt động tư vấn học tập, hoạt động ngoại khóa, hoạt động thi đua và các dịch vụ hỗ trợ khác để giúp cải thiện việc học tập và khả năng có việc làm của người học.', 8, N'https://drive.google.com/file/d/1sqHNzVK35cfESjy9imeEfvhWcKlz-elE/preview', N'https://docs.google.com/document/d/1zkB8WHD-J8HxRr_vVTUGgr80FlnF71oe08eGfNpL4F8/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1033, N'Tiêu chí 8.5 : Môi trường tâm lý, xã hội và cảnh quan tạo thuận lợi cho hoạt động đào tạo, nghiên cứu và sự thoải mái cho cá nhân người học.', 8, N'https://drive.google.com/file/d/1RPeY3-nSxVRyTl6mXRzC1P-FsoT9_Ozc/preview', N'https://docs.google.com/document/d/11H0L2_-Zs4zrYRZ0VHec6qEFdesbtojImxmJj46Wk_o/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1034, N'Tiêu chí 9.1 : Có hệ thống phòng làm việc, phòng học và các phòng chức năng với các trang thiết bị phù hợp để hỗ trợ các hoạt động đào tạo và nghiên cứu.', 9, N'https://drive.google.com/file/d/17cmYlglVBCuqxAnqXzMqJ0eynwfCE-HP/preview', N'https://docs.google.com/document/d/1DUxEcGLcRHcF_WtVuUb9zT7AQoW9iZ-PQR1SwqFxs_8/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1035, N'Tiêu chí 9.2 : Thư viện và các nguồn học liệu phù hợp và được cập nhật để hỗ trợ các hoạt động đào tạo và nghiên cứu.', 9, N'https://drive.google.com/file/d/1RdXHjynM61zCSGEPP8xuI0Q_61qIwQq6/preview', N'https://docs.google.com/document/d/1sdgL1uUPit1stTeZxlgJk_M4GOPrUPW65Xabaku_Btg/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1036, N'Tiêu chí 9.3 : Phòng thí nghiệm, thực hành và trang thiết bị phù hợp và được cập nhật để hỗ trợ các hoạt động đào tạo và nghiên cứu.', 9, N'https://drive.google.com/file/d/1EjjgsR1PG7RsnrJRWivfLgLYJIRz1GUS/preview', N'https://docs.google.com/document/d/1b4yYhifpZ6SJFgSy4zeI23PadBZxfkTL5LxwVJ7UcQ8/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1037, N'Tiêu chí 9.4 : Hệ thống công nghệ thông tin (bao gồm cả hạ tầng cho học tập trực tuyến) phù hợp và được cập nhật để hỗ trợ các hoạt động đào tạo và nghiên cứu.', 9, N'https://drive.google.com/file/d/1fBeFyd09m4KDaGrcyBp2FN4noIl8meix/preview', N'https://docs.google.com/document/d/1MAXfhLxj1gaSwzlMAtcRKrow65lw-TCB4fibqXNHfkY/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1038, N'Tiêu chí 9.5 : Các tiêu chuẩn về môi trường, sức khỏe, an toàn được xác định và triển khai có lưu ý đến nhu cầu đặc thù của người khuyết tật.', 9, N'https://drive.google.com/file/d/1lbjtCDFJI5DiPFNOAxMqfnugmOF4TqqE/preview', N'https://docs.google.com/document/d/1QGRbARax4jnRAJv17zvJLhmJF8tHTnvTAzoUc6ec3CU/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1039, N'Tiêu chí 10.1: Thông tin phản hồi và nhu cầu của các bên liên quan được sử dụng làm căn cứ để thiết kế và phát triển chương trình dạy học.', 10, N'https://drive.google.com/file/d/1r9ngmH9KuisjoLyPFMS3LYPKGH4WqCFM/preview', N'https://docs.google.com/document/d/1N7j2l4MrlXYjTRNHdb9JzCNpyAJAqafZTn-bK8D4ZF8/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1040, N'Tiêu chí 10.2: Việc thiết kế và phát triển chương trình dạy học được xác lập, được đánh giá và cải tiến.', 10, N'https://drive.google.com/file/d/1zU7hgs55XWazNqmt4XOWVnLwKgbzgC2U/preview', N'https://docs.google.com/document/d/1XJkXTg8W3Gvr-fCKwvGVXijizUQielY8vslycx2asQ8/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1041, N'Tiêu chí 10.3: Quá trình dạy và học, việc đánh giá kết quả học tập của người học được rà soát và đánh giá thường xuyên để đảm bảo sự tương thích và phù hợp với chuẩn đầu ra.', 10, N'https://drive.google.com/file/d/1swSdQvNFj-ybUnqr81lnAqba9igt3-Oe/preview', N'https://docs.google.com/document/d/1AT1Iy-w8G2SoLzKmOSISAZSvgNF0KxXCQ4NgEiV61n4/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1042, N'Tiêu chí 10.4: Các kết quả nghiên cứu khoa học được sử dụng để cải tiến việc dạy và học.', 10, N'https://drive.google.com/file/d/1A0uRd-l-DteJaJKliFYp8buqSSRRqTsr/preview', N'https://docs.google.com/document/d/1B8Hn7M6nQDpmUXrFu0kkNdnz0iqwSxnfiUQZFUcC5p4/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1043, N'Tiêu chí 10.5: Chất lượng các dịch vụ hỗ trợ và tiện ích (tại thư viện, phòng thí nghiệm, hệ thống công nghệ thông tin và các dịch vụ hỗ trợ khác) được đánh giá và cải tiến.', 10, N'https://drive.google.com/file/d/1SpPRoyt_4aXMlqLaD8YXp0WiHVaYoGc7/preview', N'https://docs.google.com/document/d/1yXEWTLS98c7cvEEay3aEWE1dyzxZSoeQYpmJqPQFqrs/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1044, N'Tiêu chí 10.6: Cơ chế phản hồi của các bên liên quan có tính hệ thống, được đánh giá và cải tiến.', 10, N'https://drive.google.com/file/d/1jM93fWURpIbqj-zfR4hCmi4k9EdK9E-O/preview', N'https://docs.google.com/document/d/1L-V01VpvWHNMMwFAQ7y3_4f-uG7nKGFL-_ZhelUkfoI/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1045, N'Tiêu chí 11.1: Tỉ lệ thôi học, tốt nghiệp được xác lập, giám sát và đối sánh để cải tiến chất lượng.', 11, N'https://drive.google.com/file/d/1u3UO6F4qY0gqVB2XlYemwMgH6_M2S01L/preview', N'https://docs.google.com/document/d/19Ad4eAbnVxLu9A7k6JVHPrer6VVM7nrUcgai5zsrSkw/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1046, N'Tiêu chí 11.2: Thời gian tốt nghiệp trung bình được xác lập, giám sát và đối sánh để cải tiến chất lượng.', 11, N'https://drive.google.com/file/d/1nVEb2dVBt0FHTf6VY2bfuYMWOnVKe57l/preview', N'https://docs.google.com/document/d/154q8M_h1VtcGX-hnYEJ2TBuQTHpBC-hCSJGzq0kXD1Q/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1047, N'Tiêu chí 11.3: Tỉ lệ có việc làm sau tốt nghiệp được xác lập, giám sát và đối sánh để cải tiến chất lượng.', 11, N'https://drive.google.com/file/d/13SN3Ti5bFHVOUfh5iCugZ8knIjkzPyM3/preview', N'https://docs.google.com/document/d/1fdPDPdG7aag2w5pAEKBL4rQDmMcY92B4Iy6gELygPXY/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1048, N'Tiêu chí 11.4: Loại hình và số lượng các hoạt động nghiên cứu của người học được xác lập, giám sát và đối sánh để cải tiến chất lượng.', 11, N'https://drive.google.com/file/d/1NqSco5EuKzmhunLFUwgulmqckzhVhtG_/preview', N'https://docs.google.com/document/d/1bBVMH7PK3bjbm2x1nQez_cFP1sto_sEAFjZfrOUq29k/edit')
INSERT [dbo].[TIEUCHI] ([MATIEUCHI], [TIEUDETIEUCHI], [MATIEUCHUAN], [DUONGDAN_ND], [DUONGDAN_CHINHSUA]) VALUES (1049, N'Tiêu chí 11.5: Mức độ hài lòng của các bên liên quan được xác lập, giám sát và đối sánh để cải tiến chất lượng.', 11, N'https://drive.google.com/file/d/1jsIKHf0pv26QB9XglYgQ9Q2sdQDptCKA/preview', N'https://docs.google.com/document/d/1nVlIosMGjQQ8IEY-2iERBnG8rgKL73A5kL3SxZrSuNA/edit')
SET IDENTITY_INSERT [dbo].[TIEUCHI] OFF
GO
--Nhap lieu bang Tieu Chuan

SET IDENTITY_INSERT [dbo].[TIEUCHUAN] ON 
INSERT [dbo].[TIEUCHUAN] ([MATIEUCHUAN], [TIEUDETIEUCHUAN]) VALUES (1, N'TIÊU CHUẨN 1: MỤC TIÊU VÀ CHUẨN ĐẦU RA CỦA CHƯƠNG TRÌNH ĐÀO TẠO')
INSERT [dbo].[TIEUCHUAN] ([MATIEUCHUAN], [TIEUDETIEUCHUAN]) VALUES (2, N'TIÊU CHUẨN 2: BẢN MÔ TẢ CHƯƠNG TRÌNH ĐÀO TẠO')
INSERT [dbo].[TIEUCHUAN] ([MATIEUCHUAN], [TIEUDETIEUCHUAN]) VALUES (3, N'TIÊU CHUẨN 3: CẤU TRÚC VÀ NỘI DUNG CHƯƠNG TRÌNH DẠY HỌC')
INSERT [dbo].[TIEUCHUAN] ([MATIEUCHUAN], [TIEUDETIEUCHUAN]) VALUES (4, N'TIÊU CHUẨN 4: PHƯƠNG PHÁP TIẾP CẬN TRONG DẠY VÀ HỌC')
INSERT [dbo].[TIEUCHUAN] ([MATIEUCHUAN], [TIEUDETIEUCHUAN]) VALUES (5, N'TIÊU CHUẨN 5: ĐÁNH GIÁ KẾT QUẢ HỌC TẬP CỦA NGƯỜI HỌC')
INSERT [dbo].[TIEUCHUAN] ([MATIEUCHUAN], [TIEUDETIEUCHUAN]) VALUES (6, N'TIÊU CHUẨN 6: ĐỘI NGŨ GIẢNG VIÊN, NGHIÊN CỨU VIÊN')
INSERT [dbo].[TIEUCHUAN] ([MATIEUCHUAN], [TIEUDETIEUCHUAN]) VALUES (7, N'TIÊU CHUẨN 7: ĐỘI NGŨ NHÂN VIÊN')
INSERT [dbo].[TIEUCHUAN] ([MATIEUCHUAN], [TIEUDETIEUCHUAN]) VALUES (8, N'TIÊU CHUẨN 8: NGƯỜI HỌC VÀ HOẠT ĐỘNG HỖ TRỢ NGƯỜI HỌC')
INSERT [dbo].[TIEUCHUAN] ([MATIEUCHUAN], [TIEUDETIEUCHUAN]) VALUES (9, N'TIÊU CHUẨN 9: CƠ SỞ VẬT CHẤT VÀ TRANG THIẾT BỊ')
INSERT [dbo].[TIEUCHUAN] ([MATIEUCHUAN], [TIEUDETIEUCHUAN]) VALUES (10, N'TIÊU CHUẨN 10: NÂNG CAO CHẤT LƯỢNG')
INSERT [dbo].[TIEUCHUAN] ([MATIEUCHUAN], [TIEUDETIEUCHUAN]) VALUES (11, N'TIÊU CHUẨN 11: KẾT QUẢ ĐẦU RA')
SET IDENTITY_INSERT [dbo].[TIEUCHUAN] OFF

GO

--Khoa Ngoai
ALTER TABLE [dbo].[KEHOACHCAITIEN]  WITH CHECK ADD  CONSTRAINT [FK_KHCT_TC] FOREIGN KEY([MA_TC])
REFERENCES [dbo].[TIEUCHUAN] ([MATIEUCHUAN])
GO
ALTER TABLE [dbo].[KQ_DANHGIA_PHAN1]  WITH CHECK ADD  CONSTRAINT [FK_DG_P1] FOREIGN KEY([MATP])
REFERENCES [dbo].[P1_KHAIQUAT] ([MATP])
GO
ALTER TABLE [dbo].[KQ_DANHGIA_PHAN1] CHECK CONSTRAINT [FK_DG_P1]
GO
ALTER TABLE [dbo].[KQ_DANHGIA_PHAN3]  WITH CHECK ADD  CONSTRAINT [FK_DG_P3] FOREIGN KEY([MATP])
REFERENCES [dbo].[P3_KETLUAN] ([MATP])
GO
ALTER TABLE [dbo].[KQ_DANHGIA_PHAN3] CHECK CONSTRAINT [FK_DG_P3]
GO
ALTER TABLE [dbo].[KQ_DANHGIA_PHAN4]  WITH CHECK ADD  CONSTRAINT [FK_DG_P4] FOREIGN KEY([MAPL])
REFERENCES [dbo].[P4_PHULUC] ([MAPL])
GO
ALTER TABLE [dbo].[KQ_DANHGIA_PHAN4] CHECK CONSTRAINT [FK_DG_P4]
GO
ALTER TABLE [dbo].[KQ_DANHGIA_TIEUCHI]  WITH CHECK ADD  CONSTRAINT [FK_DG_TC] FOREIGN KEY([MATIEUCHI])
REFERENCES [dbo].[TIEUCHI] ([MATIEUCHI])
GO
ALTER TABLE [dbo].[KQ_DANHGIA_TIEUCHI] CHECK CONSTRAINT [FK_DG_TC]
GO
ALTER TABLE [dbo].[KQ_KIEMDUYET_PHAN1]  WITH CHECK ADD  CONSTRAINT [FK_KD_P1] FOREIGN KEY([MATP])
REFERENCES [dbo].[P1_KHAIQUAT] ([MATP])
GO
ALTER TABLE [dbo].[KQ_KIEMDUYET_PHAN1] CHECK CONSTRAINT [FK_KD_P1]
GO
ALTER TABLE [dbo].[KQ_KIEMDUYET_PHAN3]  WITH CHECK ADD  CONSTRAINT [FK_KD_P3] FOREIGN KEY([MATP])
REFERENCES [dbo].[P3_KETLUAN] ([MATP])
GO
ALTER TABLE [dbo].[KQ_KIEMDUYET_PHAN3] CHECK CONSTRAINT [FK_KD_P3]
GO
ALTER TABLE [dbo].[KQ_KIEMDUYET_PHAN4]  WITH CHECK ADD  CONSTRAINT [FK_KD_P4] FOREIGN KEY([MAPL])
REFERENCES [dbo].[P4_PHULUC] ([MAPL])
GO
ALTER TABLE [dbo].[KQ_KIEMDUYET_PHAN4] CHECK CONSTRAINT [FK_KD_P4]
GO
ALTER TABLE [dbo].[KQ_KIEMDUYET_TIEUCCHI]  WITH CHECK ADD  CONSTRAINT [FK_KD_TC] FOREIGN KEY([MATIEUCHI])
REFERENCES [dbo].[TIEUCHI] ([MATIEUCHI])
GO
ALTER TABLE [dbo].[KQ_KIEMDUYET_TIEUCCHI] CHECK CONSTRAINT [FK_KD_TC]
GO
ALTER TABLE [dbo].[MINHCHUNG]  WITH CHECK ADD  CONSTRAINT [FK_MC_TC] FOREIGN KEY([MATIEUCHI])
REFERENCES [dbo].[TIEUCHI] ([MATIEUCHI])
GO
ALTER TABLE [dbo].[MINHCHUNG] CHECK CONSTRAINT [FK_MC_TC]
GO
ALTER TABLE [dbo].[NHANSU]  WITH CHECK ADD  CONSTRAINT [FK_NS_CV] FOREIGN KEY([MA_CV])
REFERENCES [dbo].[CHUCVU] ([MA_CV])
GO
ALTER TABLE [dbo].[NHANSU] CHECK CONSTRAINT [FK_NS_CV]
GO
ALTER TABLE [dbo].[NHANSU]  WITH CHECK ADD  CONSTRAINT [FK_NS_NH] FOREIGN KEY([MA_NH])
REFERENCES [dbo].[NHOM] ([MA_NH])
GO
ALTER TABLE [dbo].[NHANSU] CHECK CONSTRAINT [FK_NS_NH]
GO
ALTER TABLE [dbo].[NHANSU]  WITH CHECK ADD  CONSTRAINT [FK_NS_NQ] FOREIGN KEY([MA_NQ])
REFERENCES [dbo].[NHOMQUYEN] ([MA_NQ])
GO
ALTER TABLE [dbo].[NHANSU] CHECK CONSTRAINT [FK_NS_NQ]
GO
ALTER TABLE [dbo].[P1_KHAIQUAT]  WITH CHECK ADD  CONSTRAINT [FK_KQ_HS] FOREIGN KEY([MABAOCAO])
REFERENCES [dbo].[HOSOBC] ([MABAOCAO])
GO
ALTER TABLE [dbo].[P1_KHAIQUAT] CHECK CONSTRAINT [FK_KQ_HS]
GO
ALTER TABLE [dbo].[P2_DANHGIA]  WITH CHECK ADD  CONSTRAINT [FK_DG_HS] FOREIGN KEY([MABAOCAO])
REFERENCES [dbo].[HOSOBC] ([MABAOCAO])
GO
ALTER TABLE [dbo].[P2_DANHGIA] CHECK CONSTRAINT [FK_DG_HS]
GO
ALTER TABLE [dbo].[P2_DANHGIA]  WITH CHECK ADD  CONSTRAINT [FK_DG_TIEUCCHUAN] FOREIGN KEY([MATIEUCHUAN])
REFERENCES [dbo].[TIEUCHUAN] ([MATIEUCHUAN])
GO
ALTER TABLE [dbo].[P2_DANHGIA] CHECK CONSTRAINT [FK_DG_TIEUCCHUAN]
GO
ALTER TABLE [dbo].[P3_KETLUAN]  WITH CHECK ADD  CONSTRAINT [FK_KL_HS] FOREIGN KEY([MABAOCAO])
REFERENCES [dbo].[HOSOBC] ([MABAOCAO])
GO
ALTER TABLE [dbo].[P3_KETLUAN] CHECK CONSTRAINT [FK_KL_HS]
GO
ALTER TABLE [dbo].[P4_PHULUC]  WITH CHECK ADD  CONSTRAINT [FK_PL_HS] FOREIGN KEY([MABAOCAO])
REFERENCES [dbo].[HOSOBC] ([MABAOCAO])
GO
ALTER TABLE [dbo].[P4_PHULUC] CHECK CONSTRAINT [FK_PL_HS]
GO
ALTER TABLE [dbo].[PHANCONG_BC_TV]  WITH CHECK ADD  CONSTRAINT [FK_PCBC_TV_HS] FOREIGN KEY([MABAOCAO])
REFERENCES [dbo].[HOSOBC] ([MABAOCAO])
GO
ALTER TABLE [dbo].[PHANCONG_BC_TV] CHECK CONSTRAINT [FK_PCBC_TV_HS]
GO
ALTER TABLE [dbo].[PHANCONG_BC_TV]  WITH CHECK ADD  CONSTRAINT [FK_PCNH_NS] FOREIGN KEY([MA_NS])
REFERENCES [dbo].[NHANSU] ([MA_NS])
GO
ALTER TABLE [dbo].[PHANCONG_BC_TV] CHECK CONSTRAINT [FK_PCNH_NS]
GO
ALTER TABLE [dbo].[QUYEN]  WITH CHECK ADD  CONSTRAINT [FK_Q_NQ] FOREIGN KEY([MA_NQ])
REFERENCES [dbo].[NHOMQUYEN] ([MA_NQ])
GO
ALTER TABLE [dbo].[QUYEN] CHECK CONSTRAINT [FK_Q_NQ]
GO
ALTER TABLE [dbo].[TIEUCHI]  WITH CHECK ADD  CONSTRAINT [FK_TC_TC] FOREIGN KEY([MATIEUCHUAN])
REFERENCES [dbo].[TIEUCHUAN] ([MATIEUCHUAN])
GO
ALTER TABLE [dbo].[TIEUCHI] CHECK CONSTRAINT [FK_TC_TC]
GO

CREATE VIEW [dbo].[VW_TIEUCHI_MINHCHUNG]
AS
SELECT        dbo.MINHCHUNG.MATIEUCHI, dbo.MINHCHUNG.DUONGDAN_ND, dbo.MINHCHUNG.MAMINHCHUNG, dbo.MINHCHUNG.TENMINHCHUNG, dbo.TIEUCHI.TIEUDETIEUCHI
FROM            dbo.MINHCHUNG INNER JOIN
                         dbo.TIEUCHI ON dbo.MINHCHUNG.MATIEUCHI = dbo.TIEUCHI.MATIEUCHI

GO

CREATE VIEW [dbo].[VW_TIEUCHI_TIEUCHUAN]
AS
SELECT        dbo.TIEUCHI.MATIEUCHI, dbo.TIEUCHI.MATIEUCHUAN, dbo.TIEUCHI.TIEUDETIEUCHI, dbo.TIEUCHI.DUONGDAN_CHINHSUA, dbo.TIEUCHI.DUONGDAN_ND, dbo.TIEUCHUAN.TIEUDETIEUCHUAN
FROM            dbo.TIEUCHI INNER JOIN
                         dbo.TIEUCHUAN ON dbo.TIEUCHI.MATIEUCHUAN = dbo.TIEUCHUAN.MATIEUCHUAN
