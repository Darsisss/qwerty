USE [master]
GO
/****** Object:  Database [TradeDB]    Script Date: 04.04.2023 16:43:34 ******/
CREATE DATABASE [TradeDB]
GO
USE [TradeDB]
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) PRIMARY KEY,
	[Name] [nvarchar](100) NOT NULL
)
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) PRIMARY KEY,
	[Value] [nvarchar](50) NOT NULL,
)
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) PRIMARY KEY,
	[Surname] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Patronymic] [nvarchar](100) NOT NULL,
	[Login] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Role] [int] NOT NULL,
	FOREIGN KEY([Role]) REFERENCES [Role] ([Id])
)
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) PRIMARY KEY,
	[Value] [nvarchar](50) NOT NULL
)
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) PRIMARY KEY,
	[Value] [nvarchar](50) NOT NULL
)
GO
CREATE TABLE [dbo].[Manufacter](
	[Id] [int] IDENTITY(1,1) PRIMARY KEY,
	[Value] [nvarchar](50) NOT NULL,
)
GO
CREATE TABLE [dbo].[PickupPoint](
	[Id] [int] IDENTITY(1,1) PRIMARY KEY,
	[Index] [int] NOT NULL,
	[City] [int] NOT NULL,
	[Street] [nvarchar](50) NOT NULL,
	[HomeNumber] [nvarchar](10) NOT NULL,
	FOREIGN KEY([City]) REFERENCES [City] ([Id])
)
GO
CREATE TABLE [dbo].[Product](
	[ArticleNumber] [nvarchar](100) PRIMARY KEY,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Photo] [nvarchar](50) NULL,
	[ManufacturerId] [int] NOT NULL,
	[Cost] [decimal](19, 4) NOT NULL,
	[DiscountAmount] [int] NULL,
	[QuantityInStock] [int] NOT NULL,
	[MaxDiscountAmount] [int] NULL,
	FOREIGN KEY([CategoryId]) REFERENCES [Category] ([Id]),
	FOREIGN KEY([ManufacturerId]) REFERENCES [Manufacter] ([Id])
)
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) PRIMARY KEY,
	[Status] [int] NOT NULL,
	[DeliveryDate] [datetime] NOT NULL,
	[PickupPointId] [int] NOT NULL,
	FOREIGN KEY([PickupPointId]) REFERENCES [PickupPoint] ([Id]),
	FOREIGN KEY([Status]) REFERENCES [Status] ([Id])
)
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderId] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	PRIMARY KEY(OrderId, ProductArticleNumber),
	FOREIGN KEY([OrderId]) REFERENCES [Order] ([Id]),
	FOREIGN KEY([ProductArticleNumber]) REFERENCES [Product] ([ArticleNumber])
)
GO

SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Value]) VALUES (1, N'Общестроительные материалы')
INSERT [dbo].[Category] ([Id], [Value]) VALUES (2, N'Стеновые и фасадные материалы')
INSERT [dbo].[Category] ([Id], [Value]) VALUES (3, N'Сухие строительные смеси и гидроизоляция')
INSERT [dbo].[Category] ([Id], [Value]) VALUES (4, N'Ручной инструмент')
INSERT [dbo].[Category] ([Id], [Value]) VALUES (5, N'Защита лица, глаз, головы')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([Id], [Value]) VALUES (1, N'Сыктывкар')
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Manufacter] ON 

