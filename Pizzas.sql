USE [DAI-Pizzas]
GO
/****** Object:  User [alumno]    Script Date: 24/4/2023 10:41:25 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Pizzas]    Script Date: 24/4/2023 10:41:25 ******/
CREATE USER [Pizzas] FOR LOGIN [Pizzas] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Pizzas]
GO
/****** Object:  Table [dbo].[Pizzas]    Script Date: 24/4/2023 10:41:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pizzas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](150) NULL,
	[LibreGluten] [bit] NULL,
	[Importe] [float] NULL,
	[Descripcion] [varchar](max) NULL,
 CONSTRAINT [PK_Pizzas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Pizzas] ON 

INSERT [dbo].[Pizzas] ([Id], [Nombre], [LibreGluten], [Importe], [Descripcion]) VALUES (3, N'Muzza Salada', 0, 200, N'Pizza mas barata')
INSERT [dbo].[Pizzas] ([Id], [Nombre], [LibreGluten], [Importe], [Descripcion]) VALUES (4, N'Pizza Margarita', 1, 1450, N'Salsa de tomate, mozzarella, albahaca, orégano y aceite de oliva. Viene con un mentoplus de regalo.')
INSERT [dbo].[Pizzas] ([Id], [Nombre], [LibreGluten], [Importe], [Descripcion]) VALUES (5, NULL, NULL, NULL, NULL)
INSERT [dbo].[Pizzas] ([Id], [Nombre], [LibreGluten], [Importe], [Descripcion]) VALUES (6, N'Pizza Cuatro Quesos', 1, 1380, N'El queso fontina, originario del Valle de La garompiña; el queso gorgonzola, natural de Milán; el queso parmesano, originario de la ciudad de Parma; y el queso mozzarella del supermercado DIA.')
INSERT [dbo].[Pizzas] ([Id], [Nombre], [LibreGluten], [Importe], [Descripcion]) VALUES (7, N'Pizza con Jamon', 0, 1210, N'Pizza con queso Muzzarella, se le agrega Jamon y te cobro el doble.')
INSERT [dbo].[Pizzas] ([Id], [Nombre], [LibreGluten], [Importe], [Descripcion]) VALUES (8, N'Pizza con Rucula y Provolone', 1, 1380, N'Riquisima Pizza a la piedra, con queso provolone. Con el aliento de dragon que te queda aflojas un tornillo del puente Alsina.')
INSERT [dbo].[Pizzas] ([Id], [Nombre], [LibreGluten], [Importe], [Descripcion]) VALUES (9, N'Pizza Picante.', 1, 1400, N'Masa fina, queso del mercadito de la esquina, aji mejicano recontra picante. ATENCION: Cuando vas al baño se te incendia el papel higienico.')
INSERT [dbo].[Pizzas] ([Id], [Nombre], [LibreGluten], [Importe], [Descripcion]) VALUES (10, N'@pNombre', 1, 400, N'@pDescripcion')
INSERT [dbo].[Pizzas] ([Id], [Nombre], [LibreGluten], [Importe], [Descripcion]) VALUES (11, N'Muzza Salada', 1, 400, N'Una pizza rica')
SET IDENTITY_INSERT [dbo].[Pizzas] OFF
GO
/****** Object:  StoredProcedure [dbo].[Pizzas_DeleteById]    Script Date: 24/4/2023 10:41:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Pizzas_DeleteById]
	-- Add the parameters for the stored procedure here
	@idPizza int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM Pizzas WHERE Id = @idPizza;
END
GO
/****** Object:  StoredProcedure [dbo].[Pizzas_Insertar]    Script Date: 24/4/2023 10:41:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Pizzas_Insertar] 
	-- Add the parameters for the stored procedure here
	@nombre varchar(MAX),
	@libreGluten bit,
	@importe float,
	@descripcion varchar(MAX)


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		INSERT INTO Pizzas ( Nombre  , LibreGluten   , Importe   , Descripcion) VALUES (@nombre , @libreGluten  , @importe  , @descripcion);
END
GO
/****** Object:  StoredProcedure [dbo].[Pizzas_ObtenerPorId]    Script Date: 24/4/2023 10:41:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Pizzas_ObtenerPorId]
	@idPizza INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT Id, Nombre, LibreGluten, Importe, Descripcion FROM Pizzas WHERE Id = @idPizza;
END
GO
/****** Object:  StoredProcedure [dbo].[Pizzas_ObtenerTodos]    Script Date: 24/4/2023 10:41:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Pizzas_ObtenerTodos]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	SELECT	
		[Id]			,
		[Nombre]		,
		[LibreGluten]	,
		[Importe]		,
		[Descripcion]	
	FROM [Pizzas]
END
GO
/****** Object:  StoredProcedure [dbo].[Pizzas_UpdatePorID]    Script Date: 24/4/2023 10:41:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Pizzas_UpdatePorID]
	-- Add the parameters for the stored procedure here
		@nombre varchar(MAX),
	@libreGluten bit,
	@importe float,
	@descripcion varchar(MAX),
	@idPizza int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE Pizzas SET  Nombre = @nombre, LibreGluten = @libreGluten, Importe = @importe,Descripcion = @descripcion WHERE Id = @idPizza

END
GO
