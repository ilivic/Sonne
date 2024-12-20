USE [ABD]
GO
/****** Object:  Table [dbo].[academicApplicant]    Script Date: 08.12.2024 20:33:31 ******/
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
/****** Object:  Table [dbo].[academics]    Script Date: 08.12.2024 20:33:31 ******/
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
/****** Object:  Table [dbo].[acceptance]    Script Date: 08.12.2024 20:33:31 ******/
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
/****** Object:  Table [dbo].[applicants]    Script Date: 08.12.2024 20:33:31 ******/
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
/****** Object:  Table [dbo].[Color]    Script Date: 08.12.2024 20:33:31 ******/
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
/****** Object:  Table [dbo].[Gender]    Script Date: 08.12.2024 20:33:31 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 08.12.2024 20:33:31 ******/
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
