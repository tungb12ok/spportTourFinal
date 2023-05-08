USE [TravelBlog]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/15/2023 1:14:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[password] [varchar](50) NULL,
	[account_name] [varchar](100) NULL,
	[full_name] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[gender] [bit] NULL,
	[email] [varchar](255) NULL,
	[role_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/15/2023 1:14:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 3/15/2023 1:14:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[post_id] [int] NULL,
	[account_id] [int] NULL,
	[content] [ntext] NULL,
	[created_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 3/15/2023 1:14:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[post_id] [int] IDENTITY(1,1) NOT NULL,
	[tittle] [nvarchar](50) NULL,
	[created_date] [date] NULL,
	[description] [ntext] NULL,
	[image_link] [varchar](255) NULL,
	[account_id] [int] NULL,
	[category_id] [int] NULL,
	[vehicle_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostDetail]    Script Date: 3/15/2023 1:14:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostDetail](
	[post_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[post_id] [int] NULL,
	[content] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[post_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/15/2023 1:14:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 3/15/2023 1:14:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[service_id] [int] IDENTITY(1,1) NOT NULL,
	[service_name] [nvarchar](50) NULL,
	[price] [money] NULL,
	[iconclass] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service_of]    Script Date: 3/15/2023 1:14:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service_of](
	[post_id] [int] NOT NULL,
	[service_id] [int] NOT NULL,
 CONSTRAINT [PK_service_of] PRIMARY KEY CLUSTERED 
(
	[post_id] ASC,
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 3/15/2023 1:14:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle](
	[vehicle_id] [int] IDENTITY(1,1) NOT NULL,
	[vehicle_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[vehicle_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 
GO
INSERT [dbo].[Account] ([account_id], [password], [account_name], [full_name], [address], [gender], [email], [role_id]) VALUES (1, N'Admin123', N'AdminReview', N'Nguyễn Lan Ngọc', N'DaihocFPTHN', 0, N'Ngocnlhe160359@fpt.edu.vn', 1)
GO
INSERT [dbo].[Account] ([account_id], [password], [account_name], [full_name], [address], [gender], [email], [role_id]) VALUES (2, N'12345678', N'Nguoivivu', N'Phùng Hải Anh', N'Tay Son', 1, N'Hahaha12@gmail.com', 2)
GO
INSERT [dbo].[Account] ([account_id], [password], [account_name], [full_name], [address], [gender], [email], [role_id]) VALUES (3, N'23456789', N'DuLichTheGioi', N'Nguyễn Hương Ly', N'HongHac, ThanhPhoYenBai', 0, N'Lynhhs163344@fpt.edu.vn', 2)
GO
INSERT [dbo].[Account] ([account_id], [password], [account_name], [full_name], [address], [gender], [email], [role_id]) VALUES (4, N'TranGiaBao12', N'BaoTranthichdi', N'trần Gia Bảo', N'Hoi An, Da Nang', 1, N'BaoTranGia@gamil.com', 2)
GO
INSERT [dbo].[Account] ([account_id], [password], [account_name], [full_name], [address], [gender], [email], [role_id]) VALUES (5, N'Boy456789', N'XamXiBoy', N'Lê Trần Tiến Đông', N'Quan 4, Tp Ho Chi Minh', 1, N'TranTienDong2k2@gamil.com', 2)
GO
INSERT [dbo].[Account] ([account_id], [password], [account_name], [full_name], [address], [gender], [email], [role_id]) VALUES (1002, N'012345678', N'ThanhNC', N'Nguyễn Công Thành', N'Thành phố Hải Phòng, Việt Nam', 1, N'abcxyz1@gmail.com', 2)
GO
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (1, N'Việt Nam')
GO
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (2, N'Châu Á')
GO
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (3, N'Châu Phi')
GO
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (4, N'Châu Nam Mỹ')
GO
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (5, N'Châu Bắc Mỹ')
GO
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (6, N'Châu Âu')
GO
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (7, N'Châu Úc')
GO
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (8, N'Châu Nam Cực')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 
GO
INSERT [dbo].[Comment] ([comment_id], [post_id], [account_id], [content], [created_date]) VALUES (1, 1, 3, N'Nơi này rất là đẹp. Chụp hình sống ảo là hết nước chấm!!!', CAST(N'2023-03-09' AS Date))
GO
INSERT [dbo].[Comment] ([comment_id], [post_id], [account_id], [content], [created_date]) VALUES (2, 2, 5, N'Đã từng đặt chân đến nơi này. Có rất nhiều hiện tượng đẹp để khám phá. Vẫn muốn quay lại lần thứ 2.', CAST(N'2023-03-09' AS Date))
GO
INSERT [dbo].[Comment] ([comment_id], [post_id], [account_id], [content], [created_date]) VALUES (3, 5, 4, N'Mình rất thích nghiên cứu và khám phá các loài thực vật. Đây đúng là 1 noi lý tưởng để thục hiện mong muốn của mình.', CAST(N'2023-03-06' AS Date))
GO
INSERT [dbo].[Comment] ([comment_id], [post_id], [account_id], [content], [created_date]) VALUES (4, 14, 2, N'Lets go', CAST(N'2023-03-11' AS Date))
GO
INSERT [dbo].[Comment] ([comment_id], [post_id], [account_id], [content], [created_date]) VALUES (5, 1, 5, N'WOA. Nhất định phải đến nơi này một lần.', CAST(N'2023-03-12' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 
GO
INSERT [dbo].[Post] ([post_id], [tittle], [created_date], [description], [image_link], [account_id], [category_id], [vehicle_id]) VALUES (1, N'SA THẠCH THE WAVE, ARIZONA, MỸ', CAST(N'2023-03-05' AS Date), N'Sự hình thành sa thạch đầy màu sắc ở phía bắc Coyote Buttes, sa mạc Arizona, Hoa Kỳ được tạo nên từ các cồn cát xếp chồng lên nhau cùng sự lắng đọng của muối canxi, tạo nên những đường cong, uốn lượn độc đáo và quyến rũ.', N'https://kenh14cdn.com/thumb_w/660/2019/5/14/photo-1-1557811271978591833211.jpg', 2, 5, 5)
GO
INSERT [dbo].[Post] ([post_id], [tittle], [created_date], [description], [image_link], [account_id], [category_id], [vehicle_id]) VALUES (2, N'ĐỒNG MUỐI SALAR DE UYUNI, BOLIVIA', CAST(N'2023-03-05' AS Date), N'Là đồng muối lớn nhất thế giới, được hình thành từ nhiều hồ nước vào thời tiền sử, cung cấp một lượng nước muối lớn cho cánh đồng Salar de Uyuni. Nơi đây chiếm một nửa trữ lượng lithium của thế giới.', N'https://i1-dulich.vnecdn.net/2019/06/07/1-1559885163.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=bNBjZ2o0HSlVZk1_0lmXfg', 2, 4, 1)
GO
INSERT [dbo].[Post] ([post_id], [tittle], [created_date], [description], [image_link], [account_id], [category_id], [vehicle_id]) VALUES (3, N'CỰC QUANG PHƯƠNG BẮC, IRELAND', CAST(N'2023-03-05' AS Date), N'Tuy chỉ xuất hiện chốc lát rồi biến mất, nhưng những ánh hào quang huyền ảo, lung linh trong bầu trời ban đêm khi kết hợp với những luồng ánh sáng của ngọn núi lửa phun trào gần đó sẽ tạo nên cảnh tượng màu sắc vô cùng độc đáo của vùng đất Ireland.', N'https://vietglobaltravel.com.vn/wp-content/uploads/2017/10/home-welcome-aurora-on-george.jpg', 3, 6, 1)
GO
INSERT [dbo].[Post] ([post_id], [tittle], [created_date], [description], [image_link], [account_id], [category_id], [vehicle_id]) VALUES (4, N'SÔNG CANO CRISTALES, COLOMBIA', CAST(N'2023-03-05' AS Date), N'Nằm ở phía đông dãy núi Andes, miền trung Colombia, thuộc công viên La Macarena, sông Cano Cristales dài 100 km được gọi bằng nhiều cái tên như sông ngũ sắc, sông cầu vòng nước,…bởi vẻ đẹp đa sắc màu của dòng nước.', N'https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/07_2020/dong-song-cau-vong-noi-tieng.jpg', 3, 4, 1)
GO
INSERT [dbo].[Post] ([post_id], [tittle], [created_date], [description], [image_link], [account_id], [category_id], [vehicle_id]) VALUES (5, N'VƯỜN HOA KEUKENHOF, HÀ LAN', CAST(N'2023-03-05' AS Date), N'Nằm thị trấn Lisse, cách thủ đô Amsterdam, Hà Lan khoảng 40 phút đi xe buýt, Keukenhof là một trong những vườn hoa xuân đẹp nhất trên thế giới. Nghệ thuật trình bày hoa trên cánh đồng rộng lớn rất đặc sắc với những đường cong quyến rũ của dải hoa tulip, thủy tiên, dạ hương lan,... tạo nên bức tranh thiên nhiên tuyệt diệu.', N'https://media.vietravel.com/images/NewsPicture/Keukenhof,%20H%C3%A0%20Lan_resize.jpg', 4, 6, 1)
GO
INSERT [dbo].[Post] ([post_id], [tittle], [created_date], [description], [image_link], [account_id], [category_id], [vehicle_id]) VALUES (6, N'RUỘNG BẬC THANG, VIỆT NAM', CAST(N'2023-03-05' AS Date), N'Việt Nam, đất nước xuất khẩu gạo lớn thứ hai thế giới, sở hữu những cánh đồng lúa rộng bạt ngàn. Trong đó, những thửa ruộng bậc thang ở các vùng đồi, núi phía Bắc sẽ là một trong những cảnh quan với màu xanh nổi bật nhất thế giới.', N'https://media.vietravel.com/images/NewsPicture/ruong-bac-thang_resize.jpg', 4, 1, 2)
GO
INSERT [dbo].[Post] ([post_id], [tittle], [created_date], [description], [image_link], [account_id], [category_id], [vehicle_id]) VALUES (7, N'THUNG LŨNG QUEBRADA DE HUMAHUACA, ARGENTINA', CAST(N'2023-03-05' AS Date), N'Đây là một thung lũng hẹp thuộc tỉnh Jujuy, tây bắc Argentina, được bao quanh bởi các dãy núi cao chót vót và vượt qua ngọn Rio Grande. Năm 2003, thung lũng này được công nhận là Di sản thế giới do sự nổi bật về cảnh quan, đặc trưng bởi những ngọn đồi nhiều màu sắc và có sự hiện diện của con người hơn 10.000 năm.', N'https://toplist.vn/images/800px/thung-lung-quebrada-de-humahuaca-argentina-769562.jpg', 5, 4, 1)
GO
INSERT [dbo].[Post] ([post_id], [tittle], [created_date], [description], [image_link], [account_id], [category_id], [vehicle_id]) VALUES (8, N'SUỐI NƯỚC NÓNG GRAND PRISMATIC SPRING, WYOMING, MỸ', CAST(N'2023-03-05' AS Date), N'Grand Prismatic nằm trong vùng Geyser Basin Midway, Hoa Kỳ là suối nước nóng lớn nhất tại công viên quốc gia Yellowstone và lớn thứ ba trên thế giới. Tên gọi của nó được đặt theo màu sắc nổi bật mà chúng hòa quyện: xanh da trời, xanh lá cây, vàng, cam, vàng, đỏ và nâu, gần giống như một cầu vồng.', N'https://media.vneconomy.vn/images/upload/2021/04/21/suoi-1559019410173622166813.jpg', 5, 5, 1)
GO
INSERT [dbo].[Post] ([post_id], [tittle], [created_date], [description], [image_link], [account_id], [category_id], [vehicle_id]) VALUES (9, N'NÚI LỬA DALLOL, ETHIOPIA', CAST(N'2023-03-05' AS Date), N'Nằm ở độ cao thấp hơn mực nước biển khoảng 116m, Dallol là ngọn núi lửa trên cạn thấp nhất thế giới. Nơi đây có nhiệt độ trung bình cao nhất thế giới, tuy nhiên cũng là một điểm tham quan du lịch ngắm cảnh độc đáo.', N'https://vietluxtour.com/Upload/Images/Kham-pha/sacmauDallol08.jpg', 1, 3, 1)
GO
INSERT [dbo].[Post] ([post_id], [tittle], [created_date], [description], [image_link], [account_id], [category_id], [vehicle_id]) VALUES (10, N'ĐỒI SÔ CÔ LA, ĐẢO BOHOL, PHILIPPINES', CAST(N'2023-03-05' AS Date), N'Đồi Sô cô la (Chocolate Hills) là điểm tham quan nổi tiếng nhất ở đảo Bohol, Philippines. Ngọn đồi trông giống như được tạo thành từ hàng triệu thỏi sô cô la tan chảy. Mùa mưa, ngọn đồi khoác lên một dải màu xanh của cây cỏ đến mùa khô chuyển sang nâu, tạo nên những cảnh tượng màu sắc rất ấn tượng.', N'https://cdn-i.vtcnews.vn/resize/th/upload/2023/02/28/doi-socola-o-philippines4-11160856.jpg', 1, 2, 1)
GO
INSERT [dbo].[Post] ([post_id], [tittle], [created_date], [description], [image_link], [account_id], [category_id], [vehicle_id]) VALUES (11, N'CẦU VÀNG, ĐÀ NẴNG', CAST(N'2023-03-05' AS Date), N'Cây cầu Vàng nằm ở vườn Thiên Thai, thuộc khu du lịch Bà Nà Hills (Đà Nẵng). Nằm lưng chừng giữa núi rừng, cây cầu khiến du khách không khỏi ngỡ ngàng. Đi bộ dọc theo cầu, du khách sẽ có cảm tưởng như đang dạo bước trên mây hay như lạc vào "cõi bồng lai tiên cảnh".', N'http://docs.portal.danang.gov.vn/images/image/22-3cauvang_1616400590414.jpg', 2, 1, 2)
GO
INSERT [dbo].[Post] ([post_id], [tittle], [created_date], [description], [image_link], [account_id], [category_id], [vehicle_id]) VALUES (12, N'VƯỜN QUỐC GIA TRƯƠNG GIA GIỚI, TRUNG QUỐC', CAST(N'2023-03-05' AS Date), N'Nằm về phía Tây bắc của tỉnh Hồ Nam, Trung Quốc, rừng quốc gia Zhangjiajie (hay còn gọi với tên là Trương Gia Giới) là một trong những công viên quốc gia có vẻ đẹp ảo diệu nhất xứ sở Trung Hoa này. Với khoảng 300 cột đá sa thạch nhô lên giữa không trung với đủ mọi hình thù, ước tính đã có tuổi đời hơn 380 triệu năm. 98% khu rừng được bao phủ bởi thảm thực vật và là nơi sinh sống của hơn 700 loài động vật. Với khí hậu cận nhiệt đới châu Á, ấm áp vào mùa đông và mát mẻ trong mùa hè khiến nơi đây trở thành điểm đến lý tưởng cho bất kỳ du khách nào đến tham quan quanh năm.', N'https://vyctravel.com/libs/upload/ckfinder/images//banner/truong-gia-gioi-web.jpg', 2, 2, 1)
GO
INSERT [dbo].[Post] ([post_id], [tittle], [created_date], [description], [image_link], [account_id], [category_id], [vehicle_id]) VALUES (13, N'BEACHY HEAD, VƯƠNG QUỐC ANH', CAST(N'2023-03-05' AS Date), N'Vượt lên cả những đám mây, du khách sẽ không khỏi ngỡ ngàng khi có cơ hội được ngắm nhìn những vách đá trắng phấn tinh khôi bên cạnh vùng biển hùng vĩ nơi đây. Tầm nhìn ngoạn mục từ vách đá xuống dưới hấp dẫn bất kỳ nhà leo núi nào, đặc biệt những người yêu thích độ cao và cảnh hoàng hôn tuyệt đẹp.', N'http://bloganchoi.com/wp-content/uploads/2016/07/beachy-head-3.jpg', 3, 6, 1)
GO
INSERT [dbo].[Post] ([post_id], [tittle], [created_date], [description], [image_link], [account_id], [category_id], [vehicle_id]) VALUES (14, N'KHU BẢO TỒN HỒ HAMILTON, AUSTIN, TEXAS, HOA KỲ', CAST(N'2023-03-05' AS Date), N'Hồ Hamilton được hình thành từ hàng ngàn năm trước, khi sự xói mòn tự nhiên liên tục làm sụp đổ mái vòm của một con sông ngầm, tạo ra những thác nước tuyệt đẹp dẫn đến vùng nước màu ngọc lam. Nó thực sự là một kỳ quan của thành phố Austin. Một trải nghiệm bơi không thể quên được chắc chắn cho các du khách.', N'https://toplist.vn/images/800px/ho-hamilton-austin-texas-hoa-ky-35490.jpg', 3, 5, 1)
GO
INSERT [dbo].[Post] ([post_id], [tittle], [created_date], [description], [image_link], [account_id], [category_id], [vehicle_id]) VALUES (15, N'SÔNG HINATUAN ENCHANTED, MINDANAO, PHILIPPINES', CAST(N'2023-03-05' AS Date), N'Nằm trên đảo Mindanao ở Philippines, sông Enchanted Hinatuan chảy qua cả Biển Philippine và Thái Bình Dương. Đối với du khách lần đầu tiên, con sông mê hoặc như một nơi siêu thực. Màu sắc của sông dao động từ màu lục bảo đến màu xanh da trời. Bạn có thể nhìn thấy màu xanh đậm ở những phần sâu của dòng sông. Đồng thời các phần nông của sông phản chiếu màu xanh lục cho đến màu xanh nhạt. Khi nước rất trong suốt, bạn thậm chí có thể nhìn thấy dưới cùng của dòng sông. Nước ở sông cũng hoàn toàn không có bụi bẩn.', N'http://media2.gody.vn/public/mytravelmap/images/2018/6/1/knigh.gody/d1655e43f0e78740870c538ef615629a.JPG', 4, 2, 1)
GO
INSERT [dbo].[Post] ([post_id], [tittle], [created_date], [description], [image_link], [account_id], [category_id], [vehicle_id]) VALUES (16, N'Hồ BAIKAL, NGA', CAST(N'2023-03-05' AS Date), N'Nằm ở phía Nam Siberi thuộc Nga, hồ Bailak là hồ nước ngọt lớn nhất thế giới và chứa hơn 20% lượng nước ngọt của Trái Đất. Không chỉ vậy, hồ Baikal còn là một trong những hồ nước trong nhất thế giới.', N'https://danhnamtravel.vn/Uploads/images/Nga2019/nga-21-2-2.jpg', 4, 6, 1)
GO
INSERT [dbo].[Post] ([post_id], [tittle], [created_date], [description], [image_link], [account_id], [category_id], [vehicle_id]) VALUES (19, N'NÚI LỬA BROMO, JAVA, INDONESIA', CAST(N'2023-03-05' AS Date), N'Thoạt nhìn, nơi này trông rất mơ mộng, nhưng thực tế, có một núi lửa vẫn còn hoạt động bên trong. Núi Bromo nằm bên trong Vườn Quốc gia Bromo Tengger. Đây là ngọn núi lửa hoạt động duy nhất còn lại ở Indonesia và đến nay, nó là điểm du lịch nổi tiếng do nhờ vẻ đẹp huyền diệu và các điểm tham quan kỳ thú xung quanh.', N'https://vietsensetravel.com/view/at_kinh-nghiem-kham-pha-nui-lua-bromo--anh-2_36e9c782dd58fdda27a11a1b62a2294e.jpeg', 5, 2, 1)
GO
INSERT [dbo].[Post] ([post_id], [tittle], [created_date], [description], [image_link], [account_id], [category_id], [vehicle_id]) VALUES (20, N'ĐẢO ZAKYNTHOS, HY LẠP', CAST(N'2023-03-05' AS Date), N'Một trong những quần đảo đẹp nhất Hy Lạp là Zakynthos. Nước trong vắt, bạn có thể nhìn thấy bóng của mình ở độ sâu 5m. Cảnh đẹp nhất trên đảo là bãi biển Navagio - một vịnh nhỏ bị cô lập ở phía tây bắc của hòn đảo với những vách đá cao  chỉ có thể đi lại bằng thuyền. Ngoài ra, các hang động màu xanh hòa cùng màu sắc của nước biển xanh ngắt tạo thành một mỹ quan thiên nhiên diệu vời không gì có thể tả hết khiến nơi đây trở thành một điểm đến lý tưởng cho các cặp đôi.', N'https://kienthuckhoahoc.org/images/kt/59/0/aiuf.jpg', 1, 6, 1)
GO
INSERT [dbo].[Post] ([post_id], [tittle], [created_date], [description], [image_link], [account_id], [category_id], [vehicle_id]) VALUES (21, N'THÁC IGUAZU, BRAZIL', CAST(N'2023-03-05' AS Date), N'Iguazu là một trong những thác nước hùng vĩ nhất thế giới, đồng thời là ranh giới tự nhiên của hai nước Brazil và Argentina. Thác nước này được hình thành từ những vết nứt lớn sau các vụ phun trào núi lửa từ hàng nghìn năm trước. Vẻ đẹp tráng lệ và hoang sơ ở nơi đây thu hút hàng nghìn lượt khách du lịch mỗi năm.', N'https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/07_2020/thac-nuoc-iguazu-2.jpg', 1, 4, 1)
GO
INSERT [dbo].[Post] ([post_id], [tittle], [created_date], [description], [image_link], [account_id], [category_id], [vehicle_id]) VALUES (22, N'ỐC ĐẢO HUACACHINA, PERU', CAST(N'2023-03-05' AS Date), N'Huacachina là một ốc đảo xinh đẹp với được bao quanh bởi hồ nước nhỏ tự nhiên và những đụn cát khổng lồ trải dài và cao vài trăm mét. Huacachina đã từ lâu là điểm đến du lịch cho những gia đình giàu có và những người yêu du lịch lái xe qua đỉnh của những bờ cát dài. Số dân thường trú ở ốc đảo này chỉ khoảng 100 người và tất cả họ sống phụ thuộc hoàn toàn vào du lịch.', N'https://media.songdep.com.vn/files/thunga/2021/04/23/oc-dao-huyen-thoai-huacachina-an-hien-giua-sa-mac-nang-nong-cua-peru-0-143524.jpg', 2, 4, 1)
GO
INSERT [dbo].[Post] ([post_id], [tittle], [created_date], [description], [image_link], [account_id], [category_id], [vehicle_id]) VALUES (23, N'LÀNG CHÀI NỔI Ở VỊNH HẠ LONG, VIỆT NAM', CAST(N'2023-03-05' AS Date), N'Làng chài Cửa Vạn nằm ở Vịnh Hạ Long là một trong những làng nổi lớn nhất thế giới. Người dân địa phương chủ yếu là ngư dân không có nhà trên đất liền mà sống nhờ những ngôi nhà nhỏ nổi trên biển. Làng chài Cửa Vạn hiện có hơn 300 hộ dân sinh sống với những nét văn hóa làng chài vẫn được lưu giữ và phát triển giờ đây ngày càng thu hút nhiều hơn khách du lịch tới tham quan.', N'https://tour.dulichvietnam.com.vn/uploads/image/du-lich-ha-long/kham-pha-lang-chai-cua-van.jpg', 2, 1, 3)
GO
INSERT [dbo].[Post] ([post_id], [tittle], [created_date], [description], [image_link], [account_id], [category_id], [vehicle_id]) VALUES (24, N'POSITANO, Ý', CAST(N'2023-03-05' AS Date), N'Positano là một trong những điểm đến lãng mạn nhất ở Ý, nơi các ngôi làng vách đá với những tòa nhà đầy màu sắc ôm bờ biển cao chót vót.', N'https://www.tourchauau.net/images/news/dia-diem-du-lich/Positano-1.jpg', 3, 6, 3)
GO
INSERT [dbo].[Post] ([post_id], [tittle], [created_date], [description], [image_link], [account_id], [category_id], [vehicle_id]) VALUES (25, N'MARRAKECH, MOROCCO', CAST(N'2023-03-05' AS Date), N'Là một thành cổ có từ thời Đế chế Berber, Marrakech làm mê hoặc du khách với hàng loạt màu sắc, hàng dệt, những khu vườn, âm thanh và mùi hương. Nó cũng nổi tiếng mê cung chợ hoạt động tấp nập cả ngày lẫn đêm.', N'https://media.gq-magazine.co.uk/photos/5d138f50976fa31476f39436/master/pass/marrakech-gq-9oct18_istock_b.jpg', 3, 3, 5)
GO
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[PostDetail] ON 
GO
INSERT [dbo].[PostDetail] ([post_detail_id], [post_id], [content]) VALUES (1, 1, N'Nước và gió làm xói mòn đá đã tạo nên những đường vân tuyệt đẹp và để lộ ra lớp cát được thổi qua vùng này từ thời kỷ Jura. Đây là điểm đến mơ ước của các nhà leo núi và nhiếp ảnh gia. Các lớp trầm tích tạo nên những hỗn hợp màu sắc độc đáo trên các phiến đá khổng lồ, hình thành hình ảnh cầu vồng tam sắc rực rỡ với màu vàng nhạt, hồng và đỏ. Các nhà khoa học cho rằng sa thạch được hình thành từ những đụn cát bị vôi hóa qua nhiều năm theo phương thẳng đứng và nằm ngang lại bị xói mòn bởi các các hiện tượng tự nhiên như mưa, nắng hay gió. Để đến chiêm ngưỡng kỳ quan thiên nhiên độc đáo này, chỉ có một cách duy nhất là đi bộ khoảng 5km từ nơi gần nhất ô tô có thể tiếp cận và sử dụng hệ thống định vị GPS để khám phá. Ngoài ra, tất cả các du khách phải xin cấp giấy phép tham quan khu vực này và trả phí cho cơ quan quản lý. Tuy nhiên, do bề mặt đá mềm và dễ vỡ, chính quyền sở tại hạn chế du khách tới vùng này, mỗi ngày chỉ 20 người được vào tham quan (bao gồm 10 người đăng kí online và 10 người xin giấy phép trực tiếp), chia thành hai đợt mỗi đợt 10 người và không được cắm trại trong khu vực.')
GO
INSERT [dbo].[PostDetail] ([post_detail_id], [post_id], [content]) VALUES (2, 2, N'Salar de Uyuni là cánh đồng muối lớn nhất thế giới, trải dài hơn 10.500 km2 thuộc cao nguyên Altiplano, phía tây nam Bolivia. Nằm ở độ cao 3.650 m so với mực nước biển, địa hình của khu vực hoàn toàn bằng phẳng và được tô điểm bởi những “hòn đảo” nhỏ như Isla Incahuasi.Các nhà khoa học đã phát hiện ra khu vực này là một phần của hồ Minchin vào khoảng 40.000 năm về trước. Thời tiền sử, hồ đã bao phủ toàn bộ phía tây nam của Bolivia. Qua thời gian, nước dần cạn kiệt, ngày nay chỉ còn sót lại hai tiểu hồ là Poopo và Uru Uru. Trong một số hang động vẫn còn hóa thạch san hô, dấu tích về một vùng biển đã tồn tại trong quá khứ.Cao nguyên Altiplano không có cửa thoát nước, vì vậy khi nước hồ bốc hơi dưới ánh mặt trời khắc nghiệt, lớp muối và canxi sunfat vẫn còn sót lại trên mặt đất. Cùng với gió, những đụn muối ở Salar de Uyuni liên tục biến đổi theo thời gian.Người Aymaran sinh sống ở Bolivia có một truyền thuyết để giải thích về sự hình thành của Salar de Uyuni. Trước đây ba ngọn núi bao quanh cánh đồng muối, Kusina, Kusku và Tunupa là những người khổng lồ. Vì Kusina, người chồng Kusku đã phản bội vợ - Tunupa khiến nước mắt nàng rơi xuống và tạo thành hồ muối khổng lồ Salar de Uyuni.')
GO
INSERT [dbo].[PostDetail] ([post_detail_id], [post_id], [content]) VALUES (3, 3, N'Là nơi khiến người ta cảm tưởng như “tận cùng của trái đất” chính là địa điểm có thể giúp những kẻ lỡ đem lòng yêu nàng cực quang có thẻ giãi bày tấm chân tình của bản thân. Khu vực này cũng là nơi có quán cà phê di động nổi tiếng Caffe Banba, vì vậy thực khách vừa có thể nhâm nhi một cốc cà phê ấm nóng, vừa ngắm nhìn vẻ đẹp của cực quang trong bình yên. Không những vậy, tại đây, những kẻ si tình mộng mơ có thể ngắm nhìn ánh sáng mờ ảo từ ngọn hải đăng chiếu trên bầu trời đêm, tạo thành những vệt sáng ngũ sắc với cơ hồ là các vì sao sáng lấp lánh tựa như đôi mắt của nàng Juliet vào đêm hội ngộ cùng chàng Romeo.')
GO
INSERT [dbo].[PostDetail] ([post_detail_id], [post_id], [content]) VALUES (4, 4, N'Cano Cristales được nhà thám hiểm Andres Hurtado phát hiện vào năm 1980. Con sông dài 62,1 dặm nằm trong vườn quốc gia Serrania de la Macarena là một trong những kỳ quan thiên nhiên ngoạn mục nhất của Colombia cũng như của thế giới nhờ màu sắc sống động của nó. Từ khoảng giữa tháng 5 đến tháng 11, dòng sông mang 5 màu rực rỡ: Đáy sông hiện lên như một bức tranh với những dòng màu đỏ tươi, vàng, lục, lam và đen. Màu sắc độc đáo này được tạo ra trong quá trình sinh sản của thực vật thủy sinh ở sông, có tên khoa học là Macarenia Clavigera, một loài thuộc họ rong sông Podostemaceae. Màu sắc khác nhau của hoa rong Macarenia Clavigera sinh sống dưới đáy sông đã tạo nên điều kỳ diệu không nơi nào khác trên thế giới có được. Bên cạnh việc chiêm ngưỡng cảnh sắc kỳ lạ của dòng sông, du khách đến đây còn bị lôi cuốn bởi hệ động thực vật hoang dã rất phong phú. Vườn quốc gia Serrania de la Macarena là nơi sinh sống của hơn 400 loài chim và nhiều loại động vật quý hiếm như rùa, cự đà và aguilas - loài chim là biểu tượng quốc gia của Colombia.')
GO
INSERT [dbo].[PostDetail] ([post_detail_id], [post_id], [content]) VALUES (5, 5, N'Ý tưởng thành lập vườn hoa này bắt đầu từ nắm 1949 của thị trưởng thành phố Lisse lúc bấy giờ với mục đích triển lãm dành cho những người trồng hoa khắp Hà Lan và Châu Âu. Vườn hoa chỉ mở cửa tiếp đón khách du lịch trong 2 tháng từ giữa tháng 3 đến giữa tháng 5. Với khuôn viên rộng khoảng 32 ha, công viên là mảnh đất sinh sôi của 4,5 triệu bông tulip thuộc 100 loại, cùng 2.500 cây hoa các loại, nâng tổng số lên 7 triệu cây thuộc 1.600 loại khác nhau. Du khách có thể ngắm nhìn hàng nghìn cây hoa mang màu sắc, hình dáng khác nhau… từ vàng tươi, trắng tinh khôi, hồng dịu dàng cho đến đỏ rực rỡ hay đen huyền bí. Loài mang màu đen có một cái tên ma mị là “Nữ hoàng bóng đêm”. Tất cả được trồng thành từng thảm, trải ra bạt ngàn vô tận. Điều đặc biệt là hoa ở công viên Keukenhof được trưng bày theo 5 khu được đặt tên theo các vị vua và nữ hoàng Hà Lan là Oranje Nassau, Wilhemina, Julinana, Beatrix và Willem Alexander. Ba gian chính là nơi thu hút rất nhiều khách du lịch bởi có 30 loại hoa và cây cảnh độc đáo nhất được chính Hội đồng chuyên gia đích thân lựa chọn. Trong hơi ấm dịu nhẹ của mùa xuân, ánh nắng vàng như rót mật xuống vườn ha, mang đến cho du khách một không gian nghệ thuật đa màu sắc với cảm giác thư thái đến lạ kì. ')
GO
INSERT [dbo].[PostDetail] ([post_detail_id], [post_id], [content]) VALUES (6, 6, N'Ruộng bậc thang là một hình thức canh tác trên đất dốc của rất nhiều dân tộc trên toàn thế giới. Thường nằm ở sườn núi, nơi có đất địa hình thoai thoải, dễ thoát nước. Nó Không những là những nơi ngắm ruộng bậc thang mỗi khi mùa lúa chín đến tuyệt đẹp mà còn là những địa điểm du lịch thu hút nhiều du khách đến chiêm ngưỡng vẻ đẹp đầy sáng tạo. Các nơi có ruộng bậc thang đẹp nhất Việt Nam như: Hoàng Su Phì, Hà Giang; Mù Cang Chải ở Yên Bái; Ruộng bậc thang ở Sapa, tỉnh Lào Cai')
GO
INSERT [dbo].[PostDetail] ([post_detail_id], [post_id], [content]) VALUES (7, 7, N'Quebrada de Humahuaca là một ví dụ điển hình của các thung lũng Nam Andean, với hệ thống truyền thông đặc biệt và sự phối hợp kinh tế, xã hội và văn hóa. Đây là mối liên kết vật lý quan trọng nhất giữa vùng đất Andes cao và vùng đồng bằng ôn đới rộng lớn ở phía đông nam Nam Mỹ. Môi trường tự nhiên ấn tượng được lưu giữ gần như nguyên vẹn, với hàng trăm địa điểm khảo cổ và kiến trúc chứng kiến lịch sử lâu dài và phong phú. Thung lũng được sử dụng như là một tuyến đường thương mại chính trong vòng 10.000 năm qua. Rải rác dọc theo thung lũng là những tàn tích rộng lớn của những khu định cư kế tiếp mà người dân đã tạo ra và sử dụng những tuyến đường tuyến tính này. Đặc biệt những tàn tích rộng lớn của các cánh đồng nông nghiệp trên tường đá ở Coctaca được cho là có nguồn gốc khoảng 1.500 năm trước và vẫn được sử dụng cho tới ngày nay; chúng được kết hợp với một chuỗi các thị trấn được gọi là pucaras. Hệ thống thực địa và các pucara cùng nhau tạo ra một cảnh quan có một không hai ở Nam Mỹ. Thung lũng vẫn tồn tại một số nhà thờ lớn nhỏ với một kiến trúc truyền thống địa phương mạnh mẽ. Hiện tại một phần người dân vẫn giữ truyền thống trong cảnh quan văn hóa nổi bật. Vì vậy, Quebrada de Humahuaca là một hệ thống di sản cực kỳ phức tạp đặc trưng bởi các yếu tố đa dạng xen lẫn cảnh quan thiên nhiên tuyệt đẹp, ấn tượng và đầy màu sắc.')
GO
INSERT [dbo].[PostDetail] ([post_detail_id], [post_id], [content]) VALUES (8, 8, N'Suối nước nóng Grand Prismatic là một hồ trũng có nhiệt độ cao nằm tại khu vực Midway Geyser Basin, thuộc hệ thống vườn quốc gia Yellowstone, bang Wyoming, Hoa Kỳ. Theo đánh giá của các chuyên gia, đây là suối nước nóng lớn nhất trên toàn lãnh thổ Hoa Kỳ và xếp thứ ba thế giới chỉ sau hai hồ nước nóng Boiling Lake của Dominica và Frying Pan Lake của New Zealand. Được tìm ra vào giai đoạn cuối thế kỷ 19, chính xác được xếp hạng đặt tên vào năm 1871. Suối có đường kính rộng khoảng 110 mét và sâu tới 50 mét. Sự vận hành địa chất làm nung nóng dòng nước ở mức 70 độ C và khiến mỗi giờ suối bốc hơi 2.100 lít nước. Điều thú vị nhất là bức tranh xung quanh Grand Prismatic giống như được tán sắc ánh sáng, chúng rực rỡ với những sắc màu nổi bật và tạo ra miệng sụt giống như con mắt ngoài hành tinh. Nếu nhìn từ trên cao xuống bạn có cảm giác như đang thấy một miệng núi lửa lớn hoạt động, điểm khác biệt là màu sắc rực rỡ của nó khiến bạn bị thôi miên ngay từ giây đầu tiên. Nguyên nhân để có được bức tranh sặc sỡ như vậy là do hàm lượng vi sinh nằm sâu bên trong khoáng chất hoạt động liên tục dẫn đến biến đổi sắc tố. Khoảng cách cân bằng giữa các sắc màu cũng phụ thuộc rất lớn vào sự tác động của dòng nhiệt chảy phía dưới. Chúng tự do dệt lên thảm bề mặt đa màu sắc từ đỏ, cam vàng, xanh nước biển, xanh lá,...')
GO
INSERT [dbo].[PostDetail] ([post_detail_id], [post_id], [content]) VALUES (9, 9, N'Dallol là miệng núi lửa phun trào tại phần đất lún Danakil ở Ethiopia. Nó được hình thành trong suốt quá trình phun trào của núi lửa vào năm 1926. Du khách có thể nhận thấy nhiều miệng núi lửa tương tự khác lấm chấm những lớp muối trắng cũng nằm trong khuôn viên núi lửa Dallol. Vùng đất xa xôi này có nhiệt độ trung bình hàng năm là 34oC (cao nhất trái đất). Nhìn thoáng qua Dallol trông rất giống với vùng suối nước nóng nổi tiếng của công viên Đá Vàng ở Mỹ nhưng diện tích của nó trải rộng hơn nhiều. Đến đây, du khách sẽ thực sự bị cuốn hút bởi vẻ đẹp ấn tượng của một vùng đất lạ kỳ với sắc màu rực rỡ của màu đỏ thẫm pha lẫn màu xanh lá cây, vàng và trắng được tạo nên từ các lớp muối, ao nước và dòng suối khoáng nóng bốc hơi. Bản phối màu đa sắc này là thành quả của hợp chất muối kali được tạo màu bởi sunfua, clorua và ôxit có trong lớp vỏ địa chất ở nơi đây. Nếu du khách yêu thích phiêu lưu, mạo hiểm và khám phá những vùng đất mới lạ thì điểm đến Dallol ở Ethiopia chính là một trong những gợi ý tuyệt vời mà du khách không nên bỏ lỡ.')
GO
INSERT [dbo].[PostDetail] ([post_detail_id], [post_id], [content]) VALUES (10, 10, N'Nơi đây có khoảng 1.260 đến 1.776 ngọn đồi hình nón với kích thước tương tự gần bằng nhau, cao trung bình khoảng từ 30 – 50m, tuy nhiên cũng có một số cao đến 120m nằm trải dài trên diện tích 50km2. Và điều kì lạ là, màu sắc của tất cả các ngọn đồi ở đây vào tất các các mùa đều giống hệt nhau, đổi màu như nhau theo các tháng trong năm. Đồi chocolate thực sự là một kỳ quan thiên nhiên hiếm có trên thế giới và đã trở thành một trong những điểm du lịch hút khách bậc nhất của Philippines bởi chính vẻ đẹp bình yên và giản dị vốn có. Ngọn đồi như một bức tranh thiên nhiên hùng vĩ vì xen giữa những ngọn đồi nằm ở vùng đồng bằng tươi tốt còn là những hang động và dòng suối tuyệt đẹp. Đa số khách du lịch thường liên tưởng những ngọn đồi độc đáo này giống như những viên kẹo chocolate khi mùa khô tới. Nhưng riêng đối với người dân bản địa có thời gian ngắm những ngọn đồi đặc biệt này qua mọi khoảnh khắc trong năm thì họ lại thấy đồi chocolate trông giống như những chiếc nhũ hoa của người thiếu nữ mới lớn. Cũng chính vì lý do đó mà những ngọn đồi chocolate này còn được người dân bản địa gọi với cái tên thân mật là Cánh đồng nhũ hoa. Có rất nhiều truyền thuyết xung quanh sự hình thành của những ngọn đồi kì lạ này. Một trong số những truyền thuyết đó là câu chuyện liên quan đến mối hận thù giữa hai vị thần khổng lồ ngày xưa, trong cuộc giao tranh họ đã ném những tảng đá và cát vào nhau hòng đánh bại đối thủ. Cuộc chiến giữa họ kéo dài trong nhiều ngày liền khiến cả hai kiệt sức, rồi sau đó quên đi điều gì làm nguyên nhân gây nên mối hận thù này và đã trở thành bạn bè. Nhưng khi rời đi, họ lại quên dọn dẹp chiến trường mà mình gây ra, vì thế hỗn độn ngày đó đã tạo nên những ngọn đồi chocolate như ngày nay.')
GO
INSERT [dbo].[PostDetail] ([post_detail_id], [post_id], [content]) VALUES (11, 11, N'Cầu Vàng Đà Nẵng được xem như một tuyệt tác kiến trúc đương đại, được giới chuyên môn đánh giá cao, và du khách đặc biệt yêu thích khi đến Đà Nẵng. Cầu Vàng Đà Nẵng là một trong những công trình đặc sắc thuộc quần thể du lịch Sun World Bà Nà Hills Đà Nẵng. Cây cầu có thiết kế vô cùng ấn tượng, mềm mại uốn cong như dải lụa vàng óng ả giữa núi rừng, được nâng niu bởi hai bàn tay khổng lồ loang lổ rêu phong, tựa như chính thiên nhiên Bà Nà đã sinh ra nó. Nằm ngay lưng chừng núi ở độ cao hơn 1400m so với mực nước biển, cây cầu nổi tiếng thế giới này dài 150m, được thiết kế để làm lối đi bộ nối liền giữa ga Marseille với vườn hoa Thiên Thai. Và chính khung cảnh thần tiên của núi Bà Nà đã tạo cảm hứng cho đội ngũ kiến trúc sư lên ý tưởng về một cây cầu được nâng đỡ trên đôi tay của một vị thần. Đứng ở vị trí đôi bàn tay, bạn có thể chiêm ngưỡng cánh rừng nguyên sinh trải dài tít tắp, xa xa là toàn cảnh thành phố Đà Nẵng xinh đẹp. Vào những ngày sương mù và mây phủ trắng xóa, cảnh quan tại Cầu Vàng trở nên huyền ảo lung linh tựa tiên cảnh.')
GO
INSERT [dbo].[PostDetail] ([post_detail_id], [post_id], [content]) VALUES (12, 12, N'Tổng diện tích của công viên quốc gia Trương Gia Giới là 4810 ha. Phong cảnh thiên nhiên của nơi đây nổi tiếng với những đỉnh núi, thung lũng và những khu rừng. Có hơn 3.000 đỉnh với hình dạng kỳ lạ như: hình người, hình thú, đồ dùng, đồ vật,…với hình ảnh chân thực và vô cùng ngoạn mục. Vườn quốc gia Trương Gia Giới cùng là nguồn cảm hứng cho những thước phim Avatar vang danh thế giới. Các điểm tham quan chính ở công viên rừng quốc gia Trương Gia Giới:  Khu thắng cảnh Nguyên Gia (Yuanjiajie); Núi Thiên Sơn (Tianzishan); Suối vàng (Jinbian); Khu thắng cảnh Yangjiajie; Khu nhà cũ (Laowu Chang),..')
GO
INSERT [dbo].[PostDetail] ([post_detail_id], [post_id], [content]) VALUES (13, 13, N'Beachy Head, vách đá màu trắng hùng vĩ với độ cao lên đến 162m nằm chênh vênh bên bờ biển nước Anh. Trước đây, “bức tường trắng” này có tên là “Beauchef” vào năm 1274 và “Beauchief” vào năm 1317, có nghĩa là “vách núi xinh đẹp”. Mãi đến tận năm 1724, cái tên Beachy Head mới được lưu vào bản đồ vĩnh viễn cho đến tận hôm nay. Là vách đá cao nhất nước Anh, Beachy Head cho phép du khách được phóng tầm mắt của mình bao quát toàn bộ đường bờ biển phía đông nam. Cụ thể, đứng trên đỉnh của Beachy Head, bạn sẽ được chiêm ngưỡng phong cảnh ngoạn mục từ Dungeness ở phía đông sang Selsey Bill ở phía Tây. Beachy Head sẽ hút hồn bạn, sẽ khiến bạn như được hòa mình vào đất trời mỗi khi đứng trên đỉnh của nó. Khi đặt chân trên thảm cỏ xanh mềm mượt, nhìn xuống là nước biển trong xanh tương phản với màu trắng của vách đá, nhìn lên là bầu trời quang đãng với những cụm mây đang rất gần bạn, phóng tầm mắt xa xa là đường chân trời mờ ảo như có như không, bạn cứ ngỡ như đang đứng ở nơi đất trời giao thoa.')
GO
INSERT [dbo].[PostDetail] ([post_detail_id], [post_id], [content]) VALUES (14, 14, N'Hồ Hamilton được hình thành từ hàng ngàn năm trước, khi sự xói mòn tự nhiên liên tục làm sụp đổ mái vòm của một con sông ngầm, tạo ra những thác nước tuyệt đẹp dẫn đến vùng nước màu ngọc lam. Nó thực sự là một kỳ quan của thành phố Austin. Một trải nghiệm bơi không thể quên được chắc chắn cho các du khách. Nước hồ có nước màu xanh lá cây, bao quanh bởi vách đá và nhũ đá lớn lơ lửng từ các cạnh của vách đá. Gần đó là thác nước cao 15 mét. Ngoài ra, các cấu trúc đá hình vòm được hình thành bên trên mặt hồ vô tình tạo bóng mát cho du khách thư giãn và tận hưởng không gian trước và sau khi bơi. Tuy nhiên, những người có trách nhiệm bảo tồn địa danh tuyệt vời này đã bày tỏ lo ngại lượng khách ghé thăm ngày càng tăng có thể ảnh hưởng đến cảnh quan tự nhiên.')
GO
INSERT [dbo].[PostDetail] ([post_detail_id], [post_id], [content]) VALUES (15, 15, N'Hinatuan Enchanted (dòng Hinatuan mê hoặc) là cái tên mà nhà ngoại giao Modesto Farolan đã đặt khi phát hiện ra dòng sông này. Vẻ đẹp của dòng sông này ấn tượng đến nỗi Modesto Farolan đã làm hẳn một bài thơ mang tên “Rio Encantado” để miêu tả vẻ đẹp lung linh của nó. Với dòng nước luôn đầy ắp và màu nước trong xanh đến lạ thường, con sông Hinatuan Enchanted đã là nguồn cảm hứng cho nhiều câu chuyện huyền bí tại địa phương. Một số truyện cổ cho rằng những nàng tiên mang đến màu xanh ngọc bích và đổ vào dòng sông, tạo thành những sắc xanh lấp lánh độc đáo. Ngược lại, một số người lại cho rằng dòng sông bị ám bởi phù thủy hay thế lực siêu nhiên đáng sợ nào đó, nên hầu như không thể bắt được cá dù đã dùng rất nhiều cách. Tuy nhiên với những người dân địa phương ở đây, dòng sông này rất linh thiêng và họ cũng không dám đánh bắt hay bơi lội gì tại đây. Họ còn tin rằng, khi tất cả say ngủ, nơi này còn là chốn hẹn hò của các nàng tiên cá. Khi tiên cá chạm vào nước, các gợn sóng trên mặt sông dường như tan biến và Hinatuan trở nên trong vắt như một chiếc gương soi. Hiện nay, khu vực xung quanh sông đã du lịch hóa nhiều nhưng cảm giác thần bí mà dòng sông mang lại vẫn còn nguyên vẹn với người dân. Nhiều người tin rằng đối với những vị khách không biết tôn trọng dòng sông, khi tắm dưới đây sẽ gặp phải những điều phiền toái. Lần mở cửa gần đây nhất, chính quyền Philippines cũng đã cấm du khách bơi lội trên sông, chỉ được phép ngắm cảnh và chụp ảnh.')
GO
INSERT [dbo].[PostDetail] ([post_detail_id], [post_id], [content]) VALUES (16, 16, N'Mênh mông và kỳ vĩ - hồ Baikal được xem là viên ngọc xanh của vùng Siberia, một trong những địa danh du lịch nổi tiếng nhất của nước Nga. Phần lớn nghiên cứu cho rằng hồ Baikal đã được hình thành từ khoảng 25 - 30 triệu năm trước. Cổ nhất, rộng nhất và sâu nhất thế giới, có nhiều lý do để đến với hồ Baikal. Người ta nói rằng, có hơn 300 con sông đã đổ về đây và hồ Baikal đang lưu giữ 1/5 lượng nước ngọt trên thế giới. Với vẻ đẹp thiên nhiên độc đáo cùng thảm động thực vật phong phú, hồ Baikal đã được UNESCO công nhận là di sản thế giới vào năm 1996. Hàng năm rất nhiều du khách vẫn đến đây, đến với những bí ẩn và truyền thuyết về vùng đất thiêng của người Buryatia. Có nhiều câu chuyện dân gian về hồ Baikal, về nguồn nước tinh khiết và thiêng liêng. Người ta nói rằng, đến Baikal nhất định phải đến đủ mùa thì mới thấy đủ màu sắc của nước và thấy hết vẻ đẹp cuộc sống nơi đây.')
GO
INSERT [dbo].[PostDetail] ([post_detail_id], [post_id], [content]) VALUES (19, 19, N'Núi lửa Bromo nằm ở phía đông Java, Indonesia. Không xa Bali nên thường khi đi Bali dài ngày thì nên kết hợp dành ra 1.5 ngày để khám phá núi lửa Bromo đặc biệt thú vị. Đến Bromo đa phần phải đến vào buổi sáng sớm là đẹp nhất để còn ngắm bình minh nên đa phần có các tour du lịch đưa khách đến núi lửa bằng xe Jeep, hoặc khách muốn thì tự cuốc bộ 2 cẳng trekking. Khí hậu của Indonesia không giống với Việt Nam khi mùa mưa là từ tháng 5 cho tới tháng 10. Thì ở Indonesia, đây là khoảng thời gian mùa khô với tiết trời nắng đẹp và không khí trong lành nhất trong năm. Chính vì vậy, đây là thời điểm thích hợp nhất để bạn có thể thực hiện chuyến chinh phục núi lửa Bromo. ')
GO
INSERT [dbo].[PostDetail] ([post_detail_id], [post_id], [content]) VALUES (20, 20, N'Hòn đảo nổi tiếng từng xuất hiện trong bộ phim Hàn Quốc đình đám gây chấn động của châu Á “Hậu duệ mặt trời”. Hãy cùng hệ thống vé máy bay giá rẻ khám phá nơi này qua bài viết dưới đây bạn nhé. Zakynthos là đảo lớn thứ ba của quần đảo Ionia, Zakynthos có hình dạng của một đầu mũi tên, với đỉnh chỉ về phía tây bắc. Phần phía tây của đảo là một cao nguyên đồi núi trập trùng được phủ một màu xanh ngắt như viên ngọc tỏa sáng giữa đại dương. Bờ biển phía tây nam chủ yếu là các vách đá dựng đứng hùng vĩ khiến người khác phải choáng ngợp mỗi khi chiêm ngưỡng. Phần phía đông là một vùng đồng bằng màu mỡ đông dân cư, với các bãi biển trải dài ngút ngàn bên bãi cát trắng mịn đôi lúc bị ngắt quãng bởi những dãy núi đâm thẳng ra biển như con quái thú khổng lồ trườn trên bãi cát. ')
GO
INSERT [dbo].[PostDetail] ([post_detail_id], [post_id], [content]) VALUES (21, 21, N'Nằm giữa biên giới Brazil và Argentina, thác Iguazu được cả hai quốc gia ra sức bảo vệ và thu hút hàng trăm nghìn du khách đến đây tham quan và nghỉ dưỡng. Thác Iguazu được người Tây Ban Nha phát hiện ra lần đầu tiên vào năm 1541. Tên thác gọi theo tiếng bản địa Guarani gồm hai âm "I" là lớn và "Guazu" là nước có nghĩa là “nước lớn”. Thác nước hình thành từ sự phun trào của núi lửa, tạo nên khe nứt trong lòng đất. Dòng dung nham rực lửa ngày trước bây giờ đã biến thành những dải nước nối nhau chảy xuống dòng sông xanh mát. Một truyền thuyết của những thổ dân da đỏ lại cho rằng sự hình thành của thác Iguazu là kết quả của sự ghen tuông của một vị thần. Chuyện kể rằng, có một thuỷ thần đã lên kế hoạch kết hôn với một thiếu nữ xinh đẹp ở trần gian tên là Naipi con gái của tộc trưởng ở đây. Nhưng cô gái không chấp nhận và bỏ trốn cùng người yêu của mình là chiến binh Taroba trên chiếc thuyền độc mộc. Trong cơn phẫn nộ, vị thần đã tạo ra một dòng thác khổng lồ để nhấn chìm chiếc thuyền của họ. Cũng từ đó, trên dòng sông Iguazu đã xuất hiện dòng thác lớn tồn tại cho đến bây giờ.')
GO
INSERT [dbo].[PostDetail] ([post_detail_id], [post_id], [content]) VALUES (22, 22, N'Huacachina, một ốc đảo sa mạc gồm một thị trấn nhỏ thư giãn rất gần Ica với nhiệt độ quanh năm 25 - 30 độ. Bức tường cát bao quanh thị trấn này đang thấp xuống và cũng làm cho nó thêm nóng vào ban ngày vì vậy nên uống nhiều nước và sử dụng đủ kem chống nắng. Ốc đảo này được hình thành nhờ một dòng nước ngầm, tạo ra sự phát triển của thực vật và cây cối giữa sa mạc. Hiện tại, có những nỗ lực đang được tiến hành để bảo tồn ốc đảo, và để giúp bảo tồn thảm thực vật được tạo thành từ cây cọ, bạch đàn và cây carob. Ở trong ốc đảo sa mạc Huacachina, bơi trong đầm và chào thuyền là một trải nghiệm du lịch thực sự thú vị. Tuy nhiên ốc đảo sa mạc ở Peru này không có nhiều lựa chọn tuyệt vời về các nhà hàng. Về cơ bản có hai lựa chọn tốt; Casa de Tre và Olive Wild. Bạn cần lưu ý: không có máy ATM nào ở Huacachina. ')
GO
INSERT [dbo].[PostDetail] ([post_detail_id], [post_id], [content]) VALUES (23, 23, N'Làng chài Cửa Vạn nằm trong vùng biển lặng sóng, được bao bọc xung quanh bởi núi đá Vạ Giá. Làng chài nổi tiếng ở Hạ Long này có nguồn gốc từ hai làng chài cổ là Trúc Võng và Giang Võng, nơi sinh sống của 176 hộ dân làm nghề chài lưới. Để tham quan làng chài Cửa Cạn, bạn có thể thuê du thuyền ngủ đêm, sau đó tự do khám phá cảnh đẹp bằng cách chèo thuyền nan hoặc thuyền kayak. Ghé thăm làng chài Cửa Vạn du khách sẽ được chiêm ngưỡng cảnh đẹp sơn thủy hữu tình, không gian yên bình. Có cơ hội tìm hiểu về cuộc sống của ngư dân nơi đây và được trải nghiệm đi giăng lưới, chèo thuyền và thả câu bắt tôm cá. Trải nghiệm thú vị mà bạn không nên bỏ qua khi tới làng chài Cửa Vạn đó là, được chèo thuyền tham quan quanh làng và cùng ngư dân đi câu mực, kéo chài lưới vào ban đêm. Cùng thưởng thức những thành quả tươi rói sau khi đánh bắt ngay trên ghe thuyền hoặc ủ đá mang về.')
GO
INSERT [dbo].[PostDetail] ([post_detail_id], [post_id], [content]) VALUES (24, 24, N'Từ những năm 1950, Positano đã là tâm điểm chú ý, ít nhất của giới văn nghệ sĩ hay những tên tuổi nổi tiếng thời ấy như nữ diễn viên Sophia Lorenz, danh họa Pablo Picasso cũng như giới thượng lưu giàu có. Họ đến đây để hưởng nắng ấm, gió mát và biển cả mênh mông. Positano ngày xưa là một điểm đến sang trọng và hôm nay vẫn như thế, cái khác là hiện tại không chỉ có các ngôi sao màn bạc mà còn hàng triệu du khách ghé đây mỗi năm. Đến bằng tàu thủy hay vẫn còn lâng lâng say xe sau hàng loạt khúc cua tay áo khi đi bằng ôtô hoặc xe buýt, ấn tượng đầu tiên của du khách là các ngõ nhỏ với những bậc thang lên cao tít tắp, hệt như nhà văn John Steinbeck từng nhận xét: Positano là một thế giới “dựng đứng”. Những ngõ nhỏ men theo sườn núi đưa người ta đi qua nhiều ngôi nhà với những hàng rào nhiều sắc hoa rực rỡ, nhìn từ xa tưởng chừng như chúng được chồng chất lên nhau trong trò chơi xếp lego. Nhà ở đây buộc phải xây dựng chất chồng lên cao như thế bởi đất vùng bờ biển nhỏ hẹp này quá hiếm.')
GO
INSERT [dbo].[PostDetail] ([post_detail_id], [post_id], [content]) VALUES (25, 25, N'Hiếm có nơi nào màu đỏ lại ngập tràn như ở Marrakesh, nhà cửa, tường thành, kể cả nền ngõ phố cũng được sơn hồng hoặc đỏ. Thành phố Bắc Phi này có cuộc sống đa dạng nhiều chiều, bí ẩn và vô cùng quyến rũ. Marrakech là một thành phố lớn của  Morocco. Đây là thành phố lớn thứ tư của nước này, sau Casablanca, Fes và Tangier. Marrakesh nằm ở Tây Nam, từng là kinh đô của  Morocco một thời, đóng vị trí quan trọng trong tuyến đường buôn bán xuyên sa mạc Sahara. Lịch sử hình thành và phát triển của Marrakesh trải qua nhiều thời kỳ. Từ thế kỷ XIII, Marrakesh không còn là kinh đô, nhưng vẫn là một trong bốn hoàng thành của  Morocco, là trung tâm thương mại quan trọng. Marrakesh còn là một trong những thành phố nghệ thuật của  Morocco, một địa điểm du lịch quốc nội và quốc tế. Ở Morocco, mỗi thành phố đều hình thành những khu medina từ hàng trăm đến hàng nghìn năm trước. Nơi đây là nơi sinh sống, làm việc, các khu chợ trao đổi mua bán các sản vật địa phương, những làng nghề thủ công mỹ nghệ độc đáo được hình thành trong khu vực này và được chia ra theo từng khu vực như chạm khắc gỗ, thuộc da, hàng mã, hàng đồ đồng... ')
GO
SET IDENTITY_INSERT [dbo].[PostDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 
GO
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (1, N'Admin')
GO
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (2, N'Guest')
GO
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (3, N'Viewer')
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 
GO
INSERT [dbo].[Service] ([service_id], [service_name], [price], [iconclass]) VALUES (1, N'Nơi nghỉ dưỡng', 10000000.0000, N'fa-solid fa-house')
GO
INSERT [dbo].[Service] ([service_id], [service_name], [price], [iconclass]) VALUES (2, N'Nhà hàng', 10000000.0000, N'fa-solid fa-utensils')
GO
INSERT [dbo].[Service] ([service_id], [service_name], [price], [iconclass]) VALUES (3, N'Khách sạn', 1000000.0000, N'fa-solid fa-hotel')
GO
INSERT [dbo].[Service] ([service_id], [service_name], [price], [iconclass]) VALUES (4, N'Tour', 2000000.0000, N'fa-sharp fa-solid fa-compass')
GO
INSERT [dbo].[Service] ([service_id], [service_name], [price], [iconclass]) VALUES (5, N'Booking vé máy bay', 700000.0000, N'fa-solid fa-plane')
GO
INSERT [dbo].[Service] ([service_id], [service_name], [price], [iconclass]) VALUES (6, N'Đặt vé tàu hỏa', 600000.0000, N'fa-solid fa-train')
GO
INSERT [dbo].[Service] ([service_id], [service_name], [price], [iconclass]) VALUES (7, N'Mua vé tàu biển', 800000.0000, N'fa-solid fa-ship')
GO
INSERT [dbo].[Service] ([service_id], [service_name], [price], [iconclass]) VALUES (8, N'Thuê phiên dịch viên', 3000000.0000, N'fa-solid fa-language')
GO
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (1, 2)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (1, 3)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (1, 4)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (1, 6)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (2, 2)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (2, 5)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (2, 7)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (3, 1)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (3, 2)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (3, 8)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (4, 1)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (4, 3)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (5, 5)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (5, 6)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (5, 7)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (5, 8)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (6, 1)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (6, 2)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (7, 1)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (8, 2)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (9, 3)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (9, 4)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (10, 5)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (10, 6)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (11, 5)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (11, 7)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (11, 8)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (12, 3)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (12, 4)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (13, 1)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (13, 2)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (13, 4)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (14, 5)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (15, 6)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (15, 7)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (16, 4)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (16, 5)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (16, 6)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (16, 7)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (16, 8)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (19, 4)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (19, 5)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (19, 6)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (20, 6)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (20, 7)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (20, 8)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (21, 2)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (21, 3)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (21, 4)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (21, 5)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (22, 1)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (23, 2)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (23, 3)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (24, 4)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (25, 5)
GO
INSERT [dbo].[service_of] ([post_id], [service_id]) VALUES (25, 6)
GO
SET IDENTITY_INSERT [dbo].[Vehicle] ON 
GO
INSERT [dbo].[Vehicle] ([vehicle_id], [vehicle_name]) VALUES (1, N'Máy Bay')
GO
INSERT [dbo].[Vehicle] ([vehicle_id], [vehicle_name]) VALUES (2, N'Ô tô')
GO
INSERT [dbo].[Vehicle] ([vehicle_id], [vehicle_name]) VALUES (3, N'Tàu biển')
GO
INSERT [dbo].[Vehicle] ([vehicle_id], [vehicle_name]) VALUES (4, N'Tàu hỏa')
GO
INSERT [dbo].[Vehicle] ([vehicle_id], [vehicle_name]) VALUES (5, N'Đi bộ')
GO
INSERT [dbo].[Vehicle] ([vehicle_id], [vehicle_name]) VALUES (6, N'Những phương tiện khác')
GO
SET IDENTITY_INSERT [dbo].[Vehicle] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__AB6E6164266ECD58]    Script Date: 3/15/2023 1:14:10 AM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((1)) FOR [gender]
GO
ALTER TABLE [dbo].[Comment] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[Post] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[Post] ADD  DEFAULT ('https://hadowa.vn/wp-content/themes/ryse/assets/images/no-image/No-Image-Found-400x264.png') FOR [image_link]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [dbo].[Post] ([post_id])
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([vehicle_id])
REFERENCES [dbo].[Vehicle] ([vehicle_id])
GO
ALTER TABLE [dbo].[PostDetail]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [dbo].[Post] ([post_id])
GO
ALTER TABLE [dbo].[service_of]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [dbo].[Post] ([post_id])
GO
ALTER TABLE [dbo].[service_of]  WITH CHECK ADD FOREIGN KEY([service_id])
REFERENCES [dbo].[Service] ([service_id])
GO
