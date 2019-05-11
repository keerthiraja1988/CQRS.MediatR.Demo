USE [master]
GO

/****** Object:  Database [Blazor]    Script Date: 11-05-2019 12:12:23 ******/
CREATE DATABASE [Blazor]



GO


USE [Blazor]
GO
/****** Object:  StoredProcedure [dbo].[P_UpdateEmployee]    Script Date: 11-05-2019 12:14:52 ******/
DROP PROCEDURE [dbo].[P_UpdateEmployee]
GO
/****** Object:  StoredProcedure [dbo].[P_GetEmployee]    Script Date: 11-05-2019 12:14:52 ******/
DROP PROCEDURE [dbo].[P_GetEmployee]
GO
/****** Object:  StoredProcedure [dbo].[P_EditEmployee]    Script Date: 11-05-2019 12:14:52 ******/
DROP PROCEDURE [dbo].[P_EditEmployee]
GO
/****** Object:  StoredProcedure [dbo].[P_DeleteEmployee]    Script Date: 11-05-2019 12:14:52 ******/
DROP PROCEDURE [dbo].[P_DeleteEmployee]
GO
/****** Object:  StoredProcedure [dbo].[P_CreateUser]    Script Date: 11-05-2019 12:14:52 ******/
DROP PROCEDURE [dbo].[P_CreateUser]
GO
/****** Object:  StoredProcedure [dbo].[P_CreateEmployee]    Script Date: 11-05-2019 12:14:52 ******/
DROP PROCEDURE [dbo].[P_CreateEmployee]
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_LogError]    Script Date: 11-05-2019 12:14:52 ******/
DROP PROCEDURE [dbo].[ELMAH_LogError]
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorXml]    Script Date: 11-05-2019 12:14:52 ******/
DROP PROCEDURE [dbo].[ELMAH_GetErrorXml]
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorsXml]    Script Date: 11-05-2019 12:14:52 ******/
DROP PROCEDURE [dbo].[ELMAH_GetErrorsXml]
GO
ALTER TABLE [dbo].[ELMAH_Error] DROP CONSTRAINT [DF_ELMAH_Error_ErrorId]
GO
/****** Object:  Index [IX_ELMAH_Error_App_Time_Seq]    Script Date: 11-05-2019 12:14:52 ******/
DROP INDEX [IX_ELMAH_Error_App_Time_Seq] ON [dbo].[ELMAH_Error]
GO
/****** Object:  Index [PK_ELMAH_Error]    Script Date: 11-05-2019 12:14:52 ******/
ALTER TABLE [dbo].[ELMAH_Error] DROP CONSTRAINT [PK_ELMAH_Error]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11-05-2019 12:14:52 ******/
DROP TABLE [dbo].[User]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 11-05-2019 12:14:52 ******/
DROP TABLE [dbo].[Employee]
GO
/****** Object:  Table [dbo].[ELMAH_Error]    Script Date: 11-05-2019 12:14:52 ******/
DROP TABLE [dbo].[ELMAH_Error]
GO
/****** Object:  Table [dbo].[ELMAH_Error]    Script Date: 11-05-2019 12:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ELMAH_Error](
	[ErrorId] [uniqueidentifier] NOT NULL,
	[Application] [nvarchar](60) NOT NULL,
	[Host] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](100) NOT NULL,
	[Source] [nvarchar](60) NOT NULL,
	[Message] [nvarchar](500) NOT NULL,
	[User] [nvarchar](50) NOT NULL,
	[StatusCode] [int] NOT NULL,
	[TimeUtc] [datetime] NOT NULL,
	[Sequence] [int] IDENTITY(1,1) NOT NULL,
	[AllXml] [ntext] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 11-05-2019 12:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] IDENTITY(300000,1) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Initial] [nvarchar](200) NULL,
	[Email] [nvarchar](max) NULL,
	[DateOfBirth] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11-05-2019 12:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[FullName] [nvarchar](max) NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[PasswordHash] [nvarchar](500) NULL,
	[PasswordSalt] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
	[IsLocked] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
 CONSTRAINT [PK_dbo.User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300050, N'2 3', N'2', N'3', NULL, N'4', CAST(N'2018-12-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300051, N'2 3', N'2', N'3', NULL, N'4', CAST(N'2018-12-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300052, N'2 3', N'2', N'3', NULL, N'4', CAST(N'2018-12-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300053, N'2 3', N'2', N'3', NULL, N'4', CAST(N'2018-12-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300055, N'2 3', N'2', N'3', NULL, N'4', CAST(N'2018-12-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300056, N'2 3', N'2', N'3', NULL, N'4', CAST(N'2018-12-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300057, N'2 3', N'2', N'3', NULL, N'4', CAST(N'2018-12-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300058, N'2 3', N'2', N'3', NULL, N'4', CAST(N'2018-12-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300059, N'2 3', N'2', N'3', NULL, N'4', CAST(N'2018-12-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300061, N'2 3', N'2', N'3', NULL, N'4', CAST(N'2018-12-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300062, N'2 3', N'2', N'3', NULL, N'4', CAST(N'2018-12-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300063, N'2 3', N'2', N'3', NULL, N'4', CAST(N'2018-12-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300064, N'2 3', N'2', N'3', NULL, N'4', CAST(N'2018-12-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300065, N'1 2', N'1', N'2', NULL, N'3', CAST(N'2018-12-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300066, N'1 2', N'1', N'2', NULL, N'3', CAST(N'2018-12-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300067, N'1 2', N'1', N'2', NULL, N'3', CAST(N'2018-12-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300068, N'1 2', N'1', N'2', NULL, N'3', CAST(N'2018-12-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300069, N'1 2', N'1', N'2', NULL, N'3', CAST(N'2018-12-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300070, N'1 2', N'1', N'2', NULL, N'3', CAST(N'2018-12-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300071, N'1 2', N'1', N'2', NULL, N'3', CAST(N'2018-12-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300072, N'1 2', N'1', N'2', NULL, N'3', CAST(N'2018-12-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300073, N'1 2', N'1', N'2', NULL, N'3', CAST(N'2018-12-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300074, N'1 2', N'1', N'2', NULL, N'3', CAST(N'2018-12-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300075, N'1 2', N'1', N'2', NULL, N'3', CAST(N'2018-12-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300076, N'1 2', N'1', N'2', NULL, N'3', CAST(N'2018-12-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300077, N'1 2', N'1', N'2', NULL, N'3', CAST(N'2018-12-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300081, N'1 2', N'1', N'2', NULL, N'3', CAST(N'2018-12-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300082, N'2 3', N'2', N'3', NULL, N'4', CAST(N'2018-12-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300083, N'2 3', N'2', N'3', NULL, N'4', CAST(N'2018-12-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300084, N'2 3', N'2', N'3', NULL, N'4', CAST(N'2018-12-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300086, N'1 22', N'1', N'22', NULL, N'333', CAST(N'2018-12-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300087, N'1 22', N'1', N'22', NULL, N'333', CAST(N'2018-12-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300088, N'1 22', N'1', N'22', NULL, N'333', CAST(N'2018-12-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300089, N'rr tt', N'rr', N'tt', NULL, N'yy', CAST(N'2018-12-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300090, N'rr tt', N'rr', N'tt', NULL, N'yy', CAST(N'2018-12-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300102, N'rr tt', N'rr', N'tt', NULL, N'yy', CAST(N'2018-12-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300103, N'rr tt', N'rr', N'tt', NULL, N'yy', CAST(N'2018-12-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300104, N'rr tt', N'rr', N'tt', NULL, N'yy', CAST(N'2018-12-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300105, N'rr tt', N'rr', N'tt', NULL, N'yy', CAST(N'2018-12-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300117, N'5 7', N'5', N'7', NULL, N'8', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300118, N'5 7', N'5', N'7', NULL, N'8', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300120, N'5 7', N'5', N'7', NULL, N'8', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300121, N'5 7', N'5', N'7', NULL, N'8', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300122, N'5 7', N'5', N'7', NULL, N'8', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300123, N'5 7', N'5', N'7', NULL, N'8', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300125, N'5 7', N'5', N'7', NULL, N'8', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300126, N'5 7', N'5', N'7', NULL, N'8', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300127, N'5 7', N'5', N'7', NULL, N'8', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300128, N'5 7', N'5', N'7', NULL, N'8', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300129, N'5 7', N'5', N'7', NULL, N'8', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300130, N'5 7', N'5', N'7', NULL, N'8', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300131, N'5 7', N'5', N'7', NULL, N'8', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300132, N'5 7', N'5', N'7', NULL, N'8', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300133, N'5 7', N'5', N'7', NULL, N'8', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300134, N'5 7', N'5', N'7', NULL, N'8', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300135, N'5 7', N'5', N'7', NULL, N'8', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300137, N'5 7', N'5', N'7', NULL, N'8', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300138, N'5 7', N'5', N'7', NULL, N'8', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300139, N'5 7', N'5', N'7', NULL, N'8', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300140, N'5 7', N'5', N'7', NULL, N'8', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300141, N'5 7', N'5', N'7', NULL, N'8', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300143, N'5 7', N'5', N'7', NULL, N'8', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300144, N'5 7', N'5', N'7', NULL, N'8', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300148, N'788 999', N'788', N'999', NULL, N'ooo', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300149, N'788 999', N'788', N'999', NULL, N'ooo', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300150, N'788 999', N'788', N'999', NULL, N'ooo', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300151, N'788 999', N'788', N'999', NULL, N'ooo', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300152, N'788 999', N'788', N'999', NULL, N'ooo', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300153, N'788 999', N'788', N'999', NULL, N'ooo', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300154, N'788 999', N'788', N'999', NULL, N'ooo', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300155, N'788 999', N'788', N'999', NULL, N'ooo', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300156, N'788 999', N'788', N'999', NULL, N'ooo', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300157, N'788 999', N'788', N'999', NULL, N'ooo', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300158, N'788 999', N'788', N'999', NULL, N'ooo', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300159, N'788 999', N'788', N'999', NULL, N'ooo', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300160, N'788 999', N'788', N'999', NULL, N'ooo', CAST(N'2018-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300161, N'd d', N'd', N'd', NULL, N'd', CAST(N'2018-12-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300162, N'gt g', N'gt', N'g', NULL, N'gg', CAST(N'2018-12-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300163, N'gt g', N'gt', N'g', NULL, N'gg', CAST(N'2018-12-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300164, N'g g', N'g', N'g', NULL, N'g', CAST(N'2018-12-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300165, N'1 2', N'1', N'2', NULL, N'3', CAST(N'2018-12-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300167, N'1 2', N'1', N'2', NULL, N'2', CAST(N'2018-12-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300168, N'e e', N'e', N'e', NULL, N'e', CAST(N'2018-12-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300169, N's s', N's', N's', NULL, N's', CAST(N'2018-12-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300170, N'd d', N'd', N'd', NULL, N'd', CAST(N'2018-12-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300171, N'v v', N'v', N'v', NULL, N'v', CAST(N'2018-12-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300172, N'c c', N'c', N'c', NULL, N'c', CAST(N'2018-12-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300173, N'c c', N'c', N'c', NULL, N'c', CAST(N'2018-12-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300174, N'd d', N'd', N'd', NULL, N'd', CAST(N'2018-12-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300175, N'c c', N'c', N'c', NULL, N'c', CAST(N'2018-12-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300176, N'c c', N'c', N'c', NULL, N'c', CAST(N'2018-12-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300177, N'f f', N'f56', N'f622', NULL, N'55', CAST(N'2018-12-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300187, N'kkkkk kkkkkk', N'22', N'22123', NULL, N'222', CAST(N'2018-12-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300188, N'xc vb', N'xc', N'vb', NULL, N'bbb', CAST(N'2018-12-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300189, N'FirstName1 LastName1', N'FirstName1', N'LastName1', NULL, N'Email1', CAST(N'2019-03-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300190, N'FirstName1 LastName1', N'FirstName1', N'LastName1', NULL, N'Email1', CAST(N'2019-03-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300191, N'2 3', N'2', N'3', NULL, N'4', CAST(N'2018-12-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300192, N'2 3', N'2', N'3', NULL, N'4', CAST(N'2018-12-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300193, N'2 3', N'2', N'3', NULL, N'4', CAST(N'2018-12-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300194, N'2 3', N'2', N'3', NULL, N'4', CAST(N'2018-12-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300195, N'2 3', N'2', N'3', NULL, N'4', CAST(N'2018-12-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300199, N'dvsdv svdsdv', N'dvsdv', N'svdsdv', NULL, N'dvsdv@gmail.com', CAST(N'2019-03-22T18:30:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300200, N'dvsdv svdsdv', N'dvsdvvasddddddd', N'svdsdv', NULL, N'78dfsdfs9@gmail.com', CAST(N'2019-03-20T18:30:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300201, N'2 3', N'2', N'3', NULL, N'4', CAST(N'2018-12-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [FullName], [FirstName], [LastName], [Initial], [Email], [DateOfBirth]) VALUES (300202, N'dvsdv dvsdv', N'dvsdv', N'dvsdv', NULL, N'dvsdv@gmail.com', CAST(N'2019-05-14T18:30:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([UserId], [UserName], [FullName], [FirstName], [LastName], [Email], [Password], [PasswordHash], [PasswordSalt], [IsActive], [IsLocked], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (2, N'UserName1', N'FirstName1 LastName1', N'FirstName1', N'LastName1', N'Email1', N'Password1', N'Ia1RxEvbzmNO+koz7WehEuwovQXcuQKz6WL3Xh5bSPTjasSDRdp0Pj/uQK/X8jZIe6j+RHqGqMOMr+XbUDrB/g==', N'JQF1zRdKRNbfIr/WGbMO', 1, 0, CAST(N'2019-03-16T23:47:31.900' AS DateTime), 1, CAST(N'2019-03-16T23:47:31.900' AS DateTime), 1)
GO
INSERT [dbo].[User] ([UserId], [UserName], [FullName], [FirstName], [LastName], [Email], [Password], [PasswordHash], [PasswordSalt], [IsActive], [IsLocked], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (3, N'UserName2', N'FirstName22 LastName2', N'FirstName22', N'LastName2', N'Email1', N'Password2', N'g1xPGncIOZJjZvophLMegD02CzjXAubOuj4NHZEl4CZBUr1bJnukRf3YcgRS9rLJA/adfzFszPZXJEGOwkSp/A==', N'LvASacJGzOYY6UGBNV2C', 1, 0, CAST(N'2019-03-17T11:06:19.023' AS DateTime), 0, CAST(N'2019-03-17T11:06:19.023' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [UserName], [FullName], [FirstName], [LastName], [Email], [Password], [PasswordHash], [PasswordSalt], [IsActive], [IsLocked], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (4, N'UserName20', N'FirstName22 LastName2', N'FirstName22', N'LastName2', N'Email1', N'Password2', N'aVMXnbUTb3eMiLE7qspd8uaOu28mjg2VqjjA7y9XRK9CF+0WK0wk71woq2V7NsAXMtnHcq6aNQiLQ56MuxDHHA==', N'fEAx80Iz2czpi/2JNOsf', 1, 0, CAST(N'2019-03-17T11:06:56.487' AS DateTime), 0, CAST(N'2019-03-17T11:06:56.487' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [UserName], [FullName], [FirstName], [LastName], [Email], [Password], [PasswordHash], [PasswordSalt], [IsActive], [IsLocked], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (5, N'UserName220', N'FirstName22 LastName2', N'FirstName22', N'LastName2', N'Email1', N'Password22', N'LXkgqbBU63lfZ2vT/MSaXAguhipkzy4eREK5d6OgydLXQIyacFUH1x/fTTPnYU/OGiWHVMzKBWSvjw25/rg+nQ==', N'mepB9VOSupAoQUuap8nn', 1, 0, CAST(N'2019-03-17T12:44:12.607' AS DateTime), 0, CAST(N'2019-03-17T12:44:12.607' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [UserName], [FullName], [FirstName], [LastName], [Email], [Password], [PasswordHash], [PasswordSalt], [IsActive], [IsLocked], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (6, N'UserName270', N'FirstName22 LastName2', N'FirstName22', N'LastName2', N'Email1', N'Password22', N'MarkivAM+9njoisVoQWKfZ6NAoSeNhyBoq3I0FhISkirbaMrwmhvUHP9Q8gPmzmy4wBlaeKxneC5IAbspwRkkQ==', N'8Ut/2/aHDHzK+AeHegyL', 1, 0, CAST(N'2019-03-17T12:45:40.163' AS DateTime), 0, CAST(N'2019-03-17T12:45:40.163' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [UserName], [FullName], [FirstName], [LastName], [Email], [Password], [PasswordHash], [PasswordSalt], [IsActive], [IsLocked], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (7, N'UserName99', N'FirstName22 LastName2', N'FirstName22', N'LastName2', N'Email1', N'Password22', N'k+tdGQfuuFjIDf+/uI875v8rugOA4nYzm677ccWv7X9YJPgpIldCiuU817A4QrDSJSx6c4fqYThhDBI9lkQblA==', N'FS1NBU92s06mrpEQkZ4H', 1, 0, CAST(N'2019-03-17T12:46:54.010' AS DateTime), 0, CAST(N'2019-03-17T12:46:54.010' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [UserName], [FullName], [FirstName], [LastName], [Email], [Password], [PasswordHash], [PasswordSalt], [IsActive], [IsLocked], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (8, N'11111', N'1111 1111', N'1111', N'1111', N'11111', N'1111111', N'8SiMTDAz9jmU7i4svjs+meUmoXF4V6j/3NYF7ab0WFE7Qk5SZ/2IYk2QN911lEhe/JhIYLEjcolrKu3Qd9+Oug==', N'TVK+o/MsM0rkkWzj7AnJ', 1, 0, CAST(N'2019-03-17T12:56:04.663' AS DateTime), 0, CAST(N'2019-03-17T12:56:04.663' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
/****** Object:  Index [PK_ELMAH_Error]    Script Date: 11-05-2019 12:14:52 ******/
ALTER TABLE [dbo].[ELMAH_Error] ADD  CONSTRAINT [PK_ELMAH_Error] PRIMARY KEY NONCLUSTERED 
(
	[ErrorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ELMAH_Error_App_Time_Seq]    Script Date: 11-05-2019 12:14:52 ******/
CREATE NONCLUSTERED INDEX [IX_ELMAH_Error_App_Time_Seq] ON [dbo].[ELMAH_Error]
(
	[Application] ASC,
	[TimeUtc] DESC,
	[Sequence] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ELMAH_Error] ADD  CONSTRAINT [DF_ELMAH_Error_ErrorId]  DEFAULT (newid()) FOR [ErrorId]
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorsXml]    Script Date: 11-05-2019 12:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ELMAH_GetErrorsXml]
(
    @Application NVARCHAR(60),
    @PageIndex INT = 0,
    @PageSize INT = 15,
    @TotalCount INT OUTPUT
)
AS 

    SET NOCOUNT ON

    DECLARE @FirstTimeUTC DATETIME
    DECLARE @FirstSequence INT
    DECLARE @StartRow INT
    DECLARE @StartRowIndex INT

    SELECT 
        @TotalCount = COUNT(1) 
    FROM 
        [ELMAH_Error]
    WHERE 
        [Application] = @Application

    -- Get the ID of the first error for the requested page

    SET @StartRowIndex = @PageIndex * @PageSize + 1

    IF @StartRowIndex <= @TotalCount
    BEGIN

        SET ROWCOUNT @StartRowIndex

        SELECT  
            @FirstTimeUTC = [TimeUtc],
            @FirstSequence = [Sequence]
        FROM 
            [ELMAH_Error]
        WHERE   
            [Application] = @Application
        ORDER BY 
            [TimeUtc] DESC, 
            [Sequence] DESC

    END
    ELSE
    BEGIN

        SET @PageSize = 0

    END

    -- Now set the row count to the requested page size and get
    -- all records below it for the pertaining application.

    SET ROWCOUNT @PageSize

    SELECT 
        errorId     = [ErrorId], 
        application = [Application],
        host        = [Host], 
        type        = [Type],
        source      = [Source],
        message     = [Message],
        [user]      = [User],
        statusCode  = [StatusCode], 
        time        = CONVERT(VARCHAR(50), [TimeUtc], 126) + 'Z'
    FROM 
        [ELMAH_Error] error
    WHERE
        [Application] = @Application
    AND
        [TimeUtc] <= @FirstTimeUTC
    AND 
        [Sequence] <= @FirstSequence
    ORDER BY
        [TimeUtc] DESC, 
        [Sequence] DESC
    FOR
        XML AUTO

GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorXml]    Script Date: 11-05-2019 12:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ELMAH_GetErrorXml]
(
    @Application NVARCHAR(60),
    @ErrorId UNIQUEIDENTIFIER
)
AS

    SET NOCOUNT ON

    SELECT 
        [AllXml]
    FROM 
        [ELMAH_Error]
    WHERE
        [ErrorId] = @ErrorId
    AND
        [Application] = @Application

GO
/****** Object:  StoredProcedure [dbo].[ELMAH_LogError]    Script Date: 11-05-2019 12:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ELMAH_LogError]
(
    @ErrorId UNIQUEIDENTIFIER,
    @Application NVARCHAR(60),
    @Host NVARCHAR(30),
    @Type NVARCHAR(100),
    @Source NVARCHAR(60),
    @Message NVARCHAR(500),
    @User NVARCHAR(50),
    @AllXml NTEXT,
    @StatusCode INT,
    @TimeUtc DATETIME
)
AS

    SET NOCOUNT ON

    INSERT
    INTO
        [ELMAH_Error]
        (
            [ErrorId],
            [Application],
            [Host],
            [Type],
            [Source],
            [Message],
            [User],
            [AllXml],
            [StatusCode],
            [TimeUtc]
        )
    VALUES
        (
            @ErrorId,
            @Application,
            @Host,
            @Type,
            @Source,
            @Message,
            @User,
            @AllXml,
            @StatusCode,
            @TimeUtc
        )

GO
/****** Object:  StoredProcedure [dbo].[P_CreateEmployee]    Script Date: 11-05-2019 12:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[P_CreateEmployee] 	
			@FullName [nvarchar](max) ,
			@FirstName [nvarchar](max) ,
			@LastName [nvarchar](max) ,			
			@Email [nvarchar](max) 	,
			@DateOfBirth DATETIME 	
  AS
begin
		
	DECLARE @EmployeeId INT 

	BEGIN TRANSACTION
	
	INSERT INTO [dbo].[Employee]
           ([FullName]
           ,[FirstName]
           ,[LastName]
          
           ,[Email]
           ,[DateOfBirth])
		SELECT
			@FirstName 	+ ' ' + @LastName 			
			  , @FirstName 			
			  , @LastName 			
				
			  , @Email 				
			  , @DateOfBirth 
	
	SELECT @EmployeeId = CAST( SCOPE_IDENTITY() AS INT);  

	COMMIT TRANSACTION
	
	SELECT 	@EmployeeId AS EmployeeId;
		
end
GO
/****** Object:  StoredProcedure [dbo].[P_CreateUser]    Script Date: 11-05-2019 12:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROC [dbo].[P_CreateUser] 

	@UserName 		[nvarchar](max) ,
	@FirstName		[nvarchar](max) ,
	@LastName 		[nvarchar](max) ,
	@Email 			[nvarchar](max) ,
	@Password 		[nvarchar](max) ,
	@PasswordHash   [nvarchar](500) ,
	@PasswordSalt	[nvarchar](100) ,
	@CreatedBy 		[bigint] 
		
  AS
begin

DECLARE @TodaysDate DATETIME = GETDATE()

INSERT INTO [dbo].[User]
           ([UserName]
           ,[FullName]
           ,[FirstName]
           ,[LastName]
           ,[Email]
           ,[Password]
           ,[PasswordHash]
           ,[PasswordSalt]
           ,[IsActive]
           ,[IsLocked]
           ,[CreatedOn]
           ,[CreatedBy]
           ,[ModifiedOn]
           ,[ModifiedBy])
		SELECT
			@UserName 		
			,@FirstName	+ ' ' + @LastName	
			,@FirstName		
			,@LastName 		
			,@Email 			
			,@Password 		
			,@PasswordHash	
			,@PasswordSalt	
			,1 		
			,0 
			,@TodaysDate			
			,@CreatedBy 		
			,@TodaysDate
			,@CreatedBy
		
	DECLARE @UserId BIGINT = SCOPE_IDENTITY()
				
SELECT @UserId as UserId
end
GO
/****** Object:  StoredProcedure [dbo].[P_DeleteEmployee]    Script Date: 11-05-2019 12:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[P_DeleteEmployee] 	
		@EmployeeId [int] 	
		
  AS
begin
	BEGIN TRANSACTION
	
	DELETE FROM  [dbo].[Employee] WHERE EmployeeId= @EmployeeId
	
	COMMIT TRANSACTION
		
end
GO
/****** Object:  StoredProcedure [dbo].[P_EditEmployee]    Script Date: 11-05-2019 12:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[P_EditEmployee] 
			@EmployeeId INT,
			@FullName [nvarchar](max) ,
			@FirstName [nvarchar](max) ,
			@LastName [nvarchar](max) ,
			
			@Email [nvarchar](max) 	,
			@DateOfBirth DATETIME 
			
		
  AS
begin
	
	
	
	BEGIN TRANSACTION
	
	UPDATE [dbo].[Employee]
	   SET [FirstName] = @FirstName 			
		  ,[LastName] = @LastName 
		  
		  ,[Email] = @Email 
		  ,[DateOfBirth] =@DateOfBirth 
	 WHERE EmployeeId = @EmployeeId

	
	
	
	COMMIT TRANSACTION


		SELECT @@Error
end
GO
/****** Object:  StoredProcedure [dbo].[P_GetEmployee]    Script Date: 11-05-2019 12:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[P_GetEmployee] 
	
			@EmployeeId int			
		
  AS
begin
	
	SELECT  [EmployeeId]
      ,[FullName]
      ,[FirstName]
      ,[LastName]
      ,[Initial]
      ,[Email]
      ,[DateOfBirth]
  FROM [dbo].[Employee]
  WHERE [EmployeeId] = @EmployeeId

		
end
GO
/****** Object:  StoredProcedure [dbo].[P_UpdateEmployee]    Script Date: 11-05-2019 12:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[P_UpdateEmployee] 
			@EmployeeId INT,
			@FullName [nvarchar](max) ,
			@FirstName [nvarchar](max) ,
			@LastName [nvarchar](max) ,
			
			@Email [nvarchar](max) 	,
			@DateOfBirth DATETIME 
			
		
  AS
begin
	
	
	
	BEGIN TRANSACTION
	
	UPDATE [dbo].[Employee]
	   SET [FirstName] = @FirstName 			
		  ,[LastName] = @LastName 		  
		  ,[Email] = @Email 
		  ,[DateOfBirth] =@DateOfBirth 
	 WHERE EmployeeId = @EmployeeId

	
	
	
	COMMIT TRANSACTION


		
end
GO
