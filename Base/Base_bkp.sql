USE [master]
GO
/****** Object:  Database [LoPresto]    Script Date: 02/04/2016 00:52:46 ******/
CREATE DATABASE [LoPresto] ON  PRIMARY 
( NAME = N'LoPresto', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.PROYECTO08\MSSQL\DATA\LoPresto.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LoPresto_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.PROYECTO08\MSSQL\DATA\LoPresto_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LoPresto] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LoPresto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LoPresto] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [LoPresto] SET ANSI_NULLS OFF
GO
ALTER DATABASE [LoPresto] SET ANSI_PADDING OFF
GO
ALTER DATABASE [LoPresto] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [LoPresto] SET ARITHABORT OFF
GO
ALTER DATABASE [LoPresto] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [LoPresto] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [LoPresto] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [LoPresto] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [LoPresto] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [LoPresto] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [LoPresto] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [LoPresto] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [LoPresto] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [LoPresto] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [LoPresto] SET  DISABLE_BROKER
GO
ALTER DATABASE [LoPresto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [LoPresto] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [LoPresto] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [LoPresto] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [LoPresto] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [LoPresto] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [LoPresto] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [LoPresto] SET  READ_WRITE
GO
ALTER DATABASE [LoPresto] SET RECOVERY SIMPLE
GO
ALTER DATABASE [LoPresto] SET  MULTI_USER
GO
ALTER DATABASE [LoPresto] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [LoPresto] SET DB_CHAINING OFF
GO
USE [LoPresto]
GO
/****** Object:  User [usrpresto]    Script Date: 02/04/2016 00:52:46 ******/
CREATE USER [usrpresto] FOR LOGIN [usrpresto] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [RedSocialORT]    Script Date: 02/04/2016 00:52:46 ******/
CREATE USER [RedSocialORT] FOR LOGIN [RedSocialORT] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 02/04/2016 00:52:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id_usr] [int] NOT NULL,
	[Nombre] [nvarchar](20) NOT NULL,
	[Apellido] [nvarchar](20) NOT NULL,
	[Fnac] [date] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Pasword] [nvarchar](50) NOT NULL,
	[Sexo] [char](1) NOT NULL,
	[FechaRegistracion] [datetime] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id_usr] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 02/04/2016 00:52:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[Id_respuesta] [int] NOT NULL,
	[Id_pregunta] [int] NOT NULL,
	[Respuesta] [nvarchar](max) NOT NULL,
	[Moderada] [bit] NULL,
	[Cancelada] [bit] NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[Id_respuesta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Domicilio]    Script Date: 02/04/2016 00:52:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Domicilio](
	[Id_Domicilio] [int] NOT NULL,
	[Id_usr] [int] NOT NULL,
	[Id_localidad] [int] NOT NULL,
	[Calle] [nvarchar](50) NOT NULL,
	[DomNum] [int] NOT NULL,
	[Puerta] [nchar](10) NULL,
	[Comentario] [nvarchar](50) NULL,
 CONSTRAINT [PK_Domicilio] PRIMARY KEY CLUSTERED 
(
	[Id_Domicilio] ASC,
	[Id_usr] ASC,
	[Id_localidad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[UsuarioInsert]    Script Date: 02/04/2016 00:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioInsert]

@Nombre nvarchar(30),
@Apellido nvarchar(30),
@Email nvarchar(100),
@Password nvarchar(100),
@Fnac date,
@Sexo nchar(1),
@FechaRegistracion datetime

AS

Declare @id_usr int

set @id_usr = (select  max(id_usr)+1 from Usuarios)

if @id_usr is null
begin
	set @id_usr = 1
end

INSERT INTO Usuarios
(
id_usr,
Nombre,
Apellido,
Email,
Pasword,
Fnac,
Sexo,
FechaRegistracion
)
VALUES
(
@id_usr,
@Nombre,
@Apellido,
@Email,
@Password,
@Fnac,
@Sexo,
@FechaRegistracion
)

RETURN @id_usr
GO
/****** Object:  StoredProcedure [dbo].[UsuarioBuscarPorEmailPassword]    Script Date: 02/04/2016 00:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioBuscarPorEmailPassword](
@Email nvarchar(100),
@Password nvarchar(100))
AS

  SELECT * FROM Usuarios WHERE Email = @Email AND Pasword = @Password
GO
/****** Object:  StoredProcedure [dbo].[UsuarioBuscarEmail]    Script Date: 02/04/2016 00:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioBuscarEmail]

@Email varchar(100)

AS

IF EXISTS (SELECT * FROM Usuarios WHERE Email = @Email)
	SELECT 1
ELSE
	SELECT 0
GO
/****** Object:  Table [dbo].[Publicaciones]    Script Date: 02/04/2016 00:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publicaciones](
	[Id_publicacion] [int] NOT NULL,
	[Id_usr] [int] NOT NULL,
	[Titulo] [nvarchar](30) NOT NULL,
	[Descripcion] [nvarchar](max) NULL,
	[PrecioD] [float] NOT NULL,
	[PrecioS] [float] NULL,
	[PecioM] [float] NULL,
	[FechaDesde] [date] NOT NULL,
	[FechaHasta] [date] NULL,
	[Alquilado] [bit] NOT NULL,
	[Suspendido] [bit] NOT NULL,
	[Id_cat_lvl3] [int] NULL,
 CONSTRAINT [PK_Publicaciones_1] PRIMARY KEY CLUSTERED 
(
	[Id_publicacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 02/04/2016 00:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[Id_pregunta] [int] NOT NULL,
	[Id_publicacion] [int] NOT NULL,
	[Id_usr] [int] NOT NULL,
	[Pregunta] [nvarchar](max) NOT NULL,
	[Moderada] [bit] NULL,
	[Cancelada] [bit] NULL,
 CONSTRAINT [PK_Preguntas_1] PRIMARY KEY CLUSTERED 
(
	[Id_pregunta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Modificar_Publicacion]    Script Date: 02/04/2016 00:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Modificar_Publicacion]
@Id_publicacion int
AS
BEGIN


UPDATE [LoPresto].[dbo].[Publicaciones]
   SET Suspendido = 1
 WHERE id_publicacion = @Id_publicacion


END
RETURN @Id_publicacion
GO
/****** Object:  StoredProcedure [dbo].[MisPublicaciones]    Script Date: 02/04/2016 00:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MisPublicaciones]

@id_usr varchar(100)

AS

SELECT [Id_publicacion]
      ,[Titulo]
      ,[Descripcion]
      ,[PrecioD]
      ,[PrecioS]
      ,[PecioM]
      ,[FechaDesde]
      ,[FechaHasta]
      ,case when [Suspendido] = 1 then 'Suspendida'
		else 'Activa'
		end as [Estado]
  FROM [LoPresto].[dbo].[Publicaciones]
  where id_usr = @id_usr
  and [Suspendido] = 0
  and [Alquilado] = 0
  
--exec [MisPublicaciones] 1
GO
/****** Object:  StoredProcedure [dbo].[Insertar_Publicacion]    Script Date: 02/04/2016 00:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Insertar_Publicacion]
@Id_usr int,
@Titulo nvarchar(30),
@Descripcion nvarchar(max),
@PrecioD float,
@PrecioS float,
@PrecioM float , 
@FechaDesde datetime,
@FechaHasta datetime,
@Alquilado bit,
@Suspendido bit,
@Id_cat_lvl3 int
AS
BEGIN

declare @Id_publicacion int

set @Id_publicacion = (select  max(Id_publicacion)+1 from [LoPresto].[dbo].[Publicaciones])

if @Id_publicacion is null
begin
	set @Id_publicacion = 1
end


INSERT INTO [LoPresto].[dbo].[Publicaciones]
           ([Id_publicacion]
           ,[Id_usr]
           ,[Titulo]
           ,[Descripcion]
           ,[PrecioD]
           ,[PrecioS]
           ,[PecioM]
           ,[FechaDesde]
           ,[FechaHasta]
           ,[Alquilado]
           ,[Suspendido]
           ,[Id_cat_lvl3])
     VALUES
           (
            @Id_publicacion ,
			@Id_usr,
			@Titulo ,
			@Descripcion ,
			@PrecioD ,
			@PrecioS ,
			@PrecioM ,
			@FechaDesde ,
			@FechaHasta ,
			@Alquilado ,
			@Suspendido ,
			@Id_cat_lvl3
			 )


END
RETURN @Id_publicacion
GO
/****** Object:  Table [dbo].[Favoritos]    Script Date: 02/04/2016 00:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favoritos](
	[Id_fav] [int] NOT NULL,
	[Id_usr] [int] NOT NULL,
	[Id_pub] [int] NOT NULL,
 CONSTRAINT [PK_Favoritos] PRIMARY KEY CLUSTERED 
(
	[Id_fav] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Suspender_Publicacion]    Script Date: 02/04/2016 00:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Suspender_Publicacion]
@Id_publicacion int
AS
BEGIN


UPDATE [LoPresto].[dbo].[Publicaciones]
   SET Suspendido = 1
 WHERE id_publicacion = @Id_publicacion


END
RETURN @Id_publicacion
GO
/****** Object:  StoredProcedure [dbo].[BuscarPublicacion]    Script Date: 02/04/2016 00:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarPublicacion]

@SearchWord varchar(100),
@id_usr int

AS

SELECT [Id_publicacion]
      ,[Titulo]
      ,[Descripcion]
      ,[PrecioD]
      ,[FechaHasta]
  FROM [LoPresto].[dbo].[Publicaciones]
  WHERE (([Descripcion] LIKE '%%'+@SearchWord+'%%')
or  ([Descripcion] LIKE '%% '+@SearchWord+'')
or  ([Descripcion] LIKE ''+@SearchWord+'%%')
or  ([Descripcion] LIKE ''+@SearchWord+'')
or  ([Titulo] LIKE '%%'+@SearchWord+'%%')
or  ([Titulo] LIKE '%%'+@SearchWord+'')
or  ([Titulo] LIKE ''+@SearchWord+'%%')
or  ([Titulo] LIKE ''+@SearchWord+''))
and  Alquilado = 0
and  Suspendido = 0
and id_usr <> @id_usr
GO
/****** Object:  Table [dbo].[Alquiler]    Script Date: 02/04/2016 00:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alquiler](
	[Id_alquiler] [int] NOT NULL,
	[Id_publicacion] [int] NOT NULL,
	[Id_usuario] [int] NOT NULL,
	[Fdes] [date] NOT NULL,
	[Fasta] [date] NOT NULL,
	[Costo] [float] NOT NULL,
	[Confirmado] [bit] NULL,
	[Pagado] [bit] NULL,
	[Finalizado] [bit] NULL,
	[Devuelto] [bit] NULL,
 CONSTRAINT [PK_Alquiler] PRIMARY KEY CLUSTERED 
(
	[Id_alquiler] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PubliImg]    Script Date: 02/04/2016 00:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PubliImg](
	[Id_img] [int] NOT NULL,
	[Id_publicacion] [int] NULL,
	[Orden] [nchar](10) NULL,
	[Foto] [image] NULL,
 CONSTRAINT [PK_PubliImg] PRIMARY KEY CLUSTERED 
(
	[Id_img] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[DatosAlquiler_public]    Script Date: 02/04/2016 00:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DatosAlquiler_public]
@id_usr int,
@id_publicacion int
as

Select 
p.id_publicacion,
p.titulo,u.nombre,
u.apellido,
u.email,
a.costo,
a.fdes,
a.fasta,
a.devuelto,
a.pagado
from Publicaciones as p
join Alquiler as A
on a.id_publicacion = p.id_publicacion
join Usuarios as U
on U.id_usr = a.id_usuario
GO
/****** Object:  StoredProcedure [dbo].[DatosAlquiler_alq]    Script Date: 02/04/2016 00:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DatosAlquiler_alq]
@id_usr int,
@id_publicacion int
as

Select 
p.id_publicacion,
a.id_alquiler,
p.titulo,u.nombre,
u.apellido,
u.email,
a.costo,
a.fdes,
a.fasta,
a.devuelto,
a.pagado
from Publicaciones as p
join Alquiler as A
on a.id_publicacion = p.id_publicacion
join Usuarios as U
on U.id_usr = p.id_usr
GO
/****** Object:  StoredProcedure [dbo].[Alquilar]    Script Date: 02/04/2016 00:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Alquilar] 
@id_publicacion int,
@id_usr_publicador int,
@id_usr_alquilador int,
@costo float,
@fecha_desde date,
@fecha_hasta date
as


declare @Id_alquiler int

set @Id_alquiler = (select  max(Id_alquiler)+1 from [LoPresto].[dbo].[Alquiler])

if @Id_alquiler is null
begin
	set @Id_alquiler = 1
end



INSERT INTO [LoPresto].[dbo].[Alquiler]
           ([Id_alquiler]
           ,[Id_publicacion]
           ,[Id_usuario]
           ,[Fdes]
           ,[Fasta]
           ,[Costo]
           ,[Confirmado]
           ,[Pagado]
           ,[Finalizado]
           ,[Devuelto])
     VALUES
           (@Id_alquiler
           ,@id_publicacion
           ,@id_usr_alquilador
           ,@fecha_desde
           ,@fecha_hasta
           ,@costo
           ,1
           ,1
           ,0
           ,0)
           
           
  UPDATE [LoPresto].[dbo].[Publicaciones]
   SET [Alquilado] = 1
 WHERE id_publicacion = @id_publicacion
GO
/****** Object:  ForeignKey [FK_Domicilio_Usuarios]    Script Date: 02/04/2016 00:52:47 ******/
ALTER TABLE [dbo].[Domicilio]  WITH CHECK ADD  CONSTRAINT [FK_Domicilio_Usuarios] FOREIGN KEY([Id_usr])
REFERENCES [dbo].[Usuarios] ([Id_usr])
GO
ALTER TABLE [dbo].[Domicilio] CHECK CONSTRAINT [FK_Domicilio_Usuarios]
GO
/****** Object:  ForeignKey [FK_Publicaciones_Usuarios]    Script Date: 02/04/2016 00:52:54 ******/
ALTER TABLE [dbo].[Publicaciones]  WITH CHECK ADD  CONSTRAINT [FK_Publicaciones_Usuarios] FOREIGN KEY([Id_usr])
REFERENCES [dbo].[Usuarios] ([Id_usr])
GO
ALTER TABLE [dbo].[Publicaciones] CHECK CONSTRAINT [FK_Publicaciones_Usuarios]
GO
/****** Object:  ForeignKey [FK_Preguntas_Publicaciones]    Script Date: 02/04/2016 00:52:54 ******/
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Publicaciones] FOREIGN KEY([Id_publicacion])
REFERENCES [dbo].[Publicaciones] ([Id_publicacion])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Publicaciones]
GO
/****** Object:  ForeignKey [FK_Preguntas_Respuestas]    Script Date: 02/04/2016 00:52:54 ******/
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Respuestas] FOREIGN KEY([Id_pregunta])
REFERENCES [dbo].[Respuestas] ([Id_respuesta])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Respuestas]
GO
/****** Object:  ForeignKey [FK_Preguntas_Usuarios]    Script Date: 02/04/2016 00:52:54 ******/
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Usuarios] FOREIGN KEY([Id_usr])
REFERENCES [dbo].[Usuarios] ([Id_usr])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Usuarios]
GO
/****** Object:  ForeignKey [FK_Favoritos_Publicaciones]    Script Date: 02/04/2016 00:52:54 ******/
ALTER TABLE [dbo].[Favoritos]  WITH CHECK ADD  CONSTRAINT [FK_Favoritos_Publicaciones] FOREIGN KEY([Id_pub])
REFERENCES [dbo].[Publicaciones] ([Id_publicacion])
GO
ALTER TABLE [dbo].[Favoritos] CHECK CONSTRAINT [FK_Favoritos_Publicaciones]
GO
/****** Object:  ForeignKey [FK_Favoritos_Usuarios1]    Script Date: 02/04/2016 00:52:54 ******/
ALTER TABLE [dbo].[Favoritos]  WITH CHECK ADD  CONSTRAINT [FK_Favoritos_Usuarios1] FOREIGN KEY([Id_usr])
REFERENCES [dbo].[Usuarios] ([Id_usr])
GO
ALTER TABLE [dbo].[Favoritos] CHECK CONSTRAINT [FK_Favoritos_Usuarios1]
GO
/****** Object:  ForeignKey [FK_Alquiler_Publicaciones]    Script Date: 02/04/2016 00:52:54 ******/
ALTER TABLE [dbo].[Alquiler]  WITH CHECK ADD  CONSTRAINT [FK_Alquiler_Publicaciones] FOREIGN KEY([Id_publicacion])
REFERENCES [dbo].[Publicaciones] ([Id_publicacion])
GO
ALTER TABLE [dbo].[Alquiler] CHECK CONSTRAINT [FK_Alquiler_Publicaciones]
GO
/****** Object:  ForeignKey [FK_Alquiler_Usuarios]    Script Date: 02/04/2016 00:52:54 ******/
ALTER TABLE [dbo].[Alquiler]  WITH CHECK ADD  CONSTRAINT [FK_Alquiler_Usuarios] FOREIGN KEY([Id_usuario])
REFERENCES [dbo].[Usuarios] ([Id_usr])
GO
ALTER TABLE [dbo].[Alquiler] CHECK CONSTRAINT [FK_Alquiler_Usuarios]
GO
/****** Object:  ForeignKey [FK_PubliImg_Publicaciones]    Script Date: 02/04/2016 00:52:54 ******/
ALTER TABLE [dbo].[PubliImg]  WITH CHECK ADD  CONSTRAINT [FK_PubliImg_Publicaciones] FOREIGN KEY([Id_publicacion])
REFERENCES [dbo].[Publicaciones] ([Id_publicacion])
GO
ALTER TABLE [dbo].[PubliImg] CHECK CONSTRAINT [FK_PubliImg_Publicaciones]
GO
