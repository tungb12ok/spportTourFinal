USE [YadodVivuFinal]
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 6/14/2023 1:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity](
	[Activity_ID] [int] IDENTITY(1,1) NOT NULL,
	[ActivityName] [nvarchar](100) NULL,
	[Landscape_Address] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Activity_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 6/14/2023 1:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[City_ID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](50) NULL,
	[HotelID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[City_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 6/14/2023 1:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[Discount_ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Amount] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Discount_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 6/14/2023 1:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Room] [int] NULL,
	[Active] [int] NULL,
	[isDelete] [bit] NULL,
	[IMG] [nvarchar](250) NULL,
	[Description] [nvarchar](4000) NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/14/2023 1:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Order_ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Date] [datetime] NULL,
	[TotalPrice] [money] NULL,
	[Status] [int] NULL,
	[TourID] [int] NULL,
	[People] [int] NULL,
	[StartAddress] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/14/2023 1:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Role_ID] [int] IDENTITY(1,1) NOT NULL,
	[Role_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 6/14/2023 1:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[Tour_ID] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[City_ID] [int] NULL,
	[NumberPeople] [int] NULL,
	[Content] [nvarchar](4000) NULL,
	[IMG] [nvarchar](500) NULL,
	[TotalPrice] [money] NULL,
	[isDelete] [bit] NULL,
	[Type_ID] [int] NULL,
 CONSTRAINT [PK__Tour__D436A8635CB93D00] PRIMARY KEY CLUSTERED 
(
	[Tour_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TourActivity]    Script Date: 6/14/2023 1:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourActivity](
	[Tour_ID] [int] NULL,
	[Activity_ID] [int] NULL,
	[Time] [time](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TourDiscount]    Script Date: 6/14/2023 1:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourDiscount](
	[Discount_ID] [int] NULL,
	[Tour_ID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TourType]    Script Date: 6/14/2023 1:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourType](
	[Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Type_name] [nvarchar](100) NULL,
	[Is_Delete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/14/2023 1:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[cmnd] [varchar](16) NULL,
	[Email] [nvarchar](100) NULL,
	[UserName] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[Phone] [nvarchar](10) NULL,
	[Gender] [bit] NULL,
	[DOB] [date] NULL,
	[Address] [nvarchar](100) NULL,
	[IsBlocked] [bit] NULL,
	[Role_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Activity] ON 

INSERT [dbo].[Activity] ([Activity_ID], [ActivityName], [Landscape_Address]) VALUES (1, N'Ăn Sáng', N'Khách sạn MT')
INSERT [dbo].[Activity] ([Activity_ID], [ActivityName], [Landscape_Address]) VALUES (2, N'Tắm biển', N'Bãi biển Mỹ Khê')
INSERT [dbo].[Activity] ([Activity_ID], [ActivityName], [Landscape_Address]) VALUES (3, N'Massage', N'Khách sạn MT')
INSERT [dbo].[Activity] ([Activity_ID], [ActivityName], [Landscape_Address]) VALUES (4, N'Dạo chơi ở chợ đêm', N'Đà Lạt')
INSERT [dbo].[Activity] ([Activity_ID], [ActivityName], [Landscape_Address]) VALUES (5, N'Thăm quan thành phố cổ', N'Hội An')
INSERT [dbo].[Activity] ([Activity_ID], [ActivityName], [Landscape_Address]) VALUES (1003, N'Trải nghiệm văn hóa sắc màu', N'Sapa')
INSERT [dbo].[Activity] ([Activity_ID], [ActivityName], [Landscape_Address]) VALUES (1004, N'Lặn biển', N'Đảo Cù Lao Chàm')
INSERT [dbo].[Activity] ([Activity_ID], [ActivityName], [Landscape_Address]) VALUES (1005, N'Trải nghiệm văn hóa đồng bằng sông Cửu Long', N'Cần Thơ')
INSERT [dbo].[Activity] ([Activity_ID], [ActivityName], [Landscape_Address]) VALUES (1006, N'Khám phá cung đường Hồ Chí Minh ', N'Tây Nguyên')
INSERT [dbo].[Activity] ([Activity_ID], [ActivityName], [Landscape_Address]) VALUES (1007, N' Ghé thăm ngôi đền UNESCO', N'My Son')
INSERT [dbo].[Activity] ([Activity_ID], [ActivityName], [Landscape_Address]) VALUES (1008, N'Ghé thăm di tích quốc gia', N'Hà Nội')
INSERT [dbo].[Activity] ([Activity_ID], [ActivityName], [Landscape_Address]) VALUES (1009, N'Dạo chơi ở chợ đêm', N'Đà Lạt')
INSERT [dbo].[Activity] ([Activity_ID], [ActivityName], [Landscape_Address]) VALUES (1010, N'Tắm suối và thưởng thức nước mắm', N'Phú Quốc')
INSERT [dbo].[Activity] ([Activity_ID], [ActivityName], [Landscape_Address]) VALUES (1011, N'Tham quan thành cổ ', N'Huế')
INSERT [dbo].[Activity] ([Activity_ID], [ActivityName], [Landscape_Address]) VALUES (1012, N'Trải nghiệm cuộc sống trên sông Mekong', N'Đồng Tháp Mười')
INSERT [dbo].[Activity] ([Activity_ID], [ActivityName], [Landscape_Address]) VALUES (1013, N'Khám phá di sản quốc gia', N'Vịnh Hạ Long')
INSERT [dbo].[Activity] ([Activity_ID], [ActivityName], [Landscape_Address]) VALUES (1014, N'Ghé thăm ngôi chùa cổ', N'Chùa Một Cột Hà Nội')
INSERT [dbo].[Activity] ([Activity_ID], [ActivityName], [Landscape_Address]) VALUES (1015, N'Trải nghiệm đua thuyền cổ truyền', N'Huế')
INSERT [dbo].[Activity] ([Activity_ID], [ActivityName], [Landscape_Address]) VALUES (1016, N'Thưởng thức ẩm thực đường phố ', N'Hồ Chí Minh')
INSERT [dbo].[Activity] ([Activity_ID], [ActivityName], [Landscape_Address]) VALUES (1017, N'Ghé thăm vườn quốc gia', N' Phong Nha-Kẻ Bàng')
INSERT [dbo].[Activity] ([Activity_ID], [ActivityName], [Landscape_Address]) VALUES (1018, N'Tham quan thị trấn biển', N'Mũi Né, Phan Thiết')
INSERT [dbo].[Activity] ([Activity_ID], [ActivityName], [Landscape_Address]) VALUES (1019, N'Trải nghiệm văn hóa sông nước', N' Cái Răng, Cần Thơ')
INSERT [dbo].[Activity] ([Activity_ID], [ActivityName], [Landscape_Address]) VALUES (1020, N'Thăm ngôi chùa lớn nhất Đông Nam Á', N'Chùa Bái Đính, Ninh Bình')
INSERT [dbo].[Activity] ([Activity_ID], [ActivityName], [Landscape_Address]) VALUES (1021, N'Ghé thăm di tích quốc gia', N'Chùa Một Cột Hà Nội')
INSERT [dbo].[Activity] ([Activity_ID], [ActivityName], [Landscape_Address]) VALUES (1022, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Activity] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (1, N'An Giang', 2)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (2, N'Vũng Tàu', 6)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (3, N'Bạc Liêu', 6)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (4, N'Bắc Giang', 6)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (5, N'Bắc Kạn', 8)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (6, N'Bắc Ninh', 9)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (7, N'Bến Tre', 10)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (8, N'Bình Dương', 11)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (9, N'Bình Định', 12)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (10, N'Bình Phước', 12)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (11, N'Bình Thuận', 14)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (12, N'Cà Mau', 15)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (13, N'Cao Bằng', 16)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (14, N'Cần Thơ', 17)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (15, N'Đà Nẵng', 7)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (16, N'Đắk Lắk', 8)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (17, N'Đắk Nông', 2)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (18, N'Điện Biên', 1)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (19, N'Đồng Nai', 9)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (20, N'Đồng Tháp', 19)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (21, N'Gia Lai', 6)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (22, N'Hà Giang', 16)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (23, N'Hà Nam', 15)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (24, N'Hà Nội', 16)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (25, N'Hà Tĩnh', 2)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (26, N'Hải Dương', 1)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (27, N'Hải Phòng', 14)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (28, N'Hậu Giang', 2)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (29, N'Hòa Bình', 21)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (30, N'Hồ Chí Minh city', 20)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (31, N'Hưng Yên', 18)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (32, N'Khánh Hòa', 16)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (33, N'Kiên Giang', 1)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (34, N'Kon Tum', 2)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (35, N'Lai Châu', 1)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (36, N'Lạng Sơn', 1)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (37, N'Lào Cai', 1)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (38, N'Lâm Đồng', 12)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (39, N'Long An', 2)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (40, N'Nam Định', 2)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (41, N'Nghệ An', 5)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (42, N'Ninh Bình', 1)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (43, N'Ninh Thuận', 6)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (44, N'Phú Thọ', 7)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (45, N'Phú Yên', 8)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (46, N'Quảng Bình', 11)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (47, N'Quảng Nam', 22)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (48, N'Quảng Ngãi', 23)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (49, N'Quảng Ninh', 1)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (50, N'Quảng Trị', 16)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (51, N'Sóc Trăng', 17)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (52, N'Sơn La', 18)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (53, N'Tây Ninh', 13)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (54, N'Thái Bình', 15)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (55, N'Thái Nguyên', 18)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (56, N'Thanh Hóa', 17)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (57, N'Huế', 17)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (58, N'Tiền Giang', 19)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (59, N'Trà Vinh', 22)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (60, N'Tuyên Quang', 11)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (61, N'Vĩnh Long', 1)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (62, N'Vĩnh Phúc', 2)
INSERT [dbo].[City] ([City_ID], [CityName], [HotelID]) VALUES (63, N'Yên Bái', 21)
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Discount] ON 

INSERT [dbo].[Discount] ([Discount_ID], [Description], [StartDate], [EndDate], [Amount]) VALUES (1, N'Tuần lễ Thiếu Nhi', CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-06-07T00:00:00.000' AS DateTime), 0.06)
INSERT [dbo].[Discount] ([Discount_ID], [Description], [StartDate], [EndDate], [Amount]) VALUES (2, N'Tuần lễ Quốc Khánh', CAST(N'2023-09-02T00:00:00.000' AS DateTime), CAST(N'2023-09-08T00:00:00.000' AS DateTime), 0.1)
INSERT [dbo].[Discount] ([Discount_ID], [Description], [StartDate], [EndDate], [Amount]) VALUES (3, N'Tuần lễ Phục Sinh', CAST(N'2023-04-15T00:00:00.000' AS DateTime), CAST(N'2023-04-21T00:00:00.000' AS DateTime), 0.2)
INSERT [dbo].[Discount] ([Discount_ID], [Description], [StartDate], [EndDate], [Amount]) VALUES (4, N'Tuần lễ Lao Động', CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-05-07T00:00:00.000' AS DateTime), 0.1)
INSERT [dbo].[Discount] ([Discount_ID], [Description], [StartDate], [EndDate], [Amount]) VALUES (5, N'Tuần lễ Phật Đản', CAST(N'2023-04-25T00:00:00.000' AS DateTime), CAST(N'2023-05-01T00:00:00.000' AS DateTime), 0.34)
INSERT [dbo].[Discount] ([Discount_ID], [Description], [StartDate], [EndDate], [Amount]) VALUES (6, N'Tuần lễ Năm Mới', CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-06-07T00:00:00.000' AS DateTime), 0.16)
INSERT [dbo].[Discount] ([Discount_ID], [Description], [StartDate], [EndDate], [Amount]) VALUES (7, N'Tuần lễ Giáng Sinh', CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-06-07T00:00:00.000' AS DateTime), 0.1)
INSERT [dbo].[Discount] ([Discount_ID], [Description], [StartDate], [EndDate], [Amount]) VALUES (8, N'Tuần lễ Valentine', CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-06-07T00:00:00.000' AS DateTime), 0.34)
INSERT [dbo].[Discount] ([Discount_ID], [Description], [StartDate], [EndDate], [Amount]) VALUES (9, N'Tuần lễ sinh nhật', CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-06-07T00:00:00.000' AS DateTime), 0.15)
INSERT [dbo].[Discount] ([Discount_ID], [Description], [StartDate], [EndDate], [Amount]) VALUES (10, N'Tuần lễ', CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-06-07T00:00:00.000' AS DateTime), 0.34)
INSERT [dbo].[Discount] ([Discount_ID], [Description], [StartDate], [EndDate], [Amount]) VALUES (11, N'Tuần lễ', CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-06-07T00:00:00.000' AS DateTime), 0.16)
INSERT [dbo].[Discount] ([Discount_ID], [Description], [StartDate], [EndDate], [Amount]) VALUES (12, N'Tuần lễ', CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-06-07T00:00:00.000' AS DateTime), 0.16)
INSERT [dbo].[Discount] ([Discount_ID], [Description], [StartDate], [EndDate], [Amount]) VALUES (13, N'Tuần lễ', CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-06-07T00:00:00.000' AS DateTime), 0.16)
SET IDENTITY_INSERT [dbo].[Discount] OFF
GO
SET IDENTITY_INSERT [dbo].[Hotel] ON 

INSERT [dbo].[Hotel] ([ID], [Name], [Room], [Active], [isDelete], [IMG], [Description]) VALUES (1, N'Fusion Maia Resort', 100, 20, 0, N'https://cf.bstatic.com/xdata/images/hotel/max500/302376194.jpg?k=f6265012295c044c8161a0ca3a5077e00a6878a883ae4c992fcf36bc8261e4f0&o=&hp=1', N'Sofitel Legend Metropole Hanoi là một khách sạn danh tiếng tọa lạc tại trung tâm thành phố Hà Nội, Việt Nam. Khách sạn này có lịch sử lâu đời và được biết đến như một biểu tượng văn hóa và kiến trúc của Hà Nội.

Với kiến trúc hoàng gia và phong cách cổ điển Pháp, Sofitel Legend Metropole Hanoi mang đến một không gian sang trọng và lịch lãm. Khách sạn có tổng cộng 364 phòng và suite, được thiết kế tinh tế và trang trọng với các tiện nghi hiện đại.

Khách sạn cung cấp nhiều tiện ích cho du khách bao gồm các nhà hàng và quầy bar đa dạng. Trong đó, nhà hàng Le Beaulieu nổi tiếng với các món ăn Pháp tuyệt vời, còn nhà hàng Spices Garden phục vụ các món ăn truyền thống Việt Nam. Quầy bar ngắm cảnh thuộc sở hữu của khách sạn là một điểm đến lý tưởng để thưởng thức đồ uống và ngắm cảnh.

Ngoài ra, khách sạn còn có bể bơi ngoài trời, trung tâm thể dục và spa để khách thư giãn và thưởng thức dịch vụ chăm sóc sức khỏe.')
INSERT [dbo].[Hotel] ([ID], [Name], [Room], [Active], [isDelete], [IMG], [Description]) VALUES (2, N'Sofitel Legend Metropole', 100, 10, 0, N'https://khachsandanang.shop/uploads/images/images/fusion-maia.jpg', N'Sofitel Legend Metropole Hanoi là một khách sạn danh tiếng tọa lạc tại trung tâm thành phố Hà Nội, Việt Nam. Khách sạn này có lịch sử lâu đời và được biết đến như một biểu tượng văn hóa và kiến trúc của Hà Nội.

Với kiến trúc hoàng gia và phong cách cổ điển Pháp, Sofitel Legend Metropole Hanoi mang đến một không gian sang trọng và lịch lãm. Khách sạn có tổng cộng 364 phòng và suite, được thiết kế tinh tế và trang trọng với các tiện nghi hiện đại.

Khách sạn cung cấp nhiều tiện ích cho du khách bao gồm các nhà hàng và quầy bar đa dạng. Trong đó, nhà hàng Le Beaulieu nổi tiếng với các món ăn Pháp tuyệt vời, còn nhà hàng Spices Garden phục vụ các món ăn truyền thống Việt Nam. Quầy bar ngắm cảnh thuộc sở hữu của khách sạn là một điểm đến lý tưởng để thưởng thức đồ uống và ngắm cảnh.

Ngoài ra, khách sạn còn có bể bơi ngoài trời, trung tâm thể dục và spa để khách thư giãn và thưởng thức dịch vụ chăm sóc sức khỏe.')
INSERT [dbo].[Hotel] ([ID], [Name], [Room], [Active], [isDelete], [IMG], [Description]) VALUES (5, N'InterContinental Hanoi Westlake', 142, 42, 0, N'https://www.sofitel-legend-metropole-hanoi.com/wp-content/uploads/sites/95/2022/06/DSC00934-scaled.jpg', N'Sofitel Legend Metropole Hanoi là một khách sạn danh tiếng tọa lạc tại trung tâm thành phố Hà Nội, Việt Nam. Khách sạn này có lịch sử lâu đời và được biết đến như một biểu tượng văn hóa và kiến trúc của Hà Nội.

Với kiến trúc hoàng gia và phong cách cổ điển Pháp, Sofitel Legend Metropole Hanoi mang đến một không gian sang trọng và lịch lãm. Khách sạn có tổng cộng 364 phòng và suite, được thiết kế tinh tế và trang trọng với các tiện nghi hiện đại.

Khách sạn cung cấp nhiều tiện ích cho du khách bao gồm các nhà hàng và quầy bar đa dạng. Trong đó, nhà hàng Le Beaulieu nổi tiếng với các món ăn Pháp tuyệt vời, còn nhà hàng Spices Garden phục vụ các món ăn truyền thống Việt Nam. Quầy bar ngắm cảnh thuộc sở hữu của khách sạn là một điểm đến lý tưởng để thưởng thức đồ uống và ngắm cảnh.

Ngoài ra, khách sạn còn có bể bơi ngoài trời, trung tâm thể dục và spa để khách thư giãn và thưởng thức dịch vụ chăm sóc sức khỏe.')
INSERT [dbo].[Hotel] ([ID], [Name], [Room], [Active], [isDelete], [IMG], [Description]) VALUES (6, N'Hotel Majestic Saigon', 156, 64, 0, N'https://www.sofitel-legend-metropole-hanoi.com/wp-content/uploads/sites/95/2022/06/DSC00934-scaled.jpg', N'Sofitel Legend Metropole Hanoi là một khách sạn danh tiếng tọa lạc tại trung tâm thành phố Hà Nội, Việt Nam. Khách sạn này có lịch sử lâu đời và được biết đến như một biểu tượng văn hóa và kiến trúc của Hà Nội.

Với kiến trúc hoàng gia và phong cách cổ điển Pháp, Sofitel Legend Metropole Hanoi mang đến một không gian sang trọng và lịch lãm. Khách sạn có tổng cộng 364 phòng và suite, được thiết kế tinh tế và trang trọng với các tiện nghi hiện đại.

Khách sạn cung cấp nhiều tiện ích cho du khách bao gồm các nhà hàng và quầy bar đa dạng. Trong đó, nhà hàng Le Beaulieu nổi tiếng với các món ăn Pháp tuyệt vời, còn nhà hàng Spices Garden phục vụ các món ăn truyền thống Việt Nam. Quầy bar ngắm cảnh thuộc sở hữu của khách sạn là một điểm đến lý tưởng để thưởng thức đồ uống và ngắm cảnh.

Ngoài ra, khách sạn còn có bể bơi ngoài trời, trung tâm thể dục và spa để khách thư giãn và thưởng thức dịch vụ chăm sóc sức khỏe.')
INSERT [dbo].[Hotel] ([ID], [Name], [Room], [Active], [isDelete], [IMG], [Description]) VALUES (7, N'Park Hyatt Saigon', 234, 43, 0, N'https://www.sofitel-legend-metropole-hanoi.com/wp-content/uploads/sites/95/2022/06/DSC00934-scaled.jpg', N'Sofitel Legend Metropole Hanoi là một khách sạn danh tiếng tọa lạc tại trung tâm thành phố Hà Nội, Việt Nam. Khách sạn này có lịch sử lâu đời và được biết đến như một biểu tượng văn hóa và kiến trúc của Hà Nội.

Với kiến trúc hoàng gia và phong cách cổ điển Pháp, Sofitel Legend Metropole Hanoi mang đến một không gian sang trọng và lịch lãm. Khách sạn có tổng cộng 364 phòng và suite, được thiết kế tinh tế và trang trọng với các tiện nghi hiện đại.

Khách sạn cung cấp nhiều tiện ích cho du khách bao gồm các nhà hàng và quầy bar đa dạng. Trong đó, nhà hàng Le Beaulieu nổi tiếng với các món ăn Pháp tuyệt vời, còn nhà hàng Spices Garden phục vụ các món ăn truyền thống Việt Nam. Quầy bar ngắm cảnh thuộc sở hữu của khách sạn là một điểm đến lý tưởng để thưởng thức đồ uống và ngắm cảnh.

Ngoài ra, khách sạn còn có bể bơi ngoài trời, trung tâm thể dục và spa để khách thư giãn và thưởng thức dịch vụ chăm sóc sức khỏe.')
INSERT [dbo].[Hotel] ([ID], [Name], [Room], [Active], [isDelete], [IMG], [Description]) VALUES (8, N'The Reverie Saigon', 123, 42, 0, N'https://www.sofitel-legend-metropole-hanoi.com/wp-content/uploads/sites/95/2022/06/DSC00934-scaled.jpg', N'Sofitel Legend Metropole Hanoi là một khách sạn danh tiếng tọa lạc tại trung tâm thành phố Hà Nội, Việt Nam. Khách sạn này có lịch sử lâu đời và được biết đến như một biểu tượng văn hóa và kiến trúc của Hà Nội.

Với kiến trúc hoàng gia và phong cách cổ điển Pháp, Sofitel Legend Metropole Hanoi mang đến một không gian sang trọng và lịch lãm. Khách sạn có tổng cộng 364 phòng và suite, được thiết kế tinh tế và trang trọng với các tiện nghi hiện đại.

Khách sạn cung cấp nhiều tiện ích cho du khách bao gồm các nhà hàng và quầy bar đa dạng. Trong đó, nhà hàng Le Beaulieu nổi tiếng với các món ăn Pháp tuyệt vời, còn nhà hàng Spices Garden phục vụ các món ăn truyền thống Việt Nam. Quầy bar ngắm cảnh thuộc sở hữu của khách sạn là một điểm đến lý tưởng để thưởng thức đồ uống và ngắm cảnh.

Ngoài ra, khách sạn còn có bể bơi ngoài trời, trung tâm thể dục và spa để khách thư giãn và thưởng thức dịch vụ chăm sóc sức khỏe.')
INSERT [dbo].[Hotel] ([ID], [Name], [Room], [Active], [isDelete], [IMG], [Description]) VALUES (9, N'Caravelle Saigon', 112, 43, 0, N'https://www.sofitel-legend-metropole-hanoi.com/wp-content/uploads/sites/95/2022/06/DSC00934-scaled.jpg', N'Sofitel Legend Metropole Hanoi là một khách sạn danh tiếng tọa lạc tại trung tâm thành phố Hà Nội, Việt Nam. Khách sạn này có lịch sử lâu đời và được biết đến như một biểu tượng văn hóa và kiến trúc của Hà Nội.

Với kiến trúc hoàng gia và phong cách cổ điển Pháp, Sofitel Legend Metropole Hanoi mang đến một không gian sang trọng và lịch lãm. Khách sạn có tổng cộng 364 phòng và suite, được thiết kế tinh tế và trang trọng với các tiện nghi hiện đại.

Khách sạn cung cấp nhiều tiện ích cho du khách bao gồm các nhà hàng và quầy bar đa dạng. Trong đó, nhà hàng Le Beaulieu nổi tiếng với các món ăn Pháp tuyệt vời, còn nhà hàng Spices Garden phục vụ các món ăn truyền thống Việt Nam. Quầy bar ngắm cảnh thuộc sở hữu của khách sạn là một điểm đến lý tưởng để thưởng thức đồ uống và ngắm cảnh.

Ngoài ra, khách sạn còn có bể bơi ngoài trời, trung tâm thể dục và spa để khách thư giãn và thưởng thức dịch vụ chăm sóc sức khỏe.')
INSERT [dbo].[Hotel] ([ID], [Name], [Room], [Active], [isDelete], [IMG], [Description]) VALUES (10, N'Sheraton Hanoi Hotel', 142, 42, 0, N'https://www.sofitel-legend-metropole-hanoi.com/wp-content/uploads/sites/95/2022/06/DSC00934-scaled.jpg', N'Sofitel Legend Metropole Hanoi là một khách sạn danh tiếng tọa lạc tại trung tâm thành phố Hà Nội, Việt Nam. Khách sạn này có lịch sử lâu đời và được biết đến như một biểu tượng văn hóa và kiến trúc của Hà Nội.

Với kiến trúc hoàng gia và phong cách cổ điển Pháp, Sofitel Legend Metropole Hanoi mang đến một không gian sang trọng và lịch lãm. Khách sạn có tổng cộng 364 phòng và suite, được thiết kế tinh tế và trang trọng với các tiện nghi hiện đại.

Khách sạn cung cấp nhiều tiện ích cho du khách bao gồm các nhà hàng và quầy bar đa dạng. Trong đó, nhà hàng Le Beaulieu nổi tiếng với các món ăn Pháp tuyệt vời, còn nhà hàng Spices Garden phục vụ các món ăn truyền thống Việt Nam. Quầy bar ngắm cảnh thuộc sở hữu của khách sạn là một điểm đến lý tưởng để thưởng thức đồ uống và ngắm cảnh.

Ngoài ra, khách sạn còn có bể bơi ngoài trời, trung tâm thể dục và spa để khách thư giãn và thưởng thức dịch vụ chăm sóc sức khỏe.')
INSERT [dbo].[Hotel] ([ID], [Name], [Room], [Active], [isDelete], [IMG], [Description]) VALUES (11, N'JW Marriott Hotel Hanoi', 142, 23, 0, N'https://www.sofitel-legend-metropole-hanoi.com/wp-content/uploads/sites/95/2022/06/DSC00934-scaled.jpg', N'Sofitel Legend Metropole Hanoi là một khách sạn danh tiếng tọa lạc tại trung tâm thành phố Hà Nội, Việt Nam. Khách sạn này có lịch sử lâu đời và được biết đến như một biểu tượng văn hóa và kiến trúc của Hà Nội.

Với kiến trúc hoàng gia và phong cách cổ điển Pháp, Sofitel Legend Metropole Hanoi mang đến một không gian sang trọng và lịch lãm. Khách sạn có tổng cộng 364 phòng và suite, được thiết kế tinh tế và trang trọng với các tiện nghi hiện đại.

Khách sạn cung cấp nhiều tiện ích cho du khách bao gồm các nhà hàng và quầy bar đa dạng. Trong đó, nhà hàng Le Beaulieu nổi tiếng với các món ăn Pháp tuyệt vời, còn nhà hàng Spices Garden phục vụ các món ăn truyền thống Việt Nam. Quầy bar ngắm cảnh thuộc sở hữu của khách sạn là một điểm đến lý tưởng để thưởng thức đồ uống và ngắm cảnh.

Ngoài ra, khách sạn còn có bể bơi ngoài trời, trung tâm thể dục và spa để khách thư giãn và thưởng thức dịch vụ chăm sóc sức khỏe.')
INSERT [dbo].[Hotel] ([ID], [Name], [Room], [Active], [isDelete], [IMG], [Description]) VALUES (12, N'Vinpearl Luxury Da Nang', 142, 53, 0, N'https://www.sofitel-legend-metropole-hanoi.com/wp-content/uploads/sites/95/2022/06/DSC00934-scaled.jpg', N'Sofitel Legend Metropole Hanoi là một khách sạn danh tiếng tọa lạc tại trung tâm thành phố Hà Nội, Việt Nam. Khách sạn này có lịch sử lâu đời và được biết đến như một biểu tượng văn hóa và kiến trúc của Hà Nội.

Với kiến trúc hoàng gia và phong cách cổ điển Pháp, Sofitel Legend Metropole Hanoi mang đến một không gian sang trọng và lịch lãm. Khách sạn có tổng cộng 364 phòng và suite, được thiết kế tinh tế và trang trọng với các tiện nghi hiện đại.

Khách sạn cung cấp nhiều tiện ích cho du khách bao gồm các nhà hàng và quầy bar đa dạng. Trong đó, nhà hàng Le Beaulieu nổi tiếng với các món ăn Pháp tuyệt vời, còn nhà hàng Spices Garden phục vụ các món ăn truyền thống Việt Nam. Quầy bar ngắm cảnh thuộc sở hữu của khách sạn là một điểm đến lý tưởng để thưởng thức đồ uống và ngắm cảnh.

Ngoài ra, khách sạn còn có bể bơi ngoài trời, trung tâm thể dục và spa để khách thư giãn và thưởng thức dịch vụ chăm sóc sức khỏe.')
INSERT [dbo].[Hotel] ([ID], [Name], [Room], [Active], [isDelete], [IMG], [Description]) VALUES (13, N'Furama Resort Danang', 125, 42, 0, N'https://www.sofitel-legend-metropole-hanoi.com/wp-content/uploads/sites/95/2022/06/DSC00934-scaled.jpg', N'Sofitel Legend Metropole Hanoi là một khách sạn danh tiếng tọa lạc tại trung tâm thành phố Hà Nội, Việt Nam. Khách sạn này có lịch sử lâu đời và được biết đến như một biểu tượng văn hóa và kiến trúc của Hà Nội.

Với kiến trúc hoàng gia và phong cách cổ điển Pháp, Sofitel Legend Metropole Hanoi mang đến một không gian sang trọng và lịch lãm. Khách sạn có tổng cộng 364 phòng và suite, được thiết kế tinh tế và trang trọng với các tiện nghi hiện đại.

Khách sạn cung cấp nhiều tiện ích cho du khách bao gồm các nhà hàng và quầy bar đa dạng. Trong đó, nhà hàng Le Beaulieu nổi tiếng với các món ăn Pháp tuyệt vời, còn nhà hàng Spices Garden phục vụ các món ăn truyền thống Việt Nam. Quầy bar ngắm cảnh thuộc sở hữu của khách sạn là một điểm đến lý tưởng để thưởng thức đồ uống và ngắm cảnh.

Ngoài ra, khách sạn còn có bể bơi ngoài trời, trung tâm thể dục và spa để khách thư giãn và thưởng thức dịch vụ chăm sóc sức khỏe.')
INSERT [dbo].[Hotel] ([ID], [Name], [Room], [Active], [isDelete], [IMG], [Description]) VALUES (14, N'Six Senses Con Dao', 125, 63, 0, N'https://www.sofitel-legend-metropole-hanoi.com/wp-content/uploads/sites/95/2022/06/DSC00934-scaled.jpg', N'Sofitel Legend Metropole Hanoi là một khách sạn danh tiếng tọa lạc tại trung tâm thành phố Hà Nội, Việt Nam. Khách sạn này có lịch sử lâu đời và được biết đến như một biểu tượng văn hóa và kiến trúc của Hà Nội.

Với kiến trúc hoàng gia và phong cách cổ điển Pháp, Sofitel Legend Metropole Hanoi mang đến một không gian sang trọng và lịch lãm. Khách sạn có tổng cộng 364 phòng và suite, được thiết kế tinh tế và trang trọng với các tiện nghi hiện đại.

Khách sạn cung cấp nhiều tiện ích cho du khách bao gồm các nhà hàng và quầy bar đa dạng. Trong đó, nhà hàng Le Beaulieu nổi tiếng với các món ăn Pháp tuyệt vời, còn nhà hàng Spices Garden phục vụ các món ăn truyền thống Việt Nam. Quầy bar ngắm cảnh thuộc sở hữu của khách sạn là một điểm đến lý tưởng để thưởng thức đồ uống và ngắm cảnh.

Ngoài ra, khách sạn còn có bể bơi ngoài trời, trung tâm thể dục và spa để khách thư giãn và thưởng thức dịch vụ chăm sóc sức khỏe.')
INSERT [dbo].[Hotel] ([ID], [Name], [Room], [Active], [isDelete], [IMG], [Description]) VALUES (15, N'Amanoi Resort', 142, 42, 0, N'https://www.sofitel-legend-metropole-hanoi.com/wp-content/uploads/sites/95/2022/06/DSC00934-scaled.jpg', N'Sofitel Legend Metropole Hanoi là một khách sạn danh tiếng tọa lạc tại trung tâm thành phố Hà Nội, Việt Nam. Khách sạn này có lịch sử lâu đời và được biết đến như một biểu tượng văn hóa và kiến trúc của Hà Nội.

Với kiến trúc hoàng gia và phong cách cổ điển Pháp, Sofitel Legend Metropole Hanoi mang đến một không gian sang trọng và lịch lãm. Khách sạn có tổng cộng 364 phòng và suite, được thiết kế tinh tế và trang trọng với các tiện nghi hiện đại.

Khách sạn cung cấp nhiều tiện ích cho du khách bao gồm các nhà hàng và quầy bar đa dạng. Trong đó, nhà hàng Le Beaulieu nổi tiếng với các món ăn Pháp tuyệt vời, còn nhà hàng Spices Garden phục vụ các món ăn truyền thống Việt Nam. Quầy bar ngắm cảnh thuộc sở hữu của khách sạn là một điểm đến lý tưởng để thưởng thức đồ uống và ngắm cảnh.

Ngoài ra, khách sạn còn có bể bơi ngoài trời, trung tâm thể dục và spa để khách thư giãn và thưởng thức dịch vụ chăm sóc sức khỏe.')
INSERT [dbo].[Hotel] ([ID], [Name], [Room], [Active], [isDelete], [IMG], [Description]) VALUES (16, N'Fusion Maia Da Nang', 152, 34, 0, N'https://www.sofitel-legend-metropole-hanoi.com/wp-content/uploads/sites/95/2022/06/DSC00934-scaled.jpg', N'Sofitel Legend Metropole Hanoi là một khách sạn danh tiếng tọa lạc tại trung tâm thành phố Hà Nội, Việt Nam. Khách sạn này có lịch sử lâu đời và được biết đến như một biểu tượng văn hóa và kiến trúc của Hà Nội.

Với kiến trúc hoàng gia và phong cách cổ điển Pháp, Sofitel Legend Metropole Hanoi mang đến một không gian sang trọng và lịch lãm. Khách sạn có tổng cộng 364 phòng và suite, được thiết kế tinh tế và trang trọng với các tiện nghi hiện đại.

Khách sạn cung cấp nhiều tiện ích cho du khách bao gồm các nhà hàng và quầy bar đa dạng. Trong đó, nhà hàng Le Beaulieu nổi tiếng với các món ăn Pháp tuyệt vời, còn nhà hàng Spices Garden phục vụ các món ăn truyền thống Việt Nam. Quầy bar ngắm cảnh thuộc sở hữu của khách sạn là một điểm đến lý tưởng để thưởng thức đồ uống và ngắm cảnh.

Ngoài ra, khách sạn còn có bể bơi ngoài trời, trung tâm thể dục và spa để khách thư giãn và thưởng thức dịch vụ chăm sóc sức khỏe.')
INSERT [dbo].[Hotel] ([ID], [Name], [Room], [Active], [isDelete], [IMG], [Description]) VALUES (17, N'Anantara Hoi An Resort ', 142, 42, 0, N'https://www.sofitel-legend-metropole-hanoi.com/wp-content/uploads/sites/95/2022/06/DSC00934-scaled.jpg', N'Sofitel Legend Metropole Hanoi là một khách sạn danh tiếng tọa lạc tại trung tâm thành phố Hà Nội, Việt Nam. Khách sạn này có lịch sử lâu đời và được biết đến như một biểu tượng văn hóa và kiến trúc của Hà Nội.

Với kiến trúc hoàng gia và phong cách cổ điển Pháp, Sofitel Legend Metropole Hanoi mang đến một không gian sang trọng và lịch lãm. Khách sạn có tổng cộng 364 phòng và suite, được thiết kế tinh tế và trang trọng với các tiện nghi hiện đại.

Khách sạn cung cấp nhiều tiện ích cho du khách bao gồm các nhà hàng và quầy bar đa dạng. Trong đó, nhà hàng Le Beaulieu nổi tiếng với các món ăn Pháp tuyệt vời, còn nhà hàng Spices Garden phục vụ các món ăn truyền thống Việt Nam. Quầy bar ngắm cảnh thuộc sở hữu của khách sạn là một điểm đến lý tưởng để thưởng thức đồ uống và ngắm cảnh.

Ngoài ra, khách sạn còn có bể bơi ngoài trời, trung tâm thể dục và spa để khách thư giãn và thưởng thức dịch vụ chăm sóc sức khỏe.')
INSERT [dbo].[Hotel] ([ID], [Name], [Room], [Active], [isDelete], [IMG], [Description]) VALUES (18, N'Victoria Hoi An Beach Resort & Spa', 142, 32, 0, N'https://www.sofitel-legend-metropole-hanoi.com/wp-content/uploads/sites/95/2022/06/DSC00934-scaled.jpg', N'Sofitel Legend Metropole Hanoi là một khách sạn danh tiếng tọa lạc tại trung tâm thành phố Hà Nội, Việt Nam. Khách sạn này có lịch sử lâu đời và được biết đến như một biểu tượng văn hóa và kiến trúc của Hà Nội.

Với kiến trúc hoàng gia và phong cách cổ điển Pháp, Sofitel Legend Metropole Hanoi mang đến một không gian sang trọng và lịch lãm. Khách sạn có tổng cộng 364 phòng và suite, được thiết kế tinh tế và trang trọng với các tiện nghi hiện đại.

Khách sạn cung cấp nhiều tiện ích cho du khách bao gồm các nhà hàng và quầy bar đa dạng. Trong đó, nhà hàng Le Beaulieu nổi tiếng với các món ăn Pháp tuyệt vời, còn nhà hàng Spices Garden phục vụ các món ăn truyền thống Việt Nam. Quầy bar ngắm cảnh thuộc sở hữu của khách sạn là một điểm đến lý tưởng để thưởng thức đồ uống và ngắm cảnh.

Ngoài ra, khách sạn còn có bể bơi ngoài trời, trung tâm thể dục và spa để khách thư giãn và thưởng thức dịch vụ chăm sóc sức khỏe.')
INSERT [dbo].[Hotel] ([ID], [Name], [Room], [Active], [isDelete], [IMG], [Description]) VALUES (19, N'La Residence Hotel & Spa', 164, 64, 0, N'https://www.sofitel-legend-metropole-hanoi.com/wp-content/uploads/sites/95/2022/06/DSC00934-scaled.jpg', N'Sofitel Legend Metropole Hanoi là một khách sạn danh tiếng tọa lạc tại trung tâm thành phố Hà Nội, Việt Nam. Khách sạn này có lịch sử lâu đời và được biết đến như một biểu tượng văn hóa và kiến trúc của Hà Nội.

Với kiến trúc hoàng gia và phong cách cổ điển Pháp, Sofitel Legend Metropole Hanoi mang đến một không gian sang trọng và lịch lãm. Khách sạn có tổng cộng 364 phòng và suite, được thiết kế tinh tế và trang trọng với các tiện nghi hiện đại.

Khách sạn cung cấp nhiều tiện ích cho du khách bao gồm các nhà hàng và quầy bar đa dạng. Trong đó, nhà hàng Le Beaulieu nổi tiếng với các món ăn Pháp tuyệt vời, còn nhà hàng Spices Garden phục vụ các món ăn truyền thống Việt Nam. Quầy bar ngắm cảnh thuộc sở hữu của khách sạn là một điểm đến lý tưởng để thưởng thức đồ uống và ngắm cảnh.

Ngoài ra, khách sạn còn có bể bơi ngoài trời, trung tâm thể dục và spa để khách thư giãn và thưởng thức dịch vụ chăm sóc sức khỏe.')
INSERT [dbo].[Hotel] ([ID], [Name], [Room], [Active], [isDelete], [IMG], [Description]) VALUES (20, N'Banyan Tree Lang Co', 135, 87, 0, N'https://www.sofitel-legend-metropole-hanoi.com/wp-content/uploads/sites/95/2022/06/DSC00934-scaled.jpg', N'Sofitel Legend Metropole Hanoi là một khách sạn danh tiếng tọa lạc tại trung tâm thành phố Hà Nội, Việt Nam. Khách sạn này có lịch sử lâu đời và được biết đến như một biểu tượng văn hóa và kiến trúc của Hà Nội.

Với kiến trúc hoàng gia và phong cách cổ điển Pháp, Sofitel Legend Metropole Hanoi mang đến một không gian sang trọng và lịch lãm. Khách sạn có tổng cộng 364 phòng và suite, được thiết kế tinh tế và trang trọng với các tiện nghi hiện đại.

Khách sạn cung cấp nhiều tiện ích cho du khách bao gồm các nhà hàng và quầy bar đa dạng. Trong đó, nhà hàng Le Beaulieu nổi tiếng với các món ăn Pháp tuyệt vời, còn nhà hàng Spices Garden phục vụ các món ăn truyền thống Việt Nam. Quầy bar ngắm cảnh thuộc sở hữu của khách sạn là một điểm đến lý tưởng để thưởng thức đồ uống và ngắm cảnh.

Ngoài ra, khách sạn còn có bể bơi ngoài trời, trung tâm thể dục và spa để khách thư giãn và thưởng thức dịch vụ chăm sóc sức khỏe.')
INSERT [dbo].[Hotel] ([ID], [Name], [Room], [Active], [isDelete], [IMG], [Description]) VALUES (21, N'Salinda Resort Phu Quoc Island', 185, 65, 0, N'https://www.sofitel-legend-metropole-hanoi.com/wp-content/uploads/sites/95/2022/06/DSC00934-scaled.jpg', N'Sofitel Legend Metropole Hanoi là một khách sạn danh tiếng tọa lạc tại trung tâm thành phố Hà Nội, Việt Nam. Khách sạn này có lịch sử lâu đời và được biết đến như một biểu tượng văn hóa và kiến trúc của Hà Nội.

Với kiến trúc hoàng gia và phong cách cổ điển Pháp, Sofitel Legend Metropole Hanoi mang đến một không gian sang trọng và lịch lãm. Khách sạn có tổng cộng 364 phòng và suite, được thiết kế tinh tế và trang trọng với các tiện nghi hiện đại.

Khách sạn cung cấp nhiều tiện ích cho du khách bao gồm các nhà hàng và quầy bar đa dạng. Trong đó, nhà hàng Le Beaulieu nổi tiếng với các món ăn Pháp tuyệt vời, còn nhà hàng Spices Garden phục vụ các món ăn truyền thống Việt Nam. Quầy bar ngắm cảnh thuộc sở hữu của khách sạn là một điểm đến lý tưởng để thưởng thức đồ uống và ngắm cảnh.

Ngoài ra, khách sạn còn có bể bơi ngoài trời, trung tâm thể dục và spa để khách thư giãn và thưởng thức dịch vụ chăm sóc sức khỏe.')
INSERT [dbo].[Hotel] ([ID], [Name], [Room], [Active], [isDelete], [IMG], [Description]) VALUES (22, N'The Anam', 142, 43, 0, N'https://www.sofitel-legend-metropole-hanoi.com/wp-content/uploads/sites/95/2022/06/DSC00934-scaled.jpg', N'Sofitel Legend Metropole Hanoi là một khách sạn danh tiếng tọa lạc tại trung tâm thành phố Hà Nội, Việt Nam. Khách sạn này có lịch sử lâu đời và được biết đến như một biểu tượng văn hóa và kiến trúc của Hà Nội.

Với kiến trúc hoàng gia và phong cách cổ điển Pháp, Sofitel Legend Metropole Hanoi mang đến một không gian sang trọng và lịch lãm. Khách sạn có tổng cộng 364 phòng và suite, được thiết kế tinh tế và trang trọng với các tiện nghi hiện đại.

Khách sạn cung cấp nhiều tiện ích cho du khách bao gồm các nhà hàng và quầy bar đa dạng. Trong đó, nhà hàng Le Beaulieu nổi tiếng với các món ăn Pháp tuyệt vời, còn nhà hàng Spices Garden phục vụ các món ăn truyền thống Việt Nam. Quầy bar ngắm cảnh thuộc sở hữu của khách sạn là một điểm đến lý tưởng để thưởng thức đồ uống và ngắm cảnh.

Ngoài ra, khách sạn còn có bể bơi ngoài trời, trung tâm thể dục và spa để khách thư giãn và thưởng thức dịch vụ chăm sóc sức khỏe.')
INSERT [dbo].[Hotel] ([ID], [Name], [Room], [Active], [isDelete], [IMG], [Description]) VALUES (23, N'An Lam Retreats Ninh Van Bay', 142, 42, 0, N'https://www.sofitel-legend-metropole-hanoi.com/wp-content/uploads/sites/95/2022/06/DSC00934-scaled.jpg', N'Sofitel Legend Metropole Hanoi là một khách sạn danh tiếng tọa lạc tại trung tâm thành phố Hà Nội, Việt Nam. Khách sạn này có lịch sử lâu đời và được biết đến như một biểu tượng văn hóa và kiến trúc của Hà Nội.

Với kiến trúc hoàng gia và phong cách cổ điển Pháp, Sofitel Legend Metropole Hanoi mang đến một không gian sang trọng và lịch lãm. Khách sạn có tổng cộng 364 phòng và suite, được thiết kế tinh tế và trang trọng với các tiện nghi hiện đại.

Khách sạn cung cấp nhiều tiện ích cho du khách bao gồm các nhà hàng và quầy bar đa dạng. Trong đó, nhà hàng Le Beaulieu nổi tiếng với các món ăn Pháp tuyệt vời, còn nhà hàng Spices Garden phục vụ các món ăn truyền thống Việt Nam. Quầy bar ngắm cảnh thuộc sở hữu của khách sạn là một điểm đến lý tưởng để thưởng thức đồ uống và ngắm cảnh.

Ngoài ra, khách sạn còn có bể bơi ngoài trời, trung tâm thể dục và spa để khách thư giãn và thưởng thức dịch vụ chăm sóc sức khỏe.')
SET IDENTITY_INSERT [dbo].[Hotel] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Order_ID], [UserID], [Date], [TotalPrice], [Status], [TourID], [People], [StartAddress]) VALUES (1, 1, NULL, 1.0000, 2, 1, NULL, NULL)
INSERT [dbo].[Order] ([Order_ID], [UserID], [Date], [TotalPrice], [Status], [TourID], [People], [StartAddress]) VALUES (1087, 1, CAST(N'2023-06-14T00:00:00.000' AS DateTime), 1500000.0000, 0, 12, 1, NULL)
INSERT [dbo].[Order] ([Order_ID], [UserID], [Date], [TotalPrice], [Status], [TourID], [People], [StartAddress]) VALUES (1092, 9, CAST(N'2023-06-14T00:00:00.000' AS DateTime), 6650.8193, 0, 2, 7, N'Hay Tayy')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Role_ID], [Role_name]) VALUES (1, N'admin')
INSERT [dbo].[Role] ([Role_ID], [Role_name]) VALUES (2, N'staff')
INSERT [dbo].[Role] ([Role_ID], [Role_name]) VALUES (3, N'customer')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Tour] ON 

INSERT [dbo].[Tour] ([Tour_ID], [StartDate], [EndDate], [City_ID], [NumberPeople], [Content], [IMG], [TotalPrice], [isDelete], [Type_ID]) VALUES (1, CAST(N'2023-10-25' AS Date), CAST(N'2023-12-12' AS Date), 1, 50, N'THÔNG TIN TOUR: Vũng Tàu - Ngày Nắng Hạ 2N1Đ

 Đêm 01: CẦN THƠ  – VŨNG TÀU
21h30: Xe và HDV đón đoàn tại điểm hẹn, sau đó khởi hành đến thành phố Vũng Tàu.

 Ngày 01: KHÁM PHÁ THÀNH PHỐ BIỂN - Ăn: S, T, C
Sáng 07h00: Vũng Tàu Quý khách dùng điểm tâm sáng. Sau đó xe và HDV sẽ đưa các bạn tham quan:
img
- Tượng chúa Kitô – là một trong những địa điểm tham quan Vũng Tàu nổi tiếng, không thể thiếu trong hành trình của du khách khi du lịch Vũng Tàu, bởi cảm giác chinh phục đầy thú vị tại phố biển sôi động này. Tại đây quý khách sẽ ngấm được toàn cảnh Thành phố Vũng Tàu.
- Đoàn di chuyển đến thành phố biển Vũng Tàu. Tiếp tục tham quan Chùa Hộ Pháp - Chùa Thích Ca Phật Đài - Là một địa điểm tín ngưỡng nổi tiếng là nới cúng viếng của nhiều phật tử trong ngoài nước, nằm trong một quần thể thánh tích kiến trúc phật giáo đồ sộ quy mô rộng lớn của hệ Phật Giáo nguyên thủy Theravada có nguồn gốc từ Ấn Độ.

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, về khách sạn nhận phòng nghỉ ngơi.
14h30: Quý khách tự do tắm biển và thưởng thức hải sản. tại đây quý khách thoả sức bơi lội bỏ qua sự mệt mỏi thường ngày tận hưởng những cơn gió biển nắng chiều.     

Chiều 17h00: Đoàn ăn tối. tôi quý khách tự do dạo phố biển về đềm thưởng thức hải sản tươi ngon nơi đây.    
img
 Ngày 2: VŨNG TÀU – CẦN THƠ - Ăn: S, T, C
Sáng 06h30: Đoàn dùng điểm tâm sáng, làm thủ tục trả phòng. Sau đó xe sẽ đưa đoàn dạo quanh con đường biển. Đoàn dừng chân đến với:

- Bến du thuyền Marina - Đến đây du khách sẽ được chu du trên những chiếc cano, lướt cùng sóng biển bằng thuyền buồm, tham quan, ngắm cảnh trên sông Dinh, tìm hiểu về cuộc sống của các ngư dân trên bè nổi, tham gia các hoạt động gắn liền với sông nước.(Chi phí đi canon tự túc)     

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, Sau đó xe và HDV đưa quý khách về lại Cần Thơ.
Trên đường về đoàn dừng chân mua sấm hải sản quà tặng lưu niệm thành phố biển.
Đến Long Thành đoàn dừng chân, sau đó về Tiền Giang ăn chiều.     

Chiều 17h30: Đoàn ăn chiều. Kết thúc chương trình xe và HDV Du lịch Thiên Nhiên đưa quý khách về điểm đón ban đầu. HDV chào tạm biệt gửi lời cám ơn đến đoàn và hẹn gặp lại.    
img
Tùy theo điều kiện thực tế mà chương trình tham quan có thể thay đổi cho phù hợp, tuy nhiên tổng số điểm tham quan vẫn đảm bảo đầy đủ.

GIÁ TOUR ĐÃ BAO GỒM:
- Lưu trú: Khách sạn 2 tiêu chuẩn.
- Ăn uống: Ăn sáng: Tô ly.
Ăn chính theo chương trình, phục vụ tại nhà hàng. 
(2 buổi sáng + 4 buổi ăn chính).
- Tham quan: Vé tham quan các điểm du lịch.', N'https://znews-photo.zingcdn.me/w660/Uploaded/jaroin/2017_10_29/23DQTChon_bong_lai__Ba_na_hill.jpg', 1000.0000, 1, 1)
INSERT [dbo].[Tour] ([Tour_ID], [StartDate], [EndDate], [City_ID], [NumberPeople], [Content], [IMG], [TotalPrice], [isDelete], [Type_ID]) VALUES (2, CAST(N'2023-01-01' AS Date), CAST(N'2023-02-01' AS Date), 2, 20, N'THÔNG TIN TOUR: Vũng Tàu - Ngày Nắng Hạ 2N1Đ

 Đêm 01: CẦN THƠ  – VŨNG TÀU
21h30: Xe và HDV đón đoàn tại điểm hẹn, sau đó khởi hành đến thành phố Vũng Tàu.

 Ngày 01: KHÁM PHÁ THÀNH PHỐ BIỂN - Ăn: S, T, C
Sáng 07h00: Vũng Tàu Quý khách dùng điểm tâm sáng. Sau đó xe và HDV sẽ đưa các bạn tham quan:
img
- Tượng chúa Kitô – là một trong những địa điểm tham quan Vũng Tàu nổi tiếng, không thể thiếu trong hành trình của du khách khi du lịch Vũng Tàu, bởi cảm giác chinh phục đầy thú vị tại phố biển sôi động này. Tại đây quý khách sẽ ngấm được toàn cảnh Thành phố Vũng Tàu.
- Đoàn di chuyển đến thành phố biển Vũng Tàu. Tiếp tục tham quan Chùa Hộ Pháp - Chùa Thích Ca Phật Đài - Là một địa điểm tín ngưỡng nổi tiếng là nới cúng viếng của nhiều phật tử trong ngoài nước, nằm trong một quần thể thánh tích kiến trúc phật giáo đồ sộ quy mô rộng lớn của hệ Phật Giáo nguyên thủy Theravada có nguồn gốc từ Ấn Độ.

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, về khách sạn nhận phòng nghỉ ngơi.
14h30: Quý khách tự do tắm biển và thưởng thức hải sản. tại đây quý khách thoả sức bơi lội bỏ qua sự mệt mỏi thường ngày tận hưởng những cơn gió biển nắng chiều.     

Chiều 17h00: Đoàn ăn tối. tôi quý khách tự do dạo phố biển về đềm thưởng thức hải sản tươi ngon nơi đây.    
img
 Ngày 2: VŨNG TÀU – CẦN THƠ - Ăn: S, T, C
Sáng 06h30: Đoàn dùng điểm tâm sáng, làm thủ tục trả phòng. Sau đó xe sẽ đưa đoàn dạo quanh con đường biển. Đoàn dừng chân đến với:

- Bến du thuyền Marina - Đến đây du khách sẽ được chu du trên những chiếc cano, lướt cùng sóng biển bằng thuyền buồm, tham quan, ngắm cảnh trên sông Dinh, tìm hiểu về cuộc sống của các ngư dân trên bè nổi, tham gia các hoạt động gắn liền với sông nước.(Chi phí đi canon tự túc)     

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, Sau đó xe và HDV đưa quý khách về lại Cần Thơ.
Trên đường về đoàn dừng chân mua sấm hải sản quà tặng lưu niệm thành phố biển.
Đến Long Thành đoàn dừng chân, sau đó về Tiền Giang ăn chiều.     

Chiều 17h30: Đoàn ăn chiều. Kết thúc chương trình xe và HDV Du lịch Thiên Nhiên đưa quý khách về điểm đón ban đầu. HDV chào tạm biệt gửi lời cám ơn đến đoàn và hẹn gặp lại.    
img
Tùy theo điều kiện thực tế mà chương trình tham quan có thể thay đổi cho phù hợp, tuy nhiên tổng số điểm tham quan vẫn đảm bảo đầy đủ.

GIÁ TOUR ĐÃ BAO GỒM:
- Lưu trú: Khách sạn 2 tiêu chuẩn.
- Ăn uống: Ăn sáng: Tô ly.
Ăn chính theo chương trình, phục vụ tại nhà hàng. 
(2 buổi sáng + 4 buổi ăn chính).
- Tham quan: Vé tham quan các điểm du lịch.', N'https://leadtravel.com.vn/cam-nang-du-lich/wp-content/uploads/2021/03/dia-diem-du-lich-noi-tieng-o-ha-noi-300x164@2x.jpg', 1000.1232, 1, 2)
INSERT [dbo].[Tour] ([Tour_ID], [StartDate], [EndDate], [City_ID], [NumberPeople], [Content], [IMG], [TotalPrice], [isDelete], [Type_ID]) VALUES (3, CAST(N'2023-06-09' AS Date), CAST(N'2023-06-09' AS Date), 1, 100, N'THÔNG TIN TOUR: Vũng Tàu - Ngày Nắng Hạ 2N1Đ

 Đêm 01: CẦN THƠ  – VŨNG TÀU
21h30: Xe và HDV đón đoàn tại điểm hẹn, sau đó khởi hành đến thành phố Vũng Tàu.

 Ngày 01: KHÁM PHÁ THÀNH PHỐ BIỂN - Ăn: S, T, C
Sáng 07h00: Vũng Tàu Quý khách dùng điểm tâm sáng. Sau đó xe và HDV sẽ đưa các bạn tham quan:
img
- Tượng chúa Kitô – là một trong những địa điểm tham quan Vũng Tàu nổi tiếng, không thể thiếu trong hành trình của du khách khi du lịch Vũng Tàu, bởi cảm giác chinh phục đầy thú vị tại phố biển sôi động này. Tại đây quý khách sẽ ngấm được toàn cảnh Thành phố Vũng Tàu.
- Đoàn di chuyển đến thành phố biển Vũng Tàu. Tiếp tục tham quan Chùa Hộ Pháp - Chùa Thích Ca Phật Đài - Là một địa điểm tín ngưỡng nổi tiếng là nới cúng viếng của nhiều phật tử trong ngoài nước, nằm trong một quần thể thánh tích kiến trúc phật giáo đồ sộ quy mô rộng lớn của hệ Phật Giáo nguyên thủy Theravada có nguồn gốc từ Ấn Độ.

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, về khách sạn nhận phòng nghỉ ngơi.
14h30: Quý khách tự do tắm biển và thưởng thức hải sản. tại đây quý khách thoả sức bơi lội bỏ qua sự mệt mỏi thường ngày tận hưởng những cơn gió biển nắng chiều.     

Chiều 17h00: Đoàn ăn tối. tôi quý khách tự do dạo phố biển về đềm thưởng thức hải sản tươi ngon nơi đây.    
img
 Ngày 2: VŨNG TÀU – CẦN THƠ - Ăn: S, T, C
Sáng 06h30: Đoàn dùng điểm tâm sáng, làm thủ tục trả phòng. Sau đó xe sẽ đưa đoàn dạo quanh con đường biển. Đoàn dừng chân đến với:

- Bến du thuyền Marina - Đến đây du khách sẽ được chu du trên những chiếc cano, lướt cùng sóng biển bằng thuyền buồm, tham quan, ngắm cảnh trên sông Dinh, tìm hiểu về cuộc sống của các ngư dân trên bè nổi, tham gia các hoạt động gắn liền với sông nước.(Chi phí đi canon tự túc)     

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, Sau đó xe và HDV đưa quý khách về lại Cần Thơ.
Trên đường về đoàn dừng chân mua sấm hải sản quà tặng lưu niệm thành phố biển.
Đến Long Thành đoàn dừng chân, sau đó về Tiền Giang ăn chiều.     

Chiều 17h30: Đoàn ăn chiều. Kết thúc chương trình xe và HDV Du lịch Thiên Nhiên đưa quý khách về điểm đón ban đầu. HDV chào tạm biệt gửi lời cám ơn đến đoàn và hẹn gặp lại.    
img
Tùy theo điều kiện thực tế mà chương trình tham quan có thể thay đổi cho phù hợp, tuy nhiên tổng số điểm tham quan vẫn đảm bảo đầy đủ.

GIÁ TOUR ĐÃ BAO GỒM:
- Lưu trú: Khách sạn 2 tiêu chuẩn.
- Ăn uống: Ăn sáng: Tô ly.
Ăn chính theo chương trình, phục vụ tại nhà hàng. 
(2 buổi sáng + 4 buổi ăn chính).
- Tham quan: Vé tham quan các điểm du lịch.', N'https://top10angiang.vn/wp-content/uploads/2021/06/danh-lam-thang-canh-an-giang-3.jpg', 1000000.0000, 1, 1)
INSERT [dbo].[Tour] ([Tour_ID], [StartDate], [EndDate], [City_ID], [NumberPeople], [Content], [IMG], [TotalPrice], [isDelete], [Type_ID]) VALUES (4, CAST(N'2023-06-09' AS Date), CAST(N'2023-06-09' AS Date), 1, 50, N'THÔNG TIN TOUR: Vũng Tàu - Ngày Nắng Hạ 2N1Đ

 Đêm 01: CẦN THƠ  – VŨNG TÀU
21h30: Xe và HDV đón đoàn tại điểm hẹn, sau đó khởi hành đến thành phố Vũng Tàu.

 Ngày 01: KHÁM PHÁ THÀNH PHỐ BIỂN - Ăn: S, T, C
Sáng 07h00: Vũng Tàu Quý khách dùng điểm tâm sáng. Sau đó xe và HDV sẽ đưa các bạn tham quan:
img
- Tượng chúa Kitô – là một trong những địa điểm tham quan Vũng Tàu nổi tiếng, không thể thiếu trong hành trình của du khách khi du lịch Vũng Tàu, bởi cảm giác chinh phục đầy thú vị tại phố biển sôi động này. Tại đây quý khách sẽ ngấm được toàn cảnh Thành phố Vũng Tàu.
- Đoàn di chuyển đến thành phố biển Vũng Tàu. Tiếp tục tham quan Chùa Hộ Pháp - Chùa Thích Ca Phật Đài - Là một địa điểm tín ngưỡng nổi tiếng là nới cúng viếng của nhiều phật tử trong ngoài nước, nằm trong một quần thể thánh tích kiến trúc phật giáo đồ sộ quy mô rộng lớn của hệ Phật Giáo nguyên thủy Theravada có nguồn gốc từ Ấn Độ.

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, về khách sạn nhận phòng nghỉ ngơi.
14h30: Quý khách tự do tắm biển và thưởng thức hải sản. tại đây quý khách thoả sức bơi lội bỏ qua sự mệt mỏi thường ngày tận hưởng những cơn gió biển nắng chiều.     

Chiều 17h00: Đoàn ăn tối. tôi quý khách tự do dạo phố biển về đềm thưởng thức hải sản tươi ngon nơi đây.    
img
 Ngày 2: VŨNG TÀU – CẦN THƠ - Ăn: S, T, C
Sáng 06h30: Đoàn dùng điểm tâm sáng, làm thủ tục trả phòng. Sau đó xe sẽ đưa đoàn dạo quanh con đường biển. Đoàn dừng chân đến với:

- Bến du thuyền Marina - Đến đây du khách sẽ được chu du trên những chiếc cano, lướt cùng sóng biển bằng thuyền buồm, tham quan, ngắm cảnh trên sông Dinh, tìm hiểu về cuộc sống của các ngư dân trên bè nổi, tham gia các hoạt động gắn liền với sông nước.(Chi phí đi canon tự túc)     

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, Sau đó xe và HDV đưa quý khách về lại Cần Thơ.
Trên đường về đoàn dừng chân mua sấm hải sản quà tặng lưu niệm thành phố biển.
Đến Long Thành đoàn dừng chân, sau đó về Tiền Giang ăn chiều.     

Chiều 17h30: Đoàn ăn chiều. Kết thúc chương trình xe và HDV Du lịch Thiên Nhiên đưa quý khách về điểm đón ban đầu. HDV chào tạm biệt gửi lời cám ơn đến đoàn và hẹn gặp lại.    
img
Tùy theo điều kiện thực tế mà chương trình tham quan có thể thay đổi cho phù hợp, tuy nhiên tổng số điểm tham quan vẫn đảm bảo đầy đủ.

GIÁ TOUR ĐÃ BAO GỒM:
- Lưu trú: Khách sạn 2 tiêu chuẩn.
- Ăn uống: Ăn sáng: Tô ly.
Ăn chính theo chương trình, phục vụ tại nhà hàng. 
(2 buổi sáng + 4 buổi ăn chính).
- Tham quan: Vé tham quan các điểm du lịch.', N'https://hatinhtoplist.vn/wp-content/uploads/2022/10/Danh-lam-thang-canh-tai-Ha-Tinh-2.jpg', 1000000.0000, 1, 1)
INSERT [dbo].[Tour] ([Tour_ID], [StartDate], [EndDate], [City_ID], [NumberPeople], [Content], [IMG], [TotalPrice], [isDelete], [Type_ID]) VALUES (9, CAST(N'2023-06-10' AS Date), CAST(N'2023-09-10' AS Date), 5, 12, N'23232323232', N'https://cdn3.dhht.vn/wp-content/uploads/2021/07/1-15-danh-lam-thang-canh-viet-nam-noi-tieng-nhat-tren-the-gioi.jpg', 123.0000, 1, 1)
INSERT [dbo].[Tour] ([Tour_ID], [StartDate], [EndDate], [City_ID], [NumberPeople], [Content], [IMG], [TotalPrice], [isDelete], [Type_ID]) VALUES (10, CAST(N'2023-06-10' AS Date), CAST(N'2023-09-10' AS Date), 2, 10, N'hahahha', N'https://res.klook.com/images/fl_lossy.progressive,q_65/c_fill,w_1295,h_861/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/zfpefwkhitsaa534rcn7/TourThamQuanB%E1%BA%A3oT%C3%A0ngQuangTrung-T%C3%A2yS%C6%A1nH%C3%A0oKi%E1%BB%87t,KhuDuL%E1%BB%8BchSinhTh%C3%A1iH%E1%BA%A7mH%C3%B4t%E1%BA%A1iQuyNh%C6%A1n.webp', 5000000.0000, 0, 3)
INSERT [dbo].[Tour] ([Tour_ID], [StartDate], [EndDate], [City_ID], [NumberPeople], [Content], [IMG], [TotalPrice], [isDelete], [Type_ID]) VALUES (12, CAST(N'2023-07-10' AS Date), CAST(N'2023-10-10' AS Date), 8, 7, N'Pho co Hoi An xinh dep ngat long nguoi', N'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2017/08/hoi-an-quang-nam-vntrip-1.jpg', 1500000.0000, 0, 3)
INSERT [dbo].[Tour] ([Tour_ID], [StartDate], [EndDate], [City_ID], [NumberPeople], [Content], [IMG], [TotalPrice], [isDelete], [Type_ID]) VALUES (1012, CAST(N'1900-01-01' AS Date), CAST(N'1900-01-01' AS Date), 2, 56, N'THÔNG TIN TOUR: Vũng Tàu - Ngày Nắng Hạ 2N1Đ

 Đêm 01: CẦN THƠ  – VŨNG TÀU
21h30: Xe và HDV đón đoàn tại điểm hẹn, sau đó khởi hành đến thành phố Vũng Tàu.

 Ngày 01: KHÁM PHÁ THÀNH PHỐ BIỂN - Ăn: S, T, C
Sáng 07h00: Vũng Tàu Quý khách dùng điểm tâm sáng. Sau đó xe và HDV sẽ đưa các bạn tham quan:
img
- Tượng chúa Kitô – là một trong những địa điểm tham quan Vũng Tàu nổi tiếng, không thể thiếu trong hành trình của du khách khi du lịch Vũng Tàu, bởi cảm giác chinh phục đầy thú vị tại phố biển sôi động này. Tại đây quý khách sẽ ngấm được toàn cảnh Thành phố Vũng Tàu.
- Đoàn di chuyển đến thành phố biển Vũng Tàu. Tiếp tục tham quan Chùa Hộ Pháp - Chùa Thích Ca Phật Đài - Là một địa điểm tín ngưỡng nổi tiếng là nới cúng viếng của nhiều phật tử trong ngoài nước, nằm trong một quần thể thánh tích kiến trúc phật giáo đồ sộ quy mô rộng lớn của hệ Phật Giáo nguyên thủy Theravada có nguồn gốc từ Ấn Độ.

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, về khách sạn nhận phòng nghỉ ngơi.
14h30: Quý khách tự do tắm biển và thưởng thức hải sản. tại đây quý khách thoả sức bơi lội bỏ qua sự mệt mỏi thường ngày tận hưởng những cơn gió biển nắng chiều.     

Chiều 17h00: Đoàn ăn tối. tôi quý khách tự do dạo phố biển về đềm thưởng thức hải sản tươi ngon nơi đây.    
img
 Ngày 2: VŨNG TÀU – CẦN THƠ - Ăn: S, T, C
Sáng 06h30: Đoàn dùng điểm tâm sáng, làm thủ tục trả phòng. Sau đó xe sẽ đưa đoàn dạo quanh con đường biển. Đoàn dừng chân đến với:

- Bến du thuyền Marina - Đến đây du khách sẽ được chu du trên những chiếc cano, lướt cùng sóng biển bằng thuyền buồm, tham quan, ngắm cảnh trên sông Dinh, tìm hiểu về cuộc sống của các ngư dân trên bè nổi, tham gia các hoạt động gắn liền với sông nước.(Chi phí đi canon tự túc)     

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, Sau đó xe và HDV đưa quý khách về lại Cần Thơ.
Trên đường về đoàn dừng chân mua sấm hải sản quà tặng lưu niệm thành phố biển.
Đến Long Thành đoàn dừng chân, sau đó về Tiền Giang ăn chiều.     

Chiều 17h30: Đoàn ăn chiều. Kết thúc chương trình xe và HDV Du lịch Thiên Nhiên đưa quý khách về điểm đón ban đầu. HDV chào tạm biệt gửi lời cám ơn đến đoàn và hẹn gặp lại.    
img
Tùy theo điều kiện thực tế mà chương trình tham quan có thể thay đổi cho phù hợp, tuy nhiên tổng số điểm tham quan vẫn đảm bảo đầy đủ.

GIÁ TOUR ĐÃ BAO GỒM:
- Lưu trú: Khách sạn 2 tiêu chuẩn.
- Ăn uống: Ăn sáng: Tô ly.
Ăn chính theo chương trình, phục vụ tại nhà hàng. 
(2 buổi sáng + 4 buổi ăn chính).
- Tham quan: Vé tham quan các điểm du lịch.', N'https://www.vietnambooking.com/wp-content/uploads/2016/08/du-lich-binh-thuan-19-9-2017.jpg', 1200000.0000, 0, 1)
INSERT [dbo].[Tour] ([Tour_ID], [StartDate], [EndDate], [City_ID], [NumberPeople], [Content], [IMG], [TotalPrice], [isDelete], [Type_ID]) VALUES (1013, CAST(N'2023-07-10' AS Date), CAST(N'2023-10-10' AS Date), 23, 24, N'THÔNG TIN TOUR: Vũng Tàu - Ngày Nắng Hạ 2N1Đ

 Đêm 01: CẦN THƠ  – VŨNG TÀU
21h30: Xe và HDV đón đoàn tại điểm hẹn, sau đó khởi hành đến thành phố Vũng Tàu.

 Ngày 01: KHÁM PHÁ THÀNH PHỐ BIỂN - Ăn: S, T, C
Sáng 07h00: Vũng Tàu Quý khách dùng điểm tâm sáng. Sau đó xe và HDV sẽ đưa các bạn tham quan:
img
- Tượng chúa Kitô – là một trong những địa điểm tham quan Vũng Tàu nổi tiếng, không thể thiếu trong hành trình của du khách khi du lịch Vũng Tàu, bởi cảm giác chinh phục đầy thú vị tại phố biển sôi động này. Tại đây quý khách sẽ ngấm được toàn cảnh Thành phố Vũng Tàu.
- Đoàn di chuyển đến thành phố biển Vũng Tàu. Tiếp tục tham quan Chùa Hộ Pháp - Chùa Thích Ca Phật Đài - Là một địa điểm tín ngưỡng nổi tiếng là nới cúng viếng của nhiều phật tử trong ngoài nước, nằm trong một quần thể thánh tích kiến trúc phật giáo đồ sộ quy mô rộng lớn của hệ Phật Giáo nguyên thủy Theravada có nguồn gốc từ Ấn Độ.

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, về khách sạn nhận phòng nghỉ ngơi.
14h30: Quý khách tự do tắm biển và thưởng thức hải sản. tại đây quý khách thoả sức bơi lội bỏ qua sự mệt mỏi thường ngày tận hưởng những cơn gió biển nắng chiều.     

Chiều 17h00: Đoàn ăn tối. tôi quý khách tự do dạo phố biển về đềm thưởng thức hải sản tươi ngon nơi đây.    
img
 Ngày 2: VŨNG TÀU – CẦN THƠ - Ăn: S, T, C
Sáng 06h30: Đoàn dùng điểm tâm sáng, làm thủ tục trả phòng. Sau đó xe sẽ đưa đoàn dạo quanh con đường biển. Đoàn dừng chân đến với:

- Bến du thuyền Marina - Đến đây du khách sẽ được chu du trên những chiếc cano, lướt cùng sóng biển bằng thuyền buồm, tham quan, ngắm cảnh trên sông Dinh, tìm hiểu về cuộc sống của các ngư dân trên bè nổi, tham gia các hoạt động gắn liền với sông nước.(Chi phí đi canon tự túc)     

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, Sau đó xe và HDV đưa quý khách về lại Cần Thơ.
Trên đường về đoàn dừng chân mua sấm hải sản quà tặng lưu niệm thành phố biển.
Đến Long Thành đoàn dừng chân, sau đó về Tiền Giang ăn chiều.     

Chiều 17h30: Đoàn ăn chiều. Kết thúc chương trình xe và HDV Du lịch Thiên Nhiên đưa quý khách về điểm đón ban đầu. HDV chào tạm biệt gửi lời cám ơn đến đoàn và hẹn gặp lại.    
img
Tùy theo điều kiện thực tế mà chương trình tham quan có thể thay đổi cho phù hợp, tuy nhiên tổng số điểm tham quan vẫn đảm bảo đầy đủ.

GIÁ TOUR ĐÃ BAO GỒM:
- Lưu trú: Khách sạn 2 tiêu chuẩn.
- Ăn uống: Ăn sáng: Tô ly.
Ăn chính theo chương trình, phục vụ tại nhà hàng. 
(2 buổi sáng + 4 buổi ăn chính).
- Tham quan: Vé tham quan các điểm du lịch.', N'https://i.ex-cdn.com/vntravellive.com/files/news/2022/05/04/binh-thuan-dang-cai-nam-du-lich-quoc-gia-2023-105147.jpg', 1800000.0000, 0, 1)
INSERT [dbo].[Tour] ([Tour_ID], [StartDate], [EndDate], [City_ID], [NumberPeople], [Content], [IMG], [TotalPrice], [isDelete], [Type_ID]) VALUES (1014, CAST(N'2023-07-10' AS Date), CAST(N'2023-10-10' AS Date), 54, 24, N'THÔNG TIN TOUR: Vũng Tàu - Ngày Nắng Hạ 2N1Đ

 Đêm 01: CẦN THƠ  – VŨNG TÀU
21h30: Xe và HDV đón đoàn tại điểm hẹn, sau đó khởi hành đến thành phố Vũng Tàu.

 Ngày 01: KHÁM PHÁ THÀNH PHỐ BIỂN - Ăn: S, T, C
Sáng 07h00: Vũng Tàu Quý khách dùng điểm tâm sáng. Sau đó xe và HDV sẽ đưa các bạn tham quan:
img
- Tượng chúa Kitô – là một trong những địa điểm tham quan Vũng Tàu nổi tiếng, không thể thiếu trong hành trình của du khách khi du lịch Vũng Tàu, bởi cảm giác chinh phục đầy thú vị tại phố biển sôi động này. Tại đây quý khách sẽ ngấm được toàn cảnh Thành phố Vũng Tàu.
- Đoàn di chuyển đến thành phố biển Vũng Tàu. Tiếp tục tham quan Chùa Hộ Pháp - Chùa Thích Ca Phật Đài - Là một địa điểm tín ngưỡng nổi tiếng là nới cúng viếng của nhiều phật tử trong ngoài nước, nằm trong một quần thể thánh tích kiến trúc phật giáo đồ sộ quy mô rộng lớn của hệ Phật Giáo nguyên thủy Theravada có nguồn gốc từ Ấn Độ.

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, về khách sạn nhận phòng nghỉ ngơi.
14h30: Quý khách tự do tắm biển và thưởng thức hải sản. tại đây quý khách thoả sức bơi lội bỏ qua sự mệt mỏi thường ngày tận hưởng những cơn gió biển nắng chiều.     

Chiều 17h00: Đoàn ăn tối. tôi quý khách tự do dạo phố biển về đềm thưởng thức hải sản tươi ngon nơi đây.    
img
 Ngày 2: VŨNG TÀU – CẦN THƠ - Ăn: S, T, C
Sáng 06h30: Đoàn dùng điểm tâm sáng, làm thủ tục trả phòng. Sau đó xe sẽ đưa đoàn dạo quanh con đường biển. Đoàn dừng chân đến với:

- Bến du thuyền Marina - Đến đây du khách sẽ được chu du trên những chiếc cano, lướt cùng sóng biển bằng thuyền buồm, tham quan, ngắm cảnh trên sông Dinh, tìm hiểu về cuộc sống của các ngư dân trên bè nổi, tham gia các hoạt động gắn liền với sông nước.(Chi phí đi canon tự túc)     

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, Sau đó xe và HDV đưa quý khách về lại Cần Thơ.
Trên đường về đoàn dừng chân mua sấm hải sản quà tặng lưu niệm thành phố biển.
Đến Long Thành đoàn dừng chân, sau đó về Tiền Giang ăn chiều.     

Chiều 17h30: Đoàn ăn chiều. Kết thúc chương trình xe và HDV Du lịch Thiên Nhiên đưa quý khách về điểm đón ban đầu. HDV chào tạm biệt gửi lời cám ơn đến đoàn và hẹn gặp lại.    
img
Tùy theo điều kiện thực tế mà chương trình tham quan có thể thay đổi cho phù hợp, tuy nhiên tổng số điểm tham quan vẫn đảm bảo đầy đủ.

GIÁ TOUR ĐÃ BAO GỒM:
- Lưu trú: Khách sạn 2 tiêu chuẩn.
- Ăn uống: Ăn sáng: Tô ly.
Ăn chính theo chương trình, phục vụ tại nhà hàng. 
(2 buổi sáng + 4 buổi ăn chính).
- Tham quan: Vé tham quan các điểm du lịch.', N'https://media.baoquangninh.vn/dataimages/201809/original/images1098138_vinh_ha_long.jpg', 1900000.0000, 0, 2)
INSERT [dbo].[Tour] ([Tour_ID], [StartDate], [EndDate], [City_ID], [NumberPeople], [Content], [IMG], [TotalPrice], [isDelete], [Type_ID]) VALUES (1015, CAST(N'2023-07-10' AS Date), CAST(N'2023-10-10' AS Date), 45, 24, N'THÔNG TIN TOUR: Vũng Tàu - Ngày Nắng Hạ 2N1Đ

 Đêm 01: CẦN THƠ  – VŨNG TÀU
21h30: Xe và HDV đón đoàn tại điểm hẹn, sau đó khởi hành đến thành phố Vũng Tàu.

 Ngày 01: KHÁM PHÁ THÀNH PHỐ BIỂN - Ăn: S, T, C
Sáng 07h00: Vũng Tàu Quý khách dùng điểm tâm sáng. Sau đó xe và HDV sẽ đưa các bạn tham quan:
img
- Tượng chúa Kitô – là một trong những địa điểm tham quan Vũng Tàu nổi tiếng, không thể thiếu trong hành trình của du khách khi du lịch Vũng Tàu, bởi cảm giác chinh phục đầy thú vị tại phố biển sôi động này. Tại đây quý khách sẽ ngấm được toàn cảnh Thành phố Vũng Tàu.
- Đoàn di chuyển đến thành phố biển Vũng Tàu. Tiếp tục tham quan Chùa Hộ Pháp - Chùa Thích Ca Phật Đài - Là một địa điểm tín ngưỡng nổi tiếng là nới cúng viếng của nhiều phật tử trong ngoài nước, nằm trong một quần thể thánh tích kiến trúc phật giáo đồ sộ quy mô rộng lớn của hệ Phật Giáo nguyên thủy Theravada có nguồn gốc từ Ấn Độ.

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, về khách sạn nhận phòng nghỉ ngơi.
14h30: Quý khách tự do tắm biển và thưởng thức hải sản. tại đây quý khách thoả sức bơi lội bỏ qua sự mệt mỏi thường ngày tận hưởng những cơn gió biển nắng chiều.     

Chiều 17h00: Đoàn ăn tối. tôi quý khách tự do dạo phố biển về đềm thưởng thức hải sản tươi ngon nơi đây.    
img
 Ngày 2: VŨNG TÀU – CẦN THƠ - Ăn: S, T, C
Sáng 06h30: Đoàn dùng điểm tâm sáng, làm thủ tục trả phòng. Sau đó xe sẽ đưa đoàn dạo quanh con đường biển. Đoàn dừng chân đến với:

- Bến du thuyền Marina - Đến đây du khách sẽ được chu du trên những chiếc cano, lướt cùng sóng biển bằng thuyền buồm, tham quan, ngắm cảnh trên sông Dinh, tìm hiểu về cuộc sống của các ngư dân trên bè nổi, tham gia các hoạt động gắn liền với sông nước.(Chi phí đi canon tự túc)     

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, Sau đó xe và HDV đưa quý khách về lại Cần Thơ.
Trên đường về đoàn dừng chân mua sấm hải sản quà tặng lưu niệm thành phố biển.
Đến Long Thành đoàn dừng chân, sau đó về Tiền Giang ăn chiều.     

Chiều 17h30: Đoàn ăn chiều. Kết thúc chương trình xe và HDV Du lịch Thiên Nhiên đưa quý khách về điểm đón ban đầu. HDV chào tạm biệt gửi lời cám ơn đến đoàn và hẹn gặp lại.    
img
Tùy theo điều kiện thực tế mà chương trình tham quan có thể thay đổi cho phù hợp, tuy nhiên tổng số điểm tham quan vẫn đảm bảo đầy đủ.

GIÁ TOUR ĐÃ BAO GỒM:
- Lưu trú: Khách sạn 2 tiêu chuẩn.
- Ăn uống: Ăn sáng: Tô ly.
Ăn chính theo chương trình, phục vụ tại nhà hàng. 
(2 buổi sáng + 4 buổi ăn chính).
- Tham quan: Vé tham quan các điểm du lịch.', N'https://cdn3.dhht.vn/wp-content/uploads/2021/07/anh-bia-15-danh-lam-thang-canh-viet-nam-noi-tieng-nhat-tren-the-gioi.jpg', 1600000.0000, 0, 1)
INSERT [dbo].[Tour] ([Tour_ID], [StartDate], [EndDate], [City_ID], [NumberPeople], [Content], [IMG], [TotalPrice], [isDelete], [Type_ID]) VALUES (1016, CAST(N'2023-07-10' AS Date), CAST(N'2023-10-10' AS Date), 43, 24, N'THÔNG TIN TOUR: Vũng Tàu - Ngày Nắng Hạ 2N1Đ

 Đêm 01: CẦN THƠ  – VŨNG TÀU
21h30: Xe và HDV đón đoàn tại điểm hẹn, sau đó khởi hành đến thành phố Vũng Tàu.

 Ngày 01: KHÁM PHÁ THÀNH PHỐ BIỂN - Ăn: S, T, C
Sáng 07h00: Vũng Tàu Quý khách dùng điểm tâm sáng. Sau đó xe và HDV sẽ đưa các bạn tham quan:
img
- Tượng chúa Kitô – là một trong những địa điểm tham quan Vũng Tàu nổi tiếng, không thể thiếu trong hành trình của du khách khi du lịch Vũng Tàu, bởi cảm giác chinh phục đầy thú vị tại phố biển sôi động này. Tại đây quý khách sẽ ngấm được toàn cảnh Thành phố Vũng Tàu.
- Đoàn di chuyển đến thành phố biển Vũng Tàu. Tiếp tục tham quan Chùa Hộ Pháp - Chùa Thích Ca Phật Đài - Là một địa điểm tín ngưỡng nổi tiếng là nới cúng viếng của nhiều phật tử trong ngoài nước, nằm trong một quần thể thánh tích kiến trúc phật giáo đồ sộ quy mô rộng lớn của hệ Phật Giáo nguyên thủy Theravada có nguồn gốc từ Ấn Độ.

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, về khách sạn nhận phòng nghỉ ngơi.
14h30: Quý khách tự do tắm biển và thưởng thức hải sản. tại đây quý khách thoả sức bơi lội bỏ qua sự mệt mỏi thường ngày tận hưởng những cơn gió biển nắng chiều.     

Chiều 17h00: Đoàn ăn tối. tôi quý khách tự do dạo phố biển về đềm thưởng thức hải sản tươi ngon nơi đây.    
img
 Ngày 2: VŨNG TÀU – CẦN THƠ - Ăn: S, T, C
Sáng 06h30: Đoàn dùng điểm tâm sáng, làm thủ tục trả phòng. Sau đó xe sẽ đưa đoàn dạo quanh con đường biển. Đoàn dừng chân đến với:

- Bến du thuyền Marina - Đến đây du khách sẽ được chu du trên những chiếc cano, lướt cùng sóng biển bằng thuyền buồm, tham quan, ngắm cảnh trên sông Dinh, tìm hiểu về cuộc sống của các ngư dân trên bè nổi, tham gia các hoạt động gắn liền với sông nước.(Chi phí đi canon tự túc)     

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, Sau đó xe và HDV đưa quý khách về lại Cần Thơ.
Trên đường về đoàn dừng chân mua sấm hải sản quà tặng lưu niệm thành phố biển.
Đến Long Thành đoàn dừng chân, sau đó về Tiền Giang ăn chiều.     

Chiều 17h30: Đoàn ăn chiều. Kết thúc chương trình xe và HDV Du lịch Thiên Nhiên đưa quý khách về điểm đón ban đầu. HDV chào tạm biệt gửi lời cám ơn đến đoàn và hẹn gặp lại.    
img
Tùy theo điều kiện thực tế mà chương trình tham quan có thể thay đổi cho phù hợp, tuy nhiên tổng số điểm tham quan vẫn đảm bảo đầy đủ.

GIÁ TOUR ĐÃ BAO GỒM:
- Lưu trú: Khách sạn 2 tiêu chuẩn.
- Ăn uống: Ăn sáng: Tô ly.
Ăn chính theo chương trình, phục vụ tại nhà hàng. 
(2 buổi sáng + 4 buổi ăn chính).
- Tham quan: Vé tham quan các điểm du lịch.', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh66S3jp4jYIx5ok-5QtgctPUc5v0vxip2S7VJEE8s2hjoyqC9wr6nR-Hail_h4KB-Z0c&usqp=CAU', 2400000.0000, 0, 2)
INSERT [dbo].[Tour] ([Tour_ID], [StartDate], [EndDate], [City_ID], [NumberPeople], [Content], [IMG], [TotalPrice], [isDelete], [Type_ID]) VALUES (1017, CAST(N'2023-07-10' AS Date), CAST(N'2023-10-10' AS Date), 7, 30, N'THÔNG TIN TOUR: Vũng Tàu - Ngày Nắng Hạ 2N1Đ

 Đêm 01: CẦN THƠ  – VŨNG TÀU
21h30: Xe và HDV đón đoàn tại điểm hẹn, sau đó khởi hành đến thành phố Vũng Tàu.

 Ngày 01: KHÁM PHÁ THÀNH PHỐ BIỂN - Ăn: S, T, C
Sáng 07h00: Vũng Tàu Quý khách dùng điểm tâm sáng. Sau đó xe và HDV sẽ đưa các bạn tham quan:
img
- Tượng chúa Kitô – là một trong những địa điểm tham quan Vũng Tàu nổi tiếng, không thể thiếu trong hành trình của du khách khi du lịch Vũng Tàu, bởi cảm giác chinh phục đầy thú vị tại phố biển sôi động này. Tại đây quý khách sẽ ngấm được toàn cảnh Thành phố Vũng Tàu.
- Đoàn di chuyển đến thành phố biển Vũng Tàu. Tiếp tục tham quan Chùa Hộ Pháp - Chùa Thích Ca Phật Đài - Là một địa điểm tín ngưỡng nổi tiếng là nới cúng viếng của nhiều phật tử trong ngoài nước, nằm trong một quần thể thánh tích kiến trúc phật giáo đồ sộ quy mô rộng lớn của hệ Phật Giáo nguyên thủy Theravada có nguồn gốc từ Ấn Độ.

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, về khách sạn nhận phòng nghỉ ngơi.
14h30: Quý khách tự do tắm biển và thưởng thức hải sản. tại đây quý khách thoả sức bơi lội bỏ qua sự mệt mỏi thường ngày tận hưởng những cơn gió biển nắng chiều.     

Chiều 17h00: Đoàn ăn tối. tôi quý khách tự do dạo phố biển về đềm thưởng thức hải sản tươi ngon nơi đây.    
img
 Ngày 2: VŨNG TÀU – CẦN THƠ - Ăn: S, T, C
Sáng 06h30: Đoàn dùng điểm tâm sáng, làm thủ tục trả phòng. Sau đó xe sẽ đưa đoàn dạo quanh con đường biển. Đoàn dừng chân đến với:

- Bến du thuyền Marina - Đến đây du khách sẽ được chu du trên những chiếc cano, lướt cùng sóng biển bằng thuyền buồm, tham quan, ngắm cảnh trên sông Dinh, tìm hiểu về cuộc sống của các ngư dân trên bè nổi, tham gia các hoạt động gắn liền với sông nước.(Chi phí đi canon tự túc)     

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, Sau đó xe và HDV đưa quý khách về lại Cần Thơ.
Trên đường về đoàn dừng chân mua sấm hải sản quà tặng lưu niệm thành phố biển.
Đến Long Thành đoàn dừng chân, sau đó về Tiền Giang ăn chiều.     

Chiều 17h30: Đoàn ăn chiều. Kết thúc chương trình xe và HDV Du lịch Thiên Nhiên đưa quý khách về điểm đón ban đầu. HDV chào tạm biệt gửi lời cám ơn đến đoàn và hẹn gặp lại.    
img
Tùy theo điều kiện thực tế mà chương trình tham quan có thể thay đổi cho phù hợp, tuy nhiên tổng số điểm tham quan vẫn đảm bảo đầy đủ.

GIÁ TOUR ĐÃ BAO GỒM:
- Lưu trú: Khách sạn 2 tiêu chuẩn.
- Ăn uống: Ăn sáng: Tô ly.
Ăn chính theo chương trình, phục vụ tại nhà hàng. 
(2 buổi sáng + 4 buổi ăn chính).
- Tham quan: Vé tham quan các điểm du lịch.', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGxzynfAVV8YKR8AEag09bG_KPdx4DlWpp4JcKz1rZHtDdIAlJnSEZ8As_NKdSfiP6Tq8&usqp=CAU', 700000.0000, 0, 3)
INSERT [dbo].[Tour] ([Tour_ID], [StartDate], [EndDate], [City_ID], [NumberPeople], [Content], [IMG], [TotalPrice], [isDelete], [Type_ID]) VALUES (1018, CAST(N'2023-07-10' AS Date), CAST(N'2023-10-10' AS Date), 63, 26, N'THÔNG TIN TOUR: Vũng Tàu - Ngày Nắng Hạ 2N1Đ

 Đêm 01: CẦN THƠ  – VŨNG TÀU
21h30: Xe và HDV đón đoàn tại điểm hẹn, sau đó khởi hành đến thành phố Vũng Tàu.

 Ngày 01: KHÁM PHÁ THÀNH PHỐ BIỂN - Ăn: S, T, C
Sáng 07h00: Vũng Tàu Quý khách dùng điểm tâm sáng. Sau đó xe và HDV sẽ đưa các bạn tham quan:
img
- Tượng chúa Kitô – là một trong những địa điểm tham quan Vũng Tàu nổi tiếng, không thể thiếu trong hành trình của du khách khi du lịch Vũng Tàu, bởi cảm giác chinh phục đầy thú vị tại phố biển sôi động này. Tại đây quý khách sẽ ngấm được toàn cảnh Thành phố Vũng Tàu.
- Đoàn di chuyển đến thành phố biển Vũng Tàu. Tiếp tục tham quan Chùa Hộ Pháp - Chùa Thích Ca Phật Đài - Là một địa điểm tín ngưỡng nổi tiếng là nới cúng viếng của nhiều phật tử trong ngoài nước, nằm trong một quần thể thánh tích kiến trúc phật giáo đồ sộ quy mô rộng lớn của hệ Phật Giáo nguyên thủy Theravada có nguồn gốc từ Ấn Độ.

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, về khách sạn nhận phòng nghỉ ngơi.
14h30: Quý khách tự do tắm biển và thưởng thức hải sản. tại đây quý khách thoả sức bơi lội bỏ qua sự mệt mỏi thường ngày tận hưởng những cơn gió biển nắng chiều.     

Chiều 17h00: Đoàn ăn tối. tôi quý khách tự do dạo phố biển về đềm thưởng thức hải sản tươi ngon nơi đây.    
img
 Ngày 2: VŨNG TÀU – CẦN THƠ - Ăn: S, T, C
Sáng 06h30: Đoàn dùng điểm tâm sáng, làm thủ tục trả phòng. Sau đó xe sẽ đưa đoàn dạo quanh con đường biển. Đoàn dừng chân đến với:

- Bến du thuyền Marina - Đến đây du khách sẽ được chu du trên những chiếc cano, lướt cùng sóng biển bằng thuyền buồm, tham quan, ngắm cảnh trên sông Dinh, tìm hiểu về cuộc sống của các ngư dân trên bè nổi, tham gia các hoạt động gắn liền với sông nước.(Chi phí đi canon tự túc)     

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, Sau đó xe và HDV đưa quý khách về lại Cần Thơ.
Trên đường về đoàn dừng chân mua sấm hải sản quà tặng lưu niệm thành phố biển.
Đến Long Thành đoàn dừng chân, sau đó về Tiền Giang ăn chiều.     

Chiều 17h30: Đoàn ăn chiều. Kết thúc chương trình xe và HDV Du lịch Thiên Nhiên đưa quý khách về điểm đón ban đầu. HDV chào tạm biệt gửi lời cám ơn đến đoàn và hẹn gặp lại.    
img
Tùy theo điều kiện thực tế mà chương trình tham quan có thể thay đổi cho phù hợp, tuy nhiên tổng số điểm tham quan vẫn đảm bảo đầy đủ.

GIÁ TOUR ĐÃ BAO GỒM:
- Lưu trú: Khách sạn 2 tiêu chuẩn.
- Ăn uống: Ăn sáng: Tô ly.
Ăn chính theo chương trình, phục vụ tại nhà hàng. 
(2 buổi sáng + 4 buổi ăn chính).
- Tham quan: Vé tham quan các điểm du lịch.', N'https://mcdn.coolmate.me/uploads/January2022/danh-lam-thang-canh-Viet-nam-2.jpg', 1200000.0000, 0, 1)
INSERT [dbo].[Tour] ([Tour_ID], [StartDate], [EndDate], [City_ID], [NumberPeople], [Content], [IMG], [TotalPrice], [isDelete], [Type_ID]) VALUES (1019, CAST(N'2023-07-10' AS Date), CAST(N'2023-10-10' AS Date), 21, 24, N'THÔNG TIN TOUR: Vũng Tàu - Ngày Nắng Hạ 2N1Đ

 Đêm 01: CẦN THƠ  – VŨNG TÀU
21h30: Xe và HDV đón đoàn tại điểm hẹn, sau đó khởi hành đến thành phố Vũng Tàu.

 Ngày 01: KHÁM PHÁ THÀNH PHỐ BIỂN - Ăn: S, T, C
Sáng 07h00: Vũng Tàu Quý khách dùng điểm tâm sáng. Sau đó xe và HDV sẽ đưa các bạn tham quan:
img
- Tượng chúa Kitô – là một trong những địa điểm tham quan Vũng Tàu nổi tiếng, không thể thiếu trong hành trình của du khách khi du lịch Vũng Tàu, bởi cảm giác chinh phục đầy thú vị tại phố biển sôi động này. Tại đây quý khách sẽ ngấm được toàn cảnh Thành phố Vũng Tàu.
- Đoàn di chuyển đến thành phố biển Vũng Tàu. Tiếp tục tham quan Chùa Hộ Pháp - Chùa Thích Ca Phật Đài - Là một địa điểm tín ngưỡng nổi tiếng là nới cúng viếng của nhiều phật tử trong ngoài nước, nằm trong một quần thể thánh tích kiến trúc phật giáo đồ sộ quy mô rộng lớn của hệ Phật Giáo nguyên thủy Theravada có nguồn gốc từ Ấn Độ.

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, về khách sạn nhận phòng nghỉ ngơi.
14h30: Quý khách tự do tắm biển và thưởng thức hải sản. tại đây quý khách thoả sức bơi lội bỏ qua sự mệt mỏi thường ngày tận hưởng những cơn gió biển nắng chiều.     

Chiều 17h00: Đoàn ăn tối. tôi quý khách tự do dạo phố biển về đềm thưởng thức hải sản tươi ngon nơi đây.    
img
 Ngày 2: VŨNG TÀU – CẦN THƠ - Ăn: S, T, C
Sáng 06h30: Đoàn dùng điểm tâm sáng, làm thủ tục trả phòng. Sau đó xe sẽ đưa đoàn dạo quanh con đường biển. Đoàn dừng chân đến với:

- Bến du thuyền Marina - Đến đây du khách sẽ được chu du trên những chiếc cano, lướt cùng sóng biển bằng thuyền buồm, tham quan, ngắm cảnh trên sông Dinh, tìm hiểu về cuộc sống của các ngư dân trên bè nổi, tham gia các hoạt động gắn liền với sông nước.(Chi phí đi canon tự túc)     

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, Sau đó xe và HDV đưa quý khách về lại Cần Thơ.
Trên đường về đoàn dừng chân mua sấm hải sản quà tặng lưu niệm thành phố biển.
Đến Long Thành đoàn dừng chân, sau đó về Tiền Giang ăn chiều.     

Chiều 17h30: Đoàn ăn chiều. Kết thúc chương trình xe và HDV Du lịch Thiên Nhiên đưa quý khách về điểm đón ban đầu. HDV chào tạm biệt gửi lời cám ơn đến đoàn và hẹn gặp lại.    
img
Tùy theo điều kiện thực tế mà chương trình tham quan có thể thay đổi cho phù hợp, tuy nhiên tổng số điểm tham quan vẫn đảm bảo đầy đủ.

GIÁ TOUR ĐÃ BAO GỒM:
- Lưu trú: Khách sạn 2 tiêu chuẩn.
- Ăn uống: Ăn sáng: Tô ly.
Ăn chính theo chương trình, phục vụ tại nhà hàng. 
(2 buổi sáng + 4 buổi ăn chính).
- Tham quan: Vé tham quan các điểm du lịch.', N'https://media.baoquangninh.vn/dataimages/201809/original/images1098139_top_7.jpg', 2700000.0000, 0, 3)
INSERT [dbo].[Tour] ([Tour_ID], [StartDate], [EndDate], [City_ID], [NumberPeople], [Content], [IMG], [TotalPrice], [isDelete], [Type_ID]) VALUES (1020, CAST(N'2023-07-10' AS Date), CAST(N'2023-10-10' AS Date), 43, 12, N'THÔNG TIN TOUR: Vũng Tàu - Ngày Nắng Hạ 2N1Đ

 Đêm 01: CẦN THƠ  – VŨNG TÀU
21h30: Xe và HDV đón đoàn tại điểm hẹn, sau đó khởi hành đến thành phố Vũng Tàu.

 Ngày 01: KHÁM PHÁ THÀNH PHỐ BIỂN - Ăn: S, T, C
Sáng 07h00: Vũng Tàu Quý khách dùng điểm tâm sáng. Sau đó xe và HDV sẽ đưa các bạn tham quan:
img
- Tượng chúa Kitô – là một trong những địa điểm tham quan Vũng Tàu nổi tiếng, không thể thiếu trong hành trình của du khách khi du lịch Vũng Tàu, bởi cảm giác chinh phục đầy thú vị tại phố biển sôi động này. Tại đây quý khách sẽ ngấm được toàn cảnh Thành phố Vũng Tàu.
- Đoàn di chuyển đến thành phố biển Vũng Tàu. Tiếp tục tham quan Chùa Hộ Pháp - Chùa Thích Ca Phật Đài - Là một địa điểm tín ngưỡng nổi tiếng là nới cúng viếng của nhiều phật tử trong ngoài nước, nằm trong một quần thể thánh tích kiến trúc phật giáo đồ sộ quy mô rộng lớn của hệ Phật Giáo nguyên thủy Theravada có nguồn gốc từ Ấn Độ.

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, về khách sạn nhận phòng nghỉ ngơi.
14h30: Quý khách tự do tắm biển và thưởng thức hải sản. tại đây quý khách thoả sức bơi lội bỏ qua sự mệt mỏi thường ngày tận hưởng những cơn gió biển nắng chiều.     

Chiều 17h00: Đoàn ăn tối. tôi quý khách tự do dạo phố biển về đềm thưởng thức hải sản tươi ngon nơi đây.    
img
 Ngày 2: VŨNG TÀU – CẦN THƠ - Ăn: S, T, C
Sáng 06h30: Đoàn dùng điểm tâm sáng, làm thủ tục trả phòng. Sau đó xe sẽ đưa đoàn dạo quanh con đường biển. Đoàn dừng chân đến với:

- Bến du thuyền Marina - Đến đây du khách sẽ được chu du trên những chiếc cano, lướt cùng sóng biển bằng thuyền buồm, tham quan, ngắm cảnh trên sông Dinh, tìm hiểu về cuộc sống của các ngư dân trên bè nổi, tham gia các hoạt động gắn liền với sông nước.(Chi phí đi canon tự túc)     

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, Sau đó xe và HDV đưa quý khách về lại Cần Thơ.
Trên đường về đoàn dừng chân mua sấm hải sản quà tặng lưu niệm thành phố biển.
Đến Long Thành đoàn dừng chân, sau đó về Tiền Giang ăn chiều.     

Chiều 17h30: Đoàn ăn chiều. Kết thúc chương trình xe và HDV Du lịch Thiên Nhiên đưa quý khách về điểm đón ban đầu. HDV chào tạm biệt gửi lời cám ơn đến đoàn và hẹn gặp lại.    
img
Tùy theo điều kiện thực tế mà chương trình tham quan có thể thay đổi cho phù hợp, tuy nhiên tổng số điểm tham quan vẫn đảm bảo đầy đủ.

GIÁ TOUR ĐÃ BAO GỒM:
- Lưu trú: Khách sạn 2 tiêu chuẩn.
- Ăn uống: Ăn sáng: Tô ly.
Ăn chính theo chương trình, phục vụ tại nhà hàng. 
(2 buổi sáng + 4 buổi ăn chính).
- Tham quan: Vé tham quan các điểm du lịch.', N'https://ebooks.edu.vn/wp-content/uploads/2019/06/33e0698fa2c94b9712d8.jpg', 1100000.0000, 0, 2)
INSERT [dbo].[Tour] ([Tour_ID], [StartDate], [EndDate], [City_ID], [NumberPeople], [Content], [IMG], [TotalPrice], [isDelete], [Type_ID]) VALUES (1021, CAST(N'2023-07-10' AS Date), CAST(N'2023-10-10' AS Date), 35, 34, N'THÔNG TIN TOUR: Vũng Tàu - Ngày Nắng Hạ 2N1Đ

 Đêm 01: CẦN THƠ  – VŨNG TÀU
21h30: Xe và HDV đón đoàn tại điểm hẹn, sau đó khởi hành đến thành phố Vũng Tàu.

 Ngày 01: KHÁM PHÁ THÀNH PHỐ BIỂN - Ăn: S, T, C
Sáng 07h00: Vũng Tàu Quý khách dùng điểm tâm sáng. Sau đó xe và HDV sẽ đưa các bạn tham quan:
img
- Tượng chúa Kitô – là một trong những địa điểm tham quan Vũng Tàu nổi tiếng, không thể thiếu trong hành trình của du khách khi du lịch Vũng Tàu, bởi cảm giác chinh phục đầy thú vị tại phố biển sôi động này. Tại đây quý khách sẽ ngấm được toàn cảnh Thành phố Vũng Tàu.
- Đoàn di chuyển đến thành phố biển Vũng Tàu. Tiếp tục tham quan Chùa Hộ Pháp - Chùa Thích Ca Phật Đài - Là một địa điểm tín ngưỡng nổi tiếng là nới cúng viếng của nhiều phật tử trong ngoài nước, nằm trong một quần thể thánh tích kiến trúc phật giáo đồ sộ quy mô rộng lớn của hệ Phật Giáo nguyên thủy Theravada có nguồn gốc từ Ấn Độ.

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, về khách sạn nhận phòng nghỉ ngơi.
14h30: Quý khách tự do tắm biển và thưởng thức hải sản. tại đây quý khách thoả sức bơi lội bỏ qua sự mệt mỏi thường ngày tận hưởng những cơn gió biển nắng chiều.     

Chiều 17h00: Đoàn ăn tối. tôi quý khách tự do dạo phố biển về đềm thưởng thức hải sản tươi ngon nơi đây.    
img
 Ngày 2: VŨNG TÀU – CẦN THƠ - Ăn: S, T, C
Sáng 06h30: Đoàn dùng điểm tâm sáng, làm thủ tục trả phòng. Sau đó xe sẽ đưa đoàn dạo quanh con đường biển. Đoàn dừng chân đến với:

- Bến du thuyền Marina - Đến đây du khách sẽ được chu du trên những chiếc cano, lướt cùng sóng biển bằng thuyền buồm, tham quan, ngắm cảnh trên sông Dinh, tìm hiểu về cuộc sống của các ngư dân trên bè nổi, tham gia các hoạt động gắn liền với sông nước.(Chi phí đi canon tự túc)     

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, Sau đó xe và HDV đưa quý khách về lại Cần Thơ.
Trên đường về đoàn dừng chân mua sấm hải sản quà tặng lưu niệm thành phố biển.
Đến Long Thành đoàn dừng chân, sau đó về Tiền Giang ăn chiều.     

Chiều 17h30: Đoàn ăn chiều. Kết thúc chương trình xe và HDV Du lịch Thiên Nhiên đưa quý khách về điểm đón ban đầu. HDV chào tạm biệt gửi lời cám ơn đến đoàn và hẹn gặp lại.    
img
Tùy theo điều kiện thực tế mà chương trình tham quan có thể thay đổi cho phù hợp, tuy nhiên tổng số điểm tham quan vẫn đảm bảo đầy đủ.

GIÁ TOUR ĐÃ BAO GỒM:
- Lưu trú: Khách sạn 2 tiêu chuẩn.
- Ăn uống: Ăn sáng: Tô ly.
Ăn chính theo chương trình, phục vụ tại nhà hàng. 
(2 buổi sáng + 4 buổi ăn chính).
- Tham quan: Vé tham quan các điểm du lịch.', N'https://fridayshopping.vn/wp-content/uploads/2021/11/30-danh-lam-thang-canh-viet-nam-phai-thu-mot-lan-trong-doi-2.jpg', 2500000.0000, 0, 1)
INSERT [dbo].[Tour] ([Tour_ID], [StartDate], [EndDate], [City_ID], [NumberPeople], [Content], [IMG], [TotalPrice], [isDelete], [Type_ID]) VALUES (1022, CAST(N'2023-07-10' AS Date), CAST(N'2023-10-10' AS Date), 49, 26, N'THÔNG TIN TOUR: Vũng Tàu - Ngày Nắng Hạ 2N1Đ

 Đêm 01: CẦN THƠ  – VŨNG TÀU
21h30: Xe và HDV đón đoàn tại điểm hẹn, sau đó khởi hành đến thành phố Vũng Tàu.

 Ngày 01: KHÁM PHÁ THÀNH PHỐ BIỂN - Ăn: S, T, C
Sáng 07h00: Vũng Tàu Quý khách dùng điểm tâm sáng. Sau đó xe và HDV sẽ đưa các bạn tham quan:
img
- Tượng chúa Kitô – là một trong những địa điểm tham quan Vũng Tàu nổi tiếng, không thể thiếu trong hành trình của du khách khi du lịch Vũng Tàu, bởi cảm giác chinh phục đầy thú vị tại phố biển sôi động này. Tại đây quý khách sẽ ngấm được toàn cảnh Thành phố Vũng Tàu.
- Đoàn di chuyển đến thành phố biển Vũng Tàu. Tiếp tục tham quan Chùa Hộ Pháp - Chùa Thích Ca Phật Đài - Là một địa điểm tín ngưỡng nổi tiếng là nới cúng viếng của nhiều phật tử trong ngoài nước, nằm trong một quần thể thánh tích kiến trúc phật giáo đồ sộ quy mô rộng lớn của hệ Phật Giáo nguyên thủy Theravada có nguồn gốc từ Ấn Độ.

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, về khách sạn nhận phòng nghỉ ngơi.
14h30: Quý khách tự do tắm biển và thưởng thức hải sản. tại đây quý khách thoả sức bơi lội bỏ qua sự mệt mỏi thường ngày tận hưởng những cơn gió biển nắng chiều.     

Chiều 17h00: Đoàn ăn tối. tôi quý khách tự do dạo phố biển về đềm thưởng thức hải sản tươi ngon nơi đây.    
img
 Ngày 2: VŨNG TÀU – CẦN THƠ - Ăn: S, T, C
Sáng 06h30: Đoàn dùng điểm tâm sáng, làm thủ tục trả phòng. Sau đó xe sẽ đưa đoàn dạo quanh con đường biển. Đoàn dừng chân đến với:

- Bến du thuyền Marina - Đến đây du khách sẽ được chu du trên những chiếc cano, lướt cùng sóng biển bằng thuyền buồm, tham quan, ngắm cảnh trên sông Dinh, tìm hiểu về cuộc sống của các ngư dân trên bè nổi, tham gia các hoạt động gắn liền với sông nước.(Chi phí đi canon tự túc)     

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, Sau đó xe và HDV đưa quý khách về lại Cần Thơ.
Trên đường về đoàn dừng chân mua sấm hải sản quà tặng lưu niệm thành phố biển.
Đến Long Thành đoàn dừng chân, sau đó về Tiền Giang ăn chiều.     

Chiều 17h30: Đoàn ăn chiều. Kết thúc chương trình xe và HDV Du lịch Thiên Nhiên đưa quý khách về điểm đón ban đầu. HDV chào tạm biệt gửi lời cám ơn đến đoàn và hẹn gặp lại.    
img
Tùy theo điều kiện thực tế mà chương trình tham quan có thể thay đổi cho phù hợp, tuy nhiên tổng số điểm tham quan vẫn đảm bảo đầy đủ.

GIÁ TOUR ĐÃ BAO GỒM:
- Lưu trú: Khách sạn 2 tiêu chuẩn.
- Ăn uống: Ăn sáng: Tô ly.
Ăn chính theo chương trình, phục vụ tại nhà hàng. 
(2 buổi sáng + 4 buổi ăn chính).
- Tham quan: Vé tham quan các điểm du lịch.', N'https://cdn.vuanem.com/blog/wp-content/uploads/2022/03/cac-danh-lam-thang-canh-o-viet-nam.jpg', 2900000.0000, 0, 3)
INSERT [dbo].[Tour] ([Tour_ID], [StartDate], [EndDate], [City_ID], [NumberPeople], [Content], [IMG], [TotalPrice], [isDelete], [Type_ID]) VALUES (1023, CAST(N'2023-07-10' AS Date), CAST(N'2023-10-10' AS Date), 38, 27, N'THÔNG TIN TOUR: Vũng Tàu - Ngày Nắng Hạ 2N1Đ

 Đêm 01: CẦN THƠ  – VŨNG TÀU
21h30: Xe và HDV đón đoàn tại điểm hẹn, sau đó khởi hành đến thành phố Vũng Tàu.

 Ngày 01: KHÁM PHÁ THÀNH PHỐ BIỂN - Ăn: S, T, C
Sáng 07h00: Vũng Tàu Quý khách dùng điểm tâm sáng. Sau đó xe và HDV sẽ đưa các bạn tham quan:
img
- Tượng chúa Kitô – là một trong những địa điểm tham quan Vũng Tàu nổi tiếng, không thể thiếu trong hành trình của du khách khi du lịch Vũng Tàu, bởi cảm giác chinh phục đầy thú vị tại phố biển sôi động này. Tại đây quý khách sẽ ngấm được toàn cảnh Thành phố Vũng Tàu.
- Đoàn di chuyển đến thành phố biển Vũng Tàu. Tiếp tục tham quan Chùa Hộ Pháp - Chùa Thích Ca Phật Đài - Là một địa điểm tín ngưỡng nổi tiếng là nới cúng viếng của nhiều phật tử trong ngoài nước, nằm trong một quần thể thánh tích kiến trúc phật giáo đồ sộ quy mô rộng lớn của hệ Phật Giáo nguyên thủy Theravada có nguồn gốc từ Ấn Độ.

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, về khách sạn nhận phòng nghỉ ngơi.
14h30: Quý khách tự do tắm biển và thưởng thức hải sản. tại đây quý khách thoả sức bơi lội bỏ qua sự mệt mỏi thường ngày tận hưởng những cơn gió biển nắng chiều.     

Chiều 17h00: Đoàn ăn tối. tôi quý khách tự do dạo phố biển về đềm thưởng thức hải sản tươi ngon nơi đây.    
img
 Ngày 2: VŨNG TÀU – CẦN THƠ - Ăn: S, T, C
Sáng 06h30: Đoàn dùng điểm tâm sáng, làm thủ tục trả phòng. Sau đó xe sẽ đưa đoàn dạo quanh con đường biển. Đoàn dừng chân đến với:

- Bến du thuyền Marina - Đến đây du khách sẽ được chu du trên những chiếc cano, lướt cùng sóng biển bằng thuyền buồm, tham quan, ngắm cảnh trên sông Dinh, tìm hiểu về cuộc sống của các ngư dân trên bè nổi, tham gia các hoạt động gắn liền với sông nước.(Chi phí đi canon tự túc)     

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, Sau đó xe và HDV đưa quý khách về lại Cần Thơ.
Trên đường về đoàn dừng chân mua sấm hải sản quà tặng lưu niệm thành phố biển.
Đến Long Thành đoàn dừng chân, sau đó về Tiền Giang ăn chiều.     

Chiều 17h30: Đoàn ăn chiều. Kết thúc chương trình xe và HDV Du lịch Thiên Nhiên đưa quý khách về điểm đón ban đầu. HDV chào tạm biệt gửi lời cám ơn đến đoàn và hẹn gặp lại.    
img
Tùy theo điều kiện thực tế mà chương trình tham quan có thể thay đổi cho phù hợp, tuy nhiên tổng số điểm tham quan vẫn đảm bảo đầy đủ.

GIÁ TOUR ĐÃ BAO GỒM:
- Lưu trú: Khách sạn 2 tiêu chuẩn.
- Ăn uống: Ăn sáng: Tô ly.
Ăn chính theo chương trình, phục vụ tại nhà hàng. 
(2 buổi sáng + 4 buổi ăn chính).
- Tham quan: Vé tham quan các điểm du lịch.', N'https://media2.gody.vn/public/mytravelmap/images/2018/12/18/bintruong22228605/5cebf820a1c6930639da1aa1ae6eb4c3.jpg', 1100000.0000, 0, 3)
INSERT [dbo].[Tour] ([Tour_ID], [StartDate], [EndDate], [City_ID], [NumberPeople], [Content], [IMG], [TotalPrice], [isDelete], [Type_ID]) VALUES (1024, CAST(N'2023-07-10' AS Date), CAST(N'2023-10-10' AS Date), 57, 28, N'THÔNG TIN TOUR: Vũng Tàu - Ngày Nắng Hạ 2N1Đ

 Đêm 01: CẦN THƠ  – VŨNG TÀU
21h30: Xe và HDV đón đoàn tại điểm hẹn, sau đó khởi hành đến thành phố Vũng Tàu.

 Ngày 01: KHÁM PHÁ THÀNH PHỐ BIỂN - Ăn: S, T, C
Sáng 07h00: Vũng Tàu Quý khách dùng điểm tâm sáng. Sau đó xe và HDV sẽ đưa các bạn tham quan:
img
- Tượng chúa Kitô – là một trong những địa điểm tham quan Vũng Tàu nổi tiếng, không thể thiếu trong hành trình của du khách khi du lịch Vũng Tàu, bởi cảm giác chinh phục đầy thú vị tại phố biển sôi động này. Tại đây quý khách sẽ ngấm được toàn cảnh Thành phố Vũng Tàu.
- Đoàn di chuyển đến thành phố biển Vũng Tàu. Tiếp tục tham quan Chùa Hộ Pháp - Chùa Thích Ca Phật Đài - Là một địa điểm tín ngưỡng nổi tiếng là nới cúng viếng của nhiều phật tử trong ngoài nước, nằm trong một quần thể thánh tích kiến trúc phật giáo đồ sộ quy mô rộng lớn của hệ Phật Giáo nguyên thủy Theravada có nguồn gốc từ Ấn Độ.

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, về khách sạn nhận phòng nghỉ ngơi.
14h30: Quý khách tự do tắm biển và thưởng thức hải sản. tại đây quý khách thoả sức bơi lội bỏ qua sự mệt mỏi thường ngày tận hưởng những cơn gió biển nắng chiều.     

Chiều 17h00: Đoàn ăn tối. tôi quý khách tự do dạo phố biển về đềm thưởng thức hải sản tươi ngon nơi đây.    
img
 Ngày 2: VŨNG TÀU – CẦN THƠ - Ăn: S, T, C
Sáng 06h30: Đoàn dùng điểm tâm sáng, làm thủ tục trả phòng. Sau đó xe sẽ đưa đoàn dạo quanh con đường biển. Đoàn dừng chân đến với:

- Bến du thuyền Marina - Đến đây du khách sẽ được chu du trên những chiếc cano, lướt cùng sóng biển bằng thuyền buồm, tham quan, ngắm cảnh trên sông Dinh, tìm hiểu về cuộc sống của các ngư dân trên bè nổi, tham gia các hoạt động gắn liền với sông nước.(Chi phí đi canon tự túc)     

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, Sau đó xe và HDV đưa quý khách về lại Cần Thơ.
Trên đường về đoàn dừng chân mua sấm hải sản quà tặng lưu niệm thành phố biển.
Đến Long Thành đoàn dừng chân, sau đó về Tiền Giang ăn chiều.     

Chiều 17h30: Đoàn ăn chiều. Kết thúc chương trình xe và HDV Du lịch Thiên Nhiên đưa quý khách về điểm đón ban đầu. HDV chào tạm biệt gửi lời cám ơn đến đoàn và hẹn gặp lại.    
img
Tùy theo điều kiện thực tế mà chương trình tham quan có thể thay đổi cho phù hợp, tuy nhiên tổng số điểm tham quan vẫn đảm bảo đầy đủ.

GIÁ TOUR ĐÃ BAO GỒM:
- Lưu trú: Khách sạn 2 tiêu chuẩn.
- Ăn uống: Ăn sáng: Tô ly.
Ăn chính theo chương trình, phục vụ tại nhà hàng. 
(2 buổi sáng + 4 buổi ăn chính).
- Tham quan: Vé tham quan các điểm du lịch.', N'https://cdn.lawnet.vn/uploads/tintuc/2023/01/16/danh-lam-thang-canh.jpg', 800000.0000, 0, 1)
INSERT [dbo].[Tour] ([Tour_ID], [StartDate], [EndDate], [City_ID], [NumberPeople], [Content], [IMG], [TotalPrice], [isDelete], [Type_ID]) VALUES (1025, CAST(N'2023-07-10' AS Date), CAST(N'2023-10-10' AS Date), 50, 23, N'THÔNG TIN TOUR: Vũng Tàu - Ngày Nắng Hạ 2N1Đ

 Đêm 01: CẦN THƠ  – VŨNG TÀU
21h30: Xe và HDV đón đoàn tại điểm hẹn, sau đó khởi hành đến thành phố Vũng Tàu.

 Ngày 01: KHÁM PHÁ THÀNH PHỐ BIỂN - Ăn: S, T, C
Sáng 07h00: Vũng Tàu Quý khách dùng điểm tâm sáng. Sau đó xe và HDV sẽ đưa các bạn tham quan:
img
- Tượng chúa Kitô – là một trong những địa điểm tham quan Vũng Tàu nổi tiếng, không thể thiếu trong hành trình của du khách khi du lịch Vũng Tàu, bởi cảm giác chinh phục đầy thú vị tại phố biển sôi động này. Tại đây quý khách sẽ ngấm được toàn cảnh Thành phố Vũng Tàu.
- Đoàn di chuyển đến thành phố biển Vũng Tàu. Tiếp tục tham quan Chùa Hộ Pháp - Chùa Thích Ca Phật Đài - Là một địa điểm tín ngưỡng nổi tiếng là nới cúng viếng của nhiều phật tử trong ngoài nước, nằm trong một quần thể thánh tích kiến trúc phật giáo đồ sộ quy mô rộng lớn của hệ Phật Giáo nguyên thủy Theravada có nguồn gốc từ Ấn Độ.

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, về khách sạn nhận phòng nghỉ ngơi.
14h30: Quý khách tự do tắm biển và thưởng thức hải sản. tại đây quý khách thoả sức bơi lội bỏ qua sự mệt mỏi thường ngày tận hưởng những cơn gió biển nắng chiều.     

Chiều 17h00: Đoàn ăn tối. tôi quý khách tự do dạo phố biển về đềm thưởng thức hải sản tươi ngon nơi đây.    
img
 Ngày 2: VŨNG TÀU – CẦN THƠ - Ăn: S, T, C
Sáng 06h30: Đoàn dùng điểm tâm sáng, làm thủ tục trả phòng. Sau đó xe sẽ đưa đoàn dạo quanh con đường biển. Đoàn dừng chân đến với:

- Bến du thuyền Marina - Đến đây du khách sẽ được chu du trên những chiếc cano, lướt cùng sóng biển bằng thuyền buồm, tham quan, ngắm cảnh trên sông Dinh, tìm hiểu về cuộc sống của các ngư dân trên bè nổi, tham gia các hoạt động gắn liền với sông nước.(Chi phí đi canon tự túc)     

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, Sau đó xe và HDV đưa quý khách về lại Cần Thơ.
Trên đường về đoàn dừng chân mua sấm hải sản quà tặng lưu niệm thành phố biển.
Đến Long Thành đoàn dừng chân, sau đó về Tiền Giang ăn chiều.     

Chiều 17h30: Đoàn ăn chiều. Kết thúc chương trình xe và HDV Du lịch Thiên Nhiên đưa quý khách về điểm đón ban đầu. HDV chào tạm biệt gửi lời cám ơn đến đoàn và hẹn gặp lại.    
img
Tùy theo điều kiện thực tế mà chương trình tham quan có thể thay đổi cho phù hợp, tuy nhiên tổng số điểm tham quan vẫn đảm bảo đầy đủ.

GIÁ TOUR ĐÃ BAO GỒM:
- Lưu trú: Khách sạn 2 tiêu chuẩn.
- Ăn uống: Ăn sáng: Tô ly.
Ăn chính theo chương trình, phục vụ tại nhà hàng. 
(2 buổi sáng + 4 buổi ăn chính).
- Tham quan: Vé tham quan các điểm du lịch.', N'https://cdn3.dhht.vn/wp-content/uploads/2021/07/3-15-danh-lam-thang-canh-viet-nam-noi-tieng-nhat-tren-the-gioi.jpg', 900000.0000, 0, 3)
INSERT [dbo].[Tour] ([Tour_ID], [StartDate], [EndDate], [City_ID], [NumberPeople], [Content], [IMG], [TotalPrice], [isDelete], [Type_ID]) VALUES (1026, CAST(N'2023-07-10' AS Date), CAST(N'2023-10-10' AS Date), 9, 21, N'THÔNG TIN TOUR: Vũng Tàu - Ngày Nắng Hạ 2N1Đ

 Đêm 01: CẦN THƠ  – VŨNG TÀU
21h30: Xe và HDV đón đoàn tại điểm hẹn, sau đó khởi hành đến thành phố Vũng Tàu.

 Ngày 01: KHÁM PHÁ THÀNH PHỐ BIỂN - Ăn: S, T, C
Sáng 07h00: Vũng Tàu Quý khách dùng điểm tâm sáng. Sau đó xe và HDV sẽ đưa các bạn tham quan:
img
- Tượng chúa Kitô – là một trong những địa điểm tham quan Vũng Tàu nổi tiếng, không thể thiếu trong hành trình của du khách khi du lịch Vũng Tàu, bởi cảm giác chinh phục đầy thú vị tại phố biển sôi động này. Tại đây quý khách sẽ ngấm được toàn cảnh Thành phố Vũng Tàu.
- Đoàn di chuyển đến thành phố biển Vũng Tàu. Tiếp tục tham quan Chùa Hộ Pháp - Chùa Thích Ca Phật Đài - Là một địa điểm tín ngưỡng nổi tiếng là nới cúng viếng của nhiều phật tử trong ngoài nước, nằm trong một quần thể thánh tích kiến trúc phật giáo đồ sộ quy mô rộng lớn của hệ Phật Giáo nguyên thủy Theravada có nguồn gốc từ Ấn Độ.

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, về khách sạn nhận phòng nghỉ ngơi.
14h30: Quý khách tự do tắm biển và thưởng thức hải sản. tại đây quý khách thoả sức bơi lội bỏ qua sự mệt mỏi thường ngày tận hưởng những cơn gió biển nắng chiều.     

Chiều 17h00: Đoàn ăn tối. tôi quý khách tự do dạo phố biển về đềm thưởng thức hải sản tươi ngon nơi đây.    
img
 Ngày 2: VŨNG TÀU – CẦN THƠ - Ăn: S, T, C
Sáng 06h30: Đoàn dùng điểm tâm sáng, làm thủ tục trả phòng. Sau đó xe sẽ đưa đoàn dạo quanh con đường biển. Đoàn dừng chân đến với:

- Bến du thuyền Marina - Đến đây du khách sẽ được chu du trên những chiếc cano, lướt cùng sóng biển bằng thuyền buồm, tham quan, ngắm cảnh trên sông Dinh, tìm hiểu về cuộc sống của các ngư dân trên bè nổi, tham gia các hoạt động gắn liền với sông nước.(Chi phí đi canon tự túc)     

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, Sau đó xe và HDV đưa quý khách về lại Cần Thơ.
Trên đường về đoàn dừng chân mua sấm hải sản quà tặng lưu niệm thành phố biển.
Đến Long Thành đoàn dừng chân, sau đó về Tiền Giang ăn chiều.     

Chiều 17h30: Đoàn ăn chiều. Kết thúc chương trình xe và HDV Du lịch Thiên Nhiên đưa quý khách về điểm đón ban đầu. HDV chào tạm biệt gửi lời cám ơn đến đoàn và hẹn gặp lại.    
img
Tùy theo điều kiện thực tế mà chương trình tham quan có thể thay đổi cho phù hợp, tuy nhiên tổng số điểm tham quan vẫn đảm bảo đầy đủ.

GIÁ TOUR ĐÃ BAO GỒM:
- Lưu trú: Khách sạn 2 tiêu chuẩn.
- Ăn uống: Ăn sáng: Tô ly.
Ăn chính theo chương trình, phục vụ tại nhà hàng. 
(2 buổi sáng + 4 buổi ăn chính).
- Tham quan: Vé tham quan các điểm du lịch.', N'https://ladigi.vn/wp-content/uploads/2020/04/co-do-hoa-lu-ninh-binh-15609.jpg', 1700000.0000, 0, 2)
INSERT [dbo].[Tour] ([Tour_ID], [StartDate], [EndDate], [City_ID], [NumberPeople], [Content], [IMG], [TotalPrice], [isDelete], [Type_ID]) VALUES (1027, CAST(N'2023-07-10' AS Date), CAST(N'2023-10-10' AS Date), 26, 22, N'THÔNG TIN TOUR: Vũng Tàu - Ngày Nắng Hạ 2N1Đ

 Đêm 01: CẦN THƠ  – VŨNG TÀU
21h30: Xe và HDV đón đoàn tại điểm hẹn, sau đó khởi hành đến thành phố Vũng Tàu.

 Ngày 01: KHÁM PHÁ THÀNH PHỐ BIỂN - Ăn: S, T, C
Sáng 07h00: Vũng Tàu Quý khách dùng điểm tâm sáng. Sau đó xe và HDV sẽ đưa các bạn tham quan:
img
- Tượng chúa Kitô – là một trong những địa điểm tham quan Vũng Tàu nổi tiếng, không thể thiếu trong hành trình của du khách khi du lịch Vũng Tàu, bởi cảm giác chinh phục đầy thú vị tại phố biển sôi động này. Tại đây quý khách sẽ ngấm được toàn cảnh Thành phố Vũng Tàu.
- Đoàn di chuyển đến thành phố biển Vũng Tàu. Tiếp tục tham quan Chùa Hộ Pháp - Chùa Thích Ca Phật Đài - Là một địa điểm tín ngưỡng nổi tiếng là nới cúng viếng của nhiều phật tử trong ngoài nước, nằm trong một quần thể thánh tích kiến trúc phật giáo đồ sộ quy mô rộng lớn của hệ Phật Giáo nguyên thủy Theravada có nguồn gốc từ Ấn Độ.

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, về khách sạn nhận phòng nghỉ ngơi.
14h30: Quý khách tự do tắm biển và thưởng thức hải sản. tại đây quý khách thoả sức bơi lội bỏ qua sự mệt mỏi thường ngày tận hưởng những cơn gió biển nắng chiều.     

Chiều 17h00: Đoàn ăn tối. tôi quý khách tự do dạo phố biển về đềm thưởng thức hải sản tươi ngon nơi đây.    
img
 Ngày 2: VŨNG TÀU – CẦN THƠ - Ăn: S, T, C
Sáng 06h30: Đoàn dùng điểm tâm sáng, làm thủ tục trả phòng. Sau đó xe sẽ đưa đoàn dạo quanh con đường biển. Đoàn dừng chân đến với:

- Bến du thuyền Marina - Đến đây du khách sẽ được chu du trên những chiếc cano, lướt cùng sóng biển bằng thuyền buồm, tham quan, ngắm cảnh trên sông Dinh, tìm hiểu về cuộc sống của các ngư dân trên bè nổi, tham gia các hoạt động gắn liền với sông nước.(Chi phí đi canon tự túc)     

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, Sau đó xe và HDV đưa quý khách về lại Cần Thơ.
Trên đường về đoàn dừng chân mua sấm hải sản quà tặng lưu niệm thành phố biển.
Đến Long Thành đoàn dừng chân, sau đó về Tiền Giang ăn chiều.     

Chiều 17h30: Đoàn ăn chiều. Kết thúc chương trình xe và HDV Du lịch Thiên Nhiên đưa quý khách về điểm đón ban đầu. HDV chào tạm biệt gửi lời cám ơn đến đoàn và hẹn gặp lại.    
img
Tùy theo điều kiện thực tế mà chương trình tham quan có thể thay đổi cho phù hợp, tuy nhiên tổng số điểm tham quan vẫn đảm bảo đầy đủ.

GIÁ TOUR ĐÃ BAO GỒM:
- Lưu trú: Khách sạn 2 tiêu chuẩn.
- Ăn uống: Ăn sáng: Tô ly.
Ăn chính theo chương trình, phục vụ tại nhà hàng. 
(2 buổi sáng + 4 buổi ăn chính).
- Tham quan: Vé tham quan các điểm du lịch.', N'https://fridayshopping.vn/wp-content/uploads/2022/02/top-30-danh-lam-thang-canh-ha-noi-dong-khach-nhat-hien-nay-1.jpeg', 1100000.0000, 0, 1)
INSERT [dbo].[Tour] ([Tour_ID], [StartDate], [EndDate], [City_ID], [NumberPeople], [Content], [IMG], [TotalPrice], [isDelete], [Type_ID]) VALUES (1028, CAST(N'2023-07-10' AS Date), CAST(N'2023-10-10' AS Date), 58, 24, N'THÔNG TIN TOUR: Vũng Tàu - Ngày Nắng Hạ 2N1Đ

 Đêm 01: CẦN THƠ  – VŨNG TÀU
21h30: Xe và HDV đón đoàn tại điểm hẹn, sau đó khởi hành đến thành phố Vũng Tàu.

 Ngày 01: KHÁM PHÁ THÀNH PHỐ BIỂN - Ăn: S, T, C
Sáng 07h00: Vũng Tàu Quý khách dùng điểm tâm sáng. Sau đó xe và HDV sẽ đưa các bạn tham quan:
img
- Tượng chúa Kitô – là một trong những địa điểm tham quan Vũng Tàu nổi tiếng, không thể thiếu trong hành trình của du khách khi du lịch Vũng Tàu, bởi cảm giác chinh phục đầy thú vị tại phố biển sôi động này. Tại đây quý khách sẽ ngấm được toàn cảnh Thành phố Vũng Tàu.
- Đoàn di chuyển đến thành phố biển Vũng Tàu. Tiếp tục tham quan Chùa Hộ Pháp - Chùa Thích Ca Phật Đài - Là một địa điểm tín ngưỡng nổi tiếng là nới cúng viếng của nhiều phật tử trong ngoài nước, nằm trong một quần thể thánh tích kiến trúc phật giáo đồ sộ quy mô rộng lớn của hệ Phật Giáo nguyên thủy Theravada có nguồn gốc từ Ấn Độ.

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, về khách sạn nhận phòng nghỉ ngơi.
14h30: Quý khách tự do tắm biển và thưởng thức hải sản. tại đây quý khách thoả sức bơi lội bỏ qua sự mệt mỏi thường ngày tận hưởng những cơn gió biển nắng chiều.     

Chiều 17h00: Đoàn ăn tối. tôi quý khách tự do dạo phố biển về đềm thưởng thức hải sản tươi ngon nơi đây.    
img
 Ngày 2: VŨNG TÀU – CẦN THƠ - Ăn: S, T, C
Sáng 06h30: Đoàn dùng điểm tâm sáng, làm thủ tục trả phòng. Sau đó xe sẽ đưa đoàn dạo quanh con đường biển. Đoàn dừng chân đến với:

- Bến du thuyền Marina - Đến đây du khách sẽ được chu du trên những chiếc cano, lướt cùng sóng biển bằng thuyền buồm, tham quan, ngắm cảnh trên sông Dinh, tìm hiểu về cuộc sống của các ngư dân trên bè nổi, tham gia các hoạt động gắn liền với sông nước.(Chi phí đi canon tự túc)     

Trưa 12h00: Đoàn dùng cơm trưa tại nhà hàng, Sau đó xe và HDV đưa quý khách về lại Cần Thơ.
Trên đường về đoàn dừng chân mua sấm hải sản quà tặng lưu niệm thành phố biển.
Đến Long Thành đoàn dừng chân, sau đó về Tiền Giang ăn chiều.     

Chiều 17h30: Đoàn ăn chiều. Kết thúc chương trình xe và HDV Du lịch Thiên Nhiên đưa quý khách về điểm đón ban đầu. HDV chào tạm biệt gửi lời cám ơn đến đoàn và hẹn gặp lại.    
img
Tùy theo điều kiện thực tế mà chương trình tham quan có thể thay đổi cho phù hợp, tuy nhiên tổng số điểm tham quan vẫn đảm bảo đầy đủ.

GIÁ TOUR ĐÃ BAO GỒM:
- Lưu trú: Khách sạn 2 tiêu chuẩn.
- Ăn uống: Ăn sáng: Tô ly.
Ăn chính theo chương trình, phục vụ tại nhà hàng. 
(2 buổi sáng + 4 buổi ăn chính).
- Tham quan: Vé tham quan các điểm du lịch.', N'https://nhuathuanphong.com/wp-content/uploads/2022/09/du-lich-viet-nam.jpg', 1900000.0000, 0, 2)
SET IDENTITY_INSERT [dbo].[Tour] OFF
GO
INSERT [dbo].[TourActivity] ([Tour_ID], [Activity_ID], [Time]) VALUES (1, 1, CAST(N'07:00:00' AS Time))
INSERT [dbo].[TourActivity] ([Tour_ID], [Activity_ID], [Time]) VALUES (1, 2, CAST(N'08:00:00' AS Time))
INSERT [dbo].[TourActivity] ([Tour_ID], [Activity_ID], [Time]) VALUES (2, 1, CAST(N'09:00:00' AS Time))
INSERT [dbo].[TourActivity] ([Tour_ID], [Activity_ID], [Time]) VALUES (9, 3, CAST(N'20:32:00' AS Time))
INSERT [dbo].[TourActivity] ([Tour_ID], [Activity_ID], [Time]) VALUES (10, 4, CAST(N'19:34:00' AS Time))
INSERT [dbo].[TourActivity] ([Tour_ID], [Activity_ID], [Time]) VALUES (12, 5, CAST(N'08:30:00' AS Time))
INSERT [dbo].[TourActivity] ([Tour_ID], [Activity_ID], [Time]) VALUES (12, 5, CAST(N'09:15:00' AS Time))
INSERT [dbo].[TourActivity] ([Tour_ID], [Activity_ID], [Time]) VALUES (12, 5, CAST(N'17:04:00' AS Time))
GO
SET IDENTITY_INSERT [dbo].[TourType] ON 

INSERT [dbo].[TourType] ([Type_ID], [Type_name], [Is_Delete]) VALUES (1, N'Khám phá', 0)
INSERT [dbo].[TourType] ([Type_ID], [Type_name], [Is_Delete]) VALUES (2, N'Nghỉ Dưỡng', 0)
INSERT [dbo].[TourType] ([Type_ID], [Type_name], [Is_Delete]) VALUES (3, N'Trải nghiệm', 0)
SET IDENTITY_INSERT [dbo].[TourType] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [FullName], [cmnd], [Email], [UserName], [Password], [Phone], [Gender], [DOB], [Address], [IsBlocked], [Role_ID]) VALUES (1, N'Duc Tung', N'0987654321', N'tung@123.com', N'tung', N'1', N'123', 1, CAST(N'2002-12-12' AS Date), N'Ha Noi', 0, 1)
INSERT [dbo].[User] ([UserID], [FullName], [cmnd], [Email], [UserName], [Password], [Phone], [Gender], [DOB], [Address], [IsBlocked], [Role_ID]) VALUES (2, N'Tung', N'11111', N'tung', N'tung', N'tungbv123', N'123', 1, NULL, N'HN', 0, 1)
INSERT [dbo].[User] ([UserID], [FullName], [cmnd], [Email], [UserName], [Password], [Phone], [Gender], [DOB], [Address], [IsBlocked], [Role_ID]) VALUES (3, N'TUNG', N'111111111', N'Tung@dqw.com', N'tung123', N'123', N'123123123', NULL, NULL, NULL, 0, 3)
INSERT [dbo].[User] ([UserID], [FullName], [cmnd], [Email], [UserName], [Password], [Phone], [Gender], [DOB], [Address], [IsBlocked], [Role_ID]) VALUES (4, N'TungLuu Duc', N'1111111111111111', N'tungldhe163421@fpt.edu.vn', N'admin1', N'1111111111111111', N'0972074620', NULL, NULL, NULL, 0, 3)
INSERT [dbo].[User] ([UserID], [FullName], [cmnd], [Email], [UserName], [Password], [Phone], [Gender], [DOB], [Address], [IsBlocked], [Role_ID]) VALUES (5, N'TungLuu Duc', N'1111111111111111', N'tungldhe163vn111vn111421@fpt.edu.vn', N'1111111111111111', N'1111111111111111', N'0972074620', NULL, NULL, NULL, 0, 3)
INSERT [dbo].[User] ([UserID], [FullName], [cmnd], [Email], [UserName], [Password], [Phone], [Gender], [DOB], [Address], [IsBlocked], [Role_ID]) VALUES (6, N'ductung', N'1111111111111111', N'tungqwe@fmas.com', N'ewqe', N'1111111111111111', N'0987645321', 0, NULL, N'HN', 0, 3)
INSERT [dbo].[User] ([UserID], [FullName], [cmnd], [Email], [UserName], [Password], [Phone], [Gender], [DOB], [Address], [IsBlocked], [Role_ID]) VALUES (7, N'anhminh', N'54564546545', N'vandu@gmail.com', N'mina2k', N'14020302', N'0585664112', 0, NULL, N'34 Da Nang', 0, 3)
INSERT [dbo].[User] ([UserID], [FullName], [cmnd], [Email], [UserName], [Password], [Phone], [Gender], [DOB], [Address], [IsBlocked], [Role_ID]) VALUES (8, N'anhduc', N'54831216546423', N'ducanh142@gmail.com', N'duanh142', N'12341235', N'0656656566', 0, NULL, N'34 Da Nang', 0, 1)
INSERT [dbo].[User] ([UserID], [FullName], [cmnd], [Email], [UserName], [Password], [Phone], [Gender], [DOB], [Address], [IsBlocked], [Role_ID]) VALUES (9, N'1', N'2', N'1', N'1', N'1', N'2', 1, NULL, N'Hay Tayy', 0, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Tour] ADD  CONSTRAINT [DF__Tour__StartDate__5CD6CB2B]  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[Tour] ADD  CONSTRAINT [DF__Tour__isDelete__5DCAEF64]  DEFAULT ((0)) FOR [isDelete]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [IsBlocked]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Hotel] FOREIGN KEY([HotelID])
REFERENCES [dbo].[Hotel] ([ID])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Hotel]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Tour] FOREIGN KEY([TourID])
REFERENCES [dbo].[Tour] ([Tour_ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Tour]
GO
ALTER TABLE [dbo].[Tour]  WITH CHECK ADD  CONSTRAINT [FK_Tour_City1] FOREIGN KEY([City_ID])
REFERENCES [dbo].[City] ([City_ID])
GO
ALTER TABLE [dbo].[Tour] CHECK CONSTRAINT [FK_Tour_City1]
GO
ALTER TABLE [dbo].[Tour]  WITH CHECK ADD  CONSTRAINT [FK_Tour_TourType] FOREIGN KEY([Type_ID])
REFERENCES [dbo].[TourType] ([Type_ID])
GO
ALTER TABLE [dbo].[Tour] CHECK CONSTRAINT [FK_Tour_TourType]
GO
ALTER TABLE [dbo].[TourActivity]  WITH CHECK ADD FOREIGN KEY([Activity_ID])
REFERENCES [dbo].[Activity] ([Activity_ID])
GO
ALTER TABLE [dbo].[TourActivity]  WITH CHECK ADD  CONSTRAINT [FK__TourActiv__Tour___6383C8BA] FOREIGN KEY([Tour_ID])
REFERENCES [dbo].[Tour] ([Tour_ID])
GO
ALTER TABLE [dbo].[TourActivity] CHECK CONSTRAINT [FK__TourActiv__Tour___6383C8BA]
GO
ALTER TABLE [dbo].[TourDiscount]  WITH CHECK ADD FOREIGN KEY([Discount_ID])
REFERENCES [dbo].[Discount] ([Discount_ID])
GO
ALTER TABLE [dbo].[TourDiscount]  WITH CHECK ADD  CONSTRAINT [FK__TourDisco__Tour___656C112C] FOREIGN KEY([Tour_ID])
REFERENCES [dbo].[Tour] ([Tour_ID])
GO
ALTER TABLE [dbo].[TourDiscount] CHECK CONSTRAINT [FK__TourDisco__Tour___656C112C]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([Role_ID])
REFERENCES [dbo].[Role] ([Role_ID])
GO