INSERT [dbo].[Manufacter] ([Id], [Value]) VALUES (1, N'М500')
INSERT [dbo].[Manufacter] ([Id], [Value]) VALUES (2, N'Изостронг')
INSERT [dbo].[Manufacter] ([Id], [Value]) VALUES (3, N'Knauf')
INSERT [dbo].[Manufacter] ([Id], [Value]) VALUES (4, N'MixMaster')
INSERT [dbo].[Manufacter] ([Id], [Value]) VALUES (5, N'ЛСР')
INSERT [dbo].[Manufacter] ([Id], [Value]) VALUES (6, N'ВОЛМА')
INSERT [dbo].[Manufacter] ([Id], [Value]) VALUES (7, N'Vinylon')
INSERT [dbo].[Manufacter] ([Id], [Value]) VALUES (8, N'Павловский завод ')
INSERT [dbo].[Manufacter] ([Id], [Value]) VALUES (9, N'Weber')
INSERT [dbo].[Manufacter] ([Id], [Value]) VALUES (10, N'Hesler')
INSERT [dbo].[Manufacter] ([Id], [Value]) VALUES (11, N'Armero')
INSERT [dbo].[Manufacter] ([Id], [Value]) VALUES (12, N'Wenzo Roma')
INSERT [dbo].[Manufacter] ([Id], [Value]) VALUES (13, N'KILIMGRIN')
INSERT [dbo].[Manufacter] ([Id], [Value]) VALUES (14, N'Исток')
INSERT [dbo].[Manufacter] ([Id], [Value]) VALUES (15, N'RUIZ')
INSERT [dbo].[Manufacter] ([Id], [Value]) VALUES (16, N'Husqvarna')
INSERT [dbo].[Manufacter] ([Id], [Value]) VALUES (17, N'Delta')
SET IDENTITY_INSERT [dbo].[Manufacter] OFF
GO
SET IDENTITY_INSERT [dbo].[PickupPoint] ON 

INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (1, 344288, 1, N' Чехова', N'1')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (2, 614164, 1, N'Степная', N'30')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (3, 394242, 1, N' Коммунистическая', N'43')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (4, 660540, 1, N' Солнечная', N'25')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (5, 125837, 1, N' Шоссейная', N'40')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (6, 125703, 1, N' Партизанская', N'49')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (7, 625283, 1, N' Победы', N'46')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (8, 614611, 1, N' Молодежная', N'50')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (9, 454311, 1, N' Новая', N'19')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (10, 660007, 1, N' Октябрьская', N'19')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (11, 603036, 1, N' Садовая', N'4')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (12, 450983, 1, N' Комсомольская', N'26')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (13, 394782, 1, N' Чехова', N'3')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (14, 603002, 1, N' Дзержинского', N'28')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (15, 450558, 1, N' Набережная', N'30')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (16, 394060, 1, N' Фрунзе', N'43')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (17, 410661, 1, N' Школьная', N'50')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (18, 625590, 1, N' Коммунистическая', N'20')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (19, 625683, 1, N' 8 Марта', N'')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (20, 400562, 1, N' Зеленая', N'32')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (21, 614510, 1, N' Маяковского', N'47')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (22, 410542, 1, N' Светлая', N'46')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (23, 620839, 1, N' Цветочная', N'8')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (24, 443890, 1, N' Коммунистическая', N'1')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (25, 603379, 1, N' Спортивная', N'46')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (26, 603721, 1, N' Гоголя', N'41')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (27, 410172, 1, N' Северная', N'13')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (28, 420151, 1, N' Вишневая', N'32')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (29, 125061, 1, N' Подгорная', N'8')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (30, 630370, 1, N' Шоссейная', N'24')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (31, 614753, 1, N' Полевая', N'35')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (32, 426030, 1, N' Маяковского', N'44')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (33, 450375, 1, N'Клубная', N'44')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (34, 625560, 1, N' Некрасова', N'12')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (35, 630201, 1, N' Комсомольская', N'17')
INSERT [dbo].[PickupPoint] ([Id], [Index], [City], [Street], [HomeNumber]) VALUES (36, 190949, 1, N' Мичурина', N'26')
SET IDENTITY_INSERT [dbo].[PickupPoint] OFF
GO
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [CategoryId], [Photo], [ManufacturerId], [Cost], [DiscountAmount], [QuantityInStock], [MaxDiscountAmount]) VALUES (N'0YGHZ7', N'Очки защитные ', N'Очки защитные Husqvarna Clear (5449638-01) открытые с прозрачными линзами', 5, NULL, 16, CAST(700.0000 AS Decimal(19, 4)), 9, 36, 9)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [CategoryId], [Photo], [ManufacturerId], [Cost], [DiscountAmount], [QuantityInStock], [MaxDiscountAmount]) VALUES (N'2G3280', N'Угол наружный', N'Угол наружный Vinylon 3050 мм серо-голубой', 2, N'2G3280.jpg', 7, CAST(795.0000 AS Decimal(19, 4)), 9, 20, 16)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [CategoryId], [Photo], [ManufacturerId], [Cost], [DiscountAmount], [QuantityInStock], [MaxDiscountAmount]) VALUES (N'3L7RCZ', N'Газобетон', N'Газобетон ЛСР 100х250х625 мм D400', 2, N'3L7RCZ.jpg', 5, CAST(7400.0000 AS Decimal(19, 4)), 2, 20, 7)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [CategoryId], [Photo], [ManufacturerId], [Cost], [DiscountAmount], [QuantityInStock], [MaxDiscountAmount]) VALUES (N'3XBOTN', N'Керамзит фракция', N'Керамзит фракция 10-20 мм 0,05 куб.м', 1, N'3XBOTN.jpg', 4, CAST(110.0000 AS Decimal(19, 4)), 5, 21, 14)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [CategoryId], [Photo], [ManufacturerId], [Cost], [DiscountAmount], [QuantityInStock], [MaxDiscountAmount]) VALUES (N'4JR1HN', N'Шпатель', N'Шпатель малярный 100 мм с пластиковой ручкой', 4, NULL, 10, CAST(26.0000 AS Decimal(19, 4)), 6, 7, 3)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [CategoryId], [Photo], [ManufacturerId], [Cost], [DiscountAmount], [QuantityInStock], [MaxDiscountAmount]) VALUES (N'4WZEOT', N'Лезвие для ножа ', N'Лезвие для ножа Armero 18 мм прямое (10 шт.)', 4, NULL, 11, CAST(110.0000 AS Decimal(19, 4)), 6, 17, 2)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [CategoryId], [Photo], [ManufacturerId], [Cost], [DiscountAmount], [QuantityInStock], [MaxDiscountAmount]) VALUES (N'61PGH3', N'Очки защитные', N'Очки защитные Delta Plus KILIMANDJARO (KILIMGRIN) открытые с прозрачными линзами', 5, NULL, 13, CAST(184.0000 AS Decimal(19, 4)), 6, 25, 2)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [CategoryId], [Photo], [ManufacturerId], [Cost], [DiscountAmount], [QuantityInStock], [MaxDiscountAmount]) VALUES (N'81F1WG', N'Каска защитная', N'Каска защитная Delta Plus BASEBALL DIAMOND V UP (DIAM5UPBCFLBS) белая', 5, NULL, 17, CAST(1500.0000 AS Decimal(19, 4)), 2, 13, 1)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [CategoryId], [Photo], [ManufacturerId], [Cost], [DiscountAmount], [QuantityInStock], [MaxDiscountAmount]) VALUES (N'83M5ME', N'Кисть', N'Кисть плоская смешанная щетина 100х12 мм для красок и антисептиков на водной основе', 4, NULL, 11, CAST(122.0000 AS Decimal(19, 4)), 9, 26, 16)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [CategoryId], [Photo], [ManufacturerId], [Cost], [DiscountAmount], [QuantityInStock], [MaxDiscountAmount]) VALUES (N'ASPXSG', N'Ровнитель', N'Ровнитель (наливной пол) финишный Weber.vetonit 4100 самовыравнивающийся высокопрочный 20 кг', 3, NULL, 9, CAST(711.0000 AS Decimal(19, 4)), 10, 20, 17)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [CategoryId], [Photo], [ManufacturerId], [Cost], [DiscountAmount], [QuantityInStock], [MaxDiscountAmount]) VALUES (N'BPV4MM', N'Пленка техническая', N'Пленка техническая полиэтиленовая Изостронг 60 мк 3 м рукав 1,5 м, пог.м', 1, N'BPV4MM.jpg', 2, CAST(8.0000 AS Decimal(19, 4)), 8, 2, 13)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [CategoryId], [Photo], [ManufacturerId], [Cost], [DiscountAmount], [QuantityInStock], [MaxDiscountAmount]) VALUES (N'EQ6RKO', N'Подшлемник', N'Подшлемник для каски одноразовый', 5, NULL, 16, CAST(36.0000 AS Decimal(19, 4)), 3, 22, 17)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [CategoryId], [Photo], [ManufacturerId], [Cost], [DiscountAmount], [QuantityInStock], [MaxDiscountAmount]) VALUES (N'F895RB', N'Песок строительный', N'Песок строительный 50 кг', 1, N'F895RB.jpg', 3, CAST(102.0000 AS Decimal(19, 4)), 6, 7, 17)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [CategoryId], [Photo], [ManufacturerId], [Cost], [DiscountAmount], [QuantityInStock], [MaxDiscountAmount]) VALUES (N'GN6ICZ', N'Каска защитная ', N'Каска защитная Исток (КАС001О) оранжевая', 5, NULL, 14, CAST(154.0000 AS Decimal(19, 4)), 6, 8, 10)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [CategoryId], [Photo], [ManufacturerId], [Cost], [DiscountAmount], [QuantityInStock], [MaxDiscountAmount]) VALUES (N'I6MH89', N'Валик', N'Валик Wenzo Roma полиакрил 250 мм ворс 18 мм для красок грунтов и антисептиков на водной основе с рукояткой', 4, NULL, 12, CAST(326.0000 AS Decimal(19, 4)), 6, 3, 12)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [CategoryId], [Photo], [ManufacturerId], [Cost], [DiscountAmount], [QuantityInStock], [MaxDiscountAmount]) VALUES (N'JVL42J', N'Пленка техническая', N'Пленка техническая полиэтиленовая Изостронг 100 мк 3 м рукав 1,5 м, пог.м', 1, N'JVL42J.jpg', 2, CAST(13.0000 AS Decimal(19, 4)), 4, 34, 1)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [CategoryId], [Photo], [ManufacturerId], [Cost], [DiscountAmount], [QuantityInStock], [MaxDiscountAmount]) VALUES (N'K0YACK', N'Смесь цементно-песчаная', N'Смесь цементно-песчаная (ЦПС) 300 по ТУ MixMaster Универсал 25 кг', 3, NULL, 4, CAST(160.0000 AS Decimal(19, 4)), 8, 19, 9)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [CategoryId], [Photo], [ManufacturerId], [Cost], [DiscountAmount], [QuantityInStock], [MaxDiscountAmount]) VALUES (N'LPDDM4', N'Штукатурка гипсовая', N'Штукатурка гипсовая Knauf Ротбанд 30 кг', 3, NULL, 3, CAST(500.0000 AS Decimal(19, 4)), 6, 38, 17)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [CategoryId], [Photo], [ManufacturerId], [Cost], [DiscountAmount], [QuantityInStock], [MaxDiscountAmount]) VALUES (N'LQ48MW', N'Штукатурка гипсовая', N'Штукатурка гипсовая Knauf МП-75 машинная 30 кг', 3, NULL, 9, CAST(462.0000 AS Decimal(19, 4)), 6, 33, 16)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [CategoryId], [Photo], [ManufacturerId], [Cost], [DiscountAmount], [QuantityInStock], [MaxDiscountAmount]) VALUES (N'M26EXW', N'Клей для плитки, керамогранита и камня', N'Клей для плитки, керамогранита и камня Крепс Усиленный серый (класс С1) 25 кг', 3, NULL, 3, CAST(340.0000 AS Decimal(19, 4)), 8, 2, 8)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [CategoryId], [Photo], [ManufacturerId], [Cost], [DiscountAmount], [QuantityInStock], [MaxDiscountAmount]) VALUES (N'MIO8YV', N'Кирпич', N'Кирпич рядовой Боровичи полнотелый М150 250х120х65 мм 1NF', 2, N'MIO8YV.jpg', 6, CAST(30.0000 AS Decimal(19, 4)), 9, 31, 9)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [CategoryId], [Photo], [ManufacturerId], [Cost], [DiscountAmount], [QuantityInStock], [MaxDiscountAmount]) VALUES (N'O43COU', N'Шпаклевка', N'Шпаклевка полимерная Weber.vetonit LR + для сухих помещений белая 20 кг', 3, NULL, 6, CAST(750.0000 AS Decimal(19, 4)), 1, 16, 9)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [CategoryId], [Photo], [ManufacturerId], [Cost], [DiscountAmount], [QuantityInStock], [MaxDiscountAmount]) VALUES (N'PMEZMH', N'Цемент', N'Цемент Евроцемент М500 Д0 ЦЕМ I 42,5 50 кг', 1, N'PMEZMH.jpg', 1, CAST(440.0000 AS Decimal(19, 4)), 8, 34, 10)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [CategoryId], [Photo], [ManufacturerId], [Cost], [DiscountAmount], [QuantityInStock], [MaxDiscountAmount]) VALUES (N'QHNOKR', N'Маска защитная', N'Маска защитная Исток (ЩИТ001) ударопрочная и термостойкая', 5, NULL, 14, CAST(251.0000 AS Decimal(19, 4)), 2, 22, 6)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [CategoryId], [Photo], [ManufacturerId], [Cost], [DiscountAmount], [QuantityInStock], [MaxDiscountAmount]) VALUES (N'S72AM3', N'Пазогребневая плита ', N'Пазогребневая плита ВОЛМА Гидро 667х500х80 мм полнотелая', 2, N'S72AM3.jpg', 6, CAST(500.0000 AS Decimal(19, 4)), 5, 35, 9)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [CategoryId], [Photo], [ManufacturerId], [Cost], [DiscountAmount], [QuantityInStock], [MaxDiscountAmount]) VALUES (N'UER2QD', N'Скоба для пазогребневой плиты', N'Скоба для пазогребневой плиты Knauf С1 120х100 мм', 2, N'UER2QD.jpg', 3, CAST(25.0000 AS Decimal(19, 4)), 8, 27, 20)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [CategoryId], [Photo], [ManufacturerId], [Cost], [DiscountAmount], [QuantityInStock], [MaxDiscountAmount]) VALUES (N'Z3LO0U', N'Очки защитные ', N'Очки защитные Delta Plus RUIZ (RUIZ1VI) закрытые с прозрачными линзами', 5, NULL, 15, CAST(228.0000 AS Decimal(19, 4)), 9, 11, 19)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [CategoryId], [Photo], [ManufacturerId], [Cost], [DiscountAmount], [QuantityInStock], [MaxDiscountAmount]) VALUES (N'Z3XFSP', N'Нож строительный ', N'Нож строительный Hesler 18 мм с ломающимся лезвием пластиковый корпус', 4, NULL, 10, CAST(63.0000 AS Decimal(19, 4)), 8, 5, 19)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [CategoryId], [Photo], [ManufacturerId], [Cost], [DiscountAmount], [QuantityInStock], [MaxDiscountAmount]) VALUES (N'ZKQ5FF', N'Лезвие для ножа ', N'Лезвие для ножа Hesler 18 мм прямое (10 шт.)', 4, NULL, 10, CAST(65.0000 AS Decimal(19, 4)), 6, 6, 13)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [CategoryId], [Photo], [ManufacturerId], [Cost], [DiscountAmount], [QuantityInStock], [MaxDiscountAmount]) VALUES (N'ZR70B4', N'Кирпич', N'Кирпич рядовой силикатный Павловский завод полнотелый М200 250х120х65 мм 1NF', 2, NULL, 8, CAST(16.0000 AS Decimal(19, 4)), 3, 26, 3)
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([Id], [Value]) VALUES (1, N'Новый')
INSERT [dbo].[Status] ([Id], [Value]) VALUES (2, N'Завершен')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (1, N'Басова', N'Амина', N'Кирилловна', N'klh7pi4rcbtz@gmail.com', N'2L6KZG', 1)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (2, N'Михайлов', N'Андрей', N'Денисович', N'gn0354mbiork@outlook.com', N'uzWC67', 1)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (3, N'Сидоров', N'Егор', N'Александрович', N'1o4l05k8dwpv@yahoo.com', N'8ntwUp', 1)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (4, N'Аксенова', N'Ульяна', N'Ивановна', N'hsqixl2vebuz@mail.com', N'YOyhfR', 2)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (5, N'Васильева', N'Камила', N'Ивановна', N'towkse0hf26b@outlook.com', N'RSbvHv', 2)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (6, N'Ильин', N'Артём', N'Родионович', N'khx0ncdwz4uj@gmail.com', N'rwVDh9', 2)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (7, N'Васильева', N'Василиса', N'Фёдоровна', N'01zji3wfuq7h@outlook.com', N'LdNyos', 3)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (8, N'Кудрявцева', N'Василиса', N'Матвеевна', N'am65k18q7bwp@mail.com', N'gynQMT', 3)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (9, N'Кириллова', N'Николь', N'Святославовна', N'wt9q8i6ypx47@outlook.com', N'AtnDjr', 3)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (10, N'Андреева', N'Полина', N'Артёмовна', N'4o72gufv3xlz@tutanota.com', N'JlFRCZ', 3)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
USE [master]
GO
ALTER DATABASE [TradeDB] SET  READ_WRITE 
GO
