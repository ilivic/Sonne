USE [ABD]
GO
/****** Object:  Table [dbo].[academicApplicant]    Script Date: 08.12.2024 20:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[academicApplicant](
	[id_AA] [int] IDENTITY(1,1) NOT NULL,
	[app_id] [int] NOT NULL,
	[academic_id] [int] NOT NULL,
	[result] [float] NOT NULL,
 CONSTRAINT [PK_academicApplicant] PRIMARY KEY CLUSTERED 
(
	[id_AA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[academics]    Script Date: 08.12.2024 20:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[academics](
	[id_academic] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[info] [text] NULL,
 CONSTRAINT [PK_academics] PRIMARY KEY CLUSTERED 
(
	[id_academic] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acceptance]    Script Date: 08.12.2024 20:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acceptance](
	[id_acc] [int] IDENTITY(1,1) NOT NULL,
	[DateAnswer] [date] NOT NULL,
	[User_id] [int] NOT NULL,
	[app_id] [int] NOT NULL,
	[Result] [bit] NOT NULL,
	[Comment] [text] NULL,
	[Color_id] [int] NOT NULL,
 CONSTRAINT [PK_acceptance] PRIMARY KEY CLUSTERED 
(
	[id_acc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[applicants]    Script Date: 08.12.2024 20:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[applicants](
	[id_app] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](50) NOT NULL,
	[DateBirt] [date] NOT NULL,
	[IsTarget] [bit] NOT NULL,
	[Color_id] [int] NOT NULL,
	[isAchievement] [bit] NOT NULL,
	[GPA] [float] NOT NULL,
	[Gender_id] [int] NOT NULL,
	[dateCreate] [date] NOT NULL,
	[Phone] [nvarchar](11) NULL,
 CONSTRAINT [PK_applicants] PRIMARY KEY CLUSTERED 
(
	[id_app] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 08.12.2024 20:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[Id_color] [int] IDENTITY(1,1) NOT NULL,
	[Colo] [varchar](50) NOT NULL,
	[Info] [text] NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[Id_color] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 08.12.2024 20:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[id_gender] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[id_gender] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 08.12.2024 20:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[academicApplicant] ON 

INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (1, 1, 8, 5)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (2, 1, 7, 5)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (3, 1, 6, 4)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (4, 2, 1, 2)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (5, 2, 2, 5)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (6, 2, 6, 3)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (7, 2, 8, 5)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (8, 3, 1, 2)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (9, 3, 2, 3)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (10, 3, 3, 4)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (11, 3, 5, 2)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (12, 3, 6, 3)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (13, 3, 7, 4)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (14, 3, 8, 2)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (15, 4, 1, 3)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (16, 4, 2, 4)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (17, 4, 3, 2)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (18, 5, 8, 5)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (19, 5, 7, 5)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (20, 5, 5, 5)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (21, 5, 3, 3)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (22, 6, 7, 2)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (23, 6, 6, 2)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (24, 6, 5, 3)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (25, 7, 6, 3)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (26, 7, 5, 5)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (27, 7, 7, 4)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (28, 7, 8, 5)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (29, 8, 7, 2)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (30, 8, 6, 5)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (31, 8, 5, 5)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (32, 8, 8, 5)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (33, 9, 8, 4)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (34, 9, 7, 3)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (35, 9, 6, 4)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (36, 9, 5, 3)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (37, 9, 2, 5)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (38, 9, 1, 2)
INSERT [dbo].[academicApplicant] ([id_AA], [app_id], [academic_id], [result]) VALUES (39, 9, 3, 3)
SET IDENTITY_INSERT [dbo].[academicApplicant] OFF
GO
SET IDENTITY_INSERT [dbo].[academics] ON 

INSERT [dbo].[academics] ([id_academic], [Title], [info]) VALUES (1, N'русский язык ', NULL)
INSERT [dbo].[academics] ([id_academic], [Title], [info]) VALUES (2, N'информатика', NULL)
INSERT [dbo].[academics] ([id_academic], [Title], [info]) VALUES (3, N'матеша', NULL)
INSERT [dbo].[academics] ([id_academic], [Title], [info]) VALUES (4, N'инг яз', NULL)
INSERT [dbo].[academics] ([id_academic], [Title], [info]) VALUES (5, N'тата яз', NULL)
INSERT [dbo].[academics] ([id_academic], [Title], [info]) VALUES (6, N'физ-ра', NULL)
INSERT [dbo].[academics] ([id_academic], [Title], [info]) VALUES (7, N'ИЗО', NULL)
INSERT [dbo].[academics] ([id_academic], [Title], [info]) VALUES (8, N'литра', NULL)
SET IDENTITY_INSERT [dbo].[academics] OFF
GO
SET IDENTITY_INSERT [dbo].[acceptance] ON 

INSERT [dbo].[acceptance] ([id_acc], [DateAnswer], [User_id], [app_id], [Result], [Comment], [Color_id]) VALUES (1, CAST(N'2024-12-08' AS Date), 1, 1, 1, N'Успешно принят на собеседование', 2)
INSERT [dbo].[acceptance] ([id_acc], [DateAnswer], [User_id], [app_id], [Result], [Comment], [Color_id]) VALUES (2, CAST(N'2024-12-08' AS Date), 1, 3, 0, N'Отказ', 1)
INSERT [dbo].[acceptance] ([id_acc], [DateAnswer], [User_id], [app_id], [Result], [Comment], [Color_id]) VALUES (3, CAST(N'2024-12-08' AS Date), 1, 2, 0, N'Отказ', 1)
INSERT [dbo].[acceptance] ([id_acc], [DateAnswer], [User_id], [app_id], [Result], [Comment], [Color_id]) VALUES (4, CAST(N'2024-12-08' AS Date), 1, 4, 0, N'Отказ', 1)
INSERT [dbo].[acceptance] ([id_acc], [DateAnswer], [User_id], [app_id], [Result], [Comment], [Color_id]) VALUES (5, CAST(N'2024-12-08' AS Date), 1, 5, 1, N'Успешно принят на собеседование', 2)
INSERT [dbo].[acceptance] ([id_acc], [DateAnswer], [User_id], [app_id], [Result], [Comment], [Color_id]) VALUES (6, CAST(N'2024-12-08' AS Date), 1, 9, 1, N'Успешно принят на собеседование', 2)
SET IDENTITY_INSERT [dbo].[acceptance] OFF
GO
SET IDENTITY_INSERT [dbo].[applicants] ON 

INSERT [dbo].[applicants] ([id_app], [FullName], [DateBirt], [IsTarget], [Color_id], [isAchievement], [GPA], [Gender_id], [dateCreate], [Phone]) VALUES (1, N'awdawdawd', CAST(N'2020-08-31' AS Date), 1, 2, 0, 4.666666666666667, 1, CAST(N'2024-12-08' AS Date), N'213213123')
INSERT [dbo].[applicants] ([id_app], [FullName], [DateBirt], [IsTarget], [Color_id], [isAchievement], [GPA], [Gender_id], [dateCreate], [Phone]) VALUES (2, N'kjhagdjkhadwgkjhagwdjwakjhgdawkjh', CAST(N'2011-06-08' AS Date), 0, 1, 1, 3.75, 2, CAST(N'2024-12-08' AS Date), N'12312312683')
INSERT [dbo].[applicants] ([id_app], [FullName], [DateBirt], [IsTarget], [Color_id], [isAchievement], [GPA], [Gender_id], [dateCreate], [Phone]) VALUES (3, N'Чернигов Еблан Ебланыч', CAST(N'1966-03-27' AS Date), 1, 1, 1, 2.8571428571428572, 1, CAST(N'2024-12-08' AS Date), N'92139871293')
INSERT [dbo].[applicants] ([id_app], [FullName], [DateBirt], [IsTarget], [Color_id], [isAchievement], [GPA], [Gender_id], [dateCreate], [Phone]) VALUES (4, N'Головкин Антон Гандон', CAST(N'2006-07-13' AS Date), 0, 1, 1, 3, 1, CAST(N'2024-12-08' AS Date), N'98712983721')
INSERT [dbo].[applicants] ([id_app], [FullName], [DateBirt], [IsTarget], [Color_id], [isAchievement], [GPA], [Gender_id], [dateCreate], [Phone]) VALUES (5, N'Головач Лена Ивановна', CAST(N'2020-08-31' AS Date), 0, 2, 1, 4.5, 2, CAST(N'2024-12-08' AS Date), N'12963761287')
INSERT [dbo].[applicants] ([id_app], [FullName], [DateBirt], [IsTarget], [Color_id], [isAchievement], [GPA], [Gender_id], [dateCreate], [Phone]) VALUES (6, N'Исвыф фццвфц фцвфцв', CAST(N'2020-07-08' AS Date), 1, 3, 0, 2.3333333333333335, 1, CAST(N'2024-12-08' AS Date), N'86721866738')
INSERT [dbo].[applicants] ([id_app], [FullName], [DateBirt], [IsTarget], [Color_id], [isAchievement], [GPA], [Gender_id], [dateCreate], [Phone]) VALUES (7, N'фвфцвцвфцфв', CAST(N'2020-06-25' AS Date), 0, 4, 1, 4.25, 2, CAST(N'2024-12-08' AS Date), N'12321312321')
INSERT [dbo].[applicants] ([id_app], [FullName], [DateBirt], [IsTarget], [Color_id], [isAchievement], [GPA], [Gender_id], [dateCreate], [Phone]) VALUES (8, N'цфцввцфцф', CAST(N'2019-08-08' AS Date), 0, 6, 0, 4.25, 1, CAST(N'2024-12-08' AS Date), N'21321312321')
INSERT [dbo].[applicants] ([id_app], [FullName], [DateBirt], [IsTarget], [Color_id], [isAchievement], [GPA], [Gender_id], [dateCreate], [Phone]) VALUES (9, N'Балл Мать Е', CAST(N'2005-08-12' AS Date), 1, 2, 0, 3.4285714285714284, 1, CAST(N'2024-12-08' AS Date), N'23231231231')
SET IDENTITY_INSERT [dbo].[applicants] OFF
GO
SET IDENTITY_INSERT [dbo].[Color] ON 

INSERT [dbo].[Color] ([Id_color], [Colo], [Info]) VALUES (1, N'red', N'отказ')
INSERT [dbo].[Color] ([Id_color], [Colo], [Info]) VALUES (2, N'green', N'принят')
INSERT [dbo].[Color] ([Id_color], [Colo], [Info]) VALUES (3, N'yellow', N'целевое')
INSERT [dbo].[Color] ([Id_color], [Colo], [Info]) VALUES (4, N'blue', N'спортивное')
INSERT [dbo].[Color] ([Id_color], [Colo], [Info]) VALUES (5, N'brown', N'целовое и спротивные ')
INSERT [dbo].[Color] ([Id_color], [Colo], [Info]) VALUES (6, N'white', N'обыный')
SET IDENTITY_INSERT [dbo].[Color] OFF
GO
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([id_gender], [title]) VALUES (1, N'Спермобак')
INSERT [dbo].[Gender] ([id_gender], [title]) VALUES (2, N'посудомойка')
SET IDENTITY_INSERT [dbo].[Gender] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id_user], [Name], [Login], [password]) VALUES (1, N'test', N'1', N'1')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[academicApplicant]  WITH CHECK ADD  CONSTRAINT [FK_academicApplicant_academics] FOREIGN KEY([academic_id])
REFERENCES [dbo].[academics] ([id_academic])
GO
ALTER TABLE [dbo].[academicApplicant] CHECK CONSTRAINT [FK_academicApplicant_academics]
GO
ALTER TABLE [dbo].[academicApplicant]  WITH CHECK ADD  CONSTRAINT [FK_academicApplicant_applicants] FOREIGN KEY([app_id])
REFERENCES [dbo].[applicants] ([id_app])
GO
ALTER TABLE [dbo].[academicApplicant] CHECK CONSTRAINT [FK_academicApplicant_applicants]
GO
ALTER TABLE [dbo].[acceptance]  WITH CHECK ADD  CONSTRAINT [FK_acceptance_applicants] FOREIGN KEY([app_id])
REFERENCES [dbo].[applicants] ([id_app])
GO
ALTER TABLE [dbo].[acceptance] CHECK CONSTRAINT [FK_acceptance_applicants]
GO
ALTER TABLE [dbo].[acceptance]  WITH CHECK ADD  CONSTRAINT [FK_acceptance_Color] FOREIGN KEY([Color_id])
REFERENCES [dbo].[Color] ([Id_color])
GO
ALTER TABLE [dbo].[acceptance] CHECK CONSTRAINT [FK_acceptance_Color]
GO
ALTER TABLE [dbo].[acceptance]  WITH CHECK ADD  CONSTRAINT [FK_acceptance_Users] FOREIGN KEY([User_id])
REFERENCES [dbo].[Users] ([id_user])
GO
ALTER TABLE [dbo].[acceptance] CHECK CONSTRAINT [FK_acceptance_Users]
GO
ALTER TABLE [dbo].[applicants]  WITH CHECK ADD  CONSTRAINT [FK_applicants_Color] FOREIGN KEY([Color_id])
REFERENCES [dbo].[Color] ([Id_color])
GO
ALTER TABLE [dbo].[applicants] CHECK CONSTRAINT [FK_applicants_Color]
GO
ALTER TABLE [dbo].[applicants]  WITH CHECK ADD  CONSTRAINT [FK_applicants_Gender] FOREIGN KEY([Gender_id])
REFERENCES [dbo].[Gender] ([id_gender])
GO
ALTER TABLE [dbo].[applicants] CHECK CONSTRAINT [FK_applicants_Gender]
GO
