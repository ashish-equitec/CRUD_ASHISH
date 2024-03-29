USE [master]
GO
/****** Object:  Database [CRUDOPERATION]    Script Date: 08-01-2024 19:43:38 ******/
CREATE DATABASE [CRUDOPERATION]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CRUDOPERATION', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CRUDOPERATION.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CRUDOPERATION_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CRUDOPERATION_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CRUDOPERATION] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CRUDOPERATION].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CRUDOPERATION] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CRUDOPERATION] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CRUDOPERATION] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CRUDOPERATION] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CRUDOPERATION] SET ARITHABORT OFF 
GO
ALTER DATABASE [CRUDOPERATION] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CRUDOPERATION] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CRUDOPERATION] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CRUDOPERATION] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CRUDOPERATION] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CRUDOPERATION] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CRUDOPERATION] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CRUDOPERATION] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CRUDOPERATION] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CRUDOPERATION] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CRUDOPERATION] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CRUDOPERATION] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CRUDOPERATION] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CRUDOPERATION] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CRUDOPERATION] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CRUDOPERATION] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CRUDOPERATION] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CRUDOPERATION] SET RECOVERY FULL 
GO
ALTER DATABASE [CRUDOPERATION] SET  MULTI_USER 
GO
ALTER DATABASE [CRUDOPERATION] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CRUDOPERATION] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CRUDOPERATION] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CRUDOPERATION] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CRUDOPERATION] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CRUDOPERATION] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CRUDOPERATION', N'ON'
GO
ALTER DATABASE [CRUDOPERATION] SET QUERY_STORE = ON
GO
ALTER DATABASE [CRUDOPERATION] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CRUDOPERATION]
GO
/****** Object:  Table [dbo].[Emp_Table]    Script Date: 08-01-2024 19:43:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emp_Table](
	[Name] [varchar](50) NOT NULL,
	[DOB] [varchar](50) NOT NULL,
	[Location] [varchar](50) NOT NULL,
	[Designation] [varchar](50) NOT NULL,
	[Email_Address] [varchar](50) NOT NULL,
	[Deleted] [bit] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_EMP_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Emp_Table] ON 

INSERT [dbo].[Emp_Table] ([Name], [DOB], [Location], [Designation], [Email_Address], [Deleted], [ID]) VALUES (N'Sumit', N'2023-01-11', N'Pune', N'Developer', N'sumit123@gmail.com', 0, 2)
INSERT [dbo].[Emp_Table] ([Name], [DOB], [Location], [Designation], [Email_Address], [Deleted], [ID]) VALUES (N'Ashish Kharde', N'2022-11-11', N'Thane(W)', N'Trainee', N'ashish@123gmail.com', 1, 4)
INSERT [dbo].[Emp_Table] ([Name], [DOB], [Location], [Designation], [Email_Address], [Deleted], [ID]) VALUES (N'Don', N'2022-11-12', N'Byculla', N'Analyst', N'Don678@gmail.com', 1, 6)
INSERT [dbo].[Emp_Table] ([Name], [DOB], [Location], [Designation], [Email_Address], [Deleted], [ID]) VALUES (N'Vipin', N'2022-11-12', N'Thane', N'Analyst', N'sumit123@gmail.com', 1, 10)
INSERT [dbo].[Emp_Table] ([Name], [DOB], [Location], [Designation], [Email_Address], [Deleted], [ID]) VALUES (N'Sagar', N'2022-11-12', N'Pune', N'Developer', N'sumit123@gmail.com', 0, 12)
INSERT [dbo].[Emp_Table] ([Name], [DOB], [Location], [Designation], [Email_Address], [Deleted], [ID]) VALUES (N'Nilesh', N'2022-11-12', N'thane', N'Analyst', N'sumit123@gmail.com', 1, 13)
INSERT [dbo].[Emp_Table] ([Name], [DOB], [Location], [Designation], [Email_Address], [Deleted], [ID]) VALUES (N'Raju1', N'2022-11-12', N'Dubai', N'Trainee', N'adfsd@134', 0, 16)
INSERT [dbo].[Emp_Table] ([Name], [DOB], [Location], [Designation], [Email_Address], [Deleted], [ID]) VALUES (N'Acer89', N'2022-11-12', N'Thane', N'Computer', N'acer@123gmail.com', 0, 17)
INSERT [dbo].[Emp_Table] ([Name], [DOB], [Location], [Designation], [Email_Address], [Deleted], [ID]) VALUES (N'Varun', N'1999-07-02', N'Surat', N'Actor', N'varun3410@gmail.com', 1, 18)
INSERT [dbo].[Emp_Table] ([Name], [DOB], [Location], [Designation], [Email_Address], [Deleted], [ID]) VALUES (N'Surya', N'2013-12-12', N'Chennai', N'Actor', N'surya1243@gmail.com', 1, 19)
INSERT [dbo].[Emp_Table] ([Name], [DOB], [Location], [Designation], [Email_Address], [Deleted], [ID]) VALUES (N'Yash', N'2000-09-09', N'Mumbai', N'Trainee', N'acer@123gmail.com', 1, 20)
INSERT [dbo].[Emp_Table] ([Name], [DOB], [Location], [Designation], [Email_Address], [Deleted], [ID]) VALUES (N'Umesh', N'2022-11-12', N'Kalyan', N'Tester', N'acer@123gmail.com', 1, 22)
INSERT [dbo].[Emp_Table] ([Name], [DOB], [Location], [Designation], [Email_Address], [Deleted], [ID]) VALUES (N'Ramesh', N'1997-10-06', N'Vidyavihar', N'Manager', N'ramesh1997@gmail.com', 1, 27)
INSERT [dbo].[Emp_Table] ([Name], [DOB], [Location], [Designation], [Email_Address], [Deleted], [ID]) VALUES (N'Don12', N'2002-11-12', N'Vidyavihar', N'Trainer', N'ramesh1997@gmail.com', 0, 29)
INSERT [dbo].[Emp_Table] ([Name], [DOB], [Location], [Designation], [Email_Address], [Deleted], [ID]) VALUES (N'Suraj', N'2002-11-12', N'Kashedi', N'Tester', N'surajpatil1999@gmail.com', 1, 30)
INSERT [dbo].[Emp_Table] ([Name], [DOB], [Location], [Designation], [Email_Address], [Deleted], [ID]) VALUES (N'Don12', N'1997-10-06', N'Vidyavihar', N'Tester', N'surajpatil1999@gmail.com', 1, 31)
INSERT [dbo].[Emp_Table] ([Name], [DOB], [Location], [Designation], [Email_Address], [Deleted], [ID]) VALUES (N'Error', N'1997-10-06', N'Kashedi', N'Tester', N'surajpatil1999@gmail.com', 1, 32)
INSERT [dbo].[Emp_Table] ([Name], [DOB], [Location], [Designation], [Email_Address], [Deleted], [ID]) VALUES (N'Don123456', N'2022-11-11', N'Vidyavihar', N'Tester', N'surajpatil1999@gmail.com', 1, 34)
INSERT [dbo].[Emp_Table] ([Name], [DOB], [Location], [Designation], [Email_Address], [Deleted], [ID]) VALUES (N'Ttial', N'23-05-2034', N'Shrilanka', N'Tester', N'ashish@123gmail.com', 1, 35)
INSERT [dbo].[Emp_Table] ([Name], [DOB], [Location], [Designation], [Email_Address], [Deleted], [ID]) VALUES (N'Don123', N'11-12-2002', N'Vidyavihar', N'Tester', N'ashish@123gmail.com', 1, 36)
INSERT [dbo].[Emp_Table] ([Name], [DOB], [Location], [Designation], [Email_Address], [Deleted], [ID]) VALUES (N'Vijay', N'10-06-1997', N'Thane(W)', N'Manager', N'ramesh1997@gmail.com', 1, 37)
INSERT [dbo].[Emp_Table] ([Name], [DOB], [Location], [Designation], [Email_Address], [Deleted], [ID]) VALUES (N'Vijay', N'10-06-1997', N'Thane(W)', N'Manager', N'ramesh1997@gmail.com', 1, 38)
SET IDENTITY_INSERT [dbo].[Emp_Table] OFF
GO
/****** Object:  StoredProcedure [dbo].[EmployeeAdd]    Script Date: 08-01-2024 19:43:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[EmployeeAdd]
@Name varchar(50),
@DOB varchar(50),
@Location varchar(100),
@Designation varchar(50),
@Email_Address varchar(50),
@Deleted bit
As 
BEGIN
	INSERT INTO Emp_Table(Name,DOB,Location,Designation,Email_Address,Deleted )
	VALUES (@Name,@DOB,@Location,@Designation,@Email_Address,@Deleted)
END
GO
/****** Object:  StoredProcedure [dbo].[EmployeeDeleteByID]    Script Date: 08-01-2024 19:43:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[EmployeeDeleteByID]
@ID int
AS
BEGIN
update Emp_Table
set Deleted=0
 WHERE ID = @ID;
END;


GO
/****** Object:  StoredProcedure [dbo].[EmployeeSoftDelete]    Script Date: 08-01-2024 19:43:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmployeeSoftDelete]
AS
BEGIN
select * from Emp_Table
    where Deleted = 0
END;
GO
/****** Object:  StoredProcedure [dbo].[EmployeeUpdate]    Script Date: 08-01-2024 19:43:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[EmployeeUpdate]
@ID int,
@Name varchar(50),
@DOB date,
@Location varchar(100),
@Designation varchar(50),
@Email_Address varchar(50),
@Deleted bit
As 
Begin
		UPDATE Emp_Table
		SET
			Name=@Name,
			DOB=@DOB,
			Location=@Location,
			Designation=@Designation,
			Email_Address=@Email_Address,
			Deleted= @Deleted
			
		WHERE ID = @ID
End
GO
/****** Object:  StoredProcedure [dbo].[EmployeeView]    Script Date: 08-01-2024 19:43:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[EmployeeView]
As
begin 
   SELECT * FROM Emp_Table WHERE Deleted=1;
End 
GO
/****** Object:  StoredProcedure [dbo].[RestoreD]    Script Date: 08-01-2024 19:43:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RestoreD]
    @ID INT
AS
BEGIN
    UPDATE Emp_Table
    SET Deleted = 1
    WHERE ID = @ID;
END
GO
USE [master]
GO
ALTER DATABASE [CRUDOPERATION] SET  READ_WRITE 
GO
