USE [QLBH]
GO
/****** Object:  Table [dbo].[ADMIN]    Script Date: 7/7/2020 3:52:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ADMIN](
	[MAAD] [int] IDENTITY(1,1) NOT NULL,
	[TENAD] [nvarchar](50) NULL,
	[NGAYSINH] [datetime] NULL,
	[GIOITINH] [nvarchar](5) NULL,
	[DIACHI] [nvarchar](200) NULL,
	[EMAIL] [varchar](50) NULL,
	[MATKHAU] [varchar](30) NULL,
	[TRANGTHAI] [bit] NULL,
 CONSTRAINT [PK__ADMIN__603F0868AA7C0727] PRIMARY KEY CLUSTERED 
(
	[MAAD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTHOADON]    Script Date: 7/7/2020 3:52:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHOADON](
	[MAHD] [int] NOT NULL,
	[MASP] [int] NOT NULL,
	[TENSP] [nvarchar](20) NULL,
	[SOLUONG] [int] NULL,
	[DONGIA] [decimal](20, 0) NULL,
	[THANHTIEN]  AS ([DonGia]*[SoLuong]),
 CONSTRAINT [PK__CTHOADON__563D086DD47FEF13] PRIMARY KEY CLUSTERED 
(
	[MAHD] ASC,
	[MASP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DANHMUC]    Script Date: 7/7/2020 3:52:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHMUC](
	[MADM] [int] IDENTITY(1,1) NOT NULL,
	[TENDM] [nvarchar](100) NULL,
	[MAMN] [int] NULL,
	[TRANGTHAI] [bit] NULL,
 CONSTRAINT [PK__DANHMUC__603F005CF0FD52BF] PRIMARY KEY CLUSTERED 
(
	[MADM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HOADON]    Script Date: 7/7/2020 3:52:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HOADON](
	[MAHD] [int] IDENTITY(1,1) NOT NULL,
	[MAKH] [int] NULL,
	[TENKH] [nvarchar](30) NULL,
	[DIENTHOAI] [varchar](12) NULL,
	[DIACHI] [nvarchar](200) NULL,
	[DONGIA] [decimal](20, 0) NULL,
	[NGAYDAT] [datetime] NULL,
	[NGAYGIAO] [datetime] NULL,
	[HTTHANHTOAN] [nvarchar](100) NULL,
	[HTGIAOHANG] [nvarchar](100) NULL,
	[TRANGTHAI] [bit] NULL,
 CONSTRAINT [PK__HOADON__603F20CE950CC8C8] PRIMARY KEY CLUSTERED 
(
	[MAHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 7/7/2020 3:52:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MAKH] [int] IDENTITY(1,1) NOT NULL,
	[HOTEN] [nvarchar](100) NULL,
	[DIENTHOAI] [varchar](50) NULL,
	[EMAIL] [varchar](100) NULL,
	[MATKHAU] [varchar](100) NULL,
	[GIOITINH] [nvarchar](5) NULL,
	[NGAYSINH] [datetime] NULL,
	[DIACHI] [nvarchar](300) NULL,
	[TRANGTHAI] [bit] NULL,
 CONSTRAINT [PK__KHACHHAN__603F592CC3EB670C] PRIMARY KEY CLUSTERED 
(
	[MAKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MENU]    Script Date: 7/7/2020 3:52:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MENU](
	[MAMN] [int] IDENTITY(1,1) NOT NULL,
	[TENMN] [nvarchar](50) NULL,
	[HREF] [varchar](100) NULL,
	[TRANGTHAI] [bit] NULL,
 CONSTRAINT [PK__MENU__603F69ED8FAD2ABF] PRIMARY KEY CLUSTERED 
(
	[MAMN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QUANGCAO]    Script Date: 7/7/2020 3:52:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QUANGCAO](
	[MAQC] [int] IDENTITY(1,1) NOT NULL,
	[TENQC] [nvarchar](100) NULL,
	[ANHQC] [varchar](100) NULL,
	[HREF] [varchar](100) NULL,
	[THUTUQC] [smallint] NULL,
	[TRANGTHAI] [bit] NULL,
 CONSTRAINT [PK__QUANGCAO__602379FD3FB98AA5] PRIMARY KEY CLUSTERED 
(
	[MAQC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 7/7/2020 3:52:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[MASP] [int] IDENTITY(1,1) NOT NULL,
	[TENSP] [nvarchar](150) NULL,
	[ANHSP] [varchar](200) NULL,
	[XUATSU] [nvarchar](100) NULL,
	[MOTA] [nvarchar](max) NULL,
	[GIASP] [decimal](10, 0) NULL,
	[GIAMGIA] [decimal](10, 0) NULL,
	[SPMOI] [smallint] NULL,
	[MADM] [int] NULL,
	[LUOTXEM] [int] NULL,
	[SOLUONG] [int] NULL,
 CONSTRAINT [PK__SANPHAM__60228A32F499494F] PRIMARY KEY CLUSTERED 
(
	[MASP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TINTUC]    Script Date: 7/7/2020 3:52:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TINTUC](
	[MATT] [int] IDENTITY(1,1) NOT NULL,
	[MAAD] [int] NOT NULL,
	[TIEUDE] [nvarchar](200) NULL,
	[ANH] [varchar](200) NULL,
	[NGAYDANG] [datetime] NULL,
	[MOTA] [nvarchar](300) NULL,
	[NOIDUNG] [nvarchar](max) NULL,
	[NOIBAT] [int] NULL,
	[LUOTXEM] [int] NULL,
 CONSTRAINT [PK__TINTUC__F6208289AA7E8A46] PRIMARY KEY CLUSTERED 
(
	[MATT] ASC,
	[MAAD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ADMIN] ON 

INSERT [dbo].[ADMIN] ([MAAD], [TENAD], [NGAYSINH], [GIOITINH], [DIACHI], [EMAIL], [MATKHAU], [TRANGTHAI]) VALUES (1, N'Nguyễn Quang Linh', CAST(N'1998-03-23 00:00:00.000' AS DateTime), N'Nam', N'Bình Định', N'linhnguyen1998125@gmail.com', N'1', 1)
INSERT [dbo].[ADMIN] ([MAAD], [TENAD], [NGAYSINH], [GIOITINH], [DIACHI], [EMAIL], [MATKHAU], [TRANGTHAI]) VALUES (2, N'Tran Thi Phuong', CAST(N'2000-02-25 00:00:00.000' AS DateTime), N'Nam', N'Thanh hóa', N'phuongtran@gmail.com', N'1', 1)
SET IDENTITY_INSERT [dbo].[ADMIN] OFF
SET IDENTITY_INSERT [dbo].[DANHMUC] ON 

INSERT [dbo].[DANHMUC] ([MADM], [TENDM], [MAMN], [TRANGTHAI]) VALUES (1, N'Hoa tặng mẹ', 3, 1)
INSERT [dbo].[DANHMUC] ([MADM], [TENDM], [MAMN], [TRANGTHAI]) VALUES (2, N'Hoa sinh nhật', 3, 1)
INSERT [dbo].[DANHMUC] ([MADM], [TENDM], [MAMN], [TRANGTHAI]) VALUES (3, N'Hoa chia buồn', 3, 1)
INSERT [dbo].[DANHMUC] ([MADM], [TENDM], [MAMN], [TRANGTHAI]) VALUES (4, N'Hoa chúc mừng', 3, 1)
INSERT [dbo].[DANHMUC] ([MADM], [TENDM], [MAMN], [TRANGTHAI]) VALUES (5, N'Hoa tình yêu', 3, 1)
INSERT [dbo].[DANHMUC] ([MADM], [TENDM], [MAMN], [TRANGTHAI]) VALUES (6, N'Khác', 3, 1)
SET IDENTITY_INSERT [dbo].[DANHMUC] OFF
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON 

INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [DIENTHOAI], [EMAIL], [MATKHAU], [GIOITINH], [NGAYSINH], [DIACHI], [TRANGTHAI]) VALUES (7, N'Nguyễn Quang Huy', N'0908135210', N'nguyenquanghuy@gmail.com', N'12', N'Nam', CAST(N'1998-12-15 00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [DIENTHOAI], [EMAIL], [MATKHAU], [GIOITINH], [NGAYSINH], [DIACHI], [TRANGTHAI]) VALUES (8, N'Lê Trung Hiếu', N'0972612445', N'linhnsdsdsd8125@gmail.com', N'123', N'Nam', CAST(N'1998-12-15 00:00:00.000' AS DateTime), N'Nguyễn Viết Xuân', 1)
INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [DIENTHOAI], [EMAIL], [MATKHAU], [GIOITINH], [NGAYSINH], [DIACHI], [TRANGTHAI]) VALUES (10, N'Phương Hàn Kelly', NULL, N'tphuonghan0610@gmail.com', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [DIENTHOAI], [EMAIL], [MATKHAU], [GIOITINH], [NGAYSINH], [DIACHI], [TRANGTHAI]) VALUES (11, N'Hàn Phương', NULL, N'phonghan97@gmail.com', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [DIENTHOAI], [EMAIL], [MATKHAU], [GIOITINH], [NGAYSINH], [DIACHI], [TRANGTHAI]) VALUES (12, N'Cuong cho', NULL, N'nguyenchicuong31998@gmail.com', N'1', N'Nam', NULL, NULL, 1)
INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [DIENTHOAI], [EMAIL], [MATKHAU], [GIOITINH], [NGAYSINH], [DIACHI], [TRANGTHAI]) VALUES (14, N'phuong', N'0372325249', N'nguyenchicuong31998@gmail.com', N'1', N'Nam', NULL, NULL, 1)
INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [DIENTHOAI], [EMAIL], [MATKHAU], [GIOITINH], [NGAYSINH], [DIACHI], [TRANGTHAI]) VALUES (15, N'sdfsdfsd', N'55', N'nguyenchicuong31998@gmail.com', N'1', N'Nam', NULL, NULL, 1)
INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [DIENTHOAI], [EMAIL], [MATKHAU], [GIOITINH], [NGAYSINH], [DIACHI], [TRANGTHAI]) VALUES (16, N'sdfsdfsd', N'55', N'nguyenchicuong31998@gmail.com', N'dsf', N'Nam', NULL, NULL, 1)
INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [DIENTHOAI], [EMAIL], [MATKHAU], [GIOITINH], [NGAYSINH], [DIACHI], [TRANGTHAI]) VALUES (17, N'sdfsdfsd', N'0372325249', N'nguyenchicuong31998@gmail.com', N'1', N'Nam', NULL, NULL, 1)
INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [DIENTHOAI], [EMAIL], [MATKHAU], [GIOITINH], [NGAYSINH], [DIACHI], [TRANGTHAI]) VALUES (18, N'Trần Phương', N'0123', N'phuong1@gmail.com', N'123', N'Nữ', NULL, NULL, 1)
INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [DIENTHOAI], [EMAIL], [MATKHAU], [GIOITINH], [NGAYSINH], [DIACHI], [TRANGTHAI]) VALUES (21, N'Liu Sally', NULL, N'facebook@gmail.com', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [DIENTHOAI], [EMAIL], [MATKHAU], [GIOITINH], [NGAYSINH], [DIACHI], [TRANGTHAI]) VALUES (31, N'NguyenLInh', NULL, N'linhnguyen1998125@gmail.com', N'202cb962ac5975b964b7152d234b70', N'Nam', CAST(N'2000-02-02 00:00:00.000' AS DateTime), N'dd', 1)
INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [DIENTHOAI], [EMAIL], [MATKHAU], [GIOITINH], [NGAYSINH], [DIACHI], [TRANGTHAI]) VALUES (33, N'phuong', N'0372325249', N'phuong@gmail.com', N'202cb962ac5975b964b7152d234b70', N'Nam', CAST(N'1998-02-02 00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [DIENTHOAI], [EMAIL], [MATKHAU], [GIOITINH], [NGAYSINH], [DIACHI], [TRANGTHAI]) VALUES (34, N'nam', N'0372325249', N'nam@gmail.com', N'202cb962ac5975b964b7152d234b70', N'Nam', CAST(N'1998-02-02 00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [DIENTHOAI], [EMAIL], [MATKHAU], [GIOITINH], [NGAYSINH], [DIACHI], [TRANGTHAI]) VALUES (1044, N'Trần Phương', N'0372325249', N'linhnguyen199812@gmail.com', N'202cb962ac5975b964b7152d234b70', N'Nam', CAST(N'2000-02-02 00:00:00.000' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF
SET IDENTITY_INSERT [dbo].[MENU] ON 

INSERT [dbo].[MENU] ([MAMN], [TENMN], [HREF], [TRANGTHAI]) VALUES (1, N'Trang chủ', N'Trang-Chu', 1)
INSERT [dbo].[MENU] ([MAMN], [TENMN], [HREF], [TRANGTHAI]) VALUES (2, N'Giới thiệu', N'Gioi-Thieu', 1)
INSERT [dbo].[MENU] ([MAMN], [TENMN], [HREF], [TRANGTHAI]) VALUES (3, N'Sản phẩm', N'San-Pham', 1)
INSERT [dbo].[MENU] ([MAMN], [TENMN], [HREF], [TRANGTHAI]) VALUES (4, N'Tin tức', N'Tin-Tuc', 1)
INSERT [dbo].[MENU] ([MAMN], [TENMN], [HREF], [TRANGTHAI]) VALUES (5, N'Liên hệ', N'Lien-He', 1)
INSERT [dbo].[MENU] ([MAMN], [TENMN], [HREF], [TRANGTHAI]) VALUES (6, N'Ý nghĩa hoa', N'y-nghia', 1)
INSERT [dbo].[MENU] ([MAMN], [TENMN], [HREF], [TRANGTHAI]) VALUES (8, N'Giỏ hàng tự chọn', N'Tu-Chon', 1)
SET IDENTITY_INSERT [dbo].[MENU] OFF
SET IDENTITY_INSERT [dbo].[QUANGCAO] ON 

INSERT [dbo].[QUANGCAO] ([MAQC], [TENQC], [ANHQC], [HREF], [THUTUQC], [TRANGTHAI]) VALUES (1, N'Logo', N'~/Image/logo.png', NULL, 1, 1)
INSERT [dbo].[QUANGCAO] ([MAQC], [TENQC], [ANHQC], [HREF], [THUTUQC], [TRANGTHAI]) VALUES (2, N'Slider1', N'~/Image/slider_1.png', NULL, 2, 1)
INSERT [dbo].[QUANGCAO] ([MAQC], [TENQC], [ANHQC], [HREF], [THUTUQC], [TRANGTHAI]) VALUES (3, N'Slider2', N'~/Image/slider_2.png', NULL, 3, 1)
INSERT [dbo].[QUANGCAO] ([MAQC], [TENQC], [ANHQC], [HREF], [THUTUQC], [TRANGTHAI]) VALUES (4, N'Slider3', N'~/Image/slider_3.png', NULL, 4, 0)
INSERT [dbo].[QUANGCAO] ([MAQC], [TENQC], [ANHQC], [HREF], [THUTUQC], [TRANGTHAI]) VALUES (5, N'Banner1', N'~/Image/banner_1.png', NULL, 5, 1)
INSERT [dbo].[QUANGCAO] ([MAQC], [TENQC], [ANHQC], [HREF], [THUTUQC], [TRANGTHAI]) VALUES (6, N'Banner2', N'~/Image/banner_2.png', NULL, 6, 1)
INSERT [dbo].[QUANGCAO] ([MAQC], [TENQC], [ANHQC], [HREF], [THUTUQC], [TRANGTHAI]) VALUES (7, N'Banner3', N'~/Image/banner_3.png', NULL, 7, 1)
INSERT [dbo].[QUANGCAO] ([MAQC], [TENQC], [ANHQC], [HREF], [THUTUQC], [TRANGTHAI]) VALUES (8, N'Slider4', N'~/Image/slider_4.jpg', NULL, 2, 0)
INSERT [dbo].[QUANGCAO] ([MAQC], [TENQC], [ANHQC], [HREF], [THUTUQC], [TRANGTHAI]) VALUES (9, N'Slider5', N'~/Image/slider_5.jpg', N'', 4, 1)
INSERT [dbo].[QUANGCAO] ([MAQC], [TENQC], [ANHQC], [HREF], [THUTUQC], [TRANGTHAI]) VALUES (10, N'Banner4', N'~/Image/banner_4.png', NULL, 8, 1)
SET IDENTITY_INSERT [dbo].[QUANGCAO] OFF
SET IDENTITY_INSERT [dbo].[SANPHAM] ON 

INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [ANHSP], [XUATSU], [MOTA], [GIASP], [GIAMGIA], [SPMOI], [MADM], [LUOTXEM], [SOLUONG]) VALUES (1, N'CHEER UP', N'sactimhb.jpg', N'Mỹ', N'Với sắc đỏ chủ đạo là hồng đỏ sa, cẩm chướng đỏ, lan phượng vĩ, hoà quyện cùng tone xanh mát của lá bạc đã tạo nên một sản phẩm vô cùng bắt mắt. Bó hoa phù hợp tặng cho những cô nàng cá tính, hoặc những ai là tín đồ lâu năm của hồng đỏ- một màu sắc luôn mang đến sự mãnh liệt.', CAST(500000 AS Decimal(10, 0)), CAST(500000 AS Decimal(10, 0)), 1, 2, 148, 103)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [ANHSP], [XUATSU], [MOTA], [GIASP], [GIAMGIA], [SPMOI], [MADM], [LUOTXEM], [SOLUONG]) VALUES (2, N'YÊU THƯƠNG HẠNH PHÚC', N'hoa-sinh-nhat.jpg', N'Mỹ', N'"Yêu Thương Hạnh Phúc"kể một câu chuyện tình yêu ngọt ngào và lãng mạn. Bó hoa là sự kết hợp của hoa hồng tím và hoa hồng da đan xen và hòa quyện cùng với cúc calimero tựa như giai điệu của những đôi đang hạnh phúc khi bên nhau. Lúc sôi động khi thì trầm lHOA ĐỒNG TIỀN - HƯNG THỊNH 4ắng nhẹ nhàng.', CAST(1500000 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), 1, 2, 12, 200)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [ANHSP], [XUATSU], [MOTA], [GIASP], [GIAMGIA], [SPMOI], [MADM], [LUOTXEM], [SOLUONG]) VALUES (3, N'HỒNG TƯƠI', N'tangme.jpg', N'Việt Nam', N'Bó hoa hồng xinh xắn được thiết kế tông hồng nhạt từ những bông hoa hồng giống mới nở to và đẹp, phù hợp cho việc tặng các bạn nữ trong các dịp chúc mừng, sinh nhật.', CAST(1000000 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), 0, 1, 3, 200)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [ANHSP], [XUATSU], [MOTA], [GIASP], [GIAMGIA], [SPMOI], [MADM], [LUOTXEM], [SOLUONG]) VALUES (4, N' KÍNH TRỌNG', N'tangme2.jpg', N'Việt Nam', N'Những đóa sen tươi thắm đang đua nhau khoe sắc màu cao quý và sang trọng kính tặng ông bà, cha mẹ, thầy cô, những người lớn tuổi,... để thể hiện lòng hiếu thảo, sự biết ơn vô bờ bến của con cháu, của học trò và kính chúc ông bà, cha mẹ, thầy cô sức khỏe thật dồi dào và vui vẻ. Thích hợp để tặng chúc mừng, kỉ niệm,...', CAST(3200000 AS Decimal(10, 0)), CAST(300000 AS Decimal(10, 0)), 1, 1, 27, 500)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [ANHSP], [XUATSU], [MOTA], [GIASP], [GIAMGIA], [SPMOI], [MADM], [LUOTXEM], [SOLUONG]) VALUES (5, N'GỬI GẮM YÊU THƯƠNG', N'tangme3.jpg', N'Việt Nam', N'Gửi Gắm Yêu Thương là sự kết hợp hài hòa của hoa hồng các màu. Những đóa hoa mang đến thông điệp gửi gắm yêu thương đến người nhận cùng với phong cách bó hoa ngẫu hứng thể hiện sự đoàn kết, sum vầy và tình yêu trọn vẹn. Bó hoa sẽ mang đến người nhận thật nhiều niềm vui, may mắn và sức khỏe để tận hưởng cuộc sống tươi đẹp muôn màu muôn vẻ xung quanh mình. Thích hợp để tặng chúc mừng, kỉ niệm,...', CAST(2000000 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), 1, 1, 42, 502)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [ANHSP], [XUATSU], [MOTA], [GIASP], [GIAMGIA], [SPMOI], [MADM], [LUOTXEM], [SOLUONG]) VALUES (6, N'LỜI CẢM ƠN', N'tangme4.jpg', N'Việt Nam', N'Khi không còn trẻ nữa, chúng ta sẽ biết trân quý những mối quan hệ quanh mình hơn và đặc biệt là gia đình. Do đó, với mẫu hoa được thiết kế đặc biệt này, bạn có thể dành riêng cho các thành viên trong gia đình và những người bạn thân thiết vào những dịp đặc biệt với thông điệp " Cảm ơn vì đã ở bên cạnh và ủng hộ tinh thần vào những lúc tôi khó khăn nhất".', CAST(2500000 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), 0, 1, 4, 600)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [ANHSP], [XUATSU], [MOTA], [GIASP], [GIAMGIA], [SPMOI], [MADM], [LUOTXEM], [SOLUONG]) VALUES (7, N'TÌNH ẤM ÁP', N'tangme5.jpg', N'Mỹ', N'HOA ĐỒNG TIỀN - HƯNG THỊNH 4', CAST(100000 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), 0, 1, 3, 200)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [ANHSP], [XUATSU], [MOTA], [GIASP], [GIAMGIA], [SPMOI], [MADM], [LUOTXEM], [SOLUONG]) VALUES (8, N'KÍNH TRỌNG 2', N'tangme6.jpg', N'Việt Nam', N'Những đóa sen tươi thắm đang đua nhau khoe sắc màu cao quý và sang trọng kính tặng ông bà, cha mẹ, thầy cô, những người lớn tuổi,... để thể hiện lòng hiếu thảo, sự biết ơn vô bờ bến của con cháu, của học trò và kính chúc ông bà, cha mẹ, thầy cô sức khỏe thật dồi dào và vui vẻ. Thích hợp để tặng chúc mừng, kỉ niệm,...', CAST(2500000 AS Decimal(10, 0)), CAST(200000 AS Decimal(10, 0)), 0, 1, 28, 150)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [ANHSP], [XUATSU], [MOTA], [GIASP], [GIAMGIA], [SPMOI], [MADM], [LUOTXEM], [SOLUONG]) VALUES (9, N'ÂN TÌNH', N'tangme7.jpg', N'Việt Nam', N'Trong tất cả những loại nợ thì “Nợ ân tình” là món nợ khiến người ta khổ tâm nhất! Bởi lẽ hầu hết những người “cho vay” thứ nợ này đều không mong được trả, và những người muốn trả cũng không thể trả được. “Nợ ân tình” là món nợ mà người ta chẳng thiết tha đòi, nhưng mình thì tha thiết muốn trả! Trả để thấy lòng thanh thản bình yên hơn, để thôi không tự dằn vặt vì mình đã từ chối món quà ngọt ngào nhất mà số phận đã trao tặng cho', CAST(1500000 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), 0, 1, 37, 300)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [ANHSP], [XUATSU], [MOTA], [GIASP], [GIAMGIA], [SPMOI], [MADM], [LUOTXEM], [SOLUONG]) VALUES (10, N'GOLD LOVE', N'tangme8.jpg', N'Việt Nam', N'Sắc vàng rực rỡ của hoa hồng như một tình yêu dài lâu. Dù mai ra sau thì 2 ta vẫn sẽ luôn bên nhau. Một thứ tình yêu mộc mạc, bình dị không cần quá cầu kỳ nhưng vẫn luôn sắc son bền vững. Đừng vì những phút giận hờn, vì những cái tôi của bản thân mình mà đánh mất đi thứ hạnh phúc mà mình đang có bạn nhé.', CAST(2500000 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), 0, 1, 2, 200)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [ANHSP], [XUATSU], [MOTA], [GIASP], [GIAMGIA], [SPMOI], [MADM], [LUOTXEM], [SOLUONG]) VALUES (11, N' SỰ QUAN TÂM 2', N'tangme9.jpg', N'Việt Nam', N'Bó hoa hồng vàng được thiết kế xen kẽ cẩm chướng vàng thể hiện sự kính trọng và quan tâm đến người nhận. Sự quan tâm được thể hiện qua bó hoa này rất tinh tế và sang trọng. Thích hợp tặng cho bạn nam và người thích tone màu vàng trong những dịp đặc biệt', CAST(2500000 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), 0, 1, 2, 300)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [ANHSP], [XUATSU], [MOTA], [GIASP], [GIAMGIA], [SPMOI], [MADM], [LUOTXEM], [SOLUONG]) VALUES (12, N'Hoa Sinh Nhật SN029', N'790_299.jpg', N'Việt Nam', N'Hoa sinh nhật là món quà ý nghĩa thể hiện tình cảm mà chúng ta dành tặng cho người thân yêu. Nếu bạn đang băn khoăn không biết lựa chọn mẫu hoa tươi nào thì hãy để hoatuoibopbi chúng tôi giúp bạn.Với màu sắc ngọt ngào và đằm thắm, chỉ cần đặt trọn tình cảm vào sản phẩm hoa tươi bạn thích là bạn có thể khiến sinh nhật người thân trở nên đặc biệt. Nếu còn ngần ngại vì phải đến tận shop hoa tươi, bạn có thể đặt hoa online tại trang web hoatuoibopbi.com. Nơi đã sẵn sàng những mẫu hoa sinh nhật đẹp, phù hợp với túi tiền để bạn lựa chọn.', CAST(2000000 AS Decimal(10, 0)), CAST(300000 AS Decimal(10, 0)), 1, 2, 0, 50)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [ANHSP], [XUATSU], [MOTA], [GIASP], [GIAMGIA], [SPMOI], [MADM], [LUOTXEM], [SOLUONG]) VALUES (13, N'HOA CẨM CHƯỚNG - UNTIL YOU', N'5180_until-you.jpg', N'Việt Nam', N'Khi bạn có lòng thương nhớ với một ai đó sẽ luôn là những cảm xúc khó tả xen lẫn hồi hộp khi được đi bên cạnh người đó. Luôn là nỗi mong nhớ, mong được bên nhau mỗi ngày. Với tone màu tím hộp hoa sẽ thay bạn bày tỏ lòng nhung nhớ gửi đến người thương. Thích hợp tặng sinh nhật, kỉ niệm...
Hộp hoa tươi Until You gồm các loại hoa:

- Cúc ping pong

- Green wicky

- Hoa mõm sói

- Hoa hồng tím

- Hoa lá phụ khác', CAST(5000000 AS Decimal(10, 0)), CAST(600000 AS Decimal(10, 0)), 1, 1, 4, 100)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [ANHSP], [XUATSU], [MOTA], [GIASP], [GIAMGIA], [SPMOI], [MADM], [LUOTXEM], [SOLUONG]) VALUES (14, N'HOA CÚC', N'8396_deep-condolences.jpg', N'Mỹ', N'Chuyện nhân gian vui buồn đều có. Kiếp nhân sinh như gió thoáng qua. Sinh ra trong một kiếp con người. Sớm ở tối về là lẽ thường thôi…Với vòng hoa chia buồn này chúng tôi sẽ thay mặt bạn đưa tiễn họ và chia sẻ sự mất mát cùng gia đình họ.
Kệ hoa tang "Deepest condolences" gồm có:

- Các loại cúc mai hồng, trắng, tím

- Phụ kiện trang trí', CAST(1500000 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), 0, 1, 3, 90)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [ANHSP], [XUATSU], [MOTA], [GIASP], [GIAMGIA], [SPMOI], [MADM], [LUOTXEM], [SOLUONG]) VALUES (16, N'PINK BOX', N'8290_pink-box.jpg', N'Việt Nam', N'Hộp hoa hồng với sắc hồng tươi tắn, ngọt ngào kết hợp cùng với lá bạc xanh, tạo nên một tổng thể vô cùng hài hoà mà không kém phần sang trọng. Hộp hoa phù hợp tặng cho người yêu, bạn bè, đối tác, khách hàng là nữ. Chắc chắn đây sẽ là món quà vô cùng bất ngờ dành cho người bạn đang quan tâm đấy.
Hộp hoa gồm hồng sen nhí, lá bạc, hộp gỗ và phụ kiện trang trí.', CAST(5000000 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), 0, 1, 1, 90)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [ANHSP], [XUATSU], [MOTA], [GIASP], [GIAMGIA], [SPMOI], [MADM], [LUOTXEM], [SOLUONG]) VALUES (17, N'TÌNH KHÚC VÀNG', N'5156_tinh-khuc-vang.jpg', N'Hàn Quốc', N'Những ngươi luôn sống bên bạn và trải qua vui buồn, khó khăn cùng bạn thì đó là những người đáng cho bạn trân trọng cũng như dành tình cảm trân quý nhất dành cho họ. Tựa như bản tình khúc vàng cất lên giúp cho tình cảm ấy càng thêm sâu sắc, bền bĩ cũng năm tháng mãi không nhạt nhòa theo màu thời gian. Thích hợp tặng sinh nhật, hẹn hò, kỉ niệm ngày cưới...
Giỏ hoa tươi Tình Khúc Vàng gồm các loại hoa:

- Hoa hồng trứng gà

- Hoa cát tường

- Hoa thủy tiên

- Hoa lá phụ khác', CAST(2000000 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), 1, 1, 1, 50)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [ANHSP], [XUATSU], [MOTA], [GIASP], [GIAMGIA], [SPMOI], [MADM], [LUOTXEM], [SOLUONG]) VALUES (18, N'ALL OF LOVE', N'8524_all-of-love.jpg', N'Thái Lan', N'Mẫu hoa hồng đỏ này tượng trưng cho tình yêu và sự kính trọng to lớn của con dành cho Mẹ. Mẹ luôn là người tuyệt vời và cao cả nhất trong cuộc đời của con.', CAST(3500000 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), 1, 2, 1, 50)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [ANHSP], [XUATSU], [MOTA], [GIASP], [GIAMGIA], [SPMOI], [MADM], [LUOTXEM], [SOLUONG]) VALUES (19, N'JUST FOR YOU', N'7244_just-for-you.jpg', N'Việt Nam', N'Vì không thể diễn tả hết bằng lời cảm xúc, nỗi lòng của mình, nên bạn có thể gửi gắm qua giỏ hoa này nhé. Tặng cho người thân yêu, biết đâu bạn lại tìm lại hình bóng của một trái tim, tâm hồn luôn khát khao yêu, yêu hết mình nhé. Giỏ hoa thích hợp tặng sinh nhật, kỷ niệm, làm quen v.v...', CAST(1500000 AS Decimal(10, 0)), CAST(200000 AS Decimal(10, 0)), 1, 2, 1, 90)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [ANHSP], [XUATSU], [MOTA], [GIASP], [GIAMGIA], [SPMOI], [MADM], [LUOTXEM], [SOLUONG]) VALUES (20, N'VĨNH HẰNG', N'8398_vinh-hang.jpg', N'Việt Nam', N'Chuyện nhân gian vui buồn đều có. Kiếp nhân sinh như gió thoáng qua. Sinh ra trong một kiếp con người. Sớm ở tối về là lẽ thường thôi…Với vòng hoa chia buồn này chúng tôi sẽ thay mặt bạn đưa tiễn họ và chia sẻ sự mất mát cùng gia đình họ.', CAST(1500000 AS Decimal(10, 0)), CAST(0 AS Decimal(10, 0)), 1, 3, 1, 50)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [ANHSP], [XUATSU], [MOTA], [GIASP], [GIAMGIA], [SPMOI], [MADM], [LUOTXEM], [SOLUONG]) VALUES (21, N'HAI THẾ GIỚI 2', N'8397_hai-the-gioi-2.jpg', N'Việt Nam', N'Trong cuộc sống khi chúng ta mất đi vĩnh viễn một người thân hay người bạn thì luôn để lại nỗi đau xót khôn cùng cho người ở lại. Kệ chia buồn " Hai thế giới" với tone màu vàng - màu của phật pháp được thiết kế để chia buồn với gia chủ theo tôn giáo phật. Chúng tôi sẽ thay mặt bạn đưa tiễn họ và chia sẻ cùng gia đình', CAST(5000000 AS Decimal(10, 0)), CAST(500000 AS Decimal(10, 0)), 0, 3, 12, 90)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [ANHSP], [XUATSU], [MOTA], [GIASP], [GIAMGIA], [SPMOI], [MADM], [LUOTXEM], [SOLUONG]) VALUES (22, N'HỒNG VÀNG ÁNH TRĂNG', N'8286_hong-vang-anh-trang.jpg', N'Hoa kỳ', N'Nhắc tới hồng vàng là nhắc tới biểu tượng của sự thịnh vượng, sự tôn nghiêm và sang trọng. Hồng vàng gợi lên tình cảm ấm áp, luôn chào đón những thử thách, khung trời ước mơ với những dự định, hoài bão. Nó còn là biểu tượng của tình bạn – sự quan tâm.', CAST(1000000 AS Decimal(10, 0)), CAST(600000 AS Decimal(10, 0)), 0, 4, 1, 150)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [ANHSP], [XUATSU], [MOTA], [GIASP], [GIAMGIA], [SPMOI], [MADM], [LUOTXEM], [SOLUONG]) VALUES (23, N'THƠ MỘNG', N'8440_tho-mong.jpg', N'Việt Nam', N'Không cần quá kiểu cách, giỏ hoa được thiết kế theo tông hồng nhạt nhẹ nhàng điểm xuyết thêm gam màu tím thơ mộng, đây chắc chắn sẽ là món quà phù hợp tặng những cô nàng có tính cách nữ tính, dịu dàng.', CAST(1500000 AS Decimal(10, 0)), CAST(200000 AS Decimal(10, 0)), 0, 5, 0, 100)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [ANHSP], [XUATSU], [MOTA], [GIASP], [GIAMGIA], [SPMOI], [MADM], [LUOTXEM], [SOLUONG]) VALUES (28, N'CÙNG NHAU', N'timthumb.jpg', N'Lào', N'Cùng Nhau là mẫu hoa được thiết kế với ý nghĩa gởi đến người nhận thông điệp hãy cùng đồng hành với bạn trong suốt con đường ở tương lai. Bó hoa thích hợp gửi tặng đến bà xã, người yêu trong các dịp đặc biệt. dd', CAST(5000000 AS Decimal(10, 0)), CAST(250000 AS Decimal(10, 0)), 1, 5, 10, 50)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [ANHSP], [XUATSU], [MOTA], [GIASP], [GIAMGIA], [SPMOI], [MADM], [LUOTXEM], [SOLUONG]) VALUES (29, N'IN LOVE', N'8775_in-love.jpg', N'Lào', N'Tình yêu luôn đem đến cho người ta nhiều cảm xúc nhất đặc biệt là khoảng thời thời gian khi hai người đang yêu. Đó là khoảng thời gian hạnh phúc và nhiều màu sắc nhất. Và bó hoa In love này được thiết kế đặc biệt với tone tím chủ đạo tượng trưng cho những điều lãng mạn, tinh tế trong tình yêu, bó hoa thích hợp để gửi tặng đến cô gái đặc biệt của bạn.', CAST(5000000 AS Decimal(10, 0)), CAST(300000 AS Decimal(10, 0)), 1, 2, 10, 100)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [ANHSP], [XUATSU], [MOTA], [GIASP], [GIAMGIA], [SPMOI], [MADM], [LUOTXEM], [SOLUONG]) VALUES (30, N'REST IN PEACE', N'8388_rest-in-peace.jpg', N'Lào', N'Kệ hoa tang "Rest in peace" là sự kết hợp từ các loại hoa hồng, cúc và cẩm chướng... với gam màu chủ đạo là màu tím - gam màu của sự tiếc nuối, buồn thương dành cho người đã khuất. Dù cho họ không còn tồn tại trên cõi đỡi này, nhưng chúng ta hãy cầu nguyện cho họ được an nghỉ yên bình ở một nơi gọi là thiên đường, không còn những vương vấn, rối ren của cuộc sống trần tục.', CAST(5050000 AS Decimal(10, 0)), CAST(522050 AS Decimal(10, 0)), 1, 2, 10, 500)
SET IDENTITY_INSERT [dbo].[SANPHAM] OFF
SET IDENTITY_INSERT [dbo].[TINTUC] ON 

INSERT [dbo].[TINTUC] ([MATT], [MAAD], [TIEUDE], [ANH], [NGAYDANG], [MOTA], [NOIDUNG], [NOIBAT], [LUOTXEM]) VALUES (3, 1, N'Hoa Đà Lạt: Mục tiêu 30% xuất khẩu có khả thi?', N'tintuc-1.jpg', CAST(N'2020-12-03 00:00:00.000' AS DateTime), N'Diện tích hoa của Đà Lạt, Lâm Đồng lên tới 7.600 ha với sản lượng trên 2,3 tỷ cành mỗi năm nhưng lượng hoa xuất khẩu năm 2015 chỉ chiếm 10% (trị giá 26 triệu USD), chưa tương xứng với tiềm năng của vùng đất đỏ bazan màu mỡ, khí hậu mát lành hiếm nơi nào có được.', N'<p style="text-align:center"><img alt="Hoa Đà Lạt: Mục tiêu 30% xuất khẩu có khả thi?" src="https://cafefcdn.com/thumb_w/650/2016/6a-xfkl-1452905951149.jpg" title="Hoa Đà Lạt: Mục tiêu 30% xuất khẩu có khả thi?" /></p>

<p>&nbsp;</p>

<p><span style="font-size:18px"><strong>Hoa hồng Đ&agrave; Lạt chủ yếu ti&ecirc;u thụ nội địa.</strong></span></p>

<h2>Diện t&iacute;ch hoa của Đ&agrave; Lạt, L&acirc;m Đồng l&ecirc;n tới 7.600 ha với sản lượng tr&ecirc;n 2,3 tỷ c&agrave;nh mỗi năm nhưng lượng hoa xuất khẩu năm 2015 chỉ chiếm 10% (trị gi&aacute; 26 triệu USD), chưa tương xứng với tiềm năng của v&ugrave;ng đất đỏ bazan m&agrave;u mỡ, kh&iacute; hậu m&aacute;t l&agrave;nh hiếm nơi n&agrave;o c&oacute; được.</h2>

<p style="margin-left:40px">05-07-2015&nbsp;<a href="https://cafef.vn/nong-thuy-san/hoa-cuc-tang-gia-manh-nong-dan-da-lat-trung-lon-20150705090309461.chn" title="Hoa cúc tăng giá mạnh, nông dân Đà Lạt trúng lớn">Hoa c&uacute;c tăng gi&aacute; mạnh, n&ocirc;ng d&acirc;n Đ&agrave; Lạt tr&uacute;ng lớn</a></p>

<p style="margin-left:40px">16-02-2015&nbsp;<a href="https://cafef.vn/hang-hoa-nguyen-lieu/lang-hoa-da-lat-lo-lo-von-mua-tet-20150216153755243.chn" title="Làng hoa Đà Lạt lo lỗ vốn mùa Tết">L&agrave;ng hoa Đ&agrave; Lạt lo lỗ vốn m&ugrave;a Tết</a></p>

<p style="margin-left:40px">16-01-2015&nbsp;<a href="https://cafef.vn/hang-hoa-nguyen-lieu/hoa-dia-lan-da-lat-choi-tet-no-som-o-at-20150116091731559.chn" title="Hoa địa lan Đà Lạt chơi Tết nở sớm ồ ạt">Hoa địa lan Đ&agrave; Lạt chơi Tết nở sớm ồ ạt</a></p>

<blockquote>
<p><a href="javascript:void(0)" title="TINH DOANH NGHIỆP">TIN MỚI</a></p>

<p style="text-align:left"><img alt="Phát hiện thêm một cơ sở sản xuất nước uống đóng bình ở Hải Phòng không an toàn" src="https://cafefcdn.com/zoom/160_100/2020/6/20/photo-1-1592625018900303343961-crop-1592625075575780807284.jpg" title="Phát hiện thêm một cơ sở sản xuất nước uống đóng bình ở Hải Phòng không an toàn" /></p>

<p style="text-align:left"><a href="https://cafef.vn/phat-hien-them-mot-co-so-san-xuat-nuoc-uong-dong-binh-o-hai-phong-khong-an-toan-20200620105209687.chn" title="Phát hiện thêm một cơ sở sản xuất nước uống đóng bình ở Hải Phòng không an toàn">Ph&aacute;t hiện th&ecirc;m một cơ sở sản xuất nước uống đ&oacute;ng b&igrave;nh ở Hải Ph&ograve;ng kh&ocirc;ng an to&agrave;n</a></p>

<p style="text-align:left"><img alt="Vải thiều giảm sản lượng vào Nam" src="https://cafefcdn.com/zoom/160_100/2020/photo1592623231834-1592623231954-crop-15926232766521950005695.jpg" title="Vải thiều giảm sản lượng vào Nam" /></p>

<p style="text-align:left"><a href="https://cafef.vn/vai-thieu-giam-san-luong-vao-nam-20200620102301203.chn" title="Vải thiều giảm sản lượng vào Nam">Vải thiều giảm sản lượng v&agrave;o Nam</a></p>

<p style="text-align:left"><img alt="Phát hiện 3 kho hàng lậu, hàng giả ở chợ trung tâm Móng Cái" src="https://cafefcdn.com/zoom/160_100/2020/photo1592619782133-1592619782259-crop-1592619818675440832223.jpg" title="Phát hiện 3 kho hàng lậu, hàng giả ở chợ trung tâm Móng Cái" /></p>

<p style="text-align:left"><a href="https://cafef.vn/phat-hien-3-kho-hang-lau-hang-gia-o-cho-trung-tam-mong-cai-20200620092423593.chn" title="Phát hiện 3 kho hàng lậu, hàng giả ở chợ trung tâm Móng Cái">Ph&aacute;t hiện 3 kho h&agrave;ng lậu, h&agrave;ng giả ở chợ trung t&acirc;m M&oacute;ng C&aacute;i</a></p>
</blockquote>

<p>Theo TS Phạm S, Ph&oacute; Chủ tịch UBND tỉnh L&acirc;m Đồng, để&nbsp;<a href="https://cafef.vn/hoa-da-lat.html" target="_blank" title="hoa Đà Lạt">hoa Đ&agrave; Lạt</a>&nbsp;vươn ra thế giới, đạt mục ti&ecirc;u xuất khẩu 30% sản lượng v&agrave;o năm 2020 th&igrave; phải thay đổi triệt để từ chiến lược đầu tư, kỹ thuật canh t&aacute;c cho tới tư duy của n&ocirc;ng d&acirc;n v&agrave; doanh nghiệp. &Ocirc;ng Phạm S cho biết Nhật Bản đang t&iacute;ch cực hỗ trợ cải thiện m&ocirc;i trường đầu tư trong&nbsp;<a href="https://cafef.vn/nong-nghiep.html" target="_blank" title="nông nghiệp">n&ocirc;ng nghiệp</a>, tăng cường hợp t&aacute;c ph&aacute;t triển thế mạnh rau v&agrave; hoa ở L&acirc;m Đồng.</p>

<p><strong>Học c&aacute;ch l&agrave;m&nbsp;</strong><strong>của người Nhật</strong></p>

<p>Cơ quan Hợp t&aacute;c quốc tế Nhật Bản (JICA), Bộ NN&amp;PTNT, ch&iacute;nh quyền L&acirc;m Đồng v&agrave; những đối t&aacute;c thuộc khu vực tư nh&acirc;n đang t&iacute;ch cực hợp t&aacute;c x&acirc;y dựng chuỗi gi&aacute; trị thực phẩm từ sản xuất n&ocirc;ng nghiệp đến chế biến, ti&ecirc;u thụ. Hơn một năm qua, JICA đ&atilde; khảo s&aacute;t tiềm năng, c&aacute;c yếu tố cản trở cũng như x&aacute;c định m&ocirc; h&igrave;nh ph&aacute;t triển kinh doanh n&ocirc;ng nghiệp ở L&acirc;m Đồng. Qua đ&oacute; cho thấy thu nhập của n&ocirc;ng d&acirc;n L&acirc;m Đồng chỉ bằng 1/9 so với n&ocirc;ng d&acirc;n Malaysia. Tuy nhi&ecirc;n khi doanh nghiệp Nhật đầu tư v&agrave;o Việt Nam, n&ocirc;ng d&acirc;n sẽ c&oacute; cơ hội lớn. Nếu chuyển đổi diện t&iacute;ch c&acirc;y trồng kh&aacute;c sang hợp t&aacute;c&nbsp;<a href="https://cafef.vn/trong-hoa.html" target="_blank" title="trồng hoa">trồng hoa</a>, thu nhập của n&ocirc;ng d&acirc;n sẽ tăng 9 lần.</p>

<p>Về kinh nghiệm sản xuất hoa gi&aacute; trị cao của Nhật, &ocirc;ng Ryoji Kato, đại diện Tập đo&agrave;n b&aacute;n sỉ hoa OTA n&oacute;i, gi&aacute; hoa ở Nhật được c&ocirc;ng ty b&aacute;n đấu gi&aacute; cập nhật h&agrave;ng ng&agrave;y; th&ocirc;ng tin về sản lượng v&agrave; nhu cầu thị trường cũng được c&ocirc;ng khai, minh bạch. Dựa v&agrave;o đ&oacute;, n&ocirc;ng d&acirc;n c&oacute; thể t&iacute;nh to&aacute;n để l&ecirc;n kế hoạch sản xuất ph&ugrave; hợp, điều h&ograve;a giữa cung v&agrave; cầu; gi&aacute; cả cũng ổn định n&ecirc;n đạt lợi nhuận cao, kh&ocirc;ng xảy ra t&igrave;nh trạng hoa rớt gi&aacute; như ở Việt Nam do nguồn cung qu&aacute; lớn so với cầu.</p>

<p>&ldquo;Được sự hỗ trợ của JICA, Đ&agrave; Lạt đang x&uacute;c tiến việc x&acirc;y dựng Trung t&acirc;m giao dịch hoa theo m&ocirc; h&igrave;nh của OTA để đưa hoa l&ecirc;n s&agrave;n giao dịch. Đ&acirc;y l&agrave; đầu mối thu mua hoa tập trung rồi ph&acirc;n phối cho thị trường trong v&agrave; ngo&agrave;i nước. T&ocirc;i tin rằng việc định gi&aacute; hoa minh bạch v&agrave; c&ocirc;ng bằng sẽ l&agrave; động lực để n&ocirc;ng d&acirc;n sản xuất hoa chất lượng&rdquo;, &ocirc;ng Phạm S n&oacute;i.</p>

<p>&Ocirc;ng Ryoji Kato giải th&iacute;ch th&ecirc;m: Khi đưa sản phẩm hoa l&ecirc;n s&agrave;n giao dịch điện tử, tất cả c&aacute;c y&ecirc;u cầu của b&ecirc;n mua v&agrave; b&ecirc;n b&aacute;n được minh bạch. Bạn phải đảm bảo chất lượng hoa đến tay người ti&ecirc;u d&ugrave;ng đ&uacute;ng như những g&igrave; đăng k&yacute;. Y&ecirc;u cầu đ&oacute; sẽ buộc n&ocirc;ng d&acirc;n v&agrave; doanh nghiệp chủ động cải thiện c&aacute;c kh&acirc;u bảo quản sau thu hoạch v&agrave; vận chuyển để bảo vệ thương hiệu của m&igrave;nh. Hoa Đ&agrave; Lạt sẽ hướng đến sản xuất theo nhu cầu cập nhật h&agrave;ng ng&agrave;y của thị trường trong v&agrave; ngo&agrave;i nước. Th&ocirc;ng qua s&agrave;n giao dịch c&oacute; thể mở rộng thị trường ti&ecirc;u thụ để kết nối với bạn h&agrave;ng quốc tế. Người sản xuất chủ động t&igrave;m kiếm bạn h&agrave;ng, thỏa thuận gi&aacute; b&aacute;n v&agrave; k&yacute; hợp đồng trực tiếp với người mua để c&oacute; kế hoạch sản xuất, kinh doanh hiệu quả.</p>

<p>&Ocirc;ng Sudo, Trưởng nh&oacute;m tư vấn TEDI nhận định hiện điểm nghẽn của n&ocirc;ng nghiệp L&acirc;m Đồng l&agrave; cơ sở hạ tầng c&ograve;n thấp do thiếu vốn. TEDI đang thu thập th&ocirc;ng tin tr&ecirc;n cơ sở đ&oacute; thay đổi phương thức sản xuất v&agrave; đầu tư n&acirc;ng cấp cơ sở hạ tầng, đặc biệt trong lĩnh vực &aacute;p dụng c&ocirc;ng nghệ sau thu hoạch.</p>

<p><strong>Ch&uacute; trọng kh&acirc;u li&ecirc;n kết</strong></p>

<p>Trong qu&aacute; tr&igrave;nh khảo s&aacute;t, nhiều doanh nghiệp nước ngo&agrave;i đ&aacute;nh gi&aacute; Đ&agrave; Lạt c&oacute; điều kiện kh&iacute; hậu v&agrave; đất đai rất th&iacute;ch hợp để ph&aacute;t triển quanh năm c&aacute;c loại hoa &ocirc;n đới, &aacute; nhiệt đới với chất lượng kh&aacute;c biệt so với nhiều nơi kh&aacute;c về m&agrave;u sắc, độ d&agrave;y v&agrave; độ tươi l&acirc;u. Thế nhưng họ đ&agrave;nh t&igrave;m kiếm nơi cung cấp kh&aacute;c v&igrave; Đ&agrave; Lạt kh&ocirc;ng thể đ&aacute;p ứng đơn h&agrave;ng lớn. Quy m&ocirc; sản xuất của đa số người trồng hoa Đ&agrave; Lạt c&ograve;n manh m&uacute;n, nhỏ lẻ. Những mảnh vườn đơn lẻ với kỹ thuật canh t&aacute;c kh&aacute;c biệt, mức đầu tư ch&ecirc;nh lệch kh&ocirc;ng thể cho ra sản phẩm đồng đều về chất lượng. N&ocirc;ng d&acirc;n Đ&agrave; Lạt phải li&ecirc;n kết với nhau v&agrave; li&ecirc;n kết với c&aacute;c doanh nghiệp c&oacute; tiềm năng để n&acirc;ng cao sản lượng, đảm bảo chất lượng hoa mới mong t&igrave;m được&nbsp;<a href="https://cafef.vn/hop-dong-xuat-khau.html" target="_blank" title="hợp đồng xuất khẩu">hợp đồng xuất khẩu</a>&nbsp;lớn.</p>

<p>Chủ tịch UBND th&agrave;nh phố Đ&agrave; Lạt V&otilde; Ngọc Hiệp thừa nhận diện t&iacute;ch hoa tăng nhưng thị trường ti&ecirc;u thụ chưa được mở rộng. Cơ quan nh&agrave; nước chưa l&agrave;m tốt chức năng dự b&aacute;o, định hướng thị trường; phần lớn hộ n&ocirc;ng d&acirc;n vẫn sản xuất theo th&oacute;i quen, diện t&iacute;ch manh m&uacute;n, chậm chuyển đổi c&ocirc;ng nghệ kỹ thuật mới n&ecirc;n gi&aacute; trị nhiều sản phẩm hoa c&ograve;n thấp.</p>

<p>&ldquo;L&acirc;m Đồng l&agrave; nơi sản xuất hoa lớn nhất nước nhưng cũng cần c&oacute; ch&iacute;nh s&aacute;ch li&ecirc;n kết v&ugrave;ng để t&igrave;m kiếm lợi thế cạnh tranh tốt nhất. Chẳng hạn với c&aacute;c lo&agrave;i hoa &ocirc;n đới, cần li&ecirc;n kết với H&agrave; Nội v&agrave; c&aacute;c tỉnh ph&iacute;a Bắc để tr&aacute;nh trồng nhiều những lo&agrave;i hoa c&oacute; thể ph&aacute;t triển được v&agrave;o m&ugrave;a đ&ocirc;ng như ly chẳng hạn. Li&ecirc;n kết v&ugrave;ng, trao đổi th&ocirc;ng tin, định hướng sản xuất th&iacute;ch hợp, ch&uacute;ng ta sẽ tr&aacute;nh được cảnh cạnh tranh trong ch&iacute;nh nội bộ, dồn sức để ph&aacute;t triển theo hướng xuất khẩu&rdquo;, TS Phan Huy Th&ocirc;ng, Gi&aacute;m đốc Trung t&acirc;m Khuyến n&ocirc;ng Quốc gia n&oacute;i.</p>

<p>&nbsp;</p>
', 0, 12)
INSERT [dbo].[TINTUC] ([MATT], [MAAD], [TIEUDE], [ANH], [NGAYDANG], [MOTA], [NOIDUNG], [NOIBAT], [LUOTXEM]) VALUES (4, 1, N'Buộc phải tiêu huỷ 140 triệu bông hoa tulip do Covid-19, từ nông dân cho đến ông chủ công ty sản xuất hoa lớn nhất Hà Lan đều đứng nhìn với sự bất lực', N'tintuc-2.jpg', CAST(N'2020-12-03 00:00:00.000' AS DateTime), N'Nhu cầu đối với hoa tulip đã sụt giảm nhanh chóng khi các cửa hàng hoa trên toàn cầu đóng cửa do dịch Covid-19 bùng phát, người tiêu dùng thực hiện đúng yêu cầu phong toả của chính phủ và rất nhiều sự kiện, lễ kỷ niệm cũng bị huỷ bỏ.', N'<h2>Nhu cầu đối với hoa tulip đ&atilde; sụt giảm nhanh ch&oacute;ng khi c&aacute;c cửa h&agrave;ng hoa tr&ecirc;n to&agrave;n cầu đ&oacute;ng cửa do dịch Covid-19 b&ugrave;ng ph&aacute;t, người ti&ecirc;u d&ugrave;ng thực hiện đ&uacute;ng y&ecirc;u cầu phong toả của ch&iacute;nh phủ v&agrave; rất nhiều sự kiện, lễ kỷ niệm cũng bị huỷ bỏ.</h2>

<ul>
	<li><a href="https://kenh14.vn/duoc-ca-ngoi-nhu-nguoi-hung-nhieu-y-bac-si-bong-dung-mat-viec-giua-dai-dich-covid-19-va-thuc-trang-nhuc-nhoi-cua-nganh-y-te-my-20200414151931361.chn" title="Được ca ngợi như người hùng, nhiều y bác sĩ bỗng dưng mất việc giữa đại dịch Covid-19 và thực trạng nhức nhối của ngành y tế Mỹ">Được ca ngợi như người h&ugrave;ng, nhiều y b&aacute;c sĩ bỗng dưng mất việc giữa đại dịch Covid-19 v&agrave; thực trạng nhức nhối của ng&agrave;nh y tế Mỹ&nbsp;</a></li>
	<li><a href="https://kenh14.vn/vu-han-va-bai-hoc-doi-voi-nhung-o-dich-lon-cuoc-song-kho-co-the-tro-lai-binh-thuong-sau-khi-het-phong-toa-dai-dich-tro-thanh-noi-am-anh-keo-dai-20200413225339689.chn" title="Vũ Hán và bài học đối với những ổ dịch lớn: Cuộc sống khó có thể trở lại bình thường sau khi hết phong toả, đại dịch trở thành nỗi ám ảnh kéo dài">Vũ H&aacute;n v&agrave; b&agrave;i học đối với những ổ dịch lớn: Cuộc sống kh&oacute; c&oacute; thể trở lại b&igrave;nh thường sau khi hết phong toả, đại dịch trở th&agrave;nh nỗi &aacute;m ảnh k&eacute;o d&agrave;i&nbsp;</a></li>
	<li><a href="https://kenh14.vn/nguoi-my-doi-cach-tieu-tien-giua-dai-dich-covid-19-nhieu-nganh-nghe-tru-cot-kinh-te-giam-manh-bat-ngo-nhat-la-nganh-cuoi-cung-20200413221621939.chn" title="Người Mỹ đổi cách tiêu tiền giữa đại dịch Covid-19: Nhiều ngành nghề trụ cột kinh tế giảm mạnh, bất ngờ nhất là ngành cuối cùng">Người Mỹ đổi c&aacute;ch ti&ecirc;u tiền giữa đại dịch Covid-19: Nhiều ng&agrave;nh nghề trụ cột kinh tế giảm mạnh, bất ngờ nhất l&agrave; ng&agrave;nh cuối c&ugrave;ng&nbsp;</a></li>
</ul>

<p>Đối với những người l&agrave;m nghề trồng hoa tulip ở H&agrave; Lan, thứ 6 ng&agrave;y 13/3 năm nay thực sự l&agrave; một bộ phim kinh dị. Khi những b&ocirc;ng hoa tulip ở chợ hoa lớn nhất nước n&agrave;y tại Aalsmeer nhiều lầm bị hạ gi&aacute; xuống tới mức 0.</p>

<p style="text-align:center"><a href="https://kenh14cdn.com/2020/4/14/erlin17147621782b1f92d-0024-4091-8b5e-75c360467346-superjumbo-1586854748962262039077-15868548016121836462786-crop-15868548134932090738421-15868747195951034217052.png" target="_blank" title=""><img alt="Buộc phải tiêu huỷ 140 triệu bông hoa tulip do Covid-19, từ nông dân cho đến ông chủ công ty sản xuất hoa lớn nhất Hà Lan đều đứng nhìn với sự bất lực - Ảnh 1." id="img_a453fc80-7e5c-11ea-8600-f9ab1757833b" src="https://kenh14cdn.com/thumb_w/620/2020/4/14/erlin17147621782b1f92d-0024-4091-8b5e-75c360467346-superjumbo-1586854748962262039077-15868548016121836462786-crop-15868548134932090738421-15868747195951034217052.png" title="Buộc phải tiêu huỷ 140 triệu bông hoa tulip do Covid-19, từ nông dân cho đến ông chủ công ty sản xuất hoa lớn nhất Hà Lan đều đứng nhìn với sự bất lực - Ảnh 1." /></a></p>

<p>&nbsp;</p>

<p>Frank Uittenbogaard, gi&aacute;m đốc của JUB Holland, một n&ocirc;ng trại gia đ&igrave;nh 100 năm tuổi ở&nbsp;Noordwijkerhout, đ&atilde; đưa ra một quyết định cực kỳ t&aacute;o bạo, đ&oacute; l&agrave; huỷ to&agrave;n bộ 200.000 cuống hoa tulip. &Ocirc;ng chia sẻ: &quot;Điều đ&oacute; thực sự rất đau đớn, bởi bạn bắt đầu gieo hạt v&agrave;o th&aacute;ng 7 v&agrave; phải chăm s&oacute;c cẩn thận, đ&uacute;ng c&aacute;ch để trồng c&acirc;y v&agrave;o th&aacute;ng 10, sau đ&oacute; chuyển c&acirc;y v&agrave;o b&ecirc;n trong nh&agrave; k&iacute;nh. Chất lượng hoa năm nay của ch&uacute;ng t&ocirc;i rất tốt. T&ocirc;i đ&atilde; phải đạp xe đi đến nơi kh&aacute;c để kh&ocirc;ng chứng kiến cảnh mọi người huỷ bỏ c&acirc;y hoa.&quot;</p>

<p>Dẫu vậy, Uittenbogaard kh&ocirc;ng phải l&agrave; n&ocirc;ng d&acirc;n ở H&agrave; Lan phải ti&ecirc;u huỷ hoa tulip. Khoảng 400 triệu b&ocirc;ng hoa, trong đ&oacute; c&oacute; 140 cuống hoa, đ&atilde; bị huỷ trong th&aacute;ng vừa qua, theo ước t&iacute;nh của&nbsp;Fred van Tol&ndash; gi&aacute;m đốc mảng b&aacute;n h&agrave;ng quốc tế tại&nbsp;Royal FloraHolland&ndash; c&ocirc;ng ty sản xuất c&acirc;y v&agrave; hoa lớn nhất H&agrave; Lan. &Ocirc;ng&nbsp;van Tolcho hay: &quot;Dịch bệnh diễn ra v&agrave;o đ&uacute;ng thời điểm hoạt động mua b&aacute;n hoa diễn ra s&ocirc;i nổi. Doanh thu trong 4 tuần hiện vẫn thấp hơn 50% so với năm ngo&aacute;i.&quot;</p>

<p>Nhu cầu đối với hoa tulip đ&atilde; sụt giảm nhanh ch&oacute;ng khi c&aacute;c cửa h&agrave;ng hoa tr&ecirc;n to&agrave;n cầu đ&oacute;ng cửa do dịch Covid-19 b&ugrave;ng ph&aacute;t, người ti&ecirc;u d&ugrave;ng thực hiện đ&uacute;ng y&ecirc;u cầu phong toả của ch&iacute;nh phủ v&agrave; rất nhiều sự kiện, lễ kỷ niệm cũng bị huỷ bỏ.</p>

<p style="text-align:center"><a href="https://kenh14cdn.com/2020/4/14/photo-1-15868746659771425039675.png" target="_blank" title="Cánh đồng hoa tulip ở thị trấn Lisse."><img alt="Buộc phải tiêu huỷ 140 triệu bông hoa tulip do Covid-19, từ nông dân cho đến ông chủ công ty sản xuất hoa lớn nhất Hà Lan đều đứng nhìn với sự bất lực - Ảnh 2." id="img_83f209f0-7e5c-11ea-aeb8-7f62c631b1fc" src="https://kenh14cdn.com/thumb_w/620/2020/4/14/photo-1-15868746659771425039675.png" title="Buộc phải tiêu huỷ 140 triệu bông hoa tulip do Covid-19, từ nông dân cho đến ông chủ công ty sản xuất hoa lớn nhất Hà Lan đều đứng nhìn với sự bất lực - Ảnh 2." /></a></p>

<p>&nbsp;</p>

<p>C&aacute;nh đồng hoa tulip ở thị trấn Lisse.</p>

<p>Th&ocirc;ng thường, đối với ng&agrave;nh c&ocirc;ng nghiệp sản xuất hoa ở H&agrave; Lan, thời điểm bận rộn diễn ra từ th&aacute;ng 3 đến th&aacute;ng 5, trong đ&oacute; c&oacute; c&aacute;c ng&agrave;y Quốc tế Phụ nữ, Lễ Phục sinh v&agrave; Ng&agrave;y Của Mẹ. Khi đ&oacute;, c&aacute;c nh&agrave; sản xuất hoa thu về 7 tỷ euro (7,6 tỷ USD), với trung b&igrave;nh 30 triệu b&ocirc;ng hoa được b&aacute;n ra mỗi ng&agrave;y. Người trồng hoa tulip cũng n&acirc;ng sản lượng bắt đầu từ th&aacute;ng 3, đ&uacute;ng thời điểm hoa đ&atilde; nở rộ. M&ugrave;a hoa tulip thường k&eacute;o d&agrave;i khoảng 8 tuần.</p>

<p>&Ocirc;ng van Tol cho biết, một số phần kh&aacute;c của ng&agrave;nh c&ocirc;ng nghiệp n&agrave;y c&ograve;n hứng chịu t&aacute;c động nặng nề hơn những phần kh&aacute;c. Tuỳ thuộc v&agrave;o thị trường m&agrave; c&aacute;c nh&agrave; sản xuất hay c&aacute;c nh&agrave; cung cấp phục vụ, họ ghi nhận mức lỗ từ 10% đến 85%.</p>

<p>Ghi nhận&nbsp;26.551 ca nhiễm v&agrave; 2.823 trường hợp tử vong, H&agrave; Lan đ&atilde; &aacute;p dụng ch&iacute;nh s&aacute;ch c&aacute;ch ly vừa phải để ngăn chặn sự l&acirc;y lan của dịch bệnh, m&agrave; kh&ocirc;ng thực hiện phong toả. C&aacute;c trường học, nh&agrave; h&agrave;ng, qu&aacute;n bar, bảo t&agrave;ng, ph&ograve;ng gym v&agrave; s&acirc;n vận động đều đ&oacute;ng cửa cho đến ng&agrave;y 28/4. Hầu hết c&aacute;c sự kiện với sự tham gia của hơn 30 người đ&atilde; bị cấm cho đến ng&agrave;y 1/4. Tuy nhi&ecirc;n, c&aacute;c cửa h&agrave;ng nhỏ, v&iacute; dụ như cửa h&agrave;ng hoa v&agrave; b&aacute;n đồ l&agrave;m vườn, vẫn được ph&eacute;p mở cửa với điều kiện kh&aacute;ch h&agrave;ng duy tr&igrave; khoảng c&aacute;ch x&atilde; hội 1,5m.</p>

<p>Trong khi c&aacute;c n&ocirc;ng d&acirc;n trồng hoa v&agrave; nh&agrave; ph&acirc;n phối chủ yếu phục vụ thị trường địa phương vẫn c&oacute; thể tiếp tục hoạt động mua b&aacute;n trong nước, th&igrave; những doanh nghiệp nhập hoa để xuất khẩu nước ngo&agrave;i gặp rất nhiều kh&oacute; khăn.</p>

<p>Jan de Boer&ndash; tổng gi&aacute;m đốc c&ocirc;ng ty xuất khẩu hoa to&agrave;n cầu&nbsp;Barendsen, cho biết doanh thu theo m&ugrave;a đ&atilde; giảm 90% cho đến nay. Th&ocirc;ng thường, &ocirc;ng c&oacute; 60 nh&acirc;n vi&ecirc;n l&agrave;m việc to&agrave;n thời gian trong thời điểm n&agrave;y của năm, trong khi hiện tại &ocirc;ng chỉ l&agrave;m việc với 6 người. &Ocirc;ng chia sẻ, ch&iacute;nh phủ H&agrave; Lan đ&atilde; trả lương cho c&aacute;c nh&acirc;n vi&ecirc;n do đ&oacute; hoạt động kinh doanh cũng bớt căng thẳng hơn.</p>

<p style="text-align:center"><a href="https://kenh14cdn.com/2020/4/14/photo-1-1586874673620534619862.png" target="_blank" title="Công viên hoa lớn nhất Hà Lan - Keukenhof."><img alt="Buộc phải tiêu huỷ 140 triệu bông hoa tulip do Covid-19, từ nông dân cho đến ông chủ công ty sản xuất hoa lớn nhất Hà Lan đều đứng nhìn với sự bất lực - Ảnh 3." id="img_88a531c0-7e5c-11ea-a1a6-93988bd3eaa5" src="https://kenh14cdn.com/thumb_w/620/2020/4/14/photo-1-1586874673620534619862.png" title="Buộc phải tiêu huỷ 140 triệu bông hoa tulip do Covid-19, từ nông dân cho đến ông chủ công ty sản xuất hoa lớn nhất Hà Lan đều đứng nhìn với sự bất lực - Ảnh 3." /></a></p>

<p>&nbsp;</p>

<p>C&ocirc;ng vi&ecirc;n hoa lớn nhất H&agrave; Lan - Keukenhof.</p>

<p>&Ocirc;ng de Boer n&oacute;i: &quot;Vấn đề lớn nhất của t&ocirc;i l&agrave; g&igrave;? Kh&aacute;ch h&agrave;ng&nbsp;Viking River Cruises của t&ocirc;i sẽ kh&ocirc;ng đ&oacute;n bất kỳ một du kh&aacute;ch người Mỹ n&agrave;o l&ecirc;n t&agrave;u trong năm nay. Do đ&oacute;, hoạt động kinh doanh của t&ocirc;i v&agrave; họ đ&atilde; bị cắt đứt ho&agrave;n to&agrave;n, t&ocirc;i sẽ mất khoảng nửa triệu hoặc 1 triệu euro.&quot;&nbsp;&nbsp;Hơn nữa, &ocirc;ng cũng kh&ocirc;ng thể xuất khẩu hoa sang những nước kh&aacute;c &ndash; nơi c&aacute;c cửa h&agrave;ng đều đ&oacute;ng cửa, trong đ&oacute; c&oacute; Italy, T&acirc;y Ban Nha v&agrave; Ph&aacute;p.</p>

<p>Ngo&agrave;i ra, h&agrave;ng triệu kh&aacute;ch du lịch thường đến H&agrave; Lan để ngắm hoa tulip tại thị trấn Lisse đều huỷ chuyến đi. Theo đ&oacute;, t&aacute;c động đ&atilde; l&acirc;y lan đến những ng&agrave;nh kinh doanh c&oacute; li&ecirc;n quan.</p>

<p>Keukenhof &ndash; c&ocirc;ng vi&ecirc;n hoa lớn nhất H&agrave; Lan, thường đ&oacute;n 1,5 triệu lượt kh&aacute;ch mỗi năm trong suốt 8 tuần của m&ugrave;a hoa tulip. Tuy nhi&ecirc;n, năm nay, do c&aacute;c biện ph&aacute;p hạn chế sự l&acirc;y lan của Covid-19, c&ocirc;ng vi&ecirc;n n&agrave;y đ&atilde; đ&oacute;ng cửa kể từ ng&agrave;y 21/3 cho đến ng&agrave;y 10/5. Việc n&agrave;y sẽ khiến doanh thu của c&ocirc;ng vi&ecirc;n ước t&iacute;nh sẽ giảm 35 triệu USD.</p>

<p>Bart Siemerink, gi&aacute;m đốc điều h&agrave;nh của Keukenhof, cho hay: &quot;Thi&ecirc;n nhi&ecirc;n kh&ocirc;ng nghe theo bất kỳ quy định n&agrave;o. Ch&uacute;ng t&ocirc;i c&oacute; một m&ugrave;a xu&acirc;n rất đẹp ở H&agrave; Lan, hiện tại c&ocirc;ng vi&ecirc;n đang cực kỳ rực rỡ. Ch&uacute;ng t&ocirc;i nỗ lực hết sức để chia sẻ khung cảnh đ&oacute; với người d&acirc;n khi họ phải ở trong nh&agrave;.&quot; Hiện tại, du kh&aacute;ch c&oacute; thể ngắm hoa tại vườn Keukenhof qua chương tr&igrave;nh Keukenhof Virtually Open, cho đến m&ugrave;a hoa năm sau.&nbsp;Trong khi đ&oacute;, 25 nh&acirc;n vi&ecirc;n chăm s&oacute;c vườn hoa tiếp tục l&agrave;m việc tại c&ocirc;ng vi&ecirc;n.</p>

<p>&Ocirc;ng de Boer - chủ tịch Barendsen, lại rất lạc quan rằng thị trường hoa ở H&agrave; Lan sẽ nhanh ch&oacute;ng hồi sinh, &ocirc;ng chia sẻ: &quot;T&ocirc;i lạc quan bởi mọi người lu&ocirc;n cần đến những b&ocirc;ng hoa, để kết nối, để ở b&ecirc;n nhau v&agrave; kể một c&acirc;u chuyện. T&ocirc;i lạc quan về những b&ocirc;ng hoa nhưng kh&ocirc;ng phải l&agrave; những vấn đề về t&agrave;i ch&iacute;nh. Nếu kh&ocirc;ng thể b&ugrave; đắp những g&igrave; đ&atilde; mất, bạn sẽ bi loại khỏi &lsquo;cuộc chơi&rsquo;. Do đ&oacute;, t&ocirc;i sẽ nỗ lực hết sức để duy tr&igrave; hoạt động.&quot;</p>

<p><em>Tham khảo New York Times</em></p>
', 1, 6)
INSERT [dbo].[TINTUC] ([MATT], [MAAD], [TIEUDE], [ANH], [NGAYDANG], [MOTA], [NOIDUNG], [NOIBAT], [LUOTXEM]) VALUES (5, 1, N'Vì sao Đà Lạt chỉ xuất khẩu được 10% sản lượng hoa?', N'tintuc-3.jpg', CAST(N'2020-05-20 00:00:00.000' AS DateTime), N'Là thủ phủ hoa của cả nước nhưng Đà Lạt chỉ xuất khẩu được khoảng 10% sản lượng. Tham gia thị phần này chủ yếu là các công ty lớn, đặc biệt là doanh nghiệp có vốn đầu tư nước ngoài, còn nông dân Đà Lạt hầu như chưa thể trực tiếp xuất khẩu hoa.', N'<p>TPO - L&agrave; thủ phủ hoa của cả nước nhưng Đ&agrave; Lạt chỉ xuất khẩu được khoảng 10% sản lượng. Tham gia thị phần n&agrave;y chủ yếu l&agrave; c&aacute;c c&ocirc;ng ty lớn, đặc biệt l&agrave; doanh nghiệp c&oacute; vốn đầu tư nước ngo&agrave;i, c&ograve;n n&ocirc;ng d&acirc;n Đ&agrave; Lạt hầu như chưa thể trực tiếp xuất khẩu hoa.</p>

<h2 style="margin-left:40px"><span style="font-size:11px"><a href="https://www.tienphong.vn/kinh-te/phap-phu-gia-hoa-o-lang-hoa-lay-on-lon-nhat-nuoc-1374112.tpo" title="Phập phù giá hoa ở làng hoa lay ơn lớn nhất nước">Phập ph&ugrave; gi&aacute; hoa ở l&agrave;ng hoa lay ơn lớn nhất nước</a></span></h2>

<h2 style="margin-left:40px"><span style="font-size:11px"><a href="https://www.tienphong.vn/xa-hoi/hoa-lay-on-no-truoc-tet-phai-nho-cho-bo-an-963334.tpo" title="Hoa lay ơn nở trước Tết phải nhổ cho bò ăn">Hoa lay ơn nở trước Tết phải nhổ cho b&ograve; ăn</a></span></h2>

<h2 style="margin-left:40px"><span style="font-size:11px"><a href="https://www.tienphong.vn/kinh-te/hoa-da-lat-muc-tieu-30-xuat-khau-co-kha-thi-959693.tpo" title="Hoa Đà Lạt: Mục tiêu 30% xuất khẩu có khả thi?">Hoa Đ&agrave; Lạt: Mục ti&ecirc;u 30% xuất khẩu c&oacute; khả thi?</a></span></h2>

<p>Ng&agrave;nh chức năng tỉnh L&acirc;m Đồng ước t&iacute;nh năm 2019, diện t&iacute;ch đất trồng hoa đạt khoảng 8.890 ha với sản lượng hơn 3.350 triệu c&agrave;nh, trong đ&oacute; xuất khẩu gần 325 triệu c&agrave;nh, chỉ chiếm khoảng 10% sản lượng, kim ngạch hơn 48 triệu USD.</p>

<p>Hoa Đ&agrave; Lạt chủ yếu xuất sang Nhật Bản (hơn 60%), c&ograve;n lại l&agrave; c&aacute;c nước Australia, Đan Mạch, Th&aacute;i Lan, Malaysia, Singapore, H&agrave;n Quốc&hellip; Về chủng loại hoa xuất khẩu, đứng đầu bảng l&agrave; l&agrave; hoa c&uacute;c (52%), c&acirc;y giống invitro (30%), hoa cẩm chướng (10%), c&ograve;n lại l&agrave; c&aacute;c loại hoa cắt c&agrave;nh kh&aacute;c như lily, hồng m&ocirc;n, hướng dương, lan hồ điệp, lan vũ nữ...</p>

<p>Thị phần xuất khẩu hoa tập trung v&agrave;o c&aacute;c c&ocirc;ng ty lớn, nhất l&agrave; doanh nghiệp c&oacute; vốn đầu tư nước ngo&agrave;i, trong đ&oacute; c&ocirc;ng ty Dalat Hasfarm chiếm tr&ecirc;n 60% tổng sản lượng lượng hoa. Ri&ecirc;ng n&ocirc;ng d&acirc;n Đ&agrave; Lạt hầu như chưa thể trực tiếp xuất khẩu hoa.&nbsp;&nbsp;</p>

<p>90% sản lượng hoa c&ograve;n lại của Đ&agrave; Lạt-L&acirc;m Đồng phải ti&ecirc;u thụ trong nước, chủ yếu ở thị trường TP. HCM, miền T&acirc;y v&agrave; Đ&ocirc;ng Nam bộ... Việc phụ thuộc qu&aacute; nhiều v&agrave;o thị trường trong nước dẫn đến mất c&acirc;n đối giữa cung v&agrave; cầu, khiến gi&aacute; cả thất thường; tư thương chi phối, &eacute;p gi&aacute; hoa của n&ocirc;ng d&acirc;n. Hoa Đ&agrave; Lạt nhiều l&uacute;c bị thừa ế, phải đổ bỏ cho b&ograve; ăn hoặc để thối rữa tại vườn.</p>

<p style="text-align:center"><a href="https://image2.tienphong.vn/w665/Uploaded/2020/jqodwkoud_aycqdx/2019_12_05/taynguyen_kimanh_3_jzkt.jpg"><img alt="Vì sao Đà Lạt chỉ xuất khẩu được 10% sản lượng hoa?    - ảnh 1" src="https://image2.tienphong.vn/w665/Uploaded/2020/jqodwkoud_aycqdx/2019_12_05/taynguyen_kimanh_3_jzkt.jpg" style="width:600px" /></a></p>

<p>Nhiều l&uacute;c hoa thừa ế , nh&agrave;&nbsp; n&ocirc;ng để hoa &uacute;a t&agrave;n tr&ecirc;n c&acirc;y</p>

<p>Theo Hiệp hội hoa Đ&agrave; Lạt, n&ocirc;ng d&acirc;n của th&agrave;nh phố đ&atilde; l&agrave;m hoa l&acirc;u năm nhưng nghề trồng hoa vẫn c&ograve;n nhiều rủi ro v&igrave; quy m&ocirc; trang trại c&ograve;n qu&aacute; nhỏ. Với diện t&iacute;ch trung b&igrave;nh chỉ khoảng 2000-5000m2/hộ, n&ocirc;ng d&acirc;n gặp nhiều kh&oacute; khăn trong việc đầu tư c&ocirc;ng nghệ cao, đặc biệt l&agrave; c&aacute;c nh&agrave; k&iacute;nh hiện đại, mặt kh&aacute;c cũng kh&ocirc;ng đủ sản lượng để đ&aacute;p ứng c&aacute;c đơn h&agrave;ng xuất khẩu.</p>

<p>Ng&agrave;nh trồng hoa của mỗi địa phương n&oacute;i ri&ecirc;ng v&agrave; quốc gia n&oacute;i chung, muốn ph&aacute;t triển chuy&ecirc;n nghiệp, đẩy mạnh xuất khẩu, trước hết phải x&acirc;y dựng được những doanh nghiệp đủ tầm cỡ hoặc n&ocirc;ng d&acirc;n phải li&ecirc;n kết với nhau để tạo n&ecirc;n v&ugrave;ng sản xuất, hệ sinh th&aacute;i trồng hoa quy m&ocirc; lớn.</p>

<p>&nbsp;Ngay cả những doanh nghiệp lớn như Dalat Hasfarm mặc d&ugrave; c&oacute; tới 190ha nh&agrave; k&iacute;nh nhưng vẫn li&ecirc;n kết với h&agrave;ng trăm hộ d&acirc;n ở Đ&agrave; Lạt để mở rộng diện t&iacute;ch, n&acirc;ng cao sản lượng. &ldquo;Doanh nghiệp phải đ&aacute;p ứng được sản lượng lớn để vận chuyển bằng đường h&agrave;ng kh&ocirc;ng hoặc đường thủy th&igrave; mới thực sự c&oacute; &yacute; nghĩa cạnh tranh tr&ecirc;n thị trường&rdquo;, &ocirc;ng Aad Gordijn, Tổng gi&aacute;m đốc Dalat Hasfarm chia sẻ.</p>

<p>Mặt kh&aacute;c, Hiệp hội hoa Đ&agrave; Lạt cho rằng thị trường nước ngo&agrave;i lu&ocirc;n y&ecirc;u cầu về bản quyền giống hoa v&agrave; đ&ograve;i hỏi cao về chất lượng n&ecirc;n đa số n&ocirc;ng d&acirc;n vẫn c&ograve;n e d&egrave; trong việc đầu tư, cũng như li&ecirc;n kết để trồng hoa xuất khẩu.</p>

<p>C&aacute;c chuy&ecirc;n gia ở Đ&agrave; Lạt cũng nhận định trồng hoa phục vụ xuất khẩu cho thu nhập cao hơn rất nhiều nhưng việc xuất khẩu hoa của n&ocirc;ng d&acirc;n Đ&agrave; Lạt bị &ldquo;tắc&rdquo; ở kh&acirc;u giống. N&ocirc;ng d&acirc;n muốn mua giống c&oacute; bản quyền nhưng thiếu th&ocirc;ng tin, c&ograve;n những c&ocirc;ng ty sản xuất giống uy t&iacute;n h&agrave;ng đầu thế giới th&igrave; lo ngại bị sao ch&eacute;p giống n&ecirc;n kh&ocirc;ng quan t&acirc;m đến thị trường Việt Nam.</p>

<p>KIM ANH</p>
', 0, 5)
INSERT [dbo].[TINTUC] ([MATT], [MAAD], [TIEUDE], [ANH], [NGAYDANG], [MOTA], [NOIDUNG], [NOIBAT], [LUOTXEM]) VALUES (11, 1, N'Chuyện chưa từng có, giá hoa giảm mạnh ngày 8/3', N'hoa-tet-4.jpg', CAST(N'2020-06-20 00:00:00.000' AS DateTime), N'Thay vì tăng giá gấp 2-3 lần so với ngày thường như mọi năm, dịp Quốc tế Phụ nữ 8/3 năm nay, giá hoa lại lao dốc, nhà vườn khóc ròng vì ế ẩm. Các tiệm hoa còn phải chạy chương trình giảm giá để kích cầu mua sắm', N'<h2>&nbsp;</h2>

<p><img alt="" src="https://vnn-imgs-f.vgcloud.vn/logo.gif" title="" />Thay v&igrave; tăng gi&aacute; gấp 2-3 lần so với ng&agrave;y thường như mọi năm, dịp Quốc tế Phụ nữ 8/3 năm nay, gi&aacute; hoa lại lao dốc, nh&agrave; vườn kh&oacute;c r&ograve;ng v&igrave; ế ẩm. C&aacute;c tiệm hoa c&ograve;n phải chạy chương tr&igrave;nh giảm gi&aacute; để k&iacute;ch cầu mua sắm.</p>

<p><a href="https://vietnamnet.vn/vn/kinh-doanh/thi-truong/phong-lan-ma-vang-16-trieu-canh-dai-gia-mua-lam-qua-tang-8-3-621564.html" title="Lan hồ điệp mạ vàng 16 triệu/cành, đại gia mua làm quà tặng 8/3">Lan hồ điệp mạ v&agrave;ng 16 triệu/c&agrave;nh, đại gia mua l&agrave;m qu&agrave; tặng 8/3</a></p>

<p><a href="https://vietnamnet.vn/vn/kinh-doanh/thi-truong/dip-8-3-bong-tay-voi-lan-ho-diep-nhuom-mau-doc-1-2-trieu-dong-canh-621011.html" title="''Bỏng tay'' với lan hồ điệp nhuộm màu độc, 1,2 triệu đồng/cành">&#39;Bỏng tay&#39; với lan hồ điệp nhuộm m&agrave;u độc, 1,2 triệu đồng/c&agrave;nh</a></p>

<p>Hoa tươi l&agrave; mặt h&agrave;ng cực kỳ h&uacute;t kh&aacute;ch v&agrave;o c&aacute;c dịp lễ, đặc biệt l&agrave; ng&agrave;y Quốc tế Phụ nữ 8/3, bởi đ&acirc;y l&agrave; m&oacute;n qu&agrave; truyền thống được mọi người chọn mua để tặng bạn b&egrave;, người th&acirc;n. Theo đ&oacute;, dịp 8/3 h&agrave;ng năm, gi&aacute; hoa thường tăng gấp 2-3 lần so với ng&agrave;y thường. Thế nhưng năm nay lại kh&aacute;c. S&aacute;t ng&agrave;y 8/3, gi&aacute; hoa giảm mạnh, lượng hoa ti&ecirc;u thụ chậm, rơi v&agrave;o cảnh ế ẩm.</p>

<p>Theo c&aacute;c nh&agrave; vườn trồng hoa ở Đ&agrave; Lạt, lượng hoa hồng cung ứng cho thị trường 8/3 năm nay giảm so với h&agrave;ng năm. Thương l&aacute;i từ H&agrave; Nội, Đ&agrave; Nẵng, TP.HCM,... đều giảm số lượng đặt h&agrave;ng, k&eacute;o theo gi&aacute; hoa hồng cũng giảm mạnh.</p>

<p>Như dịp 8/3 năm ngo&aacute;i, hoa hồng đỏ xuất b&aacute;n tại vườn ở mức gi&aacute; 7.000-8.000 đồng/b&ocirc;ng. Những loại hoa hồng m&agrave;u kh&aacute;c c&oacute; gi&aacute; thấp hơn, dao động từ 5.000-6.000 đồng/b&ocirc;ng. Song năm nay, gi&aacute; hoa hồng đang ở mức thấp kỷ lục. Hiện, người trồng hồng ở Đ&agrave; Lạt chỉ mong b&aacute;n được với gi&aacute; 3.000 đồng/b&ocirc;ng để lấy lại vốn.</p>

<table>
	<tbody>
		<tr>
			<td><a href="https://vnn-imgs-f.vgcloud.vn/2020/01/23/08/hoa-tet-4.jpg" title="Giá các loại hoa dịp 8/3 đang giảm mạnh"><img alt="Chuyện chưa từng có, giá hoa giảm mạnh ngày 8/3" src="https://vnn-imgs-f.vgcloud.vn/2020/01/23/08/hoa-tet-4.jpg" /></a></td>
		</tr>
		<tr>
			<td>Gi&aacute; c&aacute;c loại hoa dịp 8/3 đang giảm mạnh</td>
		</tr>
	</tbody>
</table>

<table>
	<tbody>
		<tr>
			<td><a href="https://vnn-imgs-f.vgcloud.vn/2019/11/23/11/ntm-1.jpg" title="Nhiều nhà vườn lo lắng vì sát ngày 8/3, hoa tươi không những giảm giá mà còn ế ẩm"><img alt="Chuyện chưa từng có, giá hoa giảm mạnh ngày 8/3" src="https://vnn-imgs-f.vgcloud.vn/2019/11/23/11/ntm-1.jpg" /></a></td>
		</tr>
		<tr>
			<td>Nhiều nh&agrave; vườn lo lắng v&igrave; s&aacute;t ng&agrave;y 8/3, hoa tươi kh&ocirc;ng những giảm gi&aacute; m&agrave; c&ograve;n ế ẩm</td>
		</tr>
	</tbody>
</table>

<p>Tương tự, tại thủ phủ hoa T&acirc;y Tựu (H&agrave; Nội), gi&aacute; hoa hồng thay v&igrave; tăng như mọi năm th&igrave; đang c&oacute; chiều hướng giảm mạnh. Cụ thể, một b&oacute; hoa hồng 50 b&ocirc;ng (c&agrave;nh d&agrave;i) gi&aacute; giảm c&ograve;n 100.000-110.000 đồng t&ugrave;y m&agrave;u, hoa hồng c&agrave;nh ngắn gi&aacute; 70.000 đồng/b&oacute; 50 b&ocirc;ng.</p>

<p>B&agrave; L&ecirc; Thị Thanh Hải - một nh&agrave; vườn trồng hoa ở T&acirc;y Tựu (H&agrave; Nội) than thở, người trồng hoa như gia đ&igrave;nh b&agrave; chỉ tr&ocirc;ng v&agrave;o những dịp lễ Tết. Những dịp 8/3 trước, hoa l&agrave; mặt h&agrave;ng &ldquo;đắt như t&ocirc;m tươi&rdquo;. Trước ng&agrave;y lễ nửa th&aacute;ng, c&aacute;c đầu mối lấy sỉ về tận vườn đặt mua. Vậy m&agrave; năm nay gi&aacute; hoa bất ngờ giảm mạnh, kh&aacute;ch đến vườn đặt mua &egrave;o uột.</p>

<p>Gi&aacute; hoa hồng giảm chỉ c&ograve;n 1.500-2.000 đồng/b&ocirc;ng t&ugrave;y loại. Hoa đồng tiền gi&aacute; giảm c&ograve;n một nửa so với trước.</p>

<p>Trao đổi với PV. VietNamNet, anh B&ugrave;i Ki&ecirc;n Trung - một đầu mối chuy&ecirc;n bỏ sỉ hoa tươi ở chợ đầu mối hoa Quảng B&aacute; (T&acirc;y Hồ, H&agrave; Nội) thừa nhận, dịp 8/3 n&agrave;y gi&aacute; hoa tươi giảm đồng loạt. Đ&acirc;y l&agrave; chuyện rất hiếm khi xảy ra, bởi v&agrave;o c&aacute;c ng&agrave;y lễ như 8/3, 20/10 hay 20/11,... gi&aacute; hoa thường tăng mạnh, gấp 2-3 lần, thậm ch&iacute;&nbsp;4-5 lần so với ng&agrave;y thường.</p>

<p>&nbsp;</p>

<p>C&ograve;n thời điểm n&agrave;y, đ&atilde; s&aacute;t 8/3 m&agrave; gi&aacute; hồng Đ&agrave; Lạt bỏ sỉ chỉ 120.000-150.000 đồng/b&oacute; 30-40 b&ocirc;ng t&ugrave;y loại; cẩm t&uacute; cầu giảm c&ograve;n 100.000 đồng/b&oacute; 10 bồng; c&aacute;t tường gi&aacute; cũng chỉ 80.000-100.000 đồng//b&oacute;. Với mức gi&aacute; như n&agrave;y, trung b&igrave;nh c&aacute;c loại hoa giảm khoảng 50.000-70.000 đồng/b&oacute; t&ugrave;y loại.</p>

<p>&ldquo;Gi&aacute; hoa kh&ocirc;ng những lao dốc m&agrave; lượng hoa đổ sỉ cũng giảm so với c&ugrave;ng kỳ năm trước&rdquo;. Anh Trung n&oacute;i v&agrave; cho biết, tầm n&agrave;y năm ngo&aacute;i, chỉ ri&ecirc;ng hoa hồng mỗi ng&agrave;y anh đổ sỉ cho kh&aacute;ch ở chợ khoảng 7.500 b&ocirc;ng, nay số lượng giảm một nửa, chỉ c&ograve;n 3.500 b&ocirc;ng/ng&agrave;y.</p>

<table>
	<tbody>
		<tr>
			<td><a href="https://vnn-imgs-f.vgcloud.vn/2018/10/16/10/hoa-hong-tang-gia-1.jpg" title="Để kích cầu, nhiều tiệm hoa còn có chương trình giảm giá 20-30% cho khách đặt mua hoa"><img alt="Chuyện chưa từng có, giá hoa giảm mạnh ngày 8/3" src="https://vnn-imgs-f.vgcloud.vn/2018/10/16/10/hoa-hong-tang-gia-1.jpg" /></a></td>
		</tr>
		<tr>
			<td>Để k&iacute;ch cầu, nhiều tiệm hoa c&ograve;n c&oacute; chương tr&igrave;nh giảm gi&aacute; 20-30% cho kh&aacute;ch đặt mua hoa</td>
		</tr>
	</tbody>
</table>

<p>Anh Trung l&yacute; giải, hoa ế ẩm, gi&aacute; giảm l&agrave; bởi ảnh hưởng từ dịch Covid-19. C&aacute;c doanh nghiệp kh&oacute; khăn hạn chế đặt hoa tặng đối t&aacute;c, nh&acirc;n vi&ecirc;n nữ. Trường học nghỉ, phụ huynh học sinh, sinh vi&ecirc;n cũng kh&ocirc;ng mua hoa l&agrave;m qu&agrave; tăng như trước.</p>

<p>Kh&ocirc;ng chỉ hoa hồng, c&aacute;c loại hoa kh&aacute;c như cẩm t&uacute; cầu, c&aacute;t tường, đồng tiền, mao lương, l&aacute; hoa phụ kiện,.. lượng&nbsp;h&agrave;ng ti&ecirc;u thụ cũng giảm khoảng 20-30% so với dịp 8/3 năm ngo&aacute;i.</p>

<p>Chị Đo&agrave;n Phương B&iacute;ch, chủ một tiệm hoa ở Hai B&agrave; Trưng (H&agrave; Nội), chia sẻ, chị đang phải chạy chương tr&igrave;nh giảm gi&aacute; từ 20-30% cho c&aacute;c kh&aacute;ch đặt mua hoa với số lượng từ 6 b&oacute; trở l&ecirc;n để k&iacute;ch cầu ti&ecirc;u d&ugrave;ng dịp n&agrave;y.</p>

<p>&ldquo;Tiệm b&aacute;n hoa n&agrave;y của t&ocirc;i đ&atilde; mở 5 năm nay, ng&agrave;y Quốc tế Phụ nữ năm n&agrave;o cũng phải cho nh&acirc;n vi&ecirc;n tăng giờ l&agrave;m mới kịp b&oacute;, l&agrave;m lẵng giao cho kh&aacute;ch đ&atilde; đặt trước. Năm ngo&aacute;i, mới m&ugrave;ng 6/3, t&ocirc;i đ&atilde; phải từ chối bớt kh&aacute;ch do qu&aacute; tải, nh&acirc;n vi&ecirc;n kh&ocirc;ng thể l&agrave;m xuể&rdquo;, chị n&oacute;i.</p>

<p>C&ograve;n dịp 8/3 năm nay th&igrave; ế ẩm chưa từng c&oacute;. Kh&aacute;ch đặt mua hoa giảm tới 60% so với c&ugrave;ng kỳ d&ugrave; đ&atilde; chạy chương tr&igrave;nh khuyến m&atilde;i. Chắc 3 ng&agrave;y tới, lượng kh&aacute;ch đặt hoa sẽ tăng, song cũng kh&ocirc;ng thể bằng dịp 8/3 những năm trước, chị B&iacute;ch cho hay.</p>

<p>Như Băng</p>
', 0, 18)
INSERT [dbo].[TINTUC] ([MATT], [MAAD], [TIEUDE], [ANH], [NGAYDANG], [MOTA], [NOIDUNG], [NOIBAT], [LUOTXEM]) VALUES (13, 1, N'ssd', N'tintuc-1.jpg', CAST(N'2020-06-28 00:00:00.000' AS DateTime), N'ds', N'<p style="text-align:center"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:27.0pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#333333">ĐIỀU KHOẢN V&Agrave; QUY ĐỊNH</span></span></span></span></span></p>

<p style="text-align:center"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#333333">C&aacute;c Điều Khoản v&agrave; quy định</span></span></span></strong></span></span></p>

<p style="text-align:center"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#333333">&Aacute;p dụng từ 20/7/2020</span></span></span></strong></span></span></p>

<p><br />
<span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#333333"><em>C&aacute;c điều khoản hợp đồng sau đ&acirc;y l&agrave; thỏa thuận giữa c&aacute;c b&ecirc;n, bao gồm&nbsp;:</em></span></span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#333333">- Tất cả th&ocirc;ng tin tr&ecirc;n website gồm b&agrave;i viết, h&igrave;nh ảnh, thiết kế quy tr&igrave;nh được giữ bản quyền của &nbsp;, nghi&ecirc;m cấm c&aacute;c h&agrave;nh vi sao ch&eacute;p v&agrave; chia sẻ với mục đ&iacute;ch kinh doanh.</span></span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#333333">- C&aacute; nh&acirc;n hoặc tổ chức thực hiện việc đặt mua h&agrave;ng trực tuyến qua trang web thuộc sở hữu của cửa hàng của chún t&ocirc;i , trang web thương mại điện tử, hoặc đặt h&agrave;ng qua điện thoại sau đ&acirc;y gọi l&agrave; &ldquo;<strong>&nbsp;Kh&aacute;ch h&agrave;ng</strong>&rdquo;.<br />
<br />
- Kh&aacute;ch h&agrave;ng sau khi mua h&agrave;ng sẽ được gọi l&agrave; &ldquo;<strong>Kh&aacute;ch mua h&agrave;ng</strong>&rdquo;. Kh&aacute;ch mua h&agrave;ng sẽ được hiểu chấp nhận quyền v&agrave; nghĩa vụ của kh&aacute;ch h&agrave;ng.<br />
<br />
Mọi y&ecirc;u cầu đặt mua h&agrave;ng tr&ecirc;n trang web&nbsp;</span></span></span><a href="http://hoayeuthuong.com/"><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:red">bán hoa của chúng t&ocirc;i </span></span></span></a><strong>&nbsp;</strong><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#333333">hoặc qua c&aacute;c c&ocirc;ng cụ hỗ trợ (điện thoại, yahoo, skype,&hellip;) đều được hiểu l&agrave; kh&aacute;ch h&agrave;ng đ&atilde; hiểu v&agrave; chấp nhận c&aacute;c điều khoản qui định trong &ldquo;&nbsp;<strong>ĐIỀU KHOẢN V&Agrave; QUY ĐỊNH</strong>&ldquo;. Sự hiểu v&agrave; chấp nhận c&aacute;c điều khoản n&agrave;y kh&ocirc;ng cần thiết phải c&oacute; chữ k&yacute; tay của kh&aacute;ch h&agrave;ng.<br />
<br />
Kh&aacute;ch h&agrave;ng c&oacute; thể truy cập nội dung &ldquo;&nbsp;<strong>ĐIỀU KHOẢN V&Agrave; QUY ĐỊNH</strong>&rdquo; bất cứ l&uacute;c n&agrave;o tr&ecirc;n trang web. C&aacute;c điều khoản c&oacute; trong &ldquo;&nbsp;<strong>ĐIỀU KHOẢN V&Agrave; QUY ĐỊNH</strong>&ldquo; n&agrave;y sẽ được &aacute;p dụng trong trường hợp c&oacute; bất kỳ nội dung hoặc văn bản n&agrave;o m&acirc;u thuẫn.<br />
<br />
Th&ocirc;ng tin của kh&aacute;ch h&agrave;ng khi đăng k&yacute; sẽ được nh&acirc;n vi&ecirc;n của t&ocirc;i li&ecirc;n hệ lại để đảm bảo mọi th&ocirc;ng tin của kh&aacute;ch h&agrave;ng l&agrave; ch&iacute;nh x&aacute;c. C&aacute;c th&ocirc;ng tin n&agrave;y sẽ được sử dụng như c&aacute;c yếu tố cần thiết để thực hiện việc mua h&agrave;ng.</span></span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#333333">T&ocirc;i giữ quyền thay đổi nội dung &ldquo;&nbsp;<strong>ĐIỀU KHOẢN V&Agrave; QUY ĐỊNH</strong>&ldquo; bất kỳ l&uacute;c n&agrave;o. Điều khoản được &aacute;p dụng sẽ l&agrave; những điều khoản được qui định tại thời điểm thực hiện việc mua hang. Kh&aacute;ch mua h&agrave;ng n&ecirc;n in v&agrave; lưu giữ những qui định n&agrave;y.<br />
&nbsp;<br />
<strong>ĐIỀU KHOẢN 1 &ndash; MỤC Đ&Iacute;CH &Aacute;P DỤNG</strong><br />
&nbsp;<br />
C&aacute;c nội dung trong &ldquo;&nbsp;<strong>ĐIỀU KHOẢN V&Agrave; QUY ĐỊNH</strong>&ldquo; được &aacute;p dụng d&agrave;nh ri&ecirc;ng cho việc b&aacute;n h&agrave;ng của t&ocirc;i tr&ecirc;n trang web&nbsp;</span></span></span><a href="http://hoayeuthuong.com/"><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:red">bán hoa của chúng t&ocirc;i</span></span></span> </a><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#333333">&nbsp;hoặc đặt qua điện thoại. Kh&aacute;ch h&agrave;ng đặt mua h&agrave;ng đồng nghĩa với việc kh&aacute;ch h&agrave;ng chấp nhận một c&aacute;ch kh&ocirc;ng điều kiện c&aacute;c điều khoản c&oacute; trong &ldquo;&nbsp;<strong>ĐIỀU KHOẢN V&Agrave; QUY ĐỊNH</strong>&ldquo;. C&aacute;c th&ocirc;ng tin kh&aacute;ch h&agrave;ng d&ugrave;ng để đăng k&yacute; tr&ecirc;n trang web của t&ocirc;i sẽ l&agrave; những yếu tố được sử dụng trong cam kết của kh&aacute;ch h&agrave;ng với ch&uacute;ng t&ocirc;i .</span></span></span></span></span></p>

<p><br />
<span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#333333">Ngược lại, tất cả c&aacute;c y&ecirc;u cầu của kh&aacute;ch h&agrave;ng kh&ocirc;ng được chấp nhận bởi cửa hàng t&ocirc;i đều kh&ocirc;ng c&oacute; gi&aacute; trị. Cửa hàng t&ocirc;i c&oacute; quyền thay đổi nội dung c&aacute;c điều khoản bất kỳ l&uacute;c n&agrave;o. T&ocirc;i khuyến c&aacute;o kh&aacute;ch h&agrave;ng n&ecirc;n tham khảo thường xuy&ecirc;n tr&ecirc;n trang web để cập nhập nội dung c&aacute;c điều khoản mua h&agrave;ng.<br />
&nbsp;<br />
<strong>ĐIỀU KHOẢN 2 &ndash; TRUY CẬP TRANG WEB</strong><br />
&nbsp;<br />
2.1. C&aacute;c mặt h&agrave;ng c&oacute; gi&aacute; kh&aacute;c 0đ (kh&ocirc;ng đồng) đươc đặt tr&ecirc;n website đều l&agrave; c&aacute;c mặt h&agrave;ng kh&aacute;ch h&agrave;ng c&oacute; thể mua.<br />
<br />
2.2. Để c&oacute; thể đặt mua h&agrave;ng, kh&aacute;ch h&agrave;ng cần phải ho&agrave;n tất thủ tục cung cấp c&aacute;c th&ocirc;ng tin li&ecirc;n lạc c&aacute; nh&acirc;n. Trong đ&oacute;, kh&aacute;ch h&agrave;ng cần điền một số th&ocirc;ng tin bắt buộc để c&oacute; thể thực hiện việc đặt mua. Kh&aacute;ch h&agrave;ng cần thiết phải nhập th&ocirc;ng tin ch&iacute;nh x&aacute;c, cụ thể v&agrave; đầy đủ. Trong trường hợp kh&aacute;ch h&agrave;ng cung cấp th&ocirc;ng tin sai, kh&ocirc;ng ch&iacute;nh x&aacute;c v&agrave; kh&ocirc;ng đầy đủ, cửa hàng t&ocirc;i c&oacute; quyền từ chối v&agrave; hủy bỏ đơn h&agrave;ng. Kh&aacute;ch h&agrave;ng chịu ho&agrave;n to&agrave;n tr&aacute;ch nhiệm đối với tất cả hậu quả t&agrave;i ch&iacute;nh c&oacute; thể xảy ra trong qu&aacute; tr&igrave;nh sử dụng trang web bằng t&agrave;i khoản đăng k&yacute; của m&igrave;nh.<br />
<br />
2.3. T&ocirc;i khuyến c&aacute;o kh&aacute;ch h&agrave;ng một số ch&uacute; &yacute; sau đ&acirc;y&nbsp;:<br />
- Kh&aacute;ch h&agrave;ng chỉ được ph&eacute;p sử dụng v&agrave;/hoặc tải xuống c&aacute;c th&ocirc;ng tin c&oacute; tr&ecirc;n trang web của t&ocirc;i v&igrave; mục đ&iacute;ch c&aacute; nh&acirc;n, kh&ocirc;ng v&igrave; mục đ&iacute;ch thương mại v&agrave; c&oacute; giới hạn về thời gian.<br />
- Kh&aacute;ch h&agrave;ng kh&ocirc;ng được ph&eacute;p copy hoặc sử dụng nội dung c&oacute; tr&ecirc;n trang web của t&ocirc;i tr&ecirc;n c&aacute;c trang web kh&aacute;c.<br />
- Kh&aacute;ch h&agrave;ng kh&ocirc;ng được ph&eacute;p sử dụng, sử dụng lại, thay đổi, di chuyển, tr&iacute;ch dẫn, thay thế, ph&aacute;t t&aacute;n &hellip; trực tiếp hoặc gi&aacute;n tiếp, dưới bất kỳ h&igrave;nh thức n&agrave;o to&agrave;n bộ hoặc từng phần (h&igrave;nh ảnh, nội dung &hellip;) c&oacute; tr&ecirc;n trang web của t&ocirc;i cũng như t&ecirc;n, biểu trưng, biểu tượng của trang web v&agrave; của cửa hàng.<br />
- Kh&aacute;ch h&agrave;ng vui l&ograve;ng th&ocirc;ng b&aacute;o cho t&ocirc;i về bất kỳ những vi phạm kể tr&ecirc;n, để t&ocirc;i c&oacute; hướng xử l&yacute; nhằm phục vụ kh&aacute;ch h&agrave;ng ng&agrave;y một tốt hơn.<br />
&nbsp;<br />
<strong>ĐIỀU KHOẢN 3 &ndash; ĐẶT MUA H&Agrave;NG</strong><br />
&nbsp;<br />
Hiện nay, t&ocirc;i chỉ tiếp nhận những đơn đặt h&agrave;ng giao tại Việt Nam v&agrave; một số quốc gia tr&ecirc;n thế giới.<br />
Kh&aacute;ch h&agrave;ng cần phải ho&agrave;n tất c&aacute;c y&ecirc;u cầu khi thanh to&aacute;n mua h&agrave;ng để c&oacute; thể đặt mua h&agrave;ng. Sau khi kh&aacute;ch h&agrave;ng mua h&agrave;ng, t&ocirc;i sẽ gọi điện thoại x&aacute;c nhận về thời điểm cũng nhưng phương c&aacute;ch mua h&agrave;ng, tất cả th&ocirc;ng tin n&agrave;y đều được th&acirc;u &acirc;m v&agrave; chỉ được sử dụng khi c&oacute; khiếu nại.<br />
&nbsp;<br />
C&aacute;c th&ocirc;ng tin kh&aacute;ch h&agrave;ng sử dụng khi đăng k&yacute; với t&ocirc;i sẽ được sử dụng sau đ&oacute; trong qu&aacute; tr&igrave;nh giao h&agrave;ng. T&ocirc;i c&oacute; quyền tạm ngưng, hủy bỏ hoặc từ chối tất cả c&aacute;c đơn h&agrave;ng của một kh&aacute;ch h&agrave;ng trong trường hợp c&oacute; vấn đề li&ecirc;n quan đến th&ocirc;ng tin cung cấp v&agrave; thanh to&aacute;n của c&aacute;c đơn h&agrave;ng trước đ&oacute;.<br />
&nbsp;<br />
<strong>ĐIỀU KHOẢN 4 &ndash; T&Igrave;NH TRẠNG H&Agrave;NG H&Oacute;A</strong><br />
&nbsp;<br />
C&aacute;c mẫu h&agrave;ng v&agrave; gi&aacute; đều sẵn s&agrave;ng khi ch&uacute;ng xuất hiện tr&ecirc;n trang web của ch&uacute;ng t&ocirc;i , trong giới hạn số lượng tồn kho sẵn c&oacute;. Trong trường hợp kh&ocirc;ng c&oacute; đủ nguy&ecirc;n vật liệu cấu th&agrave;nh sản phẩm của kh&aacute;ch h&agrave;ng, t&ocirc;i sẽ tiến h&agrave;nh trao đổi với kh&aacute;ch h&agrave;ng phương &aacute;n thay thế, sau khi được sự đồng &yacute; của kh&aacute;ch h&agrave;ng th&igrave; đơn h&agrave;ng mới c&oacute; hiệu lực.<br />
&nbsp;<br />
<strong>ĐIỀU KHOẢN 5 &ndash; GI&Aacute;</strong><br />
&nbsp;<br />
Tất cả gi&aacute; sản phẩm đều bằng tiền VND, đ&atilde; bao gồm ph&iacute; chuyển h&agrave;ng qua đối t&aacute;c của t&ocirc;i v&agrave; đ&atilde; bao gồm thuế VAT (10%). Kh&aacute;ch h&agrave;ng thanh to&aacute;n bằng tiền Mỹ Kim (USD) sẽ &aacute;p dụng tỉ gi&aacute; ngoại tệ của Ng&acirc;n h&agrave;ng Vietcombank tại thời điểm thanh to&aacute;n. Kh&aacute;ch h&agrave;ng cũng c&oacute; thể chuyển khoản cho t&ocirc;i bằng c&aacute;c ngoại tệ kh&aacute;c. Chi tiết vui l&ograve;ng li&ecirc;n hệ địa chỉ mail :&nbsp;</span></span></span><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:red">linhnguyen1998125@gmail.com</span></span></span><br />
<span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#333333">T&ocirc;i nhận chuyển h&agrave;ng tới Tp. Hồ Ch&iacute; Minh, H&agrave; Nội v&agrave; c&aacute;c tỉnh th&agrave;nh tr&ecirc;n to&agrave;n quốc, ngo&agrave;i ra t&ocirc;i cũng c&oacute; chuyển một số đơn h&agrave;ng đến c&aacute;c quốc gia kh&aacute;c, c&aacute;c đơn h&agrave;ng chuyển ngo&agrave;i Tp. Hồ Ch&iacute; Minh v&agrave; H&agrave; Nội vui l&ograve;ng li&ecirc;n lạc với số điện thoại của t&ocirc;i ở phần li&ecirc;n hệ.&nbsp;<br />
T&ocirc;i giữ quyền thay đổi gi&aacute; h&agrave;ng h&oacute;a bất kỳ l&uacute;c n&agrave;o, nhưng lu&ocirc;n ở mức gi&aacute; hợp l&yacute; nhất với chất lượng tốt nhất để n&acirc;ng cao t&iacute;nh cạnh tranh v&agrave; đảm bảo lợi &iacute;ch của kh&aacute;ch h&agrave;ng.<br />
&nbsp;<br />
<strong>ĐIỀU KHOẢN 6 &ndash; THỜI HẠN GIAO H&Agrave;NG V&Agrave; VẬN CHUYỂN</strong><br />
&nbsp;<br />
<strong>6.1 Điều Kiện Chung</strong></span></span></span></span></span></p>

<p>&nbsp;</p>

<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#333333">H&agrave;ng sẽ được giao tại địa chỉ được n&ecirc;u bởi kh&aacute;ch h&agrave;ng khi đặt mua. Kh&aacute;ch h&agrave;ng c&oacute; tr&aacute;ch nhiệm cung cấp đầy đủ c&aacute;c th&ocirc;ng tin cần thiết để qu&aacute; tr&igrave;nh giao h&agrave;ng được diễn ra thuận lợi như&nbsp;: T&ecirc;n người nhận, địa chỉ ch&iacute;nh x&aacute;c, số nh&agrave;, tỉnh, t&ecirc;n phố, t&ecirc;n quận, huyện, phường, x&atilde;, số điện thoại cần li&ecirc;n hệ&hellip; T&ocirc;i kh&ocirc;ng chịu tr&aacute;ch nhiệm đối với c&aacute;c trường hợp chuyển h&agrave;ng sai địa chỉ do lỗi của kh&aacute;ch h&agrave;ng.</span></span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#333333">Trong trường hợp kh&ocirc;ng c&oacute; người nhận hoặc người người nhận kh&ocirc;ng đồng &yacute; nhận, vấn đề sẽ xử l&yacute; như sau:</span></span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#333333">- C&aacute;c mặt h&agrave;ng kh&ocirc;ng thể để l&acirc;u được: Hoa, b&aacute;nh kem, b&aacute;nh kẹo, g&acirc;u b&ocirc;ng: Kh&aacute;ch h&agrave;ng phải trả 100% gi&aacute; trị.<br />
<br />
<strong>6.2 Thời Gian Giao H&agrave;ng</strong>&nbsp;<br />
Sau khi nhận được thanh to&aacute;n trước của kh&aacute;ch h&agrave;ng, t&ocirc;i sẽ giao đ&uacute;ng thời gian kh&aacute;ch h&agrave;ng y&ecirc;u cầu, trong trường hợp giờ giao kh&ocirc;ng ph&ugrave; hợp t&ocirc;i sẽ trao đổi trước. Đơn h&agrave;ng chỉ được thực hiện khi c&oacute; sự đồng &yacute; của cả 2 b&ecirc;n.&nbsp;<br />
<br />
Thời gian giao h&agrave;ng c&oacute; thể sơm hoặc trễ hơn 60 ph&uacute;t, phụ thuộc v&agrave;o c&aacute;c điều kiện thời tiết hoặc giao th&ocirc;ng tại v&ugrave;ng địa l&yacute; nơi giao. Nếu trễ hơn thời gian n&agrave;y tr&ecirc;n 60 ph&uacute;t, t&ocirc;i sẽ th&ocirc;ng b&aacute;o tr&ecirc;n hệ thống website hoặc qua điện thoại cho người đặt v&agrave; người nhận.&nbsp; &nbsp;<br />
&nbsp;<br />
<strong>6.3 C&aacute;c vấn đề khi giao h&agrave;ng</strong></span></span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#333333">Việc giao h&agrave;ng sẽ được thực hiện bởi đối t&aacute;c do t&ocirc;i lựa chọn. H&agrave;ng h&oacute;a trong qu&aacute; tr&igrave;nh vận chuyển c&oacute; thể chịu rủi ro ngo&agrave;i &yacute; muốn như g&atilde;y, hỏng &hellip; Kh&aacute;ch h&agrave;ng cần kiểm tra kỹ t&igrave;nh trạng g&oacute;i h&agrave;ng cũng như số lượng đơn h&agrave;ng. Mọi khiếu nại li&ecirc;n quan đến việc vận chuyển h&agrave;ng h&oacute;a cần phải được kh&aacute;ch h&agrave;ng th&ocirc;ng b&aacute;o lại cho t&ocirc;i trong v&ograve;ng 1 giờ đồng hồ sau khi nhận được h&agrave;ng. Kh&aacute;ch h&agrave;ng c&oacute; thể th&ocirc;ng b&aacute;o&nbsp;<br />
- Li&ecirc;n hệ trực tiếp qua điện thoại trong phần li&ecirc;n hệ<br />
- Gửi th&ocirc;ng tin &yacute; kiến phản hồi về địa chỉ email :&nbsp;</span></span></span><a href="mailto:contact@hoayeuthuong.com"><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:red">linhnguyen1998125@gmail.com</span></span></span></a><br />
<span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#333333">&nbsp;<br />
<strong>6.4 Theo d&otilde;i đơn h&agrave;ng</strong></span></span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#333333">Kh&aacute;ch h&agrave;ng c&oacute; thể theo d&otilde;i t&igrave;nh trạng giao h&agrave;ng tại phần theo d&otilde;i đơn h&agrave;ng tr&ecirc;n website hoặc gọi điện về tổng đ&agrave;i của ch&uacute;ng t&ocirc;i . Nh&acirc;n vi&ecirc;n của t&ocirc;i sẽ c&oacute; tr&aacute;ch nhiệm th&ocirc;ng b&aacute;o tới kh&aacute;ch h&agrave;ng về t&igrave;nh trạng đơn h&agrave;ng.</span></span></span></span></span></p>

<p><br />
<span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#333333">&nbsp;<br />
<strong>ĐIỀU KHOẢN 7 &ndash; THANH TO&Aacute;N</strong></span></span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#333333">Kh&aacute;ch h&agrave;ng c&oacute; thể thanh to&aacute;n chuyển khoản bằng thẻ&nbsp;: VISA, MASTERCARD hoặc qua PAYPAL hoặc c&aacute;c c&aacute;ch kh&aacute;c.<br />
Vui l&ograve;ng xem c&aacute;c th&ocirc;ng tin thanh to&aacute;n của t&ocirc;i tại phần&nbsp;</span></span></span><a href="http://hoayeuthuong.com/Article.aspx?id=35645"><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:red">Hướng dẫn thanh to&aacute;n</span></span></span></a><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:red">.</span></span></span><br />
<span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#333333">&nbsp;<br />
<strong>ĐIỀU KHOẢN 8 &ndash; TRẢ LẠI H&Agrave;NG Đ&Atilde; GIAO</strong></span></span></span></span></span></p>

<p><br />
<span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#333333">T&ocirc;i chịu tr&aacute;ch nhiệm cung cấp th&ocirc;ng tin đầy đủ, ch&iacute;nh x&aacute;c nhất về c&aacute;c mẫu sản phẩm tr&ecirc;n trang web&nbsp;bán hoa</span></span></span><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#333333">&nbsp;như h&igrave;nh ảnh, m&agrave;u sắc, kiểu d&aacute;ng, k&iacute;ch cỡ, số lượng, chất liệu &hellip; Kh&aacute;ch h&agrave;ng cần xem x&eacute;t kỹ trước khi quyết định đặt mua. T&ocirc;i chỉ nhận lại sản phẩm khi sản phẩm đ&oacute; kh&ocirc;ng đ&uacute;ng với mi&ecirc;u tả tr&ecirc;n trang web của t&ocirc;i v&agrave; kh&ocirc;ng đ&uacute;ng với y&ecirc;u cầu trong đơn đặt mua h&agrave;ng của kh&aacute;ch h&agrave;ng. Trong trường hợp n&agrave;y, kh&aacute;ch h&agrave;ng sẽ được nhận lại 100% số tiền bao gồm&nbsp;: gi&aacute; sản phẩm + ph&iacute; giao h&agrave;ng. Thời hạn ho&agrave;n trả tiền chậm nhất l&agrave; 5 ng&agrave;y kể từ ng&agrave;y nhận được trả lời ch&iacute;nh thức của ch&uacute;ng t&ocirc;i . Kh&aacute;ch h&agrave;ng c&oacute; thể nhận lại tiền qua chuyển khoản, s&eacute;c, paypal, hoặc tiền mặt&hellip;<br />
Trong tất cả c&aacute;c trường hợp kh&aacute;c, t&ocirc;i kh&ocirc;ng chịu tr&aacute;ch nhiệm đối với c&aacute;c lỗi kh&ocirc;ng phải do t&ocirc;i g&acirc;y ra.<br />
Sản phẩm trả lại kh&ocirc;ng đầy đủ, g&atilde;y, hỏng, bẩn, r&aacute;ch, mất tag &hellip; do lỗi của kh&aacute;ch h&agrave;ng sẽ kh&ocirc;ng được chấp nhận.<br />
&nbsp;<br />
<strong>ĐIỀU KHOẢN 9 &ndash; CHĂM S&Oacute;C KH&Aacute;CH H&Agrave;NG&nbsp;</strong></span></span></span></span></span></p>

<p><br />
<span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#333333">Kh&aacute;ch h&agrave;ng c&oacute; bất kỳ thắc mắc hoặc c&acirc;u hỏi n&agrave;o li&ecirc;n quan đến c&aacute;c sản phẩm của ch&uacute;ng t&ocirc;i , c&aacute;c nh&acirc;n vi&ecirc;n chăm s&oacute;c kh&aacute;ch h&agrave;ng của t&ocirc;i lu&ocirc;n sẵn s&agrave;ng giải đ&aacute;p.&nbsp;</span></span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#333333">Thời gian phục vụ 24/24. Vui l&ograve;ng xem th&ecirc;m th&ocirc;ng tin tại phần&nbsp;</span></span></span><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:red">Li&ecirc;n hệ</span></span></span><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#333333">.</span></span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif">&nbsp;</span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#333333">ĐIỀU KHOẢN 10 - HỦY ĐƠN H&Agrave;NG - THAY ĐỔI ĐƠN H&Agrave;NG</span></span></span></strong></span></span></p>

<p><br />
<span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#333333"><strong>1/ Hủy đơn h&agrave;ng</strong><br />
- Đối với H&agrave; Nội v&agrave; Tp. HCM phải hủy trước 8 giờ h&agrave;nh ch&iacute;nh (từ 7h00 s&aacute;ng đến 21h00).<br />
- Đơn h&agrave;ng ở tỉnh phải hủy trước 12giờ&nbsp;h&agrave;nh ch&iacute;nh (từ 7h00 s&aacute;ng đến 21h00).<br />
C&aacute;c đơn h&agrave;ng hủy sau thời gian n&agrave;y vẫn phải thanh to&aacute;n 100% cho cửa hàng.</span></span></span></span></span></p>

<p><br />
<span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#333333"><strong>2/ Thay đổi đơn h&agrave;ng</strong><br />
Thay đổi sản phẩm trước thời điểm ph&aacute;t hoa dự kiến 04 giờ (hoặc khi sản phẩm chưa được<br />
thiết kế):&nbsp;Được chấp nhận v&agrave; kh&ocirc;ng t&iacute;nh ph&iacute;.<br />
Kh&ocirc;ng chấp nhận thay đổi sản phẩm ngay trước thời điểm ph&aacute;t hoặc khi sản phẩm đ&atilde; được thiết kế.<br />
Trong trường hợp sản phẩm mới c&oacute; gi&aacute; trị nhỏ hơn gi&aacute; trị sản phẩm đ&atilde; đặt, Cửa hàng kh&ocirc;ng ho&agrave;n trả lại tiền ch&ecirc;nh lệnh. Trong trường hợp sản phẩm mới c&oacute; gi&aacute; trị lớn hơn&nbsp;sản phẩm đ&atilde; đặt, kh&aacute;ch h&agrave;ng phải thực hiện việc thanh to&aacute;n gi&aacute; trị ch&ecirc;nh lệch, cộng với ph&iacute; thay đổi .Việc thực hiện chuyển ph&aacute;t điện hoa sẽ được thực hiện sau khi việc thanh to&aacute;n ho&agrave;n tất.</span></span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif">&nbsp;</span></span></p>

<p style="text-align:right"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#333333">By Nguyễn Quang Linh</span></span></span></span></span></p>

<p>&nbsp;</p>
', 0, 1)
INSERT [dbo].[TINTUC] ([MATT], [MAAD], [TIEUDE], [ANH], [NGAYDANG], [MOTA], [NOIDUNG], [NOIBAT], [LUOTXEM]) VALUES (14, 1, N'Hoa Hồng', N'tintuc-2.jpg', CAST(N'2020-07-02 00:00:00.000' AS DateTime), N'Hoa màu hồng', N'<h1>HƯỚNG DẪN THANH TO&Aacute;N</h1>

<p>Bạn c&oacute; thể chọn một số c&aacute;ch thanh to&aacute;n sau:</p>

<p><strong>1. Tiền mặt:</strong></p>

<p><strong>1.1 Thanh to&aacute;n trực tiếp tại văn ph&ograve;ng c&ocirc;ng ty</strong></p>

<p>Cửa hàng bán hoa Nguy&ecirc;̃n Quang Linh</p>

<p><strong>Địa chỉ 1:</strong>&nbsp;123 phú hòa, Thủ D&acirc;̀u M&ocirc;̣t, Bình Dương</p>

<p><strong>ĐT:</strong>&nbsp;0372325249</p>

<p><strong>1.2 Thanh to&aacute;n tiền mặt khi nhận hoa</strong><br />
<br />
Ch&uacute;ng t&ocirc;i hỗ trợ phương thức thanh to&aacute;n COD (Cash on Delivery) - thanh to&aacute;n tiền mặt khi giao hoa trong trường hợp bạn l&agrave; người đặt v&agrave; người nhận hoa, nhằm hỗ trợ tối đa việc đặt v&agrave; nhận h&agrave;ng.<br />
<br />
<strong>1.3 Thu tiền mặt ở địa điểm kh&aacute;c</strong><br />
<br />
Trong trường hợp bạn kh&ocirc;ng phải người nhận hoa để thanh to&aacute;n tiền mặt khi nhận hoa, bạn cũng kh&ocirc;ng thể chuyển khoản hoặc đến trực ti&ecirc;́p tại cửa hàng&nbsp;để thanh to&aacute;n, ch&uacute;ng t&ocirc;i hỗ trợ giao hoa v&agrave; thu tiền ở 2 địa điểm kh&aacute;c nhau. Tuy nhi&ecirc;n, phương thức thanh to&aacute;n n&agrave;y sẽ c&oacute; th&ecirc;m ph&iacute; dịch vụ (t&ugrave;y khu vực). Vui l&ograve;ng li&ecirc;n hệ nh&acirc;n vi&ecirc;n để biết th&ecirc;m chi tiết (email linhnguyen1998125@gmail.com&nbsp;hoặc hotline 0372325249)</p>

<p><strong>2. Thanh to&aacute;n chuyển khoản qua ng&acirc;n h&agrave;ng:</strong></p>

<p>Bạn đến bất kỳ ng&acirc;n h&agrave;ng n&agrave;o ở Việt Nam để chuyển tiền theo th&ocirc;ng tin b&ecirc;n dưới (bạn kh&ocirc;ng nhất thiết phải c&oacute; t&agrave;i khoản ng&acirc;n h&agrave;ng)</p>

<table>
	<tbody>
		<tr>
			<td><img alt="mua hoa online" src="https://hyt.r.worldssl.net/ShowTopicSubImage.aspx?id=34983" title="mua hoa online" /></td>
			<td><strong>Ng&acirc;n h&agrave;ng TMCP Ngoại Thương Việt Nam</strong><br />
			Chi nh&aacute;nh Bình Dương<br />
			<strong>Chủ t&agrave;i khoản:</strong>&nbsp;Nguy&ecirc;̃n Quang Linh<br />
			<strong>Số T&agrave;i Khoản:</strong>&nbsp;xxxxxxxxxxxxxxxx</td>
		</tr>
	</tbody>
</table>

<table>
	<tbody>
		<tr>
			<td><img alt="Hướng dẫn cách chuyển tiền trên internet banking của BIDV" src="https://sudospaces.com/chanhtuoi-com/uploads/2016/04/bidv-large.jpg" style="height:41px; width:200px" /></td>
			<td><strong>Ng&acirc;n h&agrave;ng Đầu tư v&agrave; Ph&aacute;t triển Việt Nam</strong><br />
			Chi nh&aacute;nh Bình Dương<br />
			<strong>Chủ t&agrave;i khoản:</strong>&nbsp;Nguy&ecirc;̃n Quang Linh<br />
			<strong>Số T&agrave;i Khoản:</strong>&nbsp;191 291 8515 2018</td>
		</tr>
	</tbody>
</table>
', 0, 1)
SET IDENTITY_INSERT [dbo].[TINTUC] OFF
ALTER TABLE [dbo].[CTHOADON]  WITH CHECK ADD  CONSTRAINT [FK__CTHOADON__MAHD__74AE54BC] FOREIGN KEY([MAHD])
REFERENCES [dbo].[HOADON] ([MAHD])
GO
ALTER TABLE [dbo].[CTHOADON] CHECK CONSTRAINT [FK__CTHOADON__MAHD__74AE54BC]
GO
ALTER TABLE [dbo].[CTHOADON]  WITH CHECK ADD  CONSTRAINT [FK__CTHOADON__MASP__75A278F5] FOREIGN KEY([MASP])
REFERENCES [dbo].[SANPHAM] ([MASP])
GO
ALTER TABLE [dbo].[CTHOADON] CHECK CONSTRAINT [FK__CTHOADON__MASP__75A278F5]
GO
ALTER TABLE [dbo].[DANHMUC]  WITH CHECK ADD  CONSTRAINT [FK__DANHMUC__MAMN__145C0A3F] FOREIGN KEY([MAMN])
REFERENCES [dbo].[MENU] ([MAMN])
GO
ALTER TABLE [dbo].[DANHMUC] CHECK CONSTRAINT [FK__DANHMUC__MAMN__145C0A3F]
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [FK__HOADON__MAKH__71D1E811] FOREIGN KEY([MAKH])
REFERENCES [dbo].[KHACHHANG] ([MAKH])
GO
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [FK__HOADON__MAKH__71D1E811]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK__SANPHAM__MADM__4316F928] FOREIGN KEY([MADM])
REFERENCES [dbo].[DANHMUC] ([MADM])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK__SANPHAM__MADM__4316F928]
GO
ALTER TABLE [dbo].[TINTUC]  WITH CHECK ADD  CONSTRAINT [FK__TINTUC__MAAD__52593CB8] FOREIGN KEY([MAAD])
REFERENCES [dbo].[ADMIN] ([MAAD])
GO
ALTER TABLE [dbo].[TINTUC] CHECK CONSTRAINT [FK__TINTUC__MAAD__52593CB8]
GO
