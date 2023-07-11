/****** Object:  Database [InfoToolsSV]    Script Date: 08/05/2021 15:40:48 ******/
CREATE DATABASE [InfoToolsSV]
GO
USE [InfoToolsSV]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 08/05/2021 15:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id] [int] IDENTITY(1000,1) NOT NULL,
	[Usuario] [varchar](50) NULL,
	[Contrasenia] [varbinary](500) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarUsuario]    Script Date: 08/05/2021 15:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_AgregarUsuario]
@Usuario varchar(50),
@Contrasenia varchar(50),
@Patron varchar(50)
as
begin
insert into Usuarios(Usuario, Contrasenia) values (@Usuario,ENCRYPTBYPASSPHRASE(@Patron,@Contrasenia))
End
GO
/****** Object:  StoredProcedure [dbo].[SP_ValidarUsuario]    Script Date: 08/05/2021 15:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_ValidarUsuario]
@Usuario varchar(50),
@Contrasenia varchar(50),
@Patron varchar(50)
as
begin
select*from Usuarios where Usuario=@Usuario and CONVERT(varchar(50),DECRYPTBYPASSPHRASE(@Patron, Contrasenia))=@Contrasenia
end
GO
USE [master]
GO
ALTER DATABASE [InfoToolsSV] SET  READ_WRITE 
GO
