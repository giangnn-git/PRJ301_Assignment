USE [master]
GO
DROP DATABASE [PRJ301_ASSIGNMENT]
GO

CREATE DATABASE [PRJ301_ASSIGNMENT]
GO

USE [PRJ301_ASSIGNMENT]
GO

-- 1. Users Table: tblUsers
CREATE TABLE [dbo].[tblUsers](
	[username] [nvarchar](50) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[role] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Insert sample users
INSERT [dbo].[tblUsers] ([username], [name], [password], [role]) VALUES (N'admin', N'Administrator', N'1', N'AD')
INSERT [dbo].[tblUsers] ([username], [name], [password], [role]) VALUES (N'mem1', N'Toi la Bot', N'1', N'MB')
INSERT [dbo].[tblUsers] ([username], [name], [password], [role]) VALUES (N'member2', N'Nguyen Van A', N'pass123', N'AD')
INSERT [dbo].[tblUsers] ([username], [name], [password], [role]) VALUES (N'member3', N'Tran Thi B', N'student123', N'MB')
INSERT [dbo].[tblUsers] ([username], [name], [password], [role]) VALUES (N'member4', N'Le Van C', N'student456', N'MB')
INSERT [dbo].[tblUsers] ([username], [name], [password], [role]) VALUES (N'member5', N'Pham Thi D', N'student789', N'MB')
GO