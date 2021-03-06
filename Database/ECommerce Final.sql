CREATE DATABASE [ECommerce]
GO

use ECommerce
GO

create procedure [dbo].[BitacoraLogInsert]
(
	@IdBitacoraLog int,
	@CUIT int,
	@NombreUsuario varchar(100),
	@Evento varchar(200),
	@FechaEvento datetime
)

as

set nocount on

insert into [BitacoraLog]
(
	[IdBitacoraLog],
	[CUIT],
	[NombreUsuario],
	[Evento],
	[FechaEvento]
)
values
(
	@IdBitacoraLog,
	@CUIT,
	@NombreUsuario,
	@Evento,
	@FechaEvento
)


GO
/****** Object:  StoredProcedure [dbo].[BitacoraLogSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[BitacoraLogSelect]
(
	@IdBitacoraLog int
)

as

set nocount on

select [IdBitacoraLog],
	[CUIT],
	[NombreUsuario],
	[Evento],
	[FechaEvento]
from [BitacoraLog]
where [IdBitacoraLog] = @IdBitacoraLog


GO
/****** Object:  StoredProcedure [dbo].[BitacoraLogSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[BitacoraLogSelectAll]

as

set nocount on

select [IdBitacoraLog],
	[CUIT],
	[NombreUsuario],
	[Evento],
	[FechaEvento]
from [BitacoraLog]


GO
/****** Object:  StoredProcedure [dbo].[BitacoraLogSelectAllByCUIT_NombreUsuario]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[BitacoraLogSelectAllByCUIT_NombreUsuario]
(
	@CUIT int,
	@NombreUsuario varchar(100)
)

as

set nocount on

select [IdBitacoraLog],
	[CUIT],
	[NombreUsuario],
	[Evento],
	[FechaEvento]
from [BitacoraLog]
where [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario


GO
/****** Object:  StoredProcedure [dbo].[BitacoraLogUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[BitacoraLogUpdate]
(
	@IdBitacoraLog int,
	@CUIT int,
	@NombreUsuario varchar(100),
	@Evento varchar(200),
	@FechaEvento datetime
)

as

set nocount on

update [BitacoraLog]
set [CUIT] = @CUIT,
	[NombreUsuario] = @NombreUsuario,
	[Evento] = @Evento,
	[FechaEvento] = @FechaEvento
where [IdBitacoraLog] = @IdBitacoraLog


GO
/****** Object:  StoredProcedure [dbo].[CategoriaDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[CategoriaDelete]
(
	@IdCategoria int
)

as

set nocount on

update [Categoria]
set FecBaja = getdate()
where [IdCategoria] = @IdCategoria


GO
/****** Object:  StoredProcedure [dbo].[CategoriaDeleteAllByIdCategoria]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[CategoriaDeleteAllByIdCategoria]
(
	@IdCategoria int
)

as

set nocount on


update [Categoria]
set FecBaja = getdate()
where [IdCategoria] = @IdCategoria


GO
/****** Object:  StoredProcedure [dbo].[CategoriaInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[CategoriaInsert]
(
	@DescripCategoria varchar(200)
)

as

set nocount on

insert into [Categoria]
(
	[DescripCategoria]
)
values
(
	@DescripCategoria
)

select scope_identity()


GO
/****** Object:  StoredProcedure [dbo].[CategoriaSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[CategoriaSelect]
(
	@IdCategoria int
)

as

set nocount on

select [IdCategoria],
	[DescripCategoria],
	[FecBaja]
from [Categoria]
where [IdCategoria] = @IdCategoria


GO
/****** Object:  StoredProcedure [dbo].[CategoriaSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[CategoriaSelectAll]

as

set nocount on

select [IdCategoria],
	[DescripCategoria],
	[FecBaja]
from [Categoria]


GO
/****** Object:  StoredProcedure [dbo].[CategoriaSelectAllByIdCategoria]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[CategoriaSelectAllByIdCategoria]
(
	@IdCategoria int
)

as

set nocount on

select [IdCategoria],
	[DescripCategoria],
	[FecBaja]
from [Categoria]
where [IdCategoria] = @IdCategoria


GO
/****** Object:  StoredProcedure [dbo].[CategoriaUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[CategoriaUpdate]
(
	@IdCategoria int,
	@DescripCategoria varchar(200)
)

as

set nocount on

update [Categoria]
set [DescripCategoria] = @DescripCategoria
where [IdCategoria] = @IdCategoria


GO
/****** Object:  StoredProcedure [dbo].[ComprobanteDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ComprobanteDelete]
(
	@NroComprobante int,
	@IdSucursal int,
	@IdTipoComprobante int,
	@CUIT int
)

as

set nocount on


update [Comprobante]
set FecBaja = getdate()
where [NroComprobante] = @NroComprobante
	and [IdSucursal] = @IdSucursal
	and [IdTipoComprobante] = @IdTipoComprobante
	and [CUIT] = @CUIT


GO
/****** Object:  StoredProcedure [dbo].[ComprobanteDeleteAllByCUIT]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ComprobanteDeleteAllByCUIT]
(
	@CUIT int
)

as

set nocount on



update [Comprobante]
set FecBaja = getdate()
where [CUIT] = @CUIT


GO
/****** Object:  StoredProcedure [dbo].[ComprobanteDeleteAllByIdPedido]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ComprobanteDeleteAllByIdPedido]
(
	@IdPedido int
)

as

set nocount on


update [Comprobante]
set FecBaja = getdate()
where [IdPedido] = @IdPedido


GO
/****** Object:  StoredProcedure [dbo].[ComprobanteDeleteAllByIdSucursal]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ComprobanteDeleteAllByIdSucursal]
(
	@IdSucursal int
)

as

set nocount on

update [Comprobante]
set FecBaja = getdate()
where [IdSucursal] = @IdSucursal


GO
/****** Object:  StoredProcedure [dbo].[ComprobanteDeleteAllByIdTipoComprobante]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ComprobanteDeleteAllByIdTipoComprobante]
(
	@IdTipoComprobante int
)

as

set nocount on


update [Comprobante]
set FecBaja = getdate()
where [IdTipoComprobante] = @IdTipoComprobante


GO
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ComprobanteDetalleDelete]
(
	@IdComprobanteDetalle int,
	@NroComprobante int,
	@IdSucursal int,
	@IdTipoComprobante int,
	@CUIT int
)

as

set nocount on


update [ComprobanteDetalle]
set FecBaja = getdate()
where [IdComprobanteDetalle] = @IdComprobanteDetalle
	and [NroComprobante] = @NroComprobante
	and [IdSucursal] = @IdSucursal
	and [IdTipoComprobante] = @IdTipoComprobante
	and [CUIT] = @CUIT


GO
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleDeleteAllByIdProducto]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ComprobanteDetalleDeleteAllByIdProducto]
(
	@IdProducto int
)

as

set nocount on


update [ComprobanteDetalle]
set FecBaja = getdate()
where [IdProducto] = @IdProducto


GO
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleDeleteAllByNroComprobante_IdSucursal_IdTipoComprobante_CUIT]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ComprobanteDetalleDeleteAllByNroComprobante_IdSucursal_IdTipoComprobante_CUIT]
(
	@NroComprobante int,
	@IdSucursal int,
	@IdTipoComprobante int,
	@CUIT int
)

as

set nocount on

update [ComprobanteDetalle]
set FecBaja = getdate()
where [NroComprobante] = @NroComprobante
	and [IdSucursal] = @IdSucursal
	and [IdTipoComprobante] = @IdTipoComprobante
	and [CUIT] = @CUIT


GO
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ComprobanteDetalleInsert]
(
	@IdComprobanteDetalle int,
	@NroComprobante int,
	@IdSucursal int,
	@IdTipoComprobante int,
	@CUIT int,
	@IdProducto int,
	@CantidadProducto int,
	@PrecioUnitarioFact decimal(18, 0)
)

as

set nocount on

insert into [ComprobanteDetalle]
(
	[IdComprobanteDetalle],
	[NroComprobante],
	[IdSucursal],
	[IdTipoComprobante],
	[CUIT],
	[IdProducto],
	[CantidadProducto],
	[PrecioUnitarioFact]
)
values
(
	@IdComprobanteDetalle,
	@NroComprobante,
	@IdSucursal,
	@IdTipoComprobante,
	@CUIT,
	@IdProducto,
	@CantidadProducto,
	@PrecioUnitarioFact
)


GO
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ComprobanteDetalleSelect]
(
	@IdComprobanteDetalle int,
	@NroComprobante int,
	@IdSucursal int,
	@IdTipoComprobante int,
	@CUIT int
)

as

set nocount on

select [IdComprobanteDetalle],
	[NroComprobante],
	[IdSucursal],
	[IdTipoComprobante],
	[CUIT],
	[IdProducto],
	[CantidadProducto],
	[PrecioUnitarioFact]
from [ComprobanteDetalle]
where [IdComprobanteDetalle] = @IdComprobanteDetalle
	and [NroComprobante] = @NroComprobante
	and [IdSucursal] = @IdSucursal
	and [IdTipoComprobante] = @IdTipoComprobante
	and [CUIT] = @CUIT


GO
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ComprobanteDetalleSelectAll]

as

set nocount on

select [IdComprobanteDetalle],
	[NroComprobante],
	[IdSucursal],
	[IdTipoComprobante],
	[CUIT],
	[IdProducto],
	[CantidadProducto],
	[PrecioUnitarioFact]
from [ComprobanteDetalle]


GO
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleSelectAllByIdProducto]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ComprobanteDetalleSelectAllByIdProducto]
(
	@IdProducto int
)

as

set nocount on

select [IdComprobanteDetalle],
	[NroComprobante],
	[IdSucursal],
	[IdTipoComprobante],
	[CUIT],
	[IdProducto],
	[CantidadProducto],
	[PrecioUnitarioFact]
from [ComprobanteDetalle]
where [IdProducto] = @IdProducto


GO
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleSelectAllByNroComprobante_IdSucursal_IdTipoComprobante_CUIT]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ComprobanteDetalleSelectAllByNroComprobante_IdSucursal_IdTipoComprobante_CUIT]
(
	@NroComprobante int,
	@IdSucursal int,
	@IdTipoComprobante int,
	@CUIT int
)

as

set nocount on

select [IdComprobanteDetalle],
	[NroComprobante],
	[IdSucursal],
	[IdTipoComprobante],
	[CUIT],
	[IdProducto],
	[CantidadProducto],
	[PrecioUnitarioFact]
from [ComprobanteDetalle]
where [NroComprobante] = @NroComprobante
	and [IdSucursal] = @IdSucursal
	and [IdTipoComprobante] = @IdTipoComprobante
	and [CUIT] = @CUIT


GO
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ComprobanteDetalleUpdate]
(
	@IdComprobanteDetalle int,
	@NroComprobante int,
	@IdSucursal int,
	@IdTipoComprobante int,
	@CUIT int,
	@IdProducto int,
	@CantidadProducto int,
	@PrecioUnitarioFact decimal(18, 0)
)

as

set nocount on

update [ComprobanteDetalle]
set [IdProducto] = @IdProducto,
	[CantidadProducto] = @CantidadProducto,
	[PrecioUnitarioFact] = @PrecioUnitarioFact
where [IdComprobanteDetalle] = @IdComprobanteDetalle	and [NroComprobante] = @NroComprobante	and [IdSucursal] = @IdSucursal	and [IdTipoComprobante] = @IdTipoComprobante	and [CUIT] = @CUIT


GO
/****** Object:  StoredProcedure [dbo].[ComprobanteInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ComprobanteInsert]
(
	@NroComprobante int,
	@IdSucursal int,
	@CUIT int,
	@IdTipoComprobante int,
	@IdComprobante int,
	@FechaComprobante datetime,
	@IdPedido int
)

as

set nocount on

insert into [Comprobante]
(
	[NroComprobante],
	[IdSucursal],
	[CUIT],
	[IdTipoComprobante],
	[IdComprobante],
	[FechaComprobante],
	[IdPedido]
)
values
(
	@NroComprobante,
	@IdSucursal,
	@CUIT,
	@IdTipoComprobante,
	@IdComprobante,
	@FechaComprobante,
	@IdPedido
)


GO
/****** Object:  StoredProcedure [dbo].[ComprobanteSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ComprobanteSelect]
(
	@NroComprobante int,
	@IdSucursal int,
	@IdTipoComprobante int,
	@CUIT int
)

as

set nocount on

select [NroComprobante],
	[IdSucursal],
	[CUIT],
	[IdTipoComprobante],
	[IdComprobante],
	[FechaComprobante],
	[IdPedido],
	[FecBaja]
from [Comprobante]
where [NroComprobante] = @NroComprobante
	and [IdSucursal] = @IdSucursal
	and [IdTipoComprobante] = @IdTipoComprobante
	and [CUIT] = @CUIT


GO
/****** Object:  StoredProcedure [dbo].[ComprobanteSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ComprobanteSelectAll]

as

set nocount on

select [NroComprobante],
	[IdSucursal],
	[CUIT],
	[IdTipoComprobante],
	[IdComprobante],
	[FechaComprobante],
	[IdPedido],
	[FecBaja]
from [Comprobante]


GO
/****** Object:  StoredProcedure [dbo].[ComprobanteSelectAllByCUIT]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ComprobanteSelectAllByCUIT]
(
	@CUIT int
)

as

set nocount on

select [NroComprobante],
	[IdSucursal],
	[CUIT],
	[IdTipoComprobante],
	[IdComprobante],
	[FechaComprobante],
	[IdPedido],
	[FecBaja]
from [Comprobante]
where [CUIT] = @CUIT


GO
/****** Object:  StoredProcedure [dbo].[ComprobanteSelectAllByIdPedido]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ComprobanteSelectAllByIdPedido]
(
	@IdPedido int
)

as

set nocount on

select [NroComprobante],
	[IdSucursal],
	[CUIT],
	[IdTipoComprobante],
	[IdComprobante],
	[FechaComprobante],
	[IdPedido],
	[FecBaja]
from [Comprobante]
where [IdPedido] = @IdPedido


GO
/****** Object:  StoredProcedure [dbo].[ComprobanteSelectAllByIdSucursal]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ComprobanteSelectAllByIdSucursal]
(
	@IdSucursal int
)

as

set nocount on

select [NroComprobante],
	[IdSucursal],
	[CUIT],
	[IdTipoComprobante],
	[IdComprobante],
	[FechaComprobante],
	[IdPedido],
	[FecBaja]
from [Comprobante]
where [IdSucursal] = @IdSucursal


GO
/****** Object:  StoredProcedure [dbo].[ComprobanteSelectAllByIdTipoComprobante]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ComprobanteSelectAllByIdTipoComprobante]
(
	@IdTipoComprobante int
)

as

set nocount on

select [NroComprobante],
	[IdSucursal],
	[CUIT],
	[IdTipoComprobante],
	[IdComprobante],
	[FechaComprobante],
	[IdPedido],
	[FecBaja]
from [Comprobante]
where [IdTipoComprobante] = @IdTipoComprobante


GO
/****** Object:  StoredProcedure [dbo].[ComprobanteUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ComprobanteUpdate]
(
	@NroComprobante int,
	@IdSucursal int,
	@CUIT int,
	@IdTipoComprobante int,
	@IdComprobante int,
	@FechaComprobante datetime,
	@IdPedido int
)

as

set nocount on

update [Comprobante]
set [IdComprobante] = @IdComprobante,
	[FechaComprobante] = @FechaComprobante,
	[IdPedido] = @IdPedido
where [NroComprobante] = @NroComprobante	and [IdSucursal] = @IdSucursal	and [IdTipoComprobante] = @IdTipoComprobante	and [CUIT] = @CUIT


GO
/****** Object:  StoredProcedure [dbo].[CondicionFiscalDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[CondicionFiscalDelete]
(
	@IdCondicionFiscal int
)

as

set nocount on


update [CondicionFiscal]
set FecBaja = getdate()
where [IdCondicionFiscal] = @IdCondicionFiscal


GO
/****** Object:  StoredProcedure [dbo].[CondicionFiscalInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[CondicionFiscalInsert]
(
	@Descripcion varchar(200)
)

as

set nocount on

insert into [CondicionFiscal]
(
	[Descripcion]
)
values
(
	@Descripcion
)

select scope_identity()


GO
/****** Object:  StoredProcedure [dbo].[CondicionFiscalSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[CondicionFiscalSelect]
(
	@IdCondicionFiscal int
)

as

set nocount on

select [IdCondicionFiscal],
	[Descripcion],
	[FecBaja]
from [CondicionFiscal]
where [IdCondicionFiscal] = @IdCondicionFiscal


GO
/****** Object:  StoredProcedure [dbo].[CondicionFiscalSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[CondicionFiscalSelectAll]

as

set nocount on

select [IdCondicionFiscal],
	[Descripcion],
	[FecBaja]
from [CondicionFiscal]


GO
/****** Object:  StoredProcedure [dbo].[CondicionFiscalUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[CondicionFiscalUpdate]
(
	@IdCondicionFiscal int,
	@Descripcion varchar(200)
)

as

set nocount on

update [CondicionFiscal]
set [Descripcion] = @Descripcion
where [IdCondicionFiscal] = @IdCondicionFiscal


GO
/****** Object:  StoredProcedure [dbo].[ControladorDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ControladorDelete]
(
	@IdControlador int
)

as

set nocount on


update [Controlador]
set FecBaja = getdate()
where [IdControlador] = @IdControlador


GO
/****** Object:  StoredProcedure [dbo].[ControladorDeleteAllByIdEmpresa]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ControladorDeleteAllByIdEmpresa]
(
	@IdEmpresa int
)

as

set nocount on

update [Controlador]
set FecBaja = getdate()
where [IdEmpresa] = @IdEmpresa


GO
/****** Object:  StoredProcedure [dbo].[ControladorInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ControladorInsert]
(
	@IdEmpresa int,
	@Pagina varchar(500),
	@Controlador varchar(500),
	@Descripcion varchar(1000)
)

as

set nocount on

insert into [Controlador]
(
	[IdEmpresa],
	[Pagina],
	[Controlador],
	[Descripcion]
)
values
(
	@IdEmpresa,
	@Pagina,
	@Controlador,
	@Descripcion
)

select scope_identity()


GO
/****** Object:  StoredProcedure [dbo].[ControladorSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ControladorSelect]
(
	@IdControlador int
)

as

set nocount on

select [IdControlador],
	[IdEmpresa],
	[Pagina],
	[Controlador],
	[Descripcion]
from [Controlador]
where [IdControlador] = @IdControlador


GO
/****** Object:  StoredProcedure [dbo].[ControladorSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ControladorSelectAll]

as

set nocount on

select [IdControlador],
	[IdEmpresa],
	[Pagina],
	[Controlador],
	[Descripcion]
from [Controlador]


GO
/****** Object:  StoredProcedure [dbo].[ControladorSelectAllByIdEmpresa]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ControladorSelectAllByIdEmpresa]
(
	@IdEmpresa int
)

as

set nocount on

select [IdControlador],
	[IdEmpresa],
	[Pagina],
	[Controlador],
	[Descripcion]
from [Controlador]
where [IdEmpresa] = @IdEmpresa


GO
/****** Object:  StoredProcedure [dbo].[ControladorUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ControladorUpdate]
(
	@IdControlador int,
	@IdEmpresa int,
	@Pagina varchar(500),
	@Controlador varchar(500),
	@Descripcion varchar(1000)
)

as

set nocount on

update [Controlador]
set [IdEmpresa] = @IdEmpresa,
	[Pagina] = @Pagina,
	[Controlador] = @Controlador,
	[Descripcion] = @Descripcion
where [IdControlador] = @IdControlador


GO
/****** Object:  StoredProcedure [dbo].[DireccionDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DireccionDelete]
(
	@IdDireccion int
)

as

set nocount on

update [Direccion]
set FecBaja = getdate()
where [IdDireccion] = @IdDireccion


GO
/****** Object:  StoredProcedure [dbo].[DireccionDeleteAllByIdProvincia]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DireccionDeleteAllByIdProvincia]
(
	@IdProvincia int
)

as

set nocount on


update [Direccion]
set FecBaja = getdate()
where [IdProvincia] = @IdProvincia


GO
/****** Object:  StoredProcedure [dbo].[DireccionDeleteAllByIdTipoDireccion]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DireccionDeleteAllByIdTipoDireccion]
(
	@IdTipoDireccion int
)

as

set nocount on

update [Direccion]
set FecBaja = getdate()
where [IdTipoDireccion] = @IdTipoDireccion


GO
/****** Object:  StoredProcedure [dbo].[DireccionInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DireccionInsert]
(
	@Calle varchar(200),
	@Numero int,
	@Piso int,
	@Departamento varchar(100),
	@Localidad varchar(200),
	@IdProvincia int,
	@IdTipoDireccion int
)

as

set nocount on

insert into [Direccion]
(
	[Calle],
	[Numero],
	[Piso],
	[Departamento],
	[Localidad],
	[IdProvincia],
	[IdTipoDireccion]
)
values
(
	@Calle,
	@Numero,
	@Piso,
	@Departamento,
	@Localidad,
	@IdProvincia,
	@IdTipoDireccion
)

select scope_identity()


GO
/****** Object:  StoredProcedure [dbo].[DireccionSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DireccionSelect]
(
	@IdDireccion int
)

as

set nocount on

select [IdDireccion],
	[Calle],
	[Numero],
	[Piso],
	[Departamento],
	[Localidad],
	[IdProvincia],
	[IdTipoDireccion],
	[FecBaja]
from [Direccion]
where [IdDireccion] = @IdDireccion


GO
/****** Object:  StoredProcedure [dbo].[DireccionSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DireccionSelectAll]

as

set nocount on

select [IdDireccion],
	[Calle],
	[Numero],
	[Piso],
	[Departamento],
	[Localidad],
	[IdProvincia],
	[IdTipoDireccion],
	[FecBaja]
from [Direccion]


GO
/****** Object:  StoredProcedure [dbo].[DireccionSelectAllByIdProvincia]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DireccionSelectAllByIdProvincia]
(
	@IdProvincia int
)

as

set nocount on

select [IdDireccion],
	[Calle],
	[Numero],
	[Piso],
	[Departamento],
	[Localidad],
	[IdProvincia],
	[IdTipoDireccion],
	[FecBaja]
from [Direccion]
where [IdProvincia] = @IdProvincia


GO
/****** Object:  StoredProcedure [dbo].[DireccionSelectAllByIdTipoDireccion]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DireccionSelectAllByIdTipoDireccion]
(
	@IdTipoDireccion int
)

as

set nocount on

select [IdDireccion],
	[Calle],
	[Numero],
	[Piso],
	[Departamento],
	[Localidad],
	[IdProvincia],
	[IdTipoDireccion],
	[FecBaja]
from [Direccion]
where [IdTipoDireccion] = @IdTipoDireccion


GO
/****** Object:  StoredProcedure [dbo].[DireccionUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DireccionUpdate]
(
	@IdDireccion int,
	@Calle varchar(200),
	@Numero int,
	@Piso int,
	@Departamento varchar(100),
	@Localidad varchar(200),
	@IdProvincia int,
	@IdTipoDireccion int
)

as

set nocount on

update [Direccion]
set [Calle] = @Calle,
	[Numero] = @Numero,
	[Piso] = @Piso,
	[Departamento] = @Departamento,
	[Localidad] = @Localidad,
	[IdProvincia] = @IdProvincia,
	[IdTipoDireccion] = @IdTipoDireccion
where [IdDireccion] = @IdDireccion


GO
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DireccionUsuarioDelete]
(
	@IdDireccion int,
	@CUIT int,
	@NombreUsuario varchar(100)
)

as

set nocount on



update [DireccionUsuario]
set FecBaja = getdate()
where [IdDireccion] = @IdDireccion
	and [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario


GO
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioDeleteAllByCUIT_NombreUsuario]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DireccionUsuarioDeleteAllByCUIT_NombreUsuario]
(
	@CUIT int,
	@NombreUsuario varchar(100)
)

as

set nocount on


update [DireccionUsuario]
set FecBaja = getdate()
where [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario


GO
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioDeleteAllByIdDireccion]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DireccionUsuarioDeleteAllByIdDireccion]
(
	@IdDireccion int
)

as

set nocount on



update [DireccionUsuario]
set FecBaja = getdate()
where [IdDireccion] = @IdDireccion


GO
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DireccionUsuarioInsert]
(
	@IdDireccion int,
	@CUIT int,
	@NombreUsuario varchar(100)
)

as

set nocount on

insert into [DireccionUsuario]
(
	[IdDireccion],
	[CUIT],
	[NombreUsuario]
)
values
(
	@IdDireccion,
	@CUIT,
	@NombreUsuario
)


GO
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DireccionUsuarioSelect]
(
	@IdDireccion int,
	@CUIT int,
	@NombreUsuario varchar(100)
)

as

set nocount on

select [IdDireccion],
	[CUIT],
	[NombreUsuario],
	[FecBaja]
from [DireccionUsuario]
where [IdDireccion] = @IdDireccion
	and [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario


GO
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DireccionUsuarioSelectAll]

as

set nocount on

select [IdDireccion],
	[CUIT],
	[NombreUsuario],
	[FecBaja]
from [DireccionUsuario]


GO
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioSelectAllByCUIT_NombreUsuario]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DireccionUsuarioSelectAllByCUIT_NombreUsuario]
(
	@CUIT int,
	@NombreUsuario varchar(100)
)

as

set nocount on

select [IdDireccion],
	[CUIT],
	[NombreUsuario],
	[FecBaja]
from [DireccionUsuario]
where [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario


GO
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioSelectAllByIdDireccion]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DireccionUsuarioSelectAllByIdDireccion]
(
	@IdDireccion int
)

as

set nocount on

select [IdDireccion],
	[CUIT],
	[NombreUsuario],
	[FecBaja]
from [DireccionUsuario]
where [IdDireccion] = @IdDireccion


GO
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DireccionUsuarioUpdate]
(
	@IdDireccion int,
	@CUIT int,
	@NombreUsuario varchar(100),
	@FecBaja datetime
)

as

set nocount on

update [DireccionUsuario]
set [FecBaja] = @FecBaja
where [IdDireccion] = @IdDireccion	and [CUIT] = @CUIT	and [NombreUsuario] = @NombreUsuario


GO
/****** Object:  StoredProcedure [dbo].[EmpresaDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[EmpresaDelete]
(
	@CUIT int
)

as

set nocount on



update [Empresa]
set FecBaja = getdate()
where [CUIT] = @CUIT


GO
/****** Object:  StoredProcedure [dbo].[EmpresaInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[EmpresaInsert]
(
	@CUIT int,
	@NombreEmpresa varchar(200)
)

as

set nocount on

insert into [Empresa]
(
	[CUIT],
	[NombreEmpresa]
)
values
(
	@CUIT,
	@NombreEmpresa
)


GO
/****** Object:  StoredProcedure [dbo].[EmpresaSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[EmpresaSelect]
(
	@CUIT int
)

as

set nocount on

select [CUIT],
	[NombreEmpresa],
	[FecBaja]
from [Empresa]
where [CUIT] = @CUIT


GO
/****** Object:  StoredProcedure [dbo].[EmpresaSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[EmpresaSelectAll]

as

set nocount on

select [CUIT],
	[NombreEmpresa],
	[FecBaja]
from [Empresa]


GO
/****** Object:  StoredProcedure [dbo].[EmpresaUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[EmpresaUpdate]
(
	@CUIT int,
	@NombreEmpresa varchar(200)
)

as

set nocount on

update [Empresa]
set [NombreEmpresa] = @NombreEmpresa
where [CUIT] = @CUIT


GO
/****** Object:  StoredProcedure [dbo].[EstadoPagoDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[EstadoPagoDelete]
(
	@IdEstadoPago int
)

as

set nocount on



update [EstadoPago]
set FecBaja = getdate()
where [IdEstadoPago] = @IdEstadoPago


GO
/****** Object:  StoredProcedure [dbo].[EstadoPagoInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[EstadoPagoInsert]
(
	@DescripEstadoPago varchar(200)
)

as

set nocount on

insert into [EstadoPago]
(
	[DescripEstadoPago]
)
values
(
	@DescripEstadoPago
)

select scope_identity()


GO
/****** Object:  StoredProcedure [dbo].[EstadoPagoSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[EstadoPagoSelect]
(
	@IdEstadoPago int
)

as

set nocount on

select [IdEstadoPago],
	[DescripEstadoPago],
	[FecBaja]
from [EstadoPago]
where [IdEstadoPago] = @IdEstadoPago


GO
/****** Object:  StoredProcedure [dbo].[EstadoPagoSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[EstadoPagoSelectAll]

as

set nocount on

select [IdEstadoPago],
	[DescripEstadoPago],
	[FecBaja]
from [EstadoPago]


GO
/****** Object:  StoredProcedure [dbo].[EstadoPagoUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[EstadoPagoUpdate]
(
	@IdEstadoPago int,
	@DescripEstadoPago varchar(200)
)

as

set nocount on

update [EstadoPago]
set [DescripEstadoPago] = @DescripEstadoPago
where [IdEstadoPago] = @IdEstadoPago


GO
/****** Object:  StoredProcedure [dbo].[EstadoPedidoDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[EstadoPedidoDelete]
(
	@IdEstadoPedido int
)

as

set nocount on


update [EstadoPedido]
set FecBaja = getdate()
where [IdEstadoPedido] = @IdEstadoPedido


GO
/****** Object:  StoredProcedure [dbo].[EstadoPedidoInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[EstadoPedidoInsert]
(
	@DescripcionEstadoPedido varchar(20)
)

as

set nocount on

insert into [EstadoPedido]
(
	[DescripcionEstadoPedido]
)
values
(
	@DescripcionEstadoPedido
)

select scope_identity()


GO
/****** Object:  StoredProcedure [dbo].[EstadoPedidoSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[EstadoPedidoSelect]
(
	@IdEstadoPedido int
)

as

set nocount on

select [IdEstadoPedido],
	[DescripcionEstadoPedido],
	[FecBaja]
from [EstadoPedido]
where [IdEstadoPedido] = @IdEstadoPedido


GO
/****** Object:  StoredProcedure [dbo].[EstadoPedidoSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[EstadoPedidoSelectAll]

as

set nocount on

select [IdEstadoPedido],
	[DescripcionEstadoPedido],
	[FecBaja]
from [EstadoPedido]


GO
/****** Object:  StoredProcedure [dbo].[EstadoPedidoUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[EstadoPedidoUpdate]
(
	@IdEstadoPedido int,
	@DescripcionEstadoPedido varchar(20)
)

as

set nocount on

update [EstadoPedido]
set [DescripcionEstadoPedido] = @DescripcionEstadoPedido
where [IdEstadoPedido] = @IdEstadoPedido


GO
/****** Object:  StoredProcedure [dbo].[FamiliaDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[FamiliaDelete]
(
	@IdFamilia int
)

as

set nocount on




update [Familia]
set FecBaja = getdate()
where [IdFamilia] = @IdFamilia


GO
/****** Object:  StoredProcedure [dbo].[FamiliaInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[FamiliaInsert]
(
	@NombreFamilia varchar(200)
)

as

set nocount on

insert into [Familia]
(
	[NombreFamilia]
)
values
(
	@NombreFamilia
)

select scope_identity()


GO
/****** Object:  StoredProcedure [dbo].[FamiliaSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[FamiliaSelect]
(
	@IdFamilia int
)

as

set nocount on

select [IdFamilia],
	[NombreFamilia],
	[FecBaja]
from [Familia]
where [IdFamilia] = @IdFamilia


GO
/****** Object:  StoredProcedure [dbo].[FamiliaSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[FamiliaSelectAll]

as

set nocount on

select [IdFamilia],
	[NombreFamilia],
	[FecBaja]
from [Familia]


GO
/****** Object:  StoredProcedure [dbo].[FamiliaUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[FamiliaUpdate]
(
	@IdFamilia int,
	@NombreFamilia varchar(200)
)

as

set nocount on

update [Familia]
set [NombreFamilia] = @NombreFamilia
where [IdFamilia] = @IdFamilia


GO
/****** Object:  StoredProcedure [dbo].[FormaEntregaDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[FormaEntregaDelete]
(
	@IdFormaEntrega int
)

as

set nocount on



update [FormaEntrega]
set FecBaja = getdate()
where [IdFormaEntrega] = @IdFormaEntrega


GO
/****** Object:  StoredProcedure [dbo].[FormaEntregaInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[FormaEntregaInsert]
(
	@DescripcionFormaEntrega varchar(20)
)

as

set nocount on

insert into [FormaEntrega]
(
	[DescripcionFormaEntrega]
)
values
(
	@DescripcionFormaEntrega
)

select scope_identity()


GO
/****** Object:  StoredProcedure [dbo].[FormaEntregaSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[FormaEntregaSelect]
(
	@IdFormaEntrega int
)

as

set nocount on

select [IdFormaEntrega],
	[DescripcionFormaEntrega],
	[FecBaja]
from [FormaEntrega]
where [IdFormaEntrega] = @IdFormaEntrega


GO
/****** Object:  StoredProcedure [dbo].[FormaEntregaSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[FormaEntregaSelectAll]

as

set nocount on

select [IdFormaEntrega],
	[DescripcionFormaEntrega],
	[FecBaja]
from [FormaEntrega]


GO
/****** Object:  StoredProcedure [dbo].[FormaEntregaUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[FormaEntregaUpdate]
(
	@IdFormaEntrega int,
	@DescripcionFormaEntrega varchar(20)
)

as

set nocount on

update [FormaEntrega]
set [DescripcionFormaEntrega] = @DescripcionFormaEntrega
where [IdFormaEntrega] = @IdFormaEntrega


GO
/****** Object:  StoredProcedure [dbo].[FormaPagoDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[FormaPagoDelete]
(
	@IdFormaPago int
)

as

set nocount on



update [FormaPago]
set FecBaja = getdate()
where [IdFormaPago] = @IdFormaPago


GO
/****** Object:  StoredProcedure [dbo].[FormaPagoInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[FormaPagoInsert]
(
	@DescripFormaPago varchar(200)
)

as

set nocount on

insert into [FormaPago]
(
	[DescripFormaPago]
)
values
(
	@DescripFormaPago
)

select scope_identity()


GO
/****** Object:  StoredProcedure [dbo].[FormaPagoSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[FormaPagoSelect]
(
	@IdFormaPago int
)

as

set nocount on

select [IdFormaPago],
	[DescripFormaPago],
	[FecBaja]
from [FormaPago]
where [IdFormaPago] = @IdFormaPago


GO
/****** Object:  StoredProcedure [dbo].[FormaPagoSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[FormaPagoSelectAll]

as

set nocount on

select [IdFormaPago],
	[DescripFormaPago]
	--[FecBaja]
from [FormaPago]


GO
/****** Object:  StoredProcedure [dbo].[FormaPagoUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[FormaPagoUpdate]
(
	@IdFormaPago int,
	@DescripFormaPago varchar(200)
)

as

set nocount on

update [FormaPago]
set [DescripFormaPago] = @DescripFormaPago
where [IdFormaPago] = @IdFormaPago


GO
/****** Object:  StoredProcedure [dbo].[IvaProductoDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[IvaProductoDelete]
(
	@IdIvaProducto int
)

as

set nocount on


update [IvaProducto]
set FecBaja = getdate()
where [IdIvaProducto] = @IdIvaProducto


GO
/****** Object:  StoredProcedure [dbo].[IvaProductoInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[IvaProductoInsert]
(
	@PorcentajeIvaProd int
)

as

set nocount on

insert into [IvaProducto]
(
	[PorcentajeIvaProd]
)
values
(
	@PorcentajeIvaProd
)

select scope_identity()


GO
/****** Object:  StoredProcedure [dbo].[IvaProductoSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[IvaProductoSelect]
(
	@IdIvaProducto int
)

as

set nocount on

select [IdIvaProducto],
	[PorcentajeIvaProd],
	[FecBaja]
from [IvaProducto]
where [IdIvaProducto] = @IdIvaProducto


GO
/****** Object:  StoredProcedure [dbo].[IvaProductoSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[IvaProductoSelectAll]

as

set nocount on

select [IdIvaProducto],
	[PorcentajeIvaProd],
	[FecBaja]
from [IvaProducto]


GO
/****** Object:  StoredProcedure [dbo].[IvaProductoUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[IvaProductoUpdate]
(
	@IdIvaProducto int,
	@PorcentajeIvaProd int
)

as

set nocount on

update [IvaProducto]
set [PorcentajeIvaProd] = @PorcentajeIvaProd
where [IdIvaProducto] = @IdIvaProducto


GO
/****** Object:  StoredProcedure [dbo].[LenguajeControlDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[LenguajeControlDelete]
(
	@Texto varchar(400),
	@IdLenguaje int
)

as

set nocount on


update [LenguajeControl]
set FecBaja = getdate()
where [Texto] = @Texto
	and [IdLenguaje] = @IdLenguaje


GO
/****** Object:  StoredProcedure [dbo].[LenguajeControlDeleteAllByIdLenguaje]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[LenguajeControlDeleteAllByIdLenguaje]
(
	@IdLenguaje int
)

as

set nocount on



update [LenguajeControl]
set FecBaja = getdate()
where [IdLenguaje] = @IdLenguaje


GO
/****** Object:  StoredProcedure [dbo].[LenguajeControlInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[LenguajeControlInsert]
(
	@Texto varchar(400),
	@IdLenguaje int,
	@Valor varchar(400)
)

as

set nocount on

insert into [LenguajeControl]
(
	[Texto],
	[IdLenguaje],
	[Valor]
)
values
(
	@Texto,
	@IdLenguaje,
	@Valor
)


GO
/****** Object:  StoredProcedure [dbo].[LenguajeControlSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[LenguajeControlSelect]
(
	@Texto varchar(400),
	@IdLenguaje int
)

as

set nocount on

select [Texto],
	[IdLenguaje],
	[Valor],
	[FecBaja]
from [LenguajeControl]
where [Texto] = @Texto
	and [IdLenguaje] = @IdLenguaje


GO
/****** Object:  StoredProcedure [dbo].[LenguajeControlSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[LenguajeControlSelectAll]

as

set nocount on

select [Texto],
	[IdLenguaje],
	[Valor],
	[FecBaja]
from [LenguajeControl]


GO
/****** Object:  StoredProcedure [dbo].[LenguajeControlSelectAllByIdLenguaje]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[LenguajeControlSelectAllByIdLenguaje]
(
	@IdLenguaje int
)

as

set nocount on

select [Texto],
	[IdLenguaje],
	[Valor],
	[FecBaja]
from [LenguajeControl]
where [IdLenguaje] = @IdLenguaje


GO
/****** Object:  StoredProcedure [dbo].[LenguajeControlUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[LenguajeControlUpdate]
(
	@Texto varchar(400),
	@IdLenguaje int,
	@Valor varchar(400)
)

as

set nocount on

update [LenguajeControl]
set [Valor] = @Valor
where [Texto] = @Texto	and [IdLenguaje] = @IdLenguaje


GO
/****** Object:  StoredProcedure [dbo].[LenguajeDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[LenguajeDelete]
(
	@IdLenguaje int
)

as

set nocount on



update [Lenguaje]
set FecBaja = getdate()
where [IdLenguaje] = @IdLenguaje


GO
/****** Object:  StoredProcedure [dbo].[LenguajeInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[LenguajeInsert]
(
	@DescripcionLenguaje varchar(200)
)

as

set nocount on

insert into [Lenguaje]
(
	[DescripcionLenguaje]
)
values
(
	@DescripcionLenguaje
)

select scope_identity()


GO
/****** Object:  StoredProcedure [dbo].[LenguajeSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[LenguajeSelect]
(
	@IdLenguaje int
)

as

set nocount on

select [IdLenguaje],
	[DescripcionLenguaje],
	[FecBaja]
from [Lenguaje]
where [IdLenguaje] = @IdLenguaje


GO
/****** Object:  StoredProcedure [dbo].[LenguajeSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[LenguajeSelectAll]

as

set nocount on

select [IdLenguaje],
	[DescripcionLenguaje],
	[FecBaja]
from [Lenguaje]


GO
/****** Object:  StoredProcedure [dbo].[LenguajeUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[LenguajeUpdate]
(
	@IdLenguaje int,
	@DescripcionLenguaje varchar(200)
)

as

set nocount on

update [Lenguaje]
set [DescripcionLenguaje] = @DescripcionLenguaje
where [IdLenguaje] = @IdLenguaje


GO
/****** Object:  StoredProcedure [dbo].[ListaDeseosDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ListaDeseosDelete]
(
	@IdListaDeseos int
)

as

set nocount on



update [ListaDeseos]
set FecBaja = getdate()
where [IdListaDeseos] = @IdListaDeseos


GO
/****** Object:  StoredProcedure [dbo].[ListaDeseosDeleteAllByCUIT_NombreUsuario]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ListaDeseosDeleteAllByCUIT_NombreUsuario]
(
	@CUIT int,
	@NombreUsuario varchar(100)
)

as

set nocount on




update [ListaDeseos]
set FecBaja = getdate()
where [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario


GO
/****** Object:  StoredProcedure [dbo].[ListaDeseosDetalleDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ListaDeseosDetalleDelete]
(
	@IdListaDeseos int,
	@IdListaDeseosDetalle int
)

as

set nocount on


update [ListaDeseosDetalle]
set FecBaja = getdate()
where [IdListaDeseos] = @IdListaDeseos
	and [IdListaDeseosDetalle] = @IdListaDeseosDetalle


GO
/****** Object:  StoredProcedure [dbo].[ListaDeseosDetalleDeleteAllByIdListaDeseos]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ListaDeseosDetalleDeleteAllByIdListaDeseos]
(
	@IdListaDeseos int
)

as

set nocount on




update [ListaDeseosDetalle]
set FecBaja = getdate()
where [IdListaDeseos] = @IdListaDeseos


GO
/****** Object:  StoredProcedure [dbo].[ListaDeseosDetalleDeleteAllByIdProducto]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ListaDeseosDetalleDeleteAllByIdProducto]
(
	@IdProducto int
)

as

set nocount on


update [ListaDeseosDetalle]
set FecBaja = getdate()
where [IdProducto] = @IdProducto


GO
/****** Object:  StoredProcedure [dbo].[ListaDeseosDetalleInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ListaDeseosDetalleInsert]
(
	@IdListaDeseos int,
	@IdProducto int,
	@FechaDeseoDetalle datetime
)

as

set nocount on

insert into [ListaDeseosDetalle]
(
	[IdListaDeseos],
	[IdProducto],
	[FechaDeseoDetalle]
)
values
(
	@IdListaDeseos,
	@IdProducto,
	@FechaDeseoDetalle
)

select scope_identity()


GO
/****** Object:  StoredProcedure [dbo].[ListaDeseosDetalleSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ListaDeseosDetalleSelect]
(
	@IdListaDeseos int,
	@IdListaDeseosDetalle int
)

as

set nocount on

select [IdListaDeseos],
	[IdListaDeseosDetalle],
	[IdProducto],
	[FechaDeseoDetalle],
	[FecBaja]
from [ListaDeseosDetalle]
where [IdListaDeseos] = @IdListaDeseos
	and [IdListaDeseosDetalle] = @IdListaDeseosDetalle


GO
/****** Object:  StoredProcedure [dbo].[ListaDeseosDetalleSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ListaDeseosDetalleSelectAll]

as

set nocount on

select [IdListaDeseos],
	[IdListaDeseosDetalle],
	[IdProducto],
	[FechaDeseoDetalle],
	[FecBaja]
from [ListaDeseosDetalle]


GO
/****** Object:  StoredProcedure [dbo].[ListaDeseosDetalleSelectAllByIdListaDeseos]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ListaDeseosDetalleSelectAllByIdListaDeseos]
(
	@IdListaDeseos int
)

as

set nocount on

select [IdListaDeseos],
	[IdListaDeseosDetalle],
	[IdProducto],
	[FechaDeseoDetalle],
	[FecBaja]
from [ListaDeseosDetalle]
where [IdListaDeseos] = @IdListaDeseos


GO
/****** Object:  StoredProcedure [dbo].[ListaDeseosDetalleSelectAllByIdProducto]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ListaDeseosDetalleSelectAllByIdProducto]
(
	@IdProducto int
)

as

set nocount on

select [IdListaDeseos],
	[IdListaDeseosDetalle],
	[IdProducto],
	[FechaDeseoDetalle],
	[FecBaja]
from [ListaDeseosDetalle]
where [IdProducto] = @IdProducto


GO
/****** Object:  StoredProcedure [dbo].[ListaDeseosDetalleUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ListaDeseosDetalleUpdate]
(
	@IdListaDeseos int,
	@IdListaDeseosDetalle int,
	@IdProducto int,
	@FechaDeseoDetalle datetime
)

as

set nocount on

update [ListaDeseosDetalle]
set [IdProducto] = @IdProducto,
	[FechaDeseoDetalle] = @FechaDeseoDetalle
where [IdListaDeseos] = @IdListaDeseos	and [IdListaDeseosDetalle] = @IdListaDeseosDetalle


GO
/****** Object:  StoredProcedure [dbo].[ListaDeseosInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ListaDeseosInsert]
(
	@CUIT int,
	@NombreUsuario varchar(100)
)

as

set nocount on

insert into [ListaDeseos]
(
	[CUIT],
	[NombreUsuario]
)
values
(
	@CUIT,
	@NombreUsuario
)

select scope_identity()


GO
/****** Object:  StoredProcedure [dbo].[ListaDeseosSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ListaDeseosSelect]
(
	@IdListaDeseos int
)

as

set nocount on

select [IdListaDeseos],
	[CUIT],
	[NombreUsuario],
	[FecBaja]
from [ListaDeseos]
where [IdListaDeseos] = @IdListaDeseos


GO
/****** Object:  StoredProcedure [dbo].[ListaDeseosSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ListaDeseosSelectAll]

as

set nocount on

select [IdListaDeseos],
	[CUIT],
	[NombreUsuario],
	[FecBaja]
from [ListaDeseos]


GO
/****** Object:  StoredProcedure [dbo].[ListaDeseosSelectAllByCUIT_NombreUsuario]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ListaDeseosSelectAllByCUIT_NombreUsuario]
(
	@CUIT int,
	@NombreUsuario varchar(100)
)

as

set nocount on

select [IdListaDeseos],
	[CUIT],
	[NombreUsuario],
	[FecBaja]
from [ListaDeseos]
where [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario


GO
/****** Object:  StoredProcedure [dbo].[ListaDeseosUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ListaDeseosUpdate]
(
	@IdListaDeseos int,
	@CUIT int,
	@NombreUsuario varchar(100)
)

as

set nocount on

update [ListaDeseos]
set [CUIT] = @CUIT,
	[NombreUsuario] = @NombreUsuario
where [IdListaDeseos] = @IdListaDeseos


GO
/****** Object:  StoredProcedure [dbo].[MarcaDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[MarcaDelete]
(
	@IdMarca int
)

as

set nocount on


update [Marca]
set FecBaja = getdate()
where [IdMarca] = @IdMarca


GO
/****** Object:  StoredProcedure [dbo].[MarcaInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[MarcaInsert]
(
	@DescripcionMarca varchar(50)
)

as

set nocount on

insert into [Marca]
(
	[DescripcionMarca]
)
values
(
	@DescripcionMarca
)

select scope_identity()


GO
/****** Object:  StoredProcedure [dbo].[MarcaSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[MarcaSelect]
(
	@IdMarca int
)

as

set nocount on

select [IdMarca],
	[DescripcionMarca],
	[FecBaja]
from [Marca]
where [IdMarca] = @IdMarca


GO
/****** Object:  StoredProcedure [dbo].[MarcaSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[MarcaSelectAll]

as

set nocount on

select [IdMarca],
	[DescripcionMarca],
	[FecBaja]
from [Marca]


GO
/****** Object:  StoredProcedure [dbo].[MarcaUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[MarcaUpdate]
(
	@IdMarca int,
	@DescripcionMarca varchar(50)
)

as

set nocount on

update [Marca]
set [DescripcionMarca] = @DescripcionMarca
where [IdMarca] = @IdMarca


GO
/****** Object:  StoredProcedure [dbo].[MonedaDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[MonedaDelete]
(
	@IdMoneda int
)

as

set nocount on


update [Moneda]
set FecBaja = getdate()
where [IdMoneda] = @IdMoneda


GO
/****** Object:  StoredProcedure [dbo].[MonedaEmpresaDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[MonedaEmpresaDelete]
(
	@IdMoneda int,
	@CUIT int
)

as

set nocount on



update [MonedaEmpresa]
set FecBaja = getdate()
where [IdMoneda] = @IdMoneda
	and [CUIT] = @CUIT


GO
/****** Object:  StoredProcedure [dbo].[MonedaEmpresaDeleteAllByCUIT]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[MonedaEmpresaDeleteAllByCUIT]
(
	@CUIT int
)

as

set nocount on



update [MonedaEmpresa]
set FecBaja = getdate()
where [CUIT] = @CUIT


GO
/****** Object:  StoredProcedure [dbo].[MonedaEmpresaDeleteAllByIdMoneda]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[MonedaEmpresaDeleteAllByIdMoneda]
(
	@IdMoneda int
)

as

set nocount on


update [MonedaEmpresa]
set FecBaja = getdate()
where [IdMoneda] = @IdMoneda


GO
/****** Object:  StoredProcedure [dbo].[MonedaEmpresaInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[MonedaEmpresaInsert]
(
	@IdMoneda int,
	@CUIT int
)

as

set nocount on

insert into [MonedaEmpresa]
(
	[IdMoneda],
	[CUIT]
)
values
(
	@IdMoneda,
	@CUIT
)


GO
/****** Object:  StoredProcedure [dbo].[MonedaEmpresaSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[MonedaEmpresaSelect]
(
	@IdMoneda int,
	@CUIT int
)

as

set nocount on

select [IdMoneda],
	[CUIT],
	[FecBaja]
from [MonedaEmpresa]
where [IdMoneda] = @IdMoneda
	and [CUIT] = @CUIT


GO
/****** Object:  StoredProcedure [dbo].[MonedaEmpresaSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[MonedaEmpresaSelectAll]

as

set nocount on

select [IdMoneda],
	[CUIT],
	[FecBaja]
from [MonedaEmpresa]


GO
/****** Object:  StoredProcedure [dbo].[MonedaEmpresaSelectAllByCUIT]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[MonedaEmpresaSelectAllByCUIT]
(
	@CUIT int
)

as

set nocount on

select [IdMoneda],
	[CUIT],
	[FecBaja]
from [MonedaEmpresa]
where [CUIT] = @CUIT


GO
/****** Object:  StoredProcedure [dbo].[MonedaEmpresaSelectAllByIdMoneda]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[MonedaEmpresaSelectAllByIdMoneda]
(
	@IdMoneda int
)

as

set nocount on

select [IdMoneda],
	[CUIT],
	[FecBaja]
from [MonedaEmpresa]
where [IdMoneda] = @IdMoneda


GO
/****** Object:  StoredProcedure [dbo].[MonedaEmpresaUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[MonedaEmpresaUpdate]
(
	@IdMoneda int,
	@CUIT int,
	@FecBaja datetime
)

as

set nocount on

update [MonedaEmpresa]
set [FecBaja] = @FecBaja
where [IdMoneda] = @IdMoneda	and [CUIT] = @CUIT


GO
/****** Object:  StoredProcedure [dbo].[MonedaInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[MonedaInsert]
(
	@Nombre nvarchar(50),
	@Cotizacion decimal(2, 2)
)

as

set nocount on

insert into [Moneda]
(
	[Nombre],
	[Cotizacion]
)
values
(
	@Nombre,
	@Cotizacion
)

select scope_identity()


GO
/****** Object:  StoredProcedure [dbo].[MonedaSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[MonedaSelect]
(
	@IdMoneda int
)

as

set nocount on

select [IdMoneda],
	[Nombre],
	[Cotizacion],
	[FecBaja]
from [Moneda]
where [IdMoneda] = @IdMoneda


GO
/****** Object:  StoredProcedure [dbo].[MonedaSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[MonedaSelectAll]

as

set nocount on

select [IdMoneda],
	[Nombre],
	[Cotizacion],
	[FecBaja]
from [Moneda]


GO
/****** Object:  StoredProcedure [dbo].[MonedaUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[MonedaUpdate]
(
	@IdMoneda int,
	@Nombre nvarchar(50),
	@Cotizacion decimal(2, 2)
)

as

set nocount on

update [Moneda]
set [Nombre] = @Nombre,
	[Cotizacion] = @Cotizacion
where [IdMoneda] = @IdMoneda


GO
/****** Object:  StoredProcedure [dbo].[PagoDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PagoDelete]
(
	@IdPago int
)

as

set nocount on



update [Pago]
set FecBaja = getdate()
where [IdPago] = @IdPago


GO
/****** Object:  StoredProcedure [dbo].[PagoDeleteAllByCUIT]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PagoDeleteAllByCUIT]
(
	@CUIT int
)

as

set nocount on


update [Pago]
set FecBaja = getdate()
where [CUIT] = @CUIT


GO
/****** Object:  StoredProcedure [dbo].[PagoDeleteAllByIdFormaPago]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PagoDeleteAllByIdFormaPago]
(
	@IdFormaPago int
)

as

set nocount on



update [Pago]
set FecBaja = getdate()
where [IdFormaPago] = @IdFormaPago


GO
/****** Object:  StoredProcedure [dbo].[PagoDeleteAllByIdPedido]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PagoDeleteAllByIdPedido]
(
	@IdPedido int
)

as

set nocount on



update [Pago]
set FecBaja = getdate()
where [IdPedido] = @IdPedido


GO
/****** Object:  StoredProcedure [dbo].[PagoDeleteAllByIdTarjeta]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PagoDeleteAllByIdTarjeta]
(
	@IdTarjeta int
)

as

set nocount on



update [Pago]
set FecBaja = getdate()
where [IdTarjeta] = @IdTarjeta


GO
/****** Object:  StoredProcedure [dbo].[PagoDeleteAllByNroComprobante_IdSucursal_IdTipoComprobante_CUIT]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PagoDeleteAllByNroComprobante_IdSucursal_IdTipoComprobante_CUIT]
(
	@NroComprobante int,
	@IdSucursal int,
	@IdTipoComprobante int,
	@CUIT int
)

as

set nocount on




update [Pago]
set FecBaja = getdate()
where [NroComprobante] = @NroComprobante
	and [IdSucursal] = @IdSucursal
	and [IdTipoComprobante] = @IdTipoComprobante
	and [CUIT] = @CUIT


GO
/****** Object:  StoredProcedure [dbo].[PagoEstadoPagoDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PagoEstadoPagoDelete]
(
	@IdEstadoPago int,
	@IdPago int
)

as

set nocount on



update [PagoEstadoPago]
set FecBaja = getdate()
where [IdEstadoPago] = @IdEstadoPago
	and [IdPago] = @IdPago


GO
/****** Object:  StoredProcedure [dbo].[PagoEstadoPagoDeleteAllByIdEstadoPago]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PagoEstadoPagoDeleteAllByIdEstadoPago]
(
	@IdEstadoPago int
)

as

set nocount on



update [PagoEstadoPago]
set FecBaja = getdate()
where [IdEstadoPago] = @IdEstadoPago


GO
/****** Object:  StoredProcedure [dbo].[PagoEstadoPagoDeleteAllByIdPago]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PagoEstadoPagoDeleteAllByIdPago]
(
	@IdPago int
)

as

set nocount on



update [PagoEstadoPago]
set FecBaja = getdate()
where [IdPago] = @IdPago


GO
/****** Object:  StoredProcedure [dbo].[PagoEstadoPagoInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PagoEstadoPagoInsert]
(
	@IdEstadoPago int,
	@IdPago int,
	@Fecha datetime,
	@FecBaja datetime
)

as

set nocount on

insert into [PagoEstadoPago]
(
	[IdEstadoPago],
	[IdPago],
	[Fecha],
	[FecBaja]
)
values
(
	@IdEstadoPago,
	@IdPago,
	@Fecha,
	@FecBaja
)


GO
/****** Object:  StoredProcedure [dbo].[PagoEstadoPagoSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PagoEstadoPagoSelect]
(
	@IdEstadoPago int,
	@IdPago int
)

as

set nocount on

select [IdEstadoPago],
	[IdPago],
	[Fecha],
	[FecBaja]
from [PagoEstadoPago]
where [IdEstadoPago] = @IdEstadoPago
	and [IdPago] = @IdPago


GO
/****** Object:  StoredProcedure [dbo].[PagoEstadoPagoSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PagoEstadoPagoSelectAll]

as

set nocount on

select [IdEstadoPago],
	[IdPago],
	[Fecha],
	[FecBaja]
from [PagoEstadoPago]


GO
/****** Object:  StoredProcedure [dbo].[PagoEstadoPagoSelectAllByIdEstadoPago]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PagoEstadoPagoSelectAllByIdEstadoPago]
(
	@IdEstadoPago int
)

as

set nocount on

select [IdEstadoPago],
	[IdPago],
	[Fecha],
	[FecBaja]
from [PagoEstadoPago]
where [IdEstadoPago] = @IdEstadoPago


GO
/****** Object:  StoredProcedure [dbo].[PagoEstadoPagoSelectAllByIdPago]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PagoEstadoPagoSelectAllByIdPago]
(
	@IdPago int
)

as

set nocount on

select [IdEstadoPago],
	[IdPago],
	[Fecha],
	[FecBaja]
from [PagoEstadoPago]
where [IdPago] = @IdPago


GO
/****** Object:  StoredProcedure [dbo].[PagoEstadoPagoUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PagoEstadoPagoUpdate]
(
	@IdEstadoPago int,
	@IdPago int,
	@Fecha datetime,
	@FecBaja datetime
)

as

set nocount on

update [PagoEstadoPago]
set [Fecha] = @Fecha,
	[FecBaja] = @FecBaja
where [IdEstadoPago] = @IdEstadoPago	and [IdPago] = @IdPago


GO
/****** Object:  StoredProcedure [dbo].[PagoInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PagoInsert]
(
	@FechaPago datetime,
	@IdFormaPago int,
	@MontoPago decimal(18, 0),
	@NroComprobante int,
	@IdSucursal int,
	@IdTipoComprobante int,
	@CUIT int,
	@IdTarjeta int
)

as

set nocount on

insert into [Pago]
(
	[FechaPago],
	[IdFormaPago],
	[MontoPago],
	[NroComprobante],
	[IdSucursal],
	[IdTipoComprobante],
	[CUIT],
	[IdTarjeta]



)
values
(
	@FechaPago,
	@IdFormaPago,
	@MontoPago,
	@NroComprobante,
	@IdSucursal,
	@IdTipoComprobante,
	@CUIT,
	@IdTarjeta
)

select scope_identity()


GO
/****** Object:  StoredProcedure [dbo].[PagoSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PagoSelect]
(
	@IdPago int
)

as

set nocount on

select [IdPago],
	[IdPedido],
	[FechaPago],
	[IdFormaPago],
	[MontoPago],
	[NroComprobante],
	[IdSucursal],
	[IdTipoComprobante],
	[CUIT],
	[FecBaja],
	[IdTarjeta]
from [Pago]
where [IdPago] = @IdPago


GO
/****** Object:  StoredProcedure [dbo].[PagoSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PagoSelectAll]

as

set nocount on

select [IdPago],
	[IdPedido],
	[FechaPago],
	[IdFormaPago],
	[MontoPago],
	[NroComprobante],
	[IdSucursal],
	[IdTipoComprobante],
	[CUIT],
	[FecBaja],
	[IdTarjeta]
from [Pago]


GO
/****** Object:  StoredProcedure [dbo].[PagoSelectAllByCUIT]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PagoSelectAllByCUIT]
(
	@CUIT int
)

as

set nocount on

select [IdPago],
	[IdPedido],
	[FechaPago],
	[IdFormaPago],
	[MontoPago],
	[NroComprobante],
	[IdSucursal],
	[IdTipoComprobante],
	[CUIT],
	[FecBaja],
	[IdTarjeta]
from [Pago]
where [CUIT] = @CUIT


GO
/****** Object:  StoredProcedure [dbo].[PagoSelectAllByIdFormaPago]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PagoSelectAllByIdFormaPago]
(
	@IdFormaPago int
)

as

set nocount on

select [IdPago],
	[IdPedido],
	[FechaPago],
	[IdFormaPago],
	[MontoPago],
	[NroComprobante],
	[IdSucursal],
	[IdTipoComprobante],
	[CUIT],
	[FecBaja],
	[IdTarjeta]
from [Pago]
where [IdFormaPago] = @IdFormaPago


GO
/****** Object:  StoredProcedure [dbo].[PagoSelectAllByIdPedido]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PagoSelectAllByIdPedido]
(
	@IdPedido int
)

as

set nocount on

select [IdPago],
	[IdPedido],
	[FechaPago],
	[IdFormaPago],
	[MontoPago],
	[NroComprobante],
	[IdSucursal],
	[IdTipoComprobante],
	[CUIT],
	[FecBaja],
	[IdTarjeta]
from [Pago]
where [IdPedido] = @IdPedido


GO
/****** Object:  StoredProcedure [dbo].[PagoSelectAllByIdTarjeta]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PagoSelectAllByIdTarjeta]
(
	@IdTarjeta int
)

as

set nocount on

select [IdPago],
	[IdPedido],
	[FechaPago],
	[IdFormaPago],
	[MontoPago],
	[NroComprobante],
	[IdSucursal],
	[IdTipoComprobante],
	[CUIT],
	[FecBaja],
	[IdTarjeta]
from [Pago]
where [IdTarjeta] = @IdTarjeta


GO
/****** Object:  StoredProcedure [dbo].[PagoSelectAllByNroComprobante_IdSucursal_IdTipoComprobante_CUIT]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PagoSelectAllByNroComprobante_IdSucursal_IdTipoComprobante_CUIT]
(
	@NroComprobante int,
	@IdSucursal int,
	@IdTipoComprobante int,
	@CUIT int
)

as

set nocount on

select [IdPago],
	[IdPedido],
	[FechaPago],
	[IdFormaPago],
	[MontoPago],
	[NroComprobante],
	[IdSucursal],
	[IdTipoComprobante],
	[CUIT],
	[FecBaja],
	[IdTarjeta]
from [Pago]
where [NroComprobante] = @NroComprobante
	and [IdSucursal] = @IdSucursal
	and [IdTipoComprobante] = @IdTipoComprobante
	and [CUIT] = @CUIT


GO
/****** Object:  StoredProcedure [dbo].[PagoUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PagoUpdate]
(
	@IdPago int,
	@IdPedido int,
	@FechaPago datetime,
	@IdFormaPago int,
	@MontoPago decimal(18, 0),
	@NroComprobante int,
	@IdSucursal int,
	@IdTipoComprobante int,
	@CUIT int,
	@FecBaja datetime,
	@IdTarjeta int
)

as

set nocount on

update [Pago]
set [IdPedido] = @IdPedido,
	[FechaPago] = @FechaPago,
	[IdFormaPago] = @IdFormaPago,
	[MontoPago] = @MontoPago,
	[NroComprobante] = @NroComprobante,
	[IdSucursal] = @IdSucursal,
	[IdTipoComprobante] = @IdTipoComprobante,
	[CUIT] = @CUIT,
	[FecBaja] = @FecBaja,
	[IdTarjeta] = @IdTarjeta
	
where [IdPago] = @IdPago


GO
/****** Object:  StoredProcedure [dbo].[PatenteDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PatenteDelete]
(
	@IdPatente int
)

as

set nocount on


update [Patente]
set FecBaja = getdate()
where [IdPatente] = @IdPatente


GO
/****** Object:  StoredProcedure [dbo].[PatenteFamiliaDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PatenteFamiliaDelete]
(
	@IdPatente int,
	@IdFamilia int
)

as

set nocount on




update [PatenteFamilia]
set FecBaja = getdate()
where [IdPatente] = @IdPatente
	and [IdFamilia] = @IdFamilia


GO
/****** Object:  StoredProcedure [dbo].[PatenteFamiliaDeleteAllByIdFamilia]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PatenteFamiliaDeleteAllByIdFamilia]
(
	@IdFamilia int
)

as

set nocount on



update [PatenteFamilia]
set FecBaja = getdate()
where [IdFamilia] = @IdFamilia


GO
/****** Object:  StoredProcedure [dbo].[PatenteFamiliaDeleteAllByIdPatente]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PatenteFamiliaDeleteAllByIdPatente]
(
	@IdPatente int
)

as

set nocount on


update [PatenteFamilia]
set FecBaja = getdate()
where [IdPatente] = @IdPatente


GO
/****** Object:  StoredProcedure [dbo].[PatenteFamiliaInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PatenteFamiliaInsert]
(
	@IdPatente int,
	@IdFamilia int
)

as

set nocount on

insert into [PatenteFamilia]
(
	[IdPatente],
	[IdFamilia]
)
values
(
	@IdPatente,
	@IdFamilia
)


GO
/****** Object:  StoredProcedure [dbo].[PatenteFamiliaSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PatenteFamiliaSelect]
(
	@IdPatente int,
	@IdFamilia int
)

as

set nocount on

select [IdPatente],
	[IdFamilia],
	[FecBaja]
from [PatenteFamilia]
where [IdPatente] = @IdPatente
	and [IdFamilia] = @IdFamilia


GO
/****** Object:  StoredProcedure [dbo].[PatenteFamiliaSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PatenteFamiliaSelectAll]

as

set nocount on

select [IdPatente],
	[IdFamilia],
	[FecBaja]
from [PatenteFamilia]


GO
/****** Object:  StoredProcedure [dbo].[PatenteFamiliaSelectAllByIdFamilia]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PatenteFamiliaSelectAllByIdFamilia]
(
	@IdFamilia int
)

as

set nocount on

select [IdPatente],
	[IdFamilia],
	[FecBaja]
from [PatenteFamilia]
where [IdFamilia] = @IdFamilia


GO
/****** Object:  StoredProcedure [dbo].[PatenteFamiliaSelectAllByIdPatente]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PatenteFamiliaSelectAllByIdPatente]
(
	@IdPatente int
)

as

set nocount on

select [IdPatente],
	[IdFamilia],
	[FecBaja]
from [PatenteFamilia]
where [IdPatente] = @IdPatente


GO
/****** Object:  StoredProcedure [dbo].[PatenteFamiliaUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PatenteFamiliaUpdate]
(
	@IdPatente int,
	@IdFamilia int,
	@FecBaja datetime
)

as

set nocount on

update [PatenteFamilia]
set [FecBaja] = @FecBaja
where [IdPatente] = @IdPatente	and [IdFamilia] = @IdFamilia


GO
/****** Object:  StoredProcedure [dbo].[PatenteInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PatenteInsert]
(
	@NombrePatente varchar(200)
)

as

set nocount on

insert into [Patente]
(
	[NombrePatente]
)
values
(
	@NombrePatente
)

select scope_identity()


GO
/****** Object:  StoredProcedure [dbo].[PatenteSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PatenteSelect]
(
	@IdPatente int
)

as

set nocount on

select [IdPatente],
	[NombrePatente],
	[FecBaja]
from [Patente]
where [IdPatente] = @IdPatente


GO
/****** Object:  StoredProcedure [dbo].[PatenteSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PatenteSelectAll]

as

set nocount on

select [IdPatente],
	[NombrePatente],
	[FecBaja]
from [Patente]


GO
/****** Object:  StoredProcedure [dbo].[PatenteUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PatenteUpdate]
(
	@IdPatente int,
	@NombrePatente varchar(200)
)

as

set nocount on

update [Patente]
set [NombrePatente] = @NombrePatente
where [IdPatente] = @IdPatente


GO
/****** Object:  StoredProcedure [dbo].[PedidoDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PedidoDelete]
(
	@IdPedido int
)

as

set nocount on

update [Pedido]
set FecBaja = getdate()
where [IdPedido] = @IdPedido


GO
/****** Object:  StoredProcedure [dbo].[PedidoDeleteAllByCUIT]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PedidoDeleteAllByCUIT]
(
	@CUIT int
)

as

set nocount on


update [Pedido]
set FecBaja = getdate()
where [CUIT] = @CUIT


GO
/****** Object:  StoredProcedure [dbo].[PedidoDeleteAllByCUIT_NombreUsuario]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PedidoDeleteAllByCUIT_NombreUsuario]
(
	@CUIT int,
	@NombreUsuario varchar(100)
)

as

set nocount on


update [Pedido]
set FecBaja = getdate()
where [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario


GO
/****** Object:  StoredProcedure [dbo].[PedidoDeleteAllByDireccionEntrega]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PedidoDeleteAllByDireccionEntrega]
(
	@DireccionEntrega int
)

as

set nocount on

update [Pedido]
set FecBaja = getdate()
where [DireccionEntrega] = @DireccionEntrega


GO
/****** Object:  StoredProcedure [dbo].[PedidoDeleteAllByIdFormaEntrega]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PedidoDeleteAllByIdFormaEntrega]
(
	@IdFormaEntrega int
)

as

set nocount on


update [Pedido]
set FecBaja = getdate()
where [IdFormaEntrega] = @IdFormaEntrega


GO
/****** Object:  StoredProcedure [dbo].[PedidoDetalleDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PedidoDetalleDelete]
(
	@IdPedido int,
	@IdPedidoDetalle int
)

as

set nocount on


update [PedidoDetalle]
set FecBaja = getdate()
where [IdPedido] = @IdPedido
	and [IdPedidoDetalle] = @IdPedidoDetalle


GO
/****** Object:  StoredProcedure [dbo].[PedidoDetalleDeleteAllByIdPedido]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PedidoDetalleDeleteAllByIdPedido]
(
	@IdPedido int
)

as

set nocount on


update [PedidoDetalle]
set FecBaja = getdate()
where [IdPedido] = @IdPedido


GO
/****** Object:  StoredProcedure [dbo].[PedidoDetalleDeleteAllByIdProducto]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PedidoDetalleDeleteAllByIdProducto]
(
	@IdProducto int
)

as

set nocount on

update [PedidoDetalle]
set FecBaja = getdate()
where [IdProducto] = @IdProducto


GO
/****** Object:  StoredProcedure [dbo].[PedidoDetalleInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PedidoDetalleInsert]
(
	@IdPedidoDetalle int,
	@IdPedido int,
	@Cantidad int,
	@PrecioUnitario decimal(18, 0),
	@Descuento int,
	@IdProducto int
)

as

set nocount on

insert into [PedidoDetalle]
(
	[IdPedidoDetalle],
	[IdPedido],
	[Cantidad],
	[PrecioUnitario],
	[Descuento],
	[IdProducto]
)
values
(
	@IdPedidoDetalle,
	@IdPedido,
	@Cantidad,
	@PrecioUnitario,
	@Descuento,
	@IdProducto
)


GO
/****** Object:  StoredProcedure [dbo].[PedidoDetalleSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PedidoDetalleSelect]
(
	@IdPedido int,
	@IdPedidoDetalle int
)

as

set nocount on

select [IdPedidoDetalle],
	[IdPedido],
	[Cantidad],
	[PrecioUnitario],
	[Descuento],
	[IdProducto],
	[FecBaja]
from [PedidoDetalle]
where [IdPedido] = @IdPedido
	and [IdPedidoDetalle] = @IdPedidoDetalle


GO
/****** Object:  StoredProcedure [dbo].[PedidoDetalleSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PedidoDetalleSelectAll]

as

set nocount on

select [IdPedidoDetalle],
	[IdPedido],
	[Cantidad],
	[PrecioUnitario],
	[Descuento],
	[IdProducto],
	[FecBaja]
from [PedidoDetalle]


GO
/****** Object:  StoredProcedure [dbo].[PedidoDetalleSelectAllByIdPedido]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PedidoDetalleSelectAllByIdPedido]
(
	@IdPedido int
)

as

set nocount on

select [IdPedidoDetalle],
	[IdPedido],
	[Cantidad],
	[PrecioUnitario],
	[Descuento],
	[IdProducto],
	[FecBaja]
from [PedidoDetalle]
where [IdPedido] = @IdPedido


GO
/****** Object:  StoredProcedure [dbo].[PedidoDetalleSelectAllByIdProducto]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PedidoDetalleSelectAllByIdProducto]
(
	@IdProducto int
)

as

set nocount on

select [IdPedidoDetalle],
	[IdPedido],
	[Cantidad],
	[PrecioUnitario],
	[Descuento],
	[IdProducto],
	[FecBaja]
from [PedidoDetalle]
where [IdProducto] = @IdProducto


GO
/****** Object:  StoredProcedure [dbo].[PedidoDetalleUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PedidoDetalleUpdate]
(
	@IdPedidoDetalle int,
	@IdPedido int,
	@Cantidad int,
	@PrecioUnitario decimal(18, 0),
	@Descuento int,
	@IdProducto int
)

as

set nocount on

update [PedidoDetalle]
set [Cantidad] = @Cantidad,
	[PrecioUnitario] = @PrecioUnitario,
	[Descuento] = @Descuento,
	[IdProducto] = @IdProducto
where [IdPedido] = @IdPedido	and [IdPedidoDetalle] = @IdPedidoDetalle


GO
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PedidoEstadoPedidoDelete]
(
	@IdPedido int,
	@IdEstadoPedido int
)

as

set nocount on

update [PedidoEstadoPedido]
set FecBaja = getdate()
where [IdPedido] = @IdPedido
	and [IdEstadoPedido] = @IdEstadoPedido


GO
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoDeleteAllByIdEstadoPedido]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PedidoEstadoPedidoDeleteAllByIdEstadoPedido]
(
	@IdEstadoPedido int
)

as

set nocount on

update [PedidoEstadoPedido]
set FecBaja = getdate()
where [IdEstadoPedido] = @IdEstadoPedido


GO
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoDeleteAllByIdPedido]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PedidoEstadoPedidoDeleteAllByIdPedido]
(
	@IdPedido int
)

as

set nocount on

update [PedidoEstadoPedido]
set FecBaja = getdate()
where [IdPedido] = @IdPedido


GO
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PedidoEstadoPedidoInsert]
(
	@IdPedido int,
	@IdEstadoPedido int,
	@Fecha datetime,
	@FecBaja datetime
)

as

set nocount on

insert into [PedidoEstadoPedido]
(
	[IdPedido],
	[IdEstadoPedido],
	[Fecha],
	[FecBaja]
)
values
(
	@IdPedido,
	@IdEstadoPedido,
	@Fecha,
	@FecBaja
)


GO
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PedidoEstadoPedidoSelect]
(
	@IdPedido int,
	@IdEstadoPedido int
)

as

set nocount on

select [IdPedido],
	[IdEstadoPedido],
	[Fecha],
	[FecBaja]
from [PedidoEstadoPedido]
where [IdPedido] = @IdPedido
	and [IdEstadoPedido] = @IdEstadoPedido


GO
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PedidoEstadoPedidoSelectAll]

as

set nocount on

select [IdPedido],
	[IdEstadoPedido],
	[Fecha],
	[FecBaja]
from [PedidoEstadoPedido]


GO
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoSelectAllByIdEstadoPedido]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PedidoEstadoPedidoSelectAllByIdEstadoPedido]
(
	@IdEstadoPedido int
)

as

set nocount on

select [IdPedido],
	[IdEstadoPedido],
	[Fecha],
	[FecBaja]
from [PedidoEstadoPedido]
where [IdEstadoPedido] = @IdEstadoPedido


GO
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoSelectAllByIdPedido]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PedidoEstadoPedidoSelectAllByIdPedido]
(
	@IdPedido int
)

as

set nocount on

select [IdPedido],
	[IdEstadoPedido],
	[Fecha],
	[FecBaja]
from [PedidoEstadoPedido]
where [IdPedido] = @IdPedido


GO
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PedidoEstadoPedidoUpdate]
(
	@IdPedido int,
	@IdEstadoPedido int,
	@Fecha datetime,
	@FecBaja datetime
)

as

set nocount on

update [PedidoEstadoPedido]
set [Fecha] = @Fecha,
	[FecBaja] = @FecBaja
where [IdPedido] = @IdPedido	and [IdEstadoPedido] = @IdEstadoPedido


GO
/****** Object:  StoredProcedure [dbo].[PedidoInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PedidoInsert]
(
	@FechaPedido datetime,
	@FechaFinPedido datetime,
	@NombreUsuario varchar(100),
	@PlazoEntrega int,
	@IdFormaEntrega int,
	@CUIT int,
	@NumeroTracking varchar(50),
	@DireccionEntrega int
)

as

set nocount on

insert into [Pedido]
(
	[FechaPedido],
	[FechaFinPedido],
	[NombreUsuario],
	[PlazoEntrega],
	[IdFormaEntrega],
	[CUIT],
	[NumeroTracking],
	[DireccionEntrega]
)
values
(
	@FechaPedido,
	@FechaFinPedido,
	@NombreUsuario,
	@PlazoEntrega,
	@IdFormaEntrega,
	@CUIT,
	@NumeroTracking,
	@DireccionEntrega
)

select scope_identity()


GO
/****** Object:  StoredProcedure [dbo].[PedidoSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PedidoSelect]
(
	@IdPedido int
)

as

set nocount on

select [IdPedido],
	[FechaPedido],
	[FechaFinPedido],
	[NombreUsuario],
	[PlazoEntrega],
	[IdFormaEntrega],
	[CUIT],
	[NumeroTracking],
	[DireccionEntrega],
	[FecBaja]
from [Pedido]
where [IdPedido] = @IdPedido


GO
/****** Object:  StoredProcedure [dbo].[PedidoSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PedidoSelectAll]

as

set nocount on

select [IdPedido],
	[FechaPedido],
	[FechaFinPedido],
	[NombreUsuario],
	[PlazoEntrega],
	[IdFormaEntrega],
	[CUIT],
	[NumeroTracking],
	[DireccionEntrega],
	[FecBaja]
from [Pedido]


GO
/****** Object:  StoredProcedure [dbo].[PedidoSelectAllByCUIT]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PedidoSelectAllByCUIT]
(
	@CUIT int
)

as

set nocount on

select [IdPedido],
	[FechaPedido],
	[FechaFinPedido],
	[NombreUsuario],
	[PlazoEntrega],
	[IdFormaEntrega],
	[CUIT],
	[NumeroTracking],
	[DireccionEntrega],
	[FecBaja]
from [Pedido]
where [CUIT] = @CUIT


GO
/****** Object:  StoredProcedure [dbo].[PedidoSelectAllByCUIT_NombreUsuario]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PedidoSelectAllByCUIT_NombreUsuario]
(
	@CUIT int,
	@NombreUsuario varchar(100)
)

as

set nocount on

select [IdPedido],
	[FechaPedido],
	[FechaFinPedido],
	[NombreUsuario],
	[PlazoEntrega],
	[IdFormaEntrega],
	[CUIT],
	[NumeroTracking],
	[DireccionEntrega],
	[FecBaja]
from [Pedido]
where [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario


GO
/****** Object:  StoredProcedure [dbo].[PedidoSelectAllByDireccionEntrega]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PedidoSelectAllByDireccionEntrega]
(
	@DireccionEntrega int
)

as

set nocount on

select [IdPedido],
	[FechaPedido],
	[FechaFinPedido],
	[NombreUsuario],
	[PlazoEntrega],
	[IdFormaEntrega],
	[CUIT],
	[NumeroTracking],
	[DireccionEntrega],
	[FecBaja]
from [Pedido]
where [DireccionEntrega] = @DireccionEntrega


GO
/****** Object:  StoredProcedure [dbo].[PedidoSelectAllByIdFormaEntrega]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PedidoSelectAllByIdFormaEntrega]
(
	@IdFormaEntrega int
)

as

set nocount on

select [IdPedido],
	[FechaPedido],
	[FechaFinPedido],
	[NombreUsuario],
	[PlazoEntrega],
	[IdFormaEntrega],
	[CUIT],
	[NumeroTracking],
	[DireccionEntrega],
	[FecBaja]
from [Pedido]
where [IdFormaEntrega] = @IdFormaEntrega


GO
/****** Object:  StoredProcedure [dbo].[PedidoUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PedidoUpdate]
(
	@IdPedido int,
	@FechaPedido datetime,
	@FechaFinPedido datetime,
	@NombreUsuario varchar(100),
	@PlazoEntrega int,
	@IdFormaEntrega int,
	@CUIT int,
	@NumeroTracking varchar(50),
	@DireccionEntrega int
)

as

set nocount on

update [Pedido]
set [FechaPedido] = @FechaPedido,
	[FechaFinPedido] = @FechaFinPedido,
	[NombreUsuario] = @NombreUsuario,
	[PlazoEntrega] = @PlazoEntrega,
	[IdFormaEntrega] = @IdFormaEntrega,
	[CUIT] = @CUIT,
	[NumeroTracking] = @NumeroTracking,
	[DireccionEntrega] = @DireccionEntrega
where [IdPedido] = @IdPedido


GO
/****** Object:  StoredProcedure [dbo].[ProdCategoriaDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProdCategoriaDelete]
(
	@IdProducto int,
	@IdCategoria int
)

as

set nocount on


update [ProdCategoria]
set FecBaja = getdate()
where [IdProducto] = @IdProducto
	and [IdCategoria] = @IdCategoria


GO
/****** Object:  StoredProcedure [dbo].[ProdCategoriaDeleteAllByIdCategoria]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProdCategoriaDeleteAllByIdCategoria]
(
	@IdCategoria int
)

as

set nocount on

update [ProdCategoria]
set FecBaja = getdate()
where [IdCategoria] = @IdCategoria


GO
/****** Object:  StoredProcedure [dbo].[ProdCategoriaDeleteAllByIdProducto]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProdCategoriaDeleteAllByIdProducto]
(
	@IdProducto int
)

as

set nocount on

update [ProdCategoria]
set FecBaja = getdate()
where [IdProducto] = @IdProducto


GO
/****** Object:  StoredProcedure [dbo].[ProdCategoriaInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProdCategoriaInsert]
(
	@IdProducto int,
	@IdCategoria int
)

as

set nocount on

insert into [ProdCategoria]
(
	[IdProducto],
	[IdCategoria]
)
values
(
	@IdProducto,
	@IdCategoria
)


GO
/****** Object:  StoredProcedure [dbo].[ProdCategoriaSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProdCategoriaSelect]
(
	@IdProducto int,
	@IdCategoria int
)

as

set nocount on

select [IdProducto],
	[IdCategoria],
	[FecBaja]
from [ProdCategoria]
where [IdProducto] = @IdProducto
	and [IdCategoria] = @IdCategoria


GO
/****** Object:  StoredProcedure [dbo].[ProdCategoriaSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProdCategoriaSelectAll]

as

set nocount on

select [IdProducto],
	[IdCategoria],
	[FecBaja]
from [ProdCategoria]


GO
/****** Object:  StoredProcedure [dbo].[ProdCategoriaSelectAllByIdCategoria]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProdCategoriaSelectAllByIdCategoria]
(
	@IdCategoria int
)

as

set nocount on

select [IdProducto],
	[IdCategoria],
	[FecBaja]
from [ProdCategoria]
where [IdCategoria] = @IdCategoria


GO
/****** Object:  StoredProcedure [dbo].[ProdCategoriaSelectAllByIdProducto]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProdCategoriaSelectAllByIdProducto]
(
	@IdProducto int
)

as

set nocount on

select [IdProducto],
	[IdCategoria],
	[FecBaja]
from [ProdCategoria]
where [IdProducto] = @IdProducto


GO
/****** Object:  StoredProcedure [dbo].[ProdCategoriaUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProdCategoriaUpdate]
(
	@IdProducto int,
	@IdCategoria int,
	@FecBaja datetime
)

as

set nocount on

update [ProdCategoria]
set [FecBaja] = @FecBaja
where [IdProducto] = @IdProducto	and [IdCategoria] = @IdCategoria


GO
/****** Object:  StoredProcedure [dbo].[ProductoDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProductoDelete]
(
	@IdProducto int
)

as

set nocount on

update [Producto]
set FecBaja = getdate()
where [IdProducto] = @IdProducto


GO
/****** Object:  StoredProcedure [dbo].[ProductoDeleteAllByCUIT]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProductoDeleteAllByCUIT]
(
	@CUIT int
)

as

set nocount on

update [Producto]
set FecBaja = getdate()
where [CUIT] = @CUIT


GO
/****** Object:  StoredProcedure [dbo].[ProductoDeleteAllByIdIvaProducto]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProductoDeleteAllByIdIvaProducto]
(
	@IdIvaProducto int
)

as

set nocount on

update [Producto]
set FecBaja = getdate()
where [IdIvaProducto] = @IdIvaProducto


GO
/****** Object:  StoredProcedure [dbo].[ProductoDeleteAllByIdMarca]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProductoDeleteAllByIdMarca]
(
	@IdMarca int
)

as

set nocount on

update [Producto]
set FecBaja = getdate()
where [IdMarca] = @IdMarca


GO
/****** Object:  StoredProcedure [dbo].[ProductoDeleteAllByIdProducto]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProductoDeleteAllByIdProducto]
(
	@IdProducto int
)

as

set nocount on

update [Producto]
set FecBaja = getdate()
where [IdProducto] = @IdProducto


GO
/****** Object:  StoredProcedure [dbo].[ProductoInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProductoInsert]
(
	@CodigoProducto varchar(50),
	@PrecioUnitario decimal(18, 0),
	@IdMarca int,
	@CUIT int,
	@IdIvaProducto int,
	@DescripProducto varchar(300),
	@URL varchar(500)
)

as

set nocount on

insert into [Producto]
(
	[CodigoProducto],
	[PrecioUnitario],
	[IdMarca],
	[CUIT],
	[IdIvaProducto],
	[DescripProducto],
	[URL]
)
values
(
	@CodigoProducto,
	@PrecioUnitario,
	@IdMarca,
	@CUIT,
	@IdIvaProducto,
	@DescripProducto,
	@URL
)

select scope_identity()


GO
/****** Object:  StoredProcedure [dbo].[ProductoSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProductoSelect]
(
	@IdProducto int
)

as

set nocount on

select [IdProducto],
	[CodigoProducto],
	[PrecioUnitario],
	[IdMarca],
	[CUIT],
	[IdIvaProducto],
	[DescripProducto],
	[URL],
	[FecBaja]
from [Producto]
where [IdProducto] = @IdProducto


GO
/****** Object:  StoredProcedure [dbo].[ProductoSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProductoSelectAll]

as

set nocount on

select [IdProducto],
	[CodigoProducto],
	[PrecioUnitario],
	[IdMarca],
	[CUIT],
	[IdIvaProducto],
	[DescripProducto],
	[URL],
	[FecBaja]
from [Producto]


GO
/****** Object:  StoredProcedure [dbo].[ProductoSelectAllByCUIT]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProductoSelectAllByCUIT]
(
	@CUIT int
)

as

set nocount on

select [IdProducto],
	[CodigoProducto],
	[PrecioUnitario],
	[IdMarca],
	[CUIT],
	[IdIvaProducto],
	[DescripProducto],
	[URL],
	[FecBaja]
from [Producto]
where [CUIT] = @CUIT


GO
/****** Object:  StoredProcedure [dbo].[ProductoSelectAllByIdIvaProducto]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProductoSelectAllByIdIvaProducto]
(
	@IdIvaProducto int
)

as

set nocount on

select [IdProducto],
	[CodigoProducto],
	[PrecioUnitario],
	[IdMarca],
	[CUIT],
	[IdIvaProducto],
	[DescripProducto],
	[URL],
	[FecBaja]
from [Producto]
where [IdIvaProducto] = @IdIvaProducto


GO
/****** Object:  StoredProcedure [dbo].[ProductoSelectAllByIdMarca]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProductoSelectAllByIdMarca]
(
	@IdMarca int
)

as

set nocount on

select [IdProducto],
	[CodigoProducto],
	[PrecioUnitario],
	[IdMarca],
	[CUIT],
	[IdIvaProducto],
	[DescripProducto],
	[URL],
	[FecBaja]
from [Producto]
where [IdMarca] = @IdMarca


GO
/****** Object:  StoredProcedure [dbo].[ProductoSelectAllByIdProducto]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProductoSelectAllByIdProducto]
(
	@IdProducto int
)

as

set nocount on

select [IdProducto],
	[CodigoProducto],
	[PrecioUnitario],
	[IdMarca],
	[CUIT],
	[IdIvaProducto],
	[DescripProducto],
	[URL],
	[FecBaja]
from [Producto]
where [IdProducto] = @IdProducto


GO
/****** Object:  StoredProcedure [dbo].[ProductoUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProductoUpdate]
(
	@IdProducto int,
	@CodigoProducto varchar(50),
	@PrecioUnitario decimal(18, 0),
	@IdMarca int,
	@CUIT int,
	@IdIvaProducto int,
	@DescripProducto varchar(300),
	@URL varchar(500)
)

as

set nocount on

update [Producto]
set [CodigoProducto] = @CodigoProducto,
	[PrecioUnitario] = @PrecioUnitario,
	[IdMarca] = @IdMarca,
	[CUIT] = @CUIT,
	[IdIvaProducto] = @IdIvaProducto,
	[DescripProducto] = @DescripProducto,
	[URL] = @URL
where [IdProducto] = @IdProducto


GO
/****** Object:  StoredProcedure [dbo].[ProvinciaDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProvinciaDelete]
(
	@IdProvincia int
)

as

set nocount on

update [Provincia]
set FecBaja = getdate()
where [IdProvincia] = @IdProvincia


GO
/****** Object:  StoredProcedure [dbo].[ProvinciaInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProvinciaInsert]
(
	@IdProvincia int,
	@DescripcionProvincia varchar(200)
)

as

set nocount on

insert into [Provincia]
(
	[IdProvincia],
	[DescripcionProvincia]
)
values
(
	@IdProvincia,
	@DescripcionProvincia
)


GO
/****** Object:  StoredProcedure [dbo].[ProvinciaSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProvinciaSelect]
(
	@IdProvincia int
)

as

set nocount on

select [IdProvincia],
	[DescripcionProvincia],
	[FecBaja]
from [Provincia]
where [IdProvincia] = @IdProvincia


GO
/****** Object:  StoredProcedure [dbo].[ProvinciaSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProvinciaSelectAll]

as

set nocount on

select [IdProvincia],
	[DescripcionProvincia],
	[FecBaja]
from [Provincia]


GO
/****** Object:  StoredProcedure [dbo].[ProvinciaUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProvinciaUpdate]
(
	@IdProvincia int,
	@DescripcionProvincia varchar(200)
)

as

set nocount on

update [Provincia]
set [DescripcionProvincia] = @DescripcionProvincia
where [IdProvincia] = @IdProvincia


GO
/****** Object:  StoredProcedure [dbo].[ReservaDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ReservaDelete]
(
	@IdReserva int
)

as

set nocount on

update [Reserva]
set FecBaja = getdate()
where [IdReserva] = @IdReserva


GO
/****** Object:  StoredProcedure [dbo].[ReservaDeleteAllByIdPedido_IdPedidoDetalle]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ReservaDeleteAllByIdPedido_IdPedidoDetalle]
(
	@IdPedido int,
	@IdPedidoDetalle int
)

as

set nocount on

update [Reserva]
set FecBaja = getdate()
where [IdPedido] = @IdPedido
	and [IdPedidoDetalle] = @IdPedidoDetalle


GO
/****** Object:  StoredProcedure [dbo].[ReservaDeleteAllByIdSucursal]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ReservaDeleteAllByIdSucursal]
(
	@IdSucursal int
)

as

set nocount on

update [Reserva]
set FecBaja = getdate()
where [IdSucursal] = @IdSucursal


GO
/****** Object:  StoredProcedure [dbo].[ReservaInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ReservaInsert]
(
	@IdPedido int,
	@IdPedidoDetalle int,
	@IdSucursal int,
	@Activo bit,
	@Fecha datetime
)

as

set nocount on

insert into [Reserva]
(
	[IdPedido],
	[IdPedidoDetalle],
	[IdSucursal],
	[Activo],
	[Fecha]
)
values
(
	@IdPedido,
	@IdPedidoDetalle,
	@IdSucursal,
	@Activo,
	@Fecha
)

select scope_identity()


GO
/****** Object:  StoredProcedure [dbo].[ReservaSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ReservaSelect]
(
	@IdReserva int
)

as

set nocount on

select [IdReserva],
	[IdPedido],
	[IdPedidoDetalle],
	[IdSucursal],
	[Activo],
	[Fecha],
	[FecBaja]
from [Reserva]
where [IdReserva] = @IdReserva


GO
/****** Object:  StoredProcedure [dbo].[ReservaSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ReservaSelectAll]

as

set nocount on

select [IdReserva],
	[IdPedido],
	[IdPedidoDetalle],
	[IdSucursal],
	[Activo],
	[Fecha],
	[FecBaja]
from [Reserva]


GO
/****** Object:  StoredProcedure [dbo].[ReservaSelectAllByIdPedido_IdPedidoDetalle]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ReservaSelectAllByIdPedido_IdPedidoDetalle]
(
	@IdPedido int,
	@IdPedidoDetalle int
)

as

set nocount on

select [IdReserva],
	[IdPedido],
	[IdPedidoDetalle],
	[IdSucursal],
	[Activo],
	[Fecha],
	[FecBaja]
from [Reserva]
where [IdPedido] = @IdPedido
	and [IdPedidoDetalle] = @IdPedidoDetalle


GO
/****** Object:  StoredProcedure [dbo].[ReservaSelectAllByIdSucursal]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ReservaSelectAllByIdSucursal]
(
	@IdSucursal int
)

as

set nocount on

select [IdReserva],
	[IdPedido],
	[IdPedidoDetalle],
	[IdSucursal],
	[Activo],
	[Fecha],
	[FecBaja]
from [Reserva]
where [IdSucursal] = @IdSucursal


GO
/****** Object:  StoredProcedure [dbo].[ReservaUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ReservaUpdate]
(
	@IdReserva int,
	@IdPedido int,
	@IdPedidoDetalle int,
	@IdSucursal int,
	@Activo bit,
	@Fecha datetime
)

as

set nocount on

update [Reserva]
set [IdPedido] = @IdPedido,
	[IdPedidoDetalle] = @IdPedidoDetalle,
	[IdSucursal] = @IdSucursal,
	[Activo] = @Activo,
	[Fecha] = @Fecha
where [IdReserva] = @IdReserva


GO
/****** Object:  StoredProcedure [dbo].[StockSucursalDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[StockSucursalDelete]
(
	@IdProducto int,
	@IdSucursal int
)

as

set nocount on

update [StockSucursal]
set FecBaja = getdate()
where [IdProducto] = @IdProducto
	and [IdSucursal] = @IdSucursal


GO
/****** Object:  StoredProcedure [dbo].[StockSucursalDeleteAllByIdProducto]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[StockSucursalDeleteAllByIdProducto]
(
	@IdProducto int
)

as

set nocount on

update [StockSucursal]
set FecBaja = getdate()
where [IdProducto] = @IdProducto


GO
/****** Object:  StoredProcedure [dbo].[StockSucursalDeleteAllByIdSucursal]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[StockSucursalDeleteAllByIdSucursal]
(
	@IdSucursal int
)

as

set nocount on

update [StockSucursal]
set FecBaja = getdate()
where [IdSucursal] = @IdSucursal


GO
/****** Object:  StoredProcedure [dbo].[StockSucursalInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[StockSucursalInsert]
(
	@IdProducto int,
	@IdSucursal int,
	@CantidadProducto int
)

as

set nocount on

insert into [StockSucursal]
(
	[IdProducto],
	[IdSucursal],
	[CantidadProducto]
)
values
(
	@IdProducto,
	@IdSucursal,
	@CantidadProducto
)


GO
/****** Object:  StoredProcedure [dbo].[StockSucursalSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[StockSucursalSelect]
(
	@IdProducto int,
	@IdSucursal int
)

as

set nocount on

select [IdProducto],
	[IdSucursal],
	[CantidadProducto],
	[FecBaja]
from [StockSucursal]
where [IdProducto] = @IdProducto
	and [IdSucursal] = @IdSucursal


GO
/****** Object:  StoredProcedure [dbo].[StockSucursalSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[StockSucursalSelectAll]

as

set nocount on

select [IdProducto],
	[IdSucursal],
	[CantidadProducto],
	[FecBaja]
from [StockSucursal]


GO
/****** Object:  StoredProcedure [dbo].[StockSucursalSelectAllByIdProducto]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[StockSucursalSelectAllByIdProducto]
(
	@IdProducto int
)

as

set nocount on

select [IdProducto],
	[IdSucursal],
	[CantidadProducto],
	[FecBaja]
from [StockSucursal]
where [IdProducto] = @IdProducto


GO
/****** Object:  StoredProcedure [dbo].[StockSucursalSelectAllByIdSucursal]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[StockSucursalSelectAllByIdSucursal]
(
	@IdSucursal int
)

as

set nocount on

select [IdProducto],
	[IdSucursal],
	[CantidadProducto],
	[FecBaja]
from [StockSucursal]
where [IdSucursal] = @IdSucursal


GO
/****** Object:  StoredProcedure [dbo].[StockSucursalUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[StockSucursalUpdate]
(
	@IdProducto int,
	@IdSucursal int,
	@CantidadProducto int
)

as

set nocount on

update [StockSucursal]
set [CantidadProducto] = @CantidadProducto
where [IdProducto] = @IdProducto	and [IdSucursal] = @IdSucursal


GO
/****** Object:  StoredProcedure [dbo].[SucursalDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SucursalDelete]
(
	@IdSucursal int
)

as

set nocount on

update [Sucursal]
set FecBaja = getdate()
where [IdSucursal] = @IdSucursal


GO
/****** Object:  StoredProcedure [dbo].[SucursalDeleteAllByCUIT]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SucursalDeleteAllByCUIT]
(
	@CUIT int
)

as

set nocount on

update [Sucursal]
set FecBaja = getdate()
where [CUIT] = @CUIT


GO
/****** Object:  StoredProcedure [dbo].[SucursalDeleteAllByDireccionSucursal]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SucursalDeleteAllByDireccionSucursal]
(
	@DireccionSucursal int
)

as

set nocount on

update [Sucursal]
set FecBaja = getdate()
where [DireccionSucursal] = @DireccionSucursal


GO
/****** Object:  StoredProcedure [dbo].[SucursalInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SucursalInsert]
(
	@DescripSucursal varchar(200),
	@DireccionSucursal int,
	@CUIT int
)

as

set nocount on

insert into [Sucursal]
(
	[DescripSucursal],
	[DireccionSucursal],
	[CUIT]
)
values
(
	@DescripSucursal,
	@DireccionSucursal,
	@CUIT
)

select scope_identity()


GO
/****** Object:  StoredProcedure [dbo].[SucursalSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SucursalSelect]
(
	@IdSucursal int
)

as

set nocount on

select [IdSucursal],
	[DescripSucursal],
	[DireccionSucursal],
	[CUIT],
	[FecBaja]
from [Sucursal]
where [IdSucursal] = @IdSucursal


GO
/****** Object:  StoredProcedure [dbo].[SucursalSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SucursalSelectAll]

as

set nocount on

select [IdSucursal],
	[DescripSucursal],
	[DireccionSucursal],
	[CUIT],
	[FecBaja]
from [Sucursal]


GO
/****** Object:  StoredProcedure [dbo].[SucursalSelectAllByCUIT]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SucursalSelectAllByCUIT]
(
	@CUIT int
)

as

set nocount on

select [IdSucursal],
	[DescripSucursal],
	[DireccionSucursal],
	[CUIT],
	[FecBaja]
from [Sucursal]
where [CUIT] = @CUIT


GO
/****** Object:  StoredProcedure [dbo].[SucursalSelectAllByDireccionSucursal]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SucursalSelectAllByDireccionSucursal]
(
	@DireccionSucursal int
)

as

set nocount on

select [IdSucursal],
	[DescripSucursal],
	[DireccionSucursal],
	[CUIT],
	[FecBaja]
from [Sucursal]
where [DireccionSucursal] = @DireccionSucursal


GO
/****** Object:  StoredProcedure [dbo].[SucursalUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SucursalUpdate]
(
	@IdSucursal int,
	@DescripSucursal varchar(200),
	@DireccionSucursal int,
	@CUIT int
)

as

set nocount on

update [Sucursal]
set [DescripSucursal] = @DescripSucursal,
	[DireccionSucursal] = @DireccionSucursal,
	[CUIT] = @CUIT
where [IdSucursal] = @IdSucursal


GO
/****** Object:  StoredProcedure [dbo].[TarjetaDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TarjetaDelete]
(
	@IdTarjeta int
)

as

set nocount on

update [Tarjeta]
set FecBaja = getdate()
where [IdTarjeta] = @IdTarjeta


GO
/****** Object:  StoredProcedure [dbo].[TarjetaDeleteAllByCUIT_NombreUsuario]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TarjetaDeleteAllByCUIT_NombreUsuario]
(
	@CUIT int,
	@NombreUsuario varchar(100)
)

as

set nocount on

update [Tarjeta]
set FecBaja = getdate()
where [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario


GO
/****** Object:  StoredProcedure [dbo].[TarjetaDeleteAllByIdTipoTarjeta]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TarjetaDeleteAllByIdTipoTarjeta]
(
	@IdTipoTarjeta int
)

as

set nocount on


update [Tarjeta]
set FecBaja = getdate()
where [IdTipoTarjeta] = @IdTipoTarjeta


GO
/****** Object:  StoredProcedure [dbo].[TarjetaInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[TarjetaInsert]
(
	@IdTipoTarjeta int,
	@CUIT int,
	@NombreUsuario varchar(100),
	@Titular nvarchar(50),
	@Vencimiento datetime,
	@Numero bigint,
	@CodSeguridad int,
	@FecBaja datetime
)

as

set nocount on

insert into [Tarjeta]
(
	[IdTipoTarjeta],
	[CUIT],
	[NombreUsuario],
	[Titular],
	[Vencimiento],
	[Numero],
	[CodSeguridad],
	[FecBaja]
)
values
(
	@IdTipoTarjeta,
	@CUIT,
	@NombreUsuario,
	@Titular,
	@Vencimiento,
	@Numero,
	@CodSeguridad,
	@FecBaja
)


GO
/****** Object:  StoredProcedure [dbo].[TarjetaSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TarjetaSelect]
(
	@IdTarjeta int
)

as

set nocount on

select [IdTarjeta],
	[IdTipoTarjeta],
	[CUIT],
	[NombreUsuario],
	[Titular],
	[Vencimiento],
	[Numero],
	[CodSeguridad],
	[FecBaja]
from [Tarjeta]
where [IdTarjeta] = @IdTarjeta


GO
/****** Object:  StoredProcedure [dbo].[TarjetaSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TarjetaSelectAll]

as

set nocount on

select [IdTarjeta],
	[IdTipoTarjeta],
	[CUIT],
	[NombreUsuario],
	[Titular],
	[Vencimiento],
	[Numero],
	[CodSeguridad],
	[FecBaja]
from [Tarjeta]


GO
/****** Object:  StoredProcedure [dbo].[TarjetaSelectAllByCUIT_NombreUsuario]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TarjetaSelectAllByCUIT_NombreUsuario]
(
	@CUIT int,
	@NombreUsuario varchar(100)
)

as

set nocount on

select [IdTarjeta],
	[IdTipoTarjeta],
	[CUIT],
	[NombreUsuario],
	[Titular],
	[Vencimiento],
	[Numero],
	[CodSeguridad],
	[FecBaja]
from [Tarjeta]
where [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario


GO
/****** Object:  StoredProcedure [dbo].[TarjetaSelectAllByIdTipoTarjeta]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TarjetaSelectAllByIdTipoTarjeta]
(
	@IdTipoTarjeta int
)

as

set nocount on

select [IdTarjeta],
	[IdTipoTarjeta],
	[CUIT],
	[NombreUsuario],
	[Titular],
	[Vencimiento],
	[Numero],
	[CodSeguridad],
	[FecBaja]
from [Tarjeta]
where [IdTipoTarjeta] = @IdTipoTarjeta


GO
/****** Object:  StoredProcedure [dbo].[TarjetaUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TarjetaUpdate]
(
	@IdTarjeta int,
	@IdTipoTarjeta int,
	@CUIT int,
	@NombreUsuario varchar(100),
	@Titular nvarchar(50),
	@Vencimiento datetime,
	@Numero bigint,
	@CodSeguridad int,
	@FecBaja datetime
)

as

set nocount on

update [Tarjeta]
set [IdTipoTarjeta] = @IdTipoTarjeta,
	[CUIT] = @CUIT,
	[NombreUsuario] = @NombreUsuario,
	[Titular] = @Titular,
	[Vencimiento] = @Vencimiento,
	[Numero] = @Numero,
	[CodSeguridad] = @CodSeguridad,
	[FecBaja] = @FecBaja
where [IdTarjeta] = @IdTarjeta


GO
/****** Object:  StoredProcedure [dbo].[TelefonoDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TelefonoDelete]
(
	@CUIT int,
	@NombreUsuario varchar(100),
	@NroTelefono varchar(12),
	@CodArea varchar(10),
	@IdTipoTel int
)

as

set nocount on


update [Telefono]
set FecBaja = getdate()
where [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario
	and [NroTelefono] = @NroTelefono
	and [CodArea] = @CodArea
	and [IdTipoTel] = @IdTipoTel


GO
/****** Object:  StoredProcedure [dbo].[TelefonoDeleteAllByCUIT_NombreUsuario]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TelefonoDeleteAllByCUIT_NombreUsuario]
(
	@CUIT int,
	@NombreUsuario varchar(100)
)

as

set nocount on



update [Telefono]
set FecBaja = getdate()
where [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario


GO
/****** Object:  StoredProcedure [dbo].[TelefonoDeleteAllByIdTipoTel]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TelefonoDeleteAllByIdTipoTel]
(
	@IdTipoTel int
)

as

set nocount on



update [Telefono]
set FecBaja = getdate()
where [IdTipoTel] = @IdTipoTel


GO
/****** Object:  StoredProcedure [dbo].[TelefonoInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TelefonoInsert]
(
	@CUIT int,
	@NombreUsuario varchar(100),
	@NroTelefono varchar(12),
	@CodArea varchar(10),
	@IdTipoTel int
)

as

set nocount on

insert into [Telefono]
(
	[CUIT],
	[NombreUsuario],
	[NroTelefono],
	[CodArea],
	[IdTipoTel]
)
values
(
	@CUIT,
	@NombreUsuario,
	@NroTelefono,
	@CodArea,
	@IdTipoTel
)


GO
/****** Object:  StoredProcedure [dbo].[TelefonoSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TelefonoSelect]
(
	@CUIT int,
	@NombreUsuario varchar(100),
	@NroTelefono varchar(12),
	@CodArea varchar(10),
	@IdTipoTel int
)

as

set nocount on

select [CUIT],
	[NombreUsuario],
	[NroTelefono],
	[CodArea],
	[IdTipoTel],
	[FecBaja]
from [Telefono]
where [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario
	and [NroTelefono] = @NroTelefono
	and [CodArea] = @CodArea
	and [IdTipoTel] = @IdTipoTel


GO
/****** Object:  StoredProcedure [dbo].[TelefonoSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TelefonoSelectAll]

as

set nocount on

select [CUIT],
	[NombreUsuario],
	[NroTelefono],
	[CodArea],
	[IdTipoTel],
	[FecBaja]
from [Telefono]


GO
/****** Object:  StoredProcedure [dbo].[TelefonoSelectAllByCUIT_NombreUsuario]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TelefonoSelectAllByCUIT_NombreUsuario]
(
	@CUIT int,
	@NombreUsuario varchar(100)
)

as

set nocount on

select [CUIT],
	[NombreUsuario],
	[NroTelefono],
	[CodArea],
	[IdTipoTel],
	[FecBaja]
from [Telefono]
where [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario


GO
/****** Object:  StoredProcedure [dbo].[TelefonoSelectAllByIdTipoTel]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TelefonoSelectAllByIdTipoTel]
(
	@IdTipoTel int
)

as

set nocount on

select [CUIT],
	[NombreUsuario],
	[NroTelefono],
	[CodArea],
	[IdTipoTel],
	[FecBaja]
from [Telefono]
where [IdTipoTel] = @IdTipoTel


GO
/****** Object:  StoredProcedure [dbo].[TelefonoUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TelefonoUpdate]
(
	@CUIT int,
	@NombreUsuario varchar(100),
	@NroTelefono varchar(12),
	@CodArea varchar(10),
	@IdTipoTel int,
	@FecBaja datetime
)

as

set nocount on

update [Telefono]
set [FecBaja] = @FecBaja
where [CUIT] = @CUIT	and [NombreUsuario] = @NombreUsuario	and [NroTelefono] = @NroTelefono	and [CodArea] = @CodArea	and [IdTipoTel] = @IdTipoTel


GO
/****** Object:  StoredProcedure [dbo].[TipoComprobanteDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TipoComprobanteDelete]
(
	@IdTipoComprobante int
)

as

set nocount on



update [TipoComprobante]
set FecBaja = getdate()
where [IdTipoComprobante] = @IdTipoComprobante


GO
/****** Object:  StoredProcedure [dbo].[TipoComprobanteInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TipoComprobanteInsert]
(
	@DescripTipoComprobante varchar(200)
)

as

set nocount on

insert into [TipoComprobante]
(
	[DescripTipoComprobante]
)
values
(
	@DescripTipoComprobante
)

select scope_identity()


GO
/****** Object:  StoredProcedure [dbo].[TipoComprobanteSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TipoComprobanteSelect]
(
	@IdTipoComprobante int
)

as

set nocount on

select [IdTipoComprobante],
	[DescripTipoComprobante],
	[FecBaja]
from [TipoComprobante]
where [IdTipoComprobante] = @IdTipoComprobante


GO
/****** Object:  StoredProcedure [dbo].[TipoComprobanteSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TipoComprobanteSelectAll]

as

set nocount on

select [IdTipoComprobante],
	[DescripTipoComprobante],
	[FecBaja]
from [TipoComprobante]


GO
/****** Object:  StoredProcedure [dbo].[TipoComprobanteUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TipoComprobanteUpdate]
(
	@IdTipoComprobante int,
	@DescripTipoComprobante varchar(200)
)

as

set nocount on

update [TipoComprobante]
set [DescripTipoComprobante] = @DescripTipoComprobante
where [IdTipoComprobante] = @IdTipoComprobante


GO
/****** Object:  StoredProcedure [dbo].[TipoDireccionDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TipoDireccionDelete]
(
	@IdTipoDireccion int
)

as

set nocount on



update [TipoDireccion]
set FecBaja = getdate()
where [IdTipoDireccion] = @IdTipoDireccion


GO
/****** Object:  StoredProcedure [dbo].[TipoDireccionInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TipoDireccionInsert]
(
	@IdTipoDireccion int,
	@DescripcionDireccion varchar(200)
)

as

set nocount on

insert into [TipoDireccion]
(
	[IdTipoDireccion],
	[DescripcionDireccion]
)
values
(
	@IdTipoDireccion,
	@DescripcionDireccion
)


GO
/****** Object:  StoredProcedure [dbo].[TipoDireccionSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TipoDireccionSelect]
(
	@IdTipoDireccion int
)

as

set nocount on

select [IdTipoDireccion],
	[DescripcionDireccion],
	[FecBaja]
from [TipoDireccion]
where [IdTipoDireccion] = @IdTipoDireccion


GO
/****** Object:  StoredProcedure [dbo].[TipoDireccionSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TipoDireccionSelectAll]

as

set nocount on

select [IdTipoDireccion],
	[DescripcionDireccion],
	[FecBaja]
from [TipoDireccion]


GO
/****** Object:  StoredProcedure [dbo].[TipoDireccionUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TipoDireccionUpdate]
(
	@IdTipoDireccion int,
	@DescripcionDireccion varchar(200)
)

as

set nocount on

update [TipoDireccion]
set [DescripcionDireccion] = @DescripcionDireccion
where [IdTipoDireccion] = @IdTipoDireccion


GO
/****** Object:  StoredProcedure [dbo].[TipoTarjetaDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TipoTarjetaDelete]
(
	@IdTipoTarjeta int
)

as

set nocount on




update [TipoTarjeta]
set FecBaja = getdate()
where [IdTipoTarjeta] = @IdTipoTarjeta


GO
/****** Object:  StoredProcedure [dbo].[TipoTarjetaInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TipoTarjetaInsert]
(
	@IdTipoTarjeta int,
	@Descripcion varchar(50),
	@FecBaja datetime
)

as

set nocount on

insert into [TipoTarjeta]
(
	[IdTipoTarjeta],
	[Descripcion],
	[FecBaja]
)
values
(
	@IdTipoTarjeta,
	@Descripcion,
	@FecBaja
)


GO
/****** Object:  StoredProcedure [dbo].[TipoTarjetaSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TipoTarjetaSelect]
(
	@IdTipoTarjeta int
)

as

set nocount on

select [IdTipoTarjeta],
	[Descripcion],
	[FecBaja]
from [TipoTarjeta]
where [IdTipoTarjeta] = @IdTipoTarjeta


GO
/****** Object:  StoredProcedure [dbo].[TipoTarjetaSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TipoTarjetaSelectAll]

as

set nocount on

select [IdTipoTarjeta],
	[Descripcion],
	[FecBaja]
from [TipoTarjeta]


GO
/****** Object:  StoredProcedure [dbo].[TipoTarjetaUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TipoTarjetaUpdate]
(
	@IdTipoTarjeta int,
	@Descripcion varchar(50),
	@FecBaja datetime
)

as

set nocount on

update [TipoTarjeta]
set [Descripcion] = @Descripcion,
	[FecBaja] = @FecBaja
where [IdTipoTarjeta] = @IdTipoTarjeta


GO
/****** Object:  StoredProcedure [dbo].[TipoTelDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TipoTelDelete]
(
	@IdTipoTel int
)

as

set nocount on



update [TipoTel]
set FecBaja = getdate()
where [IdTipoTel] = @IdTipoTel


GO
/****** Object:  StoredProcedure [dbo].[TipoTelInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TipoTelInsert]
(
	@DescripcionTipoTel varchar(20)
)

as

set nocount on

insert into [TipoTel]
(
	[DescripcionTipoTel]
)
values
(
	@DescripcionTipoTel
)

select scope_identity()


GO
/****** Object:  StoredProcedure [dbo].[TipoTelSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TipoTelSelect]
(
	@IdTipoTel int
)

as

set nocount on

select [IdTipoTel],
	[DescripcionTipoTel],
	[FecBaja]
from [TipoTel]
where [IdTipoTel] = @IdTipoTel


GO
/****** Object:  StoredProcedure [dbo].[TipoTelSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TipoTelSelectAll]

as

set nocount on

select [IdTipoTel],
	[DescripcionTipoTel],
	[FecBaja]
from [TipoTel]


GO
/****** Object:  StoredProcedure [dbo].[TipoTelUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TipoTelUpdate]
(
	@IdTipoTel int,
	@DescripcionTipoTel varchar(20)
)

as

set nocount on

update [TipoTel]
set [DescripcionTipoTel] = @DescripcionTipoTel
where [IdTipoTel] = @IdTipoTel


GO
/****** Object:  StoredProcedure [dbo].[UsuarioDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioDelete]
(
	@CUIT int,
	@NombreUsuario varchar(100)
)

as

set nocount on


update [Usuario]
set FecBaja = getdate()
where [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario


GO
/****** Object:  StoredProcedure [dbo].[UsuarioDeleteAllByCUIT]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioDeleteAllByCUIT]
(
	@CUIT int
)

as

set nocount on




update [Usuario]
set FecBaja = getdate()
where [CUIT] = @CUIT


GO
/****** Object:  StoredProcedure [dbo].[UsuarioDeleteAllByIdCondicionFiscal]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioDeleteAllByIdCondicionFiscal]
(
	@IdCondicionFiscal int
)

as

set nocount on


update [Usuario]
set FecBaja = getdate()
where [IdCondicionFiscal] = @IdCondicionFiscal


GO
/****** Object:  StoredProcedure [dbo].[UsuarioDeleteAllByIdUsuario]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioDeleteAllByIdUsuario]
(
	@IdUsuario int
)

as

set nocount on


update [Usuario]
set FecBaja = getdate()
where [IdUsuario] = @IdUsuario


GO
/****** Object:  StoredProcedure [dbo].[UsuarioDeleteAllByIdUsuarioTipo]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioDeleteAllByIdUsuarioTipo]
(
	@IdUsuarioTipo int
)

as

set nocount on


update [Usuario]
set FecBaja = getdate()
where [IdUsuarioTipo] = @IdUsuarioTipo


GO
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliaDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioFamiliaDelete]
(
	@CUIT int,
	@NombreUsuario varchar(100),
	@IdFamilia int
)

as

set nocount on



update [UsuarioFamilia]
set FecBaja = getdate()
where [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario
	and [IdFamilia] = @IdFamilia


GO
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliaDeleteAllByCUIT_NombreUsuario]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioFamiliaDeleteAllByCUIT_NombreUsuario]
(
	@CUIT int,
	@NombreUsuario varchar(100)
)

as

set nocount on


update [UsuarioFamilia]
set FecBaja = getdate()
where [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario


GO
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliaDeleteAllByIdFamilia]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioFamiliaDeleteAllByIdFamilia]
(
	@IdFamilia int
)

as

set nocount on

update [UsuarioFamilia]
set FecBaja = getdate()
where [IdFamilia] = @IdFamilia


GO
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliaInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioFamiliaInsert]
(
	@CUIT int,
	@NombreUsuario varchar(100),
	@IdFamilia int
)

as

set nocount on

insert into [UsuarioFamilia]
(
	[CUIT],
	[NombreUsuario],
	[IdFamilia]
)
values
(
	@CUIT,
	@NombreUsuario,
	@IdFamilia
)


GO
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliaSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioFamiliaSelect]
(
	@CUIT int,
	@NombreUsuario varchar(100),
	@IdFamilia int
)

as

set nocount on

select [CUIT],
	[NombreUsuario],
	[IdFamilia],
	[FecBaja]
from [UsuarioFamilia]
where [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario
	and [IdFamilia] = @IdFamilia


GO
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliaSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioFamiliaSelectAll]

as

set nocount on

select [CUIT],
	[NombreUsuario],
	[IdFamilia],
	[FecBaja]
from [UsuarioFamilia]


GO
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliaSelectAllByCUIT_NombreUsuario]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioFamiliaSelectAllByCUIT_NombreUsuario]
(
	@CUIT int,
	@NombreUsuario varchar(100)
)

as

set nocount on

select [CUIT],
	[NombreUsuario],
	[IdFamilia],
	[FecBaja]
from [UsuarioFamilia]
where [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario


GO
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliaSelectAllByIdFamilia]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioFamiliaSelectAllByIdFamilia]
(
	@IdFamilia int
)

as

set nocount on

select [CUIT],
	[NombreUsuario],
	[IdFamilia],
	[FecBaja]
from [UsuarioFamilia]
where [IdFamilia] = @IdFamilia


GO
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliaUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioFamiliaUpdate]
(
	@CUIT int,
	@NombreUsuario varchar(100),
	@IdFamilia int,
	@FecBaja datetime
)

as

set nocount on

update [UsuarioFamilia]
set [FecBaja] = @FecBaja
where [CUIT] = @CUIT	and [NombreUsuario] = @NombreUsuario	and [IdFamilia] = @IdFamilia


GO
/****** Object:  StoredProcedure [dbo].[UsuarioInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioInsert]
(
	@IdCondicionFiscal int,
	@IdUsuarioTipo int,
	@Nombre varchar(200),
	@Apellido varchar(200),
	@Dni varchar(10),
	@CUIT int,
	@Email varchar(400),
	@NombreUsuario varchar(100),
	@Clave varchar(200)
)

as

set nocount on

insert into [Usuario]
(
	[IdCondicionFiscal],
	[IdUsuarioTipo],
	[Nombre],
	[Apellido],
	[Dni],
	[CUIT],
	[Email],
	[NombreUsuario],
	[Clave]
)
values
(
	@IdCondicionFiscal,
	@IdUsuarioTipo,
	@Nombre,
	@Apellido,
	@Dni,
	@CUIT,
	@Email,
	@NombreUsuario,
	@Clave
)

select scope_identity()


GO
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioPatenteDelete]
(
	@CUIT int,
	@NombreUsuario varchar(100),
	@IdPatente int
)

as

set nocount on


update [UsuarioPatente]
set FecBaja = getdate()
where [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario
	and [IdPatente] = @IdPatente


GO
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteDeleteAllByCUIT_NombreUsuario]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioPatenteDeleteAllByCUIT_NombreUsuario]
(
	@CUIT int,
	@NombreUsuario varchar(100)
)

as

set nocount on


update [UsuarioPatente]
set FecBaja = getdate()
where [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario


GO
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteDeleteAllByIdPatente]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioPatenteDeleteAllByIdPatente]
(
	@IdPatente int
)

as

set nocount on


update [UsuarioPatente]
set FecBaja = getdate()
where [IdPatente] = @IdPatente


GO
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioPatenteInsert]
(
	@CUIT int,
	@NombreUsuario varchar(100),
	@IdPatente int
)

as

set nocount on

insert into [UsuarioPatente]
(
	[CUIT],
	[NombreUsuario],
	[IdPatente]
)
values
(
	@CUIT,
	@NombreUsuario,
	@IdPatente
)


GO
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioPatenteSelect]
(
	@CUIT int,
	@NombreUsuario varchar(100),
	@IdPatente int
)

as

set nocount on

select [CUIT],
	[NombreUsuario],
	[IdPatente],
	[FecBaja]
from [UsuarioPatente]
where [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario
	and [IdPatente] = @IdPatente


GO
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioPatenteSelectAll]

as

set nocount on

select [CUIT],
	[NombreUsuario],
	[IdPatente],
	[FecBaja]
from [UsuarioPatente]


GO
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteSelectAllByCUIT_NombreUsuario]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioPatenteSelectAllByCUIT_NombreUsuario]
(
	@CUIT int,
	@NombreUsuario varchar(100)
)

as

set nocount on

select [CUIT],
	[NombreUsuario],
	[IdPatente],
	[FecBaja]
from [UsuarioPatente]
where [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario


GO
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteSelectAllByIdPatente]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioPatenteSelectAllByIdPatente]
(
	@IdPatente int
)

as

set nocount on

select [CUIT],
	[NombreUsuario],
	[IdPatente],
	[FecBaja]
from [UsuarioPatente]
where [IdPatente] = @IdPatente


GO
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioPatenteUpdate]
(
	@CUIT int,
	@NombreUsuario varchar(100),
	@IdPatente int,
	@FecBaja datetime
)

as

set nocount on

update [UsuarioPatente]
set [FecBaja] = @FecBaja
where [CUIT] = @CUIT	and [NombreUsuario] = @NombreUsuario	and [IdPatente] = @IdPatente


GO
/****** Object:  StoredProcedure [dbo].[UsuarioSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioSelect]
(
	@CUIT int,
	@NombreUsuario varchar(100)
)

as

set nocount on

select [IdUsuario],
	[IdCondicionFiscal],
	[IdUsuarioTipo],
	[Nombre],
	[Apellido],
	[Dni],
	[CUIT],
	[Email],
	[NombreUsuario],
	[Clave],
	[CUIT],
	[FecBaja]
from [Usuario]
where [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario


GO
/****** Object:  StoredProcedure [dbo].[UsuarioSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioSelectAll]

as

set nocount on

select [IdUsuario],
	[IdCondicionFiscal],
	[IdUsuarioTipo],
	[Nombre],
	[Apellido],
	[Dni],
	[CUIT],
	[Email],
	[NombreUsuario],
	[Clave],
	[CUIT],
	[FecBaja]
from [Usuario]


GO
/****** Object:  StoredProcedure [dbo].[UsuarioSelectAllByCUIT]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioSelectAllByCUIT]
(
	@CUIT int
)

as

set nocount on

select [IdUsuario],
	[IdCondicionFiscal],
	[IdUsuarioTipo],
	[Nombre],
	[Apellido],
	[Dni],
	[CUIT],
	[Email],
	[NombreUsuario],
	[Clave],
	[CUIT],
	[FecBaja]
from [Usuario]
where [CUIT] = @CUIT


GO
/****** Object:  StoredProcedure [dbo].[UsuarioSelectAllByIdCondicionFiscal]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioSelectAllByIdCondicionFiscal]
(
	@IdCondicionFiscal int
)

as

set nocount on

select [IdUsuario],
	[IdCondicionFiscal],
	[IdUsuarioTipo],
	[Nombre],
	[Apellido],
	[Dni],
	[CUIT],
	[Email],
	[NombreUsuario],
	[Clave],
	[CUIT],
	[FecBaja]
from [Usuario]
where [IdCondicionFiscal] = @IdCondicionFiscal


GO
/****** Object:  StoredProcedure [dbo].[UsuarioSelectAllByIdUsuario]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioSelectAllByIdUsuario]
(
	@IdUsuario int
)

as

set nocount on

select [IdUsuario],
	[IdCondicionFiscal],
	[IdUsuarioTipo],
	[Nombre],
	[Apellido],
	[Dni],
	[CUIT],
	[Email],
	[NombreUsuario],
	[Clave],
	[CUIT],
	[FecBaja]
from [Usuario]
where [IdUsuario] = @IdUsuario


GO
/****** Object:  StoredProcedure [dbo].[UsuarioSelectAllByIdUsuarioTipo]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioSelectAllByIdUsuarioTipo]
(
	@IdUsuarioTipo int
)

as

set nocount on

select [IdUsuario],
	[IdCondicionFiscal],
	[IdUsuarioTipo],
	[Nombre],
	[Apellido],
	[Dni],
	[CUIT],
	[Email],
	[NombreUsuario],
	[Clave],
	[CUIT],
	[FecBaja]
from [Usuario]
where [IdUsuarioTipo] = @IdUsuarioTipo


GO
/****** Object:  StoredProcedure [dbo].[UsuarioTipoDelete]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioTipoDelete]
(
	@IdUsuarioTipo int
)

as

set nocount on


update [UsuarioTipo]
set FecBaja = getdate()
where [IdUsuarioTipo] = @IdUsuarioTipo


GO
/****** Object:  StoredProcedure [dbo].[UsuarioTipoInsert]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioTipoInsert]
(
	@Descripcion varchar(200)
)

as

set nocount on

insert into [UsuarioTipo]
(
	[Descripcion]
)
values
(
	@Descripcion
)

select scope_identity()


GO
/****** Object:  StoredProcedure [dbo].[UsuarioTipoSelect]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioTipoSelect]
(
	@IdUsuarioTipo int
)

as

set nocount on

select [IdUsuarioTipo],
	[Descripcion],
	[FecBaja]
from [UsuarioTipo]
where [IdUsuarioTipo] = @IdUsuarioTipo


GO
/****** Object:  StoredProcedure [dbo].[UsuarioTipoSelectAll]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioTipoSelectAll]

as

set nocount on

select [IdUsuarioTipo],
	[Descripcion],
	[FecBaja]
from [UsuarioTipo]


GO
/****** Object:  StoredProcedure [dbo].[UsuarioTipoUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioTipoUpdate]
(
	@IdUsuarioTipo int,
	@Descripcion varchar(200)
)

as

set nocount on

update [UsuarioTipo]
set [Descripcion] = @Descripcion
where [IdUsuarioTipo] = @IdUsuarioTipo


GO
/****** Object:  StoredProcedure [dbo].[UsuarioUpdate]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UsuarioUpdate]
(
	@IdUsuario int,
	@IdCondicionFiscal int,
	@IdUsuarioTipo int,
	@Nombre varchar(200),
	@Apellido varchar(200),
	@Dni varchar(10),
	@CUIT int,
	@Email varchar(400),
	@NombreUsuario varchar(100),
	@Clave varchar(200)
)

as

set nocount on

update [Usuario]
set [IdCondicionFiscal] = @IdCondicionFiscal,
	[IdUsuarioTipo] = @IdUsuarioTipo,
	[Nombre] = @Nombre,
	[Apellido] = @Apellido,
	[Dni] = @Dni,
	[Email] = @Email,
	[Clave] = @Clave
where [CUIT] = @CUIT	and [NombreUsuario] = @NombreUsuario


GO
/****** Object:  Table [dbo].[BitacoraLog]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BitacoraLog](
	[IdBitacoraLog] [int] NOT NULL,
	[CUIT] [int] NOT NULL,
	[NombreUsuario] [varchar](100) NOT NULL,
	[Evento] [varchar](200) NOT NULL,
	[FechaEvento] [datetime] NOT NULL,
 CONSTRAINT [PK_BitacoraLog] PRIMARY KEY CLUSTERED 
(
	[IdBitacoraLog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[DescripCategoria] [varchar](200) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comprobante]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comprobante](
	[NroComprobante] [int] NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[CUIT] [int] NOT NULL,
	[IdTipoComprobante] [int] NOT NULL,
	[IdComprobante] [int] NOT NULL,
	[FechaComprobante] [datetime] NOT NULL,
	[IdPedido] [int] NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Comprobante] PRIMARY KEY CLUSTERED 
(
	[NroComprobante] ASC,
	[IdSucursal] ASC,
	[IdTipoComprobante] ASC,
	[CUIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ComprobanteDetalle]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComprobanteDetalle](
	[IdComprobanteDetalle] [int] NOT NULL,
	[NroComprobante] [int] NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[IdTipoComprobante] [int] NOT NULL,
	[CUIT] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[CantidadProducto] [int] NOT NULL,
	[PrecioUnitarioFact] [decimal](18, 0) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_ComprobanteDetalle] PRIMARY KEY CLUSTERED 
(
	[IdComprobanteDetalle] ASC,
	[NroComprobante] ASC,
	[IdSucursal] ASC,
	[IdTipoComprobante] ASC,
	[CUIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CondicionFiscal]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CondicionFiscal](
	[IdCondicionFiscal] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_CondicionFiscal] PRIMARY KEY CLUSTERED 
(
	[IdCondicionFiscal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Controlador]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Controlador](
	[IdControlador] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpresa] [int] NULL,
	[Pagina] [varchar](500) NULL,
	[Controlador] [varchar](500) NULL,
	[Descripcion] [varchar](1000) NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Controladores] PRIMARY KEY CLUSTERED 
(
	[IdControlador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Direccion](
	[IdDireccion] [int] IDENTITY(1,1) NOT NULL,
	[Calle] [varchar](200) NOT NULL,
	[Numero] [int] NOT NULL,
	[Piso] [int] NULL,
	[Departamento] [varchar](100) NULL,
	[Localidad] [varchar](200) NULL,
	[IdProvincia] [int] NOT NULL,
	[IdTipoDireccion] [int] NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Direccion] PRIMARY KEY CLUSTERED 
(
	[IdDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DireccionUsuario]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DireccionUsuario](
	[IdDireccion] [int] NOT NULL,
	[CUIT] [int] NOT NULL,
	[NombreUsuario] [varchar](100) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Direccion_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdDireccion] ASC,
	[CUIT] ASC,
	[NombreUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empresa](
	[CUIT] [int] NOT NULL,
	[NombreEmpresa] [varchar](200) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Empresa] PRIMARY KEY CLUSTERED 
(
	[CUIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EstadoPago]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EstadoPago](
	[IdEstadoPago] [int] IDENTITY(1,1) NOT NULL,
	[DescripEstadoPago] [varchar](200) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_EstadoPago] PRIMARY KEY CLUSTERED 
(
	[IdEstadoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EstadoPedido]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EstadoPedido](
	[IdEstadoPedido] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionEstadoPedido] [varchar](20) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_EstadoPedido] PRIMARY KEY CLUSTERED 
(
	[IdEstadoPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Familia]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Familia](
	[IdFamilia] [int] IDENTITY(1,1) NOT NULL,
	[NombreFamilia] [varchar](200) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Familia] PRIMARY KEY CLUSTERED 
(
	[IdFamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FormaEntrega]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FormaEntrega](
	[IdFormaEntrega] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionFormaEntrega] [varchar](20) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_FormaEntrega] PRIMARY KEY CLUSTERED 
(
	[IdFormaEntrega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FormaPago]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FormaPago](
	[IdFormaPago] [int] IDENTITY(1,1) NOT NULL,
	[DescripFormaPago] [varchar](200) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_FormaPago] PRIMARY KEY CLUSTERED 
(
	[IdFormaPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IvaProducto]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IvaProducto](
	[IdIvaProducto] [int] IDENTITY(1,1) NOT NULL,
	[PorcentajeIvaProd] [int] NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_IvaProducto] PRIMARY KEY CLUSTERED 
(
	[IdIvaProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lenguaje]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lenguaje](
	[IdLenguaje] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionLenguaje] [varchar](200) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Lenguaje] PRIMARY KEY CLUSTERED 
(
	[IdLenguaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LenguajeControl]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LenguajeControl](
	[Texto] [varchar](400) NOT NULL,
	[IdLenguaje] [int] NOT NULL,
	[Valor] [varchar](400) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_LenguajeControl_Lenguaje] PRIMARY KEY CLUSTERED 
(
	[Texto] ASC,
	[IdLenguaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ListaDeseos]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ListaDeseos](
	[IdListaDeseos] [int] IDENTITY(1,1) NOT NULL,
	[CUIT] [int] NOT NULL,
	[NombreUsuario] [varchar](100) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_ListaDeseos] PRIMARY KEY CLUSTERED 
(
	[IdListaDeseos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ListaDeseosDetalle]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListaDeseosDetalle](
	[IdListaDeseos] [int] NOT NULL,
	[IdListaDeseosDetalle] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NOT NULL,
	[FechaDeseoDetalle] [datetime] NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_ListaDeseosDetalle] PRIMARY KEY CLUSTERED 
(
	[IdListaDeseos] ASC,
	[IdListaDeseosDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Marca]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Marca](
	[IdMarca] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionMarca] [varchar](50) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Marca] PRIMARY KEY CLUSTERED 
(
	[IdMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Moneda]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Moneda](
	[IdMoneda] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Cotizacion] [decimal](2, 2) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Moneda] PRIMARY KEY CLUSTERED 
(
	[IdMoneda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MonedaEmpresa]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonedaEmpresa](
	[IdMoneda] [int] NOT NULL,
	[CUIT] [int] NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_MonedaEmpresa] PRIMARY KEY CLUSTERED 
(
	[IdMoneda] ASC,
	[CUIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pago]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[IdPago] [int] IDENTITY(1,1) NOT NULL,
	[IdPedido] [int] NOT NULL,
	[FechaPago] [datetime] NOT NULL,
	[IdFormaPago] [int] NOT NULL,
	[MontoPago] [decimal](18, 0) NOT NULL,
	[NroComprobante] [int] NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[IdTipoComprobante] [int] NOT NULL,
	[CUIT] [int] NOT NULL,
	[FecBaja] [datetime] NULL,
	[IdTarjeta] [int] NULL,
 CONSTRAINT [PK_Pago] PRIMARY KEY CLUSTERED 
(
	[IdPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PagoEstadoPago]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagoEstadoPago](
	[IdEstadoPago] [int] NOT NULL,
	[IdPago] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_PagoEstadoPago] PRIMARY KEY CLUSTERED 
(
	[IdEstadoPago] ASC,
	[IdPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Patente]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Patente](
	[IdPatente] [int] IDENTITY(1,1) NOT NULL,
	[NombrePatente] [varchar](200) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Patente] PRIMARY KEY CLUSTERED 
(
	[IdPatente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatenteFamilia]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatenteFamilia](
	[IdPatente] [int] NOT NULL,
	[IdFamilia] [int] NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Patente_Familia] PRIMARY KEY CLUSTERED 
(
	[IdPatente] ASC,
	[IdFamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pedido](
	[IdPedido] [int] IDENTITY(1,1) NOT NULL,
	[FechaPedido] [datetime] NOT NULL,
	[FechaFinPedido] [datetime] NULL,
	[NombreUsuario] [varchar](100) NOT NULL,
	[PlazoEntrega] [int] NULL,
	[IdFormaEntrega] [int] NOT NULL,
	[CUIT] [int] NOT NULL,
	[NumeroTracking] [varchar](50) NULL,
	[DireccionEntrega] [int] NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_IdPedido] PRIMARY KEY CLUSTERED 
(
	[IdPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PedidoDetalle]    Script Date: 22/10/2016 4:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidoDetalle](
	[IdPedidoDetalle] [int] NOT NULL,
	[IdPedido] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnitario] [decimal](18, 0) NOT NULL,
	[Descuento] [int] NULL,
	[IdProducto] [int] NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_IdPedidoDetalle] PRIMARY KEY CLUSTERED 
(
	[IdPedido] ASC,
	[IdPedidoDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PedidoEstadoPedido]    Script Date: 22/10/2016 4:35:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidoEstadoPedido](
	[IdPedido] [int] NOT NULL,
	[IdEstadoPedido] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_PedidoEstadoPedido] PRIMARY KEY CLUSTERED 
(
	[IdPedido] ASC,
	[IdEstadoPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProdCategoria]    Script Date: 22/10/2016 4:35:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProdCategoria](
	[IdProducto] [int] NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_ProdCategoria] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC,
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producto]    Script Date: 22/10/2016 4:35:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[CodigoProducto] [varchar](50) NOT NULL,
	[PrecioUnitario] [decimal](18, 0) NOT NULL,
	[IdMarca] [int] NOT NULL,
	[CUIT] [int] NOT NULL,
	[IdIvaProducto] [int] NOT NULL,
	[DescripProducto] [varchar](300) NOT NULL,
	[URL] [varchar](500) NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 22/10/2016 4:35:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Provincia](
	[IdProvincia] [int] NOT NULL,
	[DescripcionProvincia] [varchar](200) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Provincia] PRIMARY KEY CLUSTERED 
(
	[IdProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 22/10/2016 4:35:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva](
	[IdReserva] [int] IDENTITY(1,1) NOT NULL,
	[IdPedido] [int] NOT NULL,
	[IdPedidoDetalle] [int] NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 
(
	[IdReserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockSucursal]    Script Date: 22/10/2016 4:35:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockSucursal](
	[IdProducto] [int] NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[CantidadProducto] [int] NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_StockSucursal] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC,
	[IdSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 22/10/2016 4:35:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sucursal](
	[IdSucursal] [int] IDENTITY(1,1) NOT NULL,
	[DescripSucursal] [varchar](200) NOT NULL,
	[DireccionSucursal] [int] NOT NULL,
	[CUIT] [int] NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Sucursal] PRIMARY KEY CLUSTERED 
(
	[IdSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tarjeta]    Script Date: 22/10/2016 4:35:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tarjeta](
	[IdTarjeta] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoTarjeta] [int] NOT NULL,
	[CUIT] [int] NOT NULL,
	[NombreUsuario] [varchar](100) NOT NULL,
	[Titular] [nvarchar](50) NOT NULL,
	[Vencimiento] [datetime] NOT NULL,
	[Numero] [bigint] NOT NULL,
	[CodSeguridad] [int] NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Tarjetas] PRIMARY KEY CLUSTERED 
(
	[IdTarjeta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Telefono]    Script Date: 22/10/2016 4:35:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Telefono](
	[CUIT] [int] NOT NULL,
	[NombreUsuario] [varchar](100) NOT NULL,
	[NroTelefono] [varchar](12) NOT NULL,
	[CodArea] [varchar](10) NOT NULL,
	[IdTipoTel] [int] NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Telefono] PRIMARY KEY CLUSTERED 
(
	[CUIT] ASC,
	[NombreUsuario] ASC,
	[NroTelefono] ASC,
	[CodArea] ASC,
	[IdTipoTel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoComprobante]    Script Date: 22/10/2016 4:35:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoComprobante](
	[IdTipoComprobante] [int] IDENTITY(1,1) NOT NULL,
	[DescripTipoComprobante] [varchar](200) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_TipoComprobante] PRIMARY KEY CLUSTERED 
(
	[IdTipoComprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoDireccion]    Script Date: 22/10/2016 4:35:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoDireccion](
	[IdTipoDireccion] [int] NOT NULL,
	[DescripcionDireccion] [varchar](200) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_TipoDireccion] PRIMARY KEY CLUSTERED 
(
	[IdTipoDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoTarjeta]    Script Date: 22/10/2016 4:35:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoTarjeta](
	[IdTipoTarjeta] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_TipoTarjetas] PRIMARY KEY CLUSTERED 
(
	[IdTipoTarjeta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoTel]    Script Date: 22/10/2016 4:35:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoTel](
	[IdTipoTel] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionTipoTel] [varchar](20) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_TipoTel] PRIMARY KEY CLUSTERED 
(
	[IdTipoTel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 22/10/2016 4:35:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[IdCondicionFiscal] [int] NULL,
	[IdUsuarioTipo] [int] NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[Apellido] [varchar](200) NOT NULL,
	[Dni] [varchar](10) NULL,
	[CUIT] [int] NOT NULL,
	[Email] [varchar](400) NOT NULL,
	[NombreUsuario] [varchar](100) NOT NULL,
	[Clave] [varchar](200) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[CUIT] ASC,
	[NombreUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsuarioFamilia]    Script Date: 22/10/2016 4:35:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsuarioFamilia](
	[CUIT] [int] NOT NULL,
	[NombreUsuario] [varchar](100) NOT NULL,
	[IdFamilia] [int] NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Usuario_Familia] PRIMARY KEY CLUSTERED 
(
	[CUIT] ASC,
	[NombreUsuario] ASC,
	[IdFamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsuarioPatente]    Script Date: 22/10/2016 4:35:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsuarioPatente](
	[CUIT] [int] NOT NULL,
	[NombreUsuario] [varchar](100) NOT NULL,
	[IdPatente] [int] NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Usuario_Patente] PRIMARY KEY CLUSTERED 
(
	[CUIT] ASC,
	[NombreUsuario] ASC,
	[IdPatente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsuarioTipo]    Script Date: 22/10/2016 4:35:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsuarioTipo](
	[IdUsuarioTipo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_UsuarioTipo] PRIMARY KEY CLUSTERED 
(
	[IdUsuarioTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[BitacoraLog]  WITH CHECK ADD  CONSTRAINT [FK_BitacoraLog_Usuario] FOREIGN KEY([CUIT], [NombreUsuario])
REFERENCES [dbo].[Usuario] ([CUIT], [NombreUsuario])
GO
ALTER TABLE [dbo].[BitacoraLog] CHECK CONSTRAINT [FK_BitacoraLog_Usuario]
GO
ALTER TABLE [dbo].[Categoria]  WITH CHECK ADD  CONSTRAINT [FK_Categoria_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[Categoria] CHECK CONSTRAINT [FK_Categoria_Categoria]
GO
ALTER TABLE [dbo].[Comprobante]  WITH CHECK ADD  CONSTRAINT [FK_Comprobante_Empresa] FOREIGN KEY([CUIT])
REFERENCES [dbo].[Empresa] ([CUIT])
GO
ALTER TABLE [dbo].[Comprobante] CHECK CONSTRAINT [FK_Comprobante_Empresa]
GO
ALTER TABLE [dbo].[Comprobante]  WITH CHECK ADD  CONSTRAINT [FK_Comprobante_Pedido] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedido] ([IdPedido])
GO
ALTER TABLE [dbo].[Comprobante] CHECK CONSTRAINT [FK_Comprobante_Pedido]
GO
ALTER TABLE [dbo].[Comprobante]  WITH CHECK ADD  CONSTRAINT [FK_Comprobante_Sucursal] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[Comprobante] CHECK CONSTRAINT [FK_Comprobante_Sucursal]
GO
ALTER TABLE [dbo].[Comprobante]  WITH CHECK ADD  CONSTRAINT [FK_Comprobante_TipoComprobante] FOREIGN KEY([IdTipoComprobante])
REFERENCES [dbo].[TipoComprobante] ([IdTipoComprobante])
GO
ALTER TABLE [dbo].[Comprobante] CHECK CONSTRAINT [FK_Comprobante_TipoComprobante]
GO
ALTER TABLE [dbo].[ComprobanteDetalle]  WITH CHECK ADD  CONSTRAINT [FK_ComprobanteDetalle_Comprobante] FOREIGN KEY([NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT])
REFERENCES [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT])
GO
ALTER TABLE [dbo].[ComprobanteDetalle] CHECK CONSTRAINT [FK_ComprobanteDetalle_Comprobante]
GO
ALTER TABLE [dbo].[ComprobanteDetalle]  WITH CHECK ADD  CONSTRAINT [FK_ComprobanteDetalle_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[ComprobanteDetalle] CHECK CONSTRAINT [FK_ComprobanteDetalle_Producto]
GO
ALTER TABLE [dbo].[Controlador]  WITH CHECK ADD  CONSTRAINT [FK_Controladores_Empresa] FOREIGN KEY([IdEmpresa])
REFERENCES [dbo].[Empresa] ([CUIT])
GO
ALTER TABLE [dbo].[Controlador] CHECK CONSTRAINT [FK_Controladores_Empresa]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_DireccionTipo] FOREIGN KEY([IdTipoDireccion])
REFERENCES [dbo].[TipoDireccion] ([IdTipoDireccion])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion_DireccionTipo]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_Provincia] FOREIGN KEY([IdProvincia])
REFERENCES [dbo].[Provincia] ([IdProvincia])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion_Provincia]
GO
ALTER TABLE [dbo].[DireccionUsuario]  WITH CHECK ADD  CONSTRAINT [FK_DireccionUsuario_Cliente] FOREIGN KEY([CUIT], [NombreUsuario])
REFERENCES [dbo].[Usuario] ([CUIT], [NombreUsuario])
GO
ALTER TABLE [dbo].[DireccionUsuario] CHECK CONSTRAINT [FK_DireccionUsuario_Cliente]
GO
ALTER TABLE [dbo].[DireccionUsuario]  WITH CHECK ADD  CONSTRAINT [FK_DireccionUsuario_Direccion] FOREIGN KEY([IdDireccion])
REFERENCES [dbo].[Direccion] ([IdDireccion])
GO
ALTER TABLE [dbo].[DireccionUsuario] CHECK CONSTRAINT [FK_DireccionUsuario_Direccion]
GO
ALTER TABLE [dbo].[LenguajeControl]  WITH CHECK ADD  CONSTRAINT [FK_LenguageControl_Lenguage] FOREIGN KEY([IdLenguaje])
REFERENCES [dbo].[Lenguaje] ([IdLenguaje])
GO
ALTER TABLE [dbo].[LenguajeControl] CHECK CONSTRAINT [FK_LenguageControl_Lenguage]
GO
ALTER TABLE [dbo].[ListaDeseos]  WITH CHECK ADD  CONSTRAINT [FK_ListaDeseos_Usuario] FOREIGN KEY([CUIT], [NombreUsuario])
REFERENCES [dbo].[Usuario] ([CUIT], [NombreUsuario])
GO
ALTER TABLE [dbo].[ListaDeseos] CHECK CONSTRAINT [FK_ListaDeseos_Usuario]
GO
ALTER TABLE [dbo].[ListaDeseosDetalle]  WITH CHECK ADD  CONSTRAINT [FK_ListaDeseosDetalle_ListaDeseos] FOREIGN KEY([IdListaDeseos])
REFERENCES [dbo].[ListaDeseos] ([IdListaDeseos])
GO
ALTER TABLE [dbo].[ListaDeseosDetalle] CHECK CONSTRAINT [FK_ListaDeseosDetalle_ListaDeseos]
GO
ALTER TABLE [dbo].[ListaDeseosDetalle]  WITH CHECK ADD  CONSTRAINT [FK_ListaDeseosDetalle_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[ListaDeseosDetalle] CHECK CONSTRAINT [FK_ListaDeseosDetalle_Producto]
GO
ALTER TABLE [dbo].[MonedaEmpresa]  WITH CHECK ADD  CONSTRAINT [FK_MonedaEmpresa_Empresa] FOREIGN KEY([CUIT])
REFERENCES [dbo].[Empresa] ([CUIT])
GO
ALTER TABLE [dbo].[MonedaEmpresa] CHECK CONSTRAINT [FK_MonedaEmpresa_Empresa]
GO
ALTER TABLE [dbo].[MonedaEmpresa]  WITH CHECK ADD  CONSTRAINT [FK_MonedaEmpresa_Moneda] FOREIGN KEY([IdMoneda])
REFERENCES [dbo].[Moneda] ([IdMoneda])
GO
ALTER TABLE [dbo].[MonedaEmpresa] CHECK CONSTRAINT [FK_MonedaEmpresa_Moneda]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_Comprobante] FOREIGN KEY([NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT])
REFERENCES [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_Comprobante]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_Empresa] FOREIGN KEY([CUIT])
REFERENCES [dbo].[Empresa] ([CUIT])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_Empresa]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_FormaPago] FOREIGN KEY([IdFormaPago])
REFERENCES [dbo].[FormaPago] ([IdFormaPago])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_FormaPago]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_Pedido] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedido] ([IdPedido])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_Pedido]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_PagoTarjeta] FOREIGN KEY([IdTarjeta])
REFERENCES [dbo].[Tarjeta] ([IdTarjeta])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_PagoTarjeta]
GO
ALTER TABLE [dbo].[PagoEstadoPago]  WITH CHECK ADD  CONSTRAINT [FK_PagoEstadoPago_EstadoPago] FOREIGN KEY([IdEstadoPago])
REFERENCES [dbo].[EstadoPago] ([IdEstadoPago])
GO
ALTER TABLE [dbo].[PagoEstadoPago] CHECK CONSTRAINT [FK_PagoEstadoPago_EstadoPago]
GO
ALTER TABLE [dbo].[PagoEstadoPago]  WITH CHECK ADD  CONSTRAINT [FK_PagoEstadoPago_Pago] FOREIGN KEY([IdPago])
REFERENCES [dbo].[Pago] ([IdPago])
GO
ALTER TABLE [dbo].[PagoEstadoPago] CHECK CONSTRAINT [FK_PagoEstadoPago_Pago]
GO
ALTER TABLE [dbo].[PatenteFamilia]  WITH CHECK ADD  CONSTRAINT [FK_PatenteFamilia_Familia] FOREIGN KEY([IdFamilia])
REFERENCES [dbo].[Familia] ([IdFamilia])
GO
ALTER TABLE [dbo].[PatenteFamilia] CHECK CONSTRAINT [FK_PatenteFamilia_Familia]
GO
ALTER TABLE [dbo].[PatenteFamilia]  WITH CHECK ADD  CONSTRAINT [FK_PatenteFamilia_Patente] FOREIGN KEY([IdPatente])
REFERENCES [dbo].[Patente] ([IdPatente])
GO
ALTER TABLE [dbo].[PatenteFamilia] CHECK CONSTRAINT [FK_PatenteFamilia_Patente]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Direccion] FOREIGN KEY([DireccionEntrega])
REFERENCES [dbo].[Direccion] ([IdDireccion])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Direccion]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Empresa] FOREIGN KEY([CUIT])
REFERENCES [dbo].[Empresa] ([CUIT])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Empresa]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_FormaEntrega] FOREIGN KEY([IdFormaEntrega])
REFERENCES [dbo].[FormaEntrega] ([IdFormaEntrega])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_FormaEntrega]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Usuario] FOREIGN KEY([CUIT], [NombreUsuario])
REFERENCES [dbo].[Usuario] ([CUIT], [NombreUsuario])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Usuario]
GO
ALTER TABLE [dbo].[PedidoDetalle]  WITH CHECK ADD  CONSTRAINT [FK_PedidoDetalle_Pedido] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedido] ([IdPedido])
GO
ALTER TABLE [dbo].[PedidoDetalle] CHECK CONSTRAINT [FK_PedidoDetalle_Pedido]
GO
ALTER TABLE [dbo].[PedidoDetalle]  WITH CHECK ADD  CONSTRAINT [FK_PedidoDetalle_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[PedidoDetalle] CHECK CONSTRAINT [FK_PedidoDetalle_Producto]
GO
ALTER TABLE [dbo].[PedidoEstadoPedido]  WITH CHECK ADD  CONSTRAINT [FK_PedidoEstadoPedidoEstPed] FOREIGN KEY([IdEstadoPedido])
REFERENCES [dbo].[EstadoPedido] ([IdEstadoPedido])
GO
ALTER TABLE [dbo].[PedidoEstadoPedido] CHECK CONSTRAINT [FK_PedidoEstadoPedidoEstPed]
GO
ALTER TABLE [dbo].[PedidoEstadoPedido]  WITH CHECK ADD  CONSTRAINT [FK_PedidoEstadoPedidoPed] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedido] ([IdPedido])
GO
ALTER TABLE [dbo].[PedidoEstadoPedido] CHECK CONSTRAINT [FK_PedidoEstadoPedidoPed]
GO
ALTER TABLE [dbo].[ProdCategoria]  WITH CHECK ADD  CONSTRAINT [FK_ProductoCateg_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[ProdCategoria] CHECK CONSTRAINT [FK_ProductoCateg_Categoria]
GO
ALTER TABLE [dbo].[ProdCategoria]  WITH CHECK ADD  CONSTRAINT [FK_ProductoCateg_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[ProdCategoria] CHECK CONSTRAINT [FK_ProductoCateg_Producto]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Empresa] FOREIGN KEY([CUIT])
REFERENCES [dbo].[Empresa] ([CUIT])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Empresa]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_IvaProducto] FOREIGN KEY([IdIvaProducto])
REFERENCES [dbo].[IvaProducto] ([IdIvaProducto])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_IvaProducto]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Marca] FOREIGN KEY([IdMarca])
REFERENCES [dbo].[Marca] ([IdMarca])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Marca]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Producto]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_PedidoDetalle] FOREIGN KEY([IdPedido], [IdPedidoDetalle])
REFERENCES [dbo].[PedidoDetalle] ([IdPedido], [IdPedidoDetalle])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_PedidoDetalle]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Sucursal] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Sucursal]
GO
ALTER TABLE [dbo].[StockSucursal]  WITH CHECK ADD  CONSTRAINT [FK_StockSucursal_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[StockSucursal] CHECK CONSTRAINT [FK_StockSucursal_Producto]
GO
ALTER TABLE [dbo].[StockSucursal]  WITH CHECK ADD  CONSTRAINT [FK_StockSucursal_Sucursal] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[StockSucursal] CHECK CONSTRAINT [FK_StockSucursal_Sucursal]
GO
ALTER TABLE [dbo].[Sucursal]  WITH CHECK ADD  CONSTRAINT [FK_Sucursal_Direccion] FOREIGN KEY([DireccionSucursal])
REFERENCES [dbo].[Direccion] ([IdDireccion])
GO
ALTER TABLE [dbo].[Sucursal] CHECK CONSTRAINT [FK_Sucursal_Direccion]
GO
ALTER TABLE [dbo].[Sucursal]  WITH CHECK ADD  CONSTRAINT [FK_Sucursal_Empresa] FOREIGN KEY([CUIT])
REFERENCES [dbo].[Empresa] ([CUIT])
GO
ALTER TABLE [dbo].[Sucursal] CHECK CONSTRAINT [FK_Sucursal_Empresa]
GO
ALTER TABLE [dbo].[Tarjeta]  WITH CHECK ADD  CONSTRAINT [FK_Tarjeta_Usuario] FOREIGN KEY([CUIT], [NombreUsuario])
REFERENCES [dbo].[Usuario] ([CUIT], [NombreUsuario])
GO
ALTER TABLE [dbo].[Tarjeta] CHECK CONSTRAINT [FK_Tarjeta_Usuario]
GO
ALTER TABLE [dbo].[Tarjeta]  WITH CHECK ADD  CONSTRAINT [FK_Tarjetas_TipoTarjetas] FOREIGN KEY([IdTipoTarjeta])
REFERENCES [dbo].[TipoTarjeta] ([IdTipoTarjeta])
GO
ALTER TABLE [dbo].[Tarjeta] CHECK CONSTRAINT [FK_Tarjetas_TipoTarjetas]
GO
ALTER TABLE [dbo].[Telefono]  WITH CHECK ADD  CONSTRAINT [FK_Telefono_TipoTel] FOREIGN KEY([IdTipoTel])
REFERENCES [dbo].[TipoTel] ([IdTipoTel])
GO
ALTER TABLE [dbo].[Telefono] CHECK CONSTRAINT [FK_Telefono_TipoTel]
GO
ALTER TABLE [dbo].[Telefono]  WITH CHECK ADD  CONSTRAINT [FK_Telefono_Usuario] FOREIGN KEY([CUIT], [NombreUsuario])
REFERENCES [dbo].[Usuario] ([CUIT], [NombreUsuario])
GO
ALTER TABLE [dbo].[Telefono] CHECK CONSTRAINT [FK_Telefono_Usuario]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_CondFiscal] FOREIGN KEY([IdCondicionFiscal])
REFERENCES [dbo].[CondicionFiscal] ([IdCondicionFiscal])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_CondFiscal]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Empresa] FOREIGN KEY([CUIT])
REFERENCES [dbo].[Empresa] ([CUIT])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Empresa]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_UsuarioTipo] FOREIGN KEY([IdUsuarioTipo])
REFERENCES [dbo].[UsuarioTipo] ([IdUsuarioTipo])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_UsuarioTipo]
GO
ALTER TABLE [dbo].[UsuarioFamilia]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioFamilia_Familia] FOREIGN KEY([IdFamilia])
REFERENCES [dbo].[Familia] ([IdFamilia])
GO
ALTER TABLE [dbo].[UsuarioFamilia] CHECK CONSTRAINT [FK_UsuarioFamilia_Familia]
GO
ALTER TABLE [dbo].[UsuarioFamilia]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioFamilia_Usuario] FOREIGN KEY([CUIT], [NombreUsuario])
REFERENCES [dbo].[Usuario] ([CUIT], [NombreUsuario])
GO
ALTER TABLE [dbo].[UsuarioFamilia] CHECK CONSTRAINT [FK_UsuarioFamilia_Usuario]
GO
ALTER TABLE [dbo].[UsuarioPatente]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioPatente_Patente] FOREIGN KEY([IdPatente])
REFERENCES [dbo].[Patente] ([IdPatente])
GO
ALTER TABLE [dbo].[UsuarioPatente] CHECK CONSTRAINT [FK_UsuarioPatente_Patente]
GO
ALTER TABLE [dbo].[UsuarioPatente]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioPatente_Usuario] FOREIGN KEY([CUIT], [NombreUsuario])
REFERENCES [dbo].[Usuario] ([CUIT], [NombreUsuario])
GO
ALTER TABLE [dbo].[UsuarioPatente] CHECK CONSTRAINT [FK_UsuarioPatente_Usuario]
GO
USE [master]
GO
ALTER DATABASE [ECommerce] SET  READ_WRITE 
GO
