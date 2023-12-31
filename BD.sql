USE [master]
GO
/****** Object:  Database [Elecciones2023]    Script Date: 27/6/2023 12:11:47 ******/
CREATE DATABASE [Elecciones2023]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Elecciones2023', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Elecciones2023.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Elecciones2023_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Elecciones2023_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Elecciones2023] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Elecciones2023].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Elecciones2023] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Elecciones2023] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Elecciones2023] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Elecciones2023] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Elecciones2023] SET ARITHABORT OFF 
GO
ALTER DATABASE [Elecciones2023] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Elecciones2023] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Elecciones2023] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Elecciones2023] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Elecciones2023] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Elecciones2023] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Elecciones2023] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Elecciones2023] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Elecciones2023] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Elecciones2023] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Elecciones2023] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Elecciones2023] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Elecciones2023] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Elecciones2023] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Elecciones2023] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Elecciones2023] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Elecciones2023] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Elecciones2023] SET RECOVERY FULL 
GO
ALTER DATABASE [Elecciones2023] SET  MULTI_USER 
GO
ALTER DATABASE [Elecciones2023] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Elecciones2023] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Elecciones2023] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Elecciones2023] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Elecciones2023] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Elecciones2023', N'ON'
GO
ALTER DATABASE [Elecciones2023] SET QUERY_STORE = OFF
GO
USE [Elecciones2023]
GO
/****** Object:  User [alumno]    Script Date: 27/6/2023 12:11:47 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Candidato]    Script Date: 27/6/2023 12:11:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidato](
	[IdCandidato] [int] NOT NULL,
	[IdPartido] [int] NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Foto] [varchar](50) NOT NULL,
	[Postulación] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Candidatos] PRIMARY KEY CLUSTERED 
(
	[IdCandidato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partido]    Script Date: 27/6/2023 12:11:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partido](
	[IdPartido] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Logo] [varchar](50) NOT NULL,
	[SitioWeb] [varchar](50) NOT NULL,
	[FechaFundacion] [date] NOT NULL,
	[CantidadDiputados] [int] NOT NULL,
	[CantidadSenadores] [int] NOT NULL,
 CONSTRAINT [PK_Partido] PRIMARY KEY CLUSTERED 
(
	[IdPartido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Candidato] ([IdCandidato], [IdPartido], [Apellido], [Nombre], [FechaNacimiento], [Foto], [Postulación]) VALUES (1, 1, N'Noba', N'El', CAST(N'2001-01-01' AS Date), N'elnoba.jpg', N'Presidente')
INSERT [dbo].[Candidato] ([IdCandidato], [IdPartido], [Apellido], [Nombre], [FechaNacimiento], [Foto], [Postulación]) VALUES (2, 1, N'Argento', N'Paola', CAST(N'2002-02-02' AS Date), N'paola.jpg', N'VicePresidente')
INSERT [dbo].[Candidato] ([IdCandidato], [IdPartido], [Apellido], [Nombre], [FechaNacimiento], [Foto], [Postulación]) VALUES (3, 2, N'Advincula', N'Luis', CAST(N'1996-05-09' AS Date), N'advincula.jpg', N'Presidente')
INSERT [dbo].[Candidato] ([IdCandidato], [IdPartido], [Apellido], [Nombre], [FechaNacimiento], [Foto], [Postulación]) VALUES (4, 2, N'Tate', N'Andrew', CAST(N'1985-12-05' AS Date), N'tate.jpg', N'VicePresidente')
INSERT [dbo].[Candidato] ([IdCandidato], [IdPartido], [Apellido], [Nombre], [FechaNacimiento], [Foto], [Postulación]) VALUES (5, 3, N'Llanos', N'Ibai', CAST(N'1975-06-09' AS Date), N'ibai.png', N'Presidente')
INSERT [dbo].[Candidato] ([IdCandidato], [IdPartido], [Apellido], [Nombre], [FechaNacimiento], [Foto], [Postulación]) VALUES (6, 3, N'Rodman', N'Dennis', CAST(N'1965-11-16' AS Date), N'rodman.jpg', N'VicePresidente')
GO
INSERT [dbo].[Partido] ([IdPartido], [Nombre], [Logo], [SitioWeb], [FechaFundacion], [CantidadDiputados], [CantidadSenadores]) VALUES (1, N'Frente de Nadie', N'fdn.png', N'frentedenadie.com', CAST(N'2016-07-18' AS Date), 8, 6)
INSERT [dbo].[Partido] ([IdPartido], [Nombre], [Logo], [SitioWeb], [FechaFundacion], [CantidadDiputados], [CantidadSenadores]) VALUES (2, N'Juntos por que quede', N'jxc.png', N'juntosnosepuede.com.ar', CAST(N'1204-05-08' AS Date), 7, 5)
INSERT [dbo].[Partido] ([IdPartido], [Nombre], [Logo], [SitioWeb], [FechaFundacion], [CantidadDiputados], [CantidadSenadores]) VALUES (3, N'La Matanza Avanza', N'lla.png', N'lamatanzaavanza.com.ar', CAST(N'1856-03-19' AS Date), 10, 4)
GO
ALTER TABLE [dbo].[Candidato]  WITH CHECK ADD  CONSTRAINT [FK_Candidatos_Partido] FOREIGN KEY([IdPartido])
REFERENCES [dbo].[Partido] ([IdPartido])
GO
ALTER TABLE [dbo].[Candidato] CHECK CONSTRAINT [FK_Candidatos_Partido]
GO
USE [master]
GO
ALTER DATABASE [Elecciones2023] SET  READ_WRITE 
GO
