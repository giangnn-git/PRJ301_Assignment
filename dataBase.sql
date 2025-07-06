USE [master]
GO
DROP DATABASE [PRJ301_ASSIGNMENT]
GO

CREATE DATABASE [PRJ301_ASSIGNMENT]
GO

USE [PRJ301_ASSIGNMENT]
GO


/*
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

*/

IF OBJECT_ID('dbo.tblUsers', 'U') IS NOT NULL
    DROP TABLE dbo.tblUsers;
GO

--  
CREATE TABLE dbo.tblUsers (
    userId INT IDENTITY(1,1) PRIMARY KEY,
    userName NVARCHAR(50) NOT NULL UNIQUE,
    fullName NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) NOT NULL UNIQUE,
    password NVARCHAR(255) NOT NULL,
    phone NVARCHAR(20),
    address NVARCHAR(255),
    role NVARCHAR(20) NOT NULL CHECK (role IN ('ADMIN', 'CUSTOMER', 'SHIPPER'))
);
GO


INSERT INTO dbo.tblUsers (userName, fullName, email, password, phone, address, role) VALUES
('admin',     'Administrator',   'admin@example.com',     '1',  '0123456789', '123 Admin St',   'ADMIN'),
('cust1',     'Nguyen Van A',    'cust1@example.com',     '1',   '0911223344', '456 Cust St',    'CUSTOMER'),
('shipper1',  'Pham Thi Binh',   'shipper1@example.com',  '1',   '0988776655', '789 Shipper Rd', 'SHIPPER');
GO

