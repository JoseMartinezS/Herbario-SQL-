--Sql
USE master;
GO
IF DB_ID (N'Herbarioo') IS NOT NULL
	Drop DATABASE Herbarioo;
	GO
CREATE DATABASE Herbarioo

ON   
( NAME = Herbarioo_dat,  
    FILENAME = 'D:\BD\Herbarioo.mdf',  
    SIZE = 10,  
    MAXSIZE = 50,  
    FILEGROWTH = 5 )  
LOG ON  
( NAME = Sales_log,  
    FILENAME = 'D:\BD\Herbarioo.ldf',  
    SIZE = 5MB,  
    MAXSIZE = 25MB,  
    FILEGROWTH = 5MB );  
GO
USE Herbarioo;
GO

CREATE TABLE Agenda
(
	idAgenda int identity(1,1),
	nombre varchar(50) not null,
	fecha datetime not null,
	idDoctor int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Apartado
(
	idApartado int identity(1,1),
	nombre varchar(50) not null,
	cantidad int not null,
	abono int not null,
	fecha datetime not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Bodega
(
	idBodega int identity(1,1),
	nombre varchar(50) not null,
	calle varchar(50) not null,
	numero int not null,
	ciudad varchar(50),
	idSucursal int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Caja
(
	idCaja int identity(1,1),
	numer int not null,
	persona varchar(50) not null,
	computadora varchar(50) not null,
	idSucursal int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Capacitacion
(
	idCapacitacion int identity(1,1),
	nombre varchar(50) not null,
	tipo varchar(50)not null,
	numero int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Cita
(
	idCita int identity(1,1),
	fecha datetime not null,
	asunto varchar(50) not null,
	nombre varchar(50) not null,
	edad int not null,
	idAgenda int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Cliente
(
	idCliente int identity(1,1),
	nombre varchar(50) not null,
	apellidoPaterno varchar(50) not null,
	apellidoMaterno varchar(50) not null,
	curp varchar(50) not null,
	calle varchar(50) not null,
	numero int not  null,
	estado varchar(50) not null,
	telefono int not null,
	idCredito int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Compra
(
	idCompra int identity(1,1),
	cantidad int not null,
	fecha datetime not null,
	idComprobante int not null,
	idCotizacion int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Consulta
(
	idConsulta int identity(1,1),
	nombre varchar(50) not null,
	precio int not null,
	fecha datetime not null,
	idPaciente int not null,
	idDoctor int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Comprobante
(
	idComprobante int identity(1,1),
	cantidad int not null,
	productos varchar(50) not null,
	fecha datetime not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Contador
(
	idContador int identity(1,1),
	nombre varchar(50) not null,
	apellidop varchar(50) not null,
	apellidom varchar(50) not null,
	calle varchar(50) not null,
	numero int not null,
	ciudad varchar(50) not null,
	telefono int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Contrato
(
	idContrato int identity(1,1),
	nombre varchar(50) not null,
	servicio varchar(50) not null,
	fecha datetime not null,
	idEmpleado int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Convenio
(
	idConvenio int identity(1,1),
	cantidad int not null,
	fecha datetime not null,
	idCliente int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Cotizacion
(
	idCotizacion int identity(1,1),
	cantidad int not null,
	fecha datetime not null,
	idCliente int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Credito
(
	idCredito int identity(1,1),
	creditoDisponible varchar(50) not null,
	creditoDebe varchar(50) not null,
	fecha datetime not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Delivery
(
	idDelivery int identity(1,1),
	cantidad varchar(30) not null,
	producto varchar(50) not null,
	direccion varchar(50) not null,
	horasalida datetime not null,
	horallegada datetime not null,
	idSucursal int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Departamento
(
	idDepartamento int identity(1,1),
	nombre varchar(50) not null,
	numero int not null,
	cantidad varchar(30) not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Devolucion
(
	idDevolucion int identity(1,1),
	producto varchar(50) not null,
	cantidad int not null,
	cantidadmonetaria varchar(50) not null,
	fecha datetime not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Doctor
(
	idDoctor int identity(1,1),
	nombre varchar(50) not null,
	apellidop varchar(50) not null,
	apellidom varchar(50) not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Empleado
(
	idEmpleado int identity(1,1),
	puesto varchar(50) not null,
	sueldo varchar(30) not null,
	nombre varchar(50) not null,
	apellidop varchar(50) not null,
	apellidom varchar(50) not null,
	calle varchar(50) not null,
	numero int not null,
	ciudad varchar(50) not null,
	telefono int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Empresa
(
	idEmpresa int identity(1,1),
	nombre varchar(50) not null,
	telefono int not null,
	calle varchar(50) not null,
	estado varchar(50) not null,
	numero int not null,
	colonia varchar(50) not null,
	ciudad varchar(50) not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Envio
(
	idEnvio int identity(1,1),
	fechaSalida datetime not null,
	fechaLlegada datetime not null,
	productos varchar(50) not null,
	cantidad int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Estacionamiento
(
	idEstacionamiento int identity(1,1),
	numero int not null,
	numerodiscapacitados int not null,
	idSucursal int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE FacturaCliente
(
	idFacturaCliente int identity(1,1),
	fecha datetime not null,
	remitente varchar(50) not null,
	cantidad int not null,
	idContador int not null,
	idCliente int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE FacturaProveedor
(
	idFacturaProveedor int identity(1,1),
	fecha datetime not null,
	remitente varchar(50) not null,
	cantidad char(20) not null,
	idContador int not null,
	idProveedor int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE HorarioTrabajo
(
	idHorarioTrabajo int identity(1,1),
	entrada datetime not null,
	salida datetime not null,
	horasextras varchar(50) not null,
	idEmpleado int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Instrumento
(
	idInstrumento int identity(1,1),
	nombre varchar(50) not null,
	tamaño varchar(50) not null,
	marca varchar(50) not null,
	idDoctor int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Mantenimiento
(
	idMantenimiento int identity(1,1),
	costo varchar(50) not null,
	persona varchar(50) not null,
	fecha datetime not null,
	idSucursal int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Marca
(
	idMarca int identity(1,1),
	nombre varchar(50) not null,
	modelo varchar(50) not null,
	estatus bit default 1 not null
);
GO


CREATE TABLE Marketing
(
	idMarketing int identity(1,1),
	tipo varchar(50) not null,
	lugar varchar(50) not null,
	idSucursal int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE MateriaPrima
(
	idMateriaPrima int identity(1,1),
	material varchar(50) not null,
	nombre varchar(50) not null,
	cantidad int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Medicamento
(
	idMedicamento int identity(1,1),
	nombre varchar(50) not null,
	existencia int not null,
	salida int not null,
	idDoctor int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE MetodoPago
(
	idMetodoPago int identity(1,1),
	tipo varchar(50) not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Mobiliario
(
	idMobiliario int identity(1,1),
	nombre varchar(50) not null,
	cantidad int not null,
	material varchar(50) not null,
	idSucursal int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Nomina
(
	idNomina int identity(1,1),
	numero int not null,
	persona varchar(50) not null,
	fecha datetime not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Oferta
(
	idOferta int identity(1,1),
	producto varchar(50) not null,
	precio varchar(50) not null,
	precioAnterior varchar(50) not null,
	fecha datetime not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Paciente
(
	idPaciente int identity(1,1),
	nombre varchar(50) not null,
	apellidoPaterno varchar(50) not null,
	apellidoMaterno varchar(50) not null,
	fechaNacimiento datetime not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE PagoServicio
(
	idPagoServicio int identity(1,1),
	catidad int not null,
	servicio varchar(50) not null,
	fecha datetime not null,
	idSucursal int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Paquete
(
	idPaquete int identity(1,1),
	numero int not null,
	peso varchar(50) not null,
	remitente varchar(50) not null,
	destinatario varchar(50) not null,
	idEnvio int not null,
	idPedido int not null,
	idTransporte int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Pedido
(
	idPedido int identity(1,1),
	productos varchar(50) not null,
	cantidad int not null,
	costo varchar(50) not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Prestacion
(
	idPrestacion int identity(1,1),
	clasificacion varchar(50) not null,
	descripcion varchar(50) not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Produccion
(
	idProduccion int identity(1,1),
	cantidadFinal int not null,
	ingresos varchar(50) not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Producto
(
	idProducto int identity(1,1),
	nombre varchar(50) not null,
	precio int not null,
	cantidad int not null,
	idPedido int not null,
	idMateriaPrima int not null,
	idApartado int not null,
	idEnvio int not null,
	idDevolucion int not null,
	idCompra int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Proveedor
(
	idProveedor int identity(1,1),
	nombre varchar(50) not null,
	apellidoPaterno varchar(50) not null,
	apellidMaterno varchar(50) not null,
	calle varchar(50) not null,
	numero int not null,
	ciudad varchar(50) not null,
	telefono int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Puesto
(
	idPuesto int identity(1,1),
	puesto varchar(50) not null,
	numero int not null,
	idEmpleado int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Receta
(
	idReceta int identity(1,1),
	descripcion varchar(50) not null,
	medicamento varchar(50) not null,
	cantidad int not null,
	idDoctor int not null,
	idPaciente int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Representante
(
	idRepresentante int identity(1,1),
	nombre varchar(50) not null,
	apellidoPaterno varchar(50) not null,
	apellidoMaterno varchar(50) not null,
	calle varchar(50) not null,
	numero int not null,
	ciudad varchar(50) not null,
	telefono int not null,
	idEmpresa int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Transporte
(
	idTransporte int identity(1,1),
	marca varchar(50) not null,
	matricula varchar(50) not null,
	modelo varchar(50) not null,
	cilindros varchar(30) not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Sucursal
(
	idSucursal int identity(1,1),
	nombre varchar(50) not null,
	calle varchar(50) not null,
	estado varchar(50) not null,
	colonia varchar(50) not null,
	ciudad varchar(50) not null,
	telefoo int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Venta
(
	idVenta int identity(1,1),
	fecha datetime not null,
	cantidad varchar(30) not null,
	estatus bit default 1 not null
);

CREATE TABLE ApartadoProducto
(
	idApartadoProducto int identity(1,1),
	idApartado int not null,
	idProducto int not null,
	cantidad varchar(50) not null,
	estatus bit default 1 not null,
);
GO

CREATE TABLE ClienteMetodoPago
(
	idClienteMetodoPago int identity(1,1),
	idCliente int not null,
	idMetodoPago int not null,
	estatus bit default 1 not null,
);
GO

CREATE TABLE CompraCliente
(
	idCompraCliente int identity(1,1),
	idCompra int not null,
	idCliente int not null,
	estatus bit default 1 not null,
);
GO

CREATE TABLE EmpleadoCapacitacion
(
	idEmpleadoCapacitacion int identity(1,1),
	idEmpleado int not null,
	idCapacitacion int not null,
	estatus bit default 1 not null,
);
GO

CREATE TABLE MarcaProducto
(
	idMarcaProducto int identity(1,1),
	idMarca int not null,
	idProducto int not null,
	estatus bit default 1 not null,
);
GO

CREATE TABLE ProductoOferta
(
	idProductoOferta int identity(1,1),
	idProducto int not null,
	idOferta int not null,
	estatus bit default 1 not null,
);
GO

CREATE TABLE ProductoVenta
(
	idProductoVenta int identity(1,1),
	idProducto int not null,
	idVenta int not null,
	estatus bit default 1 not null,
);
GO

CREATE TABLE SucursalEmpleado
(
	idSucursalEmpleado int identity(1,1),
	idSucursal int not null,
	idEmpleado int not null,
	estatus bit default 1 not null,
);
GO




--Llaves primarias
ALTER TABLE Agenda ADD CONSTRAINT PK_Agenda PRIMARY KEY (idAgenda)
ALTER TABLE Apartado ADD CONSTRAINT PK_Apartado PRIMARY KEY (idApartado)
ALTER TABLE Bodega ADD CONSTRAINT PK_Bodega PRIMARY KEY (idBodega)
ALTER TABLE Caja ADD CONSTRAINT PK_Caja PRIMARY KEY (idCaja)
ALTER TABLE Capacitacion ADD CONSTRAINT PK_Capacitacion PRIMARY KEY (idCapacitacion)
ALTER TABLE Cita ADD CONSTRAINT PK_Cita PRIMARY KEY (idCita)
ALTER TABLE Cliente ADD CONSTRAINT PK_Cliente PRIMARY KEY (idCliente)
ALTER TABLE Compra ADD CONSTRAINT PK_Compra PRIMARY KEY (idCompra)
ALTER TABLE Comprobante ADD CONSTRAINT PK_Comprobante PRIMARY KEY (idComprobante)
ALTER TABLE Consulta ADD CONSTRAINT PK_Consulta PRIMARY KEY (idConsulta)
ALTER TABLE Contador ADD CONSTRAINT PK_Contador PRIMARY KEY (idContador)
ALTER TABLE Contrato ADD CONSTRAINT PK_Contrato PRIMARY KEY (idContrato)
ALTER TABLE Convenio ADD CONSTRAINT PK_Convenio PRIMARY KEY (idConvenio)
ALTER TABLE Cotizacion ADD CONSTRAINT PK_Cotizacion PRIMARY KEY (idCotizacion)
ALTER TABLE Credito ADD CONSTRAINT PK_Credito PRIMARY KEY (idCredito)
ALTER TABLE Delivery ADD CONSTRAINT PK_Delivery PRIMARY KEY (idDelivery)
ALTER TABLE Departamento ADD CONSTRAINT PK_Departamento PRIMARY KEY (idDepartamento)
ALTER TABLE Devolucion ADD CONSTRAINT PK_Devolucion PRIMARY KEY (idDevolucion)
ALTER TABLE Doctor ADD CONSTRAINT PK_Doctor PRIMARY KEY (idDoctor)
ALTER TABLE Empleado ADD CONSTRAINT PK_Empleado PRIMARY KEY (idEmpleado)
ALTER TABLE Empresa ADD CONSTRAINT PK_Empresa PRIMARY KEY (idEmpresa)
ALTER TABLE Envio ADD CONSTRAINT PK_Envio PRIMARY KEY (idEnvio)
ALTER TABLE Estacionamiento ADD CONSTRAINT PK_Estacionamiento PRIMARY KEY (idEstacionamiento)
ALTER TABLE FacturaCliente ADD CONSTRAINT PK_FacturaCliente PRIMARY KEY (idFacturaCliente)
ALTER TABLE FacturaProveedor ADD CONSTRAINT PK_FacturaProveedor PRIMARY KEY (idFacturaProveedor)
ALTER TABLE HorarioTrabajo ADD CONSTRAINT PK_HorarioTrabajo PRIMARY KEY (idHorarioTrabajo)
ALTER TABLE Instrumento ADD CONSTRAINT PK_Instrumento PRIMARY KEY (idInstrumento)
ALTER TABLE Mantenimiento ADD CONSTRAINT PK_Mantenimiento PRIMARY KEY (idMantenimiento)
ALTER TABLE Marca ADD CONSTRAINT PK_Marca PRIMARY KEY (idMarca)
ALTER TABLE Marketing ADD CONSTRAINT PK_Marketing PRIMARY KEY (idMarketing)
ALTER TABLE MateriaPrima ADD CONSTRAINT PK_MateriaPrima PRIMARY KEY (idMateriaPrima)
ALTER TABLE Medicamento ADD CONSTRAINT PK_Medicamento PRIMARY KEY (idMedicamento)
ALTER TABLE MetodoPago ADD CONSTRAINT PK_MetodoPago PRIMARY KEY (idMetodoPago)
ALTER TABLE Mobiliario ADD CONSTRAINT PK_Mobiliario PRIMARY KEY (idMobiliario)
ALTER TABLE Nomina ADD CONSTRAINT PK_Nomina PRIMARY KEY (idNomina)
ALTER TABLE Oferta ADD CONSTRAINT PK_Oferta PRIMARY KEY (idOferta)
ALTER TABLE Paciente ADD CONSTRAINT PK_Paciente PRIMARY KEY (idPaciente)
ALTER TABLE PagoServicio ADD CONSTRAINT PK_PagoServicio PRIMARY KEY (idPagoServicio)
ALTER TABLE Paquete ADD CONSTRAINT PK_Paquete PRIMARY KEY (idPaquete)
ALTER TABLE Pedido ADD CONSTRAINT PK_Pedido PRIMARY KEY (idPedido)
ALTER TABLE Prestacion ADD CONSTRAINT PK_Prestacion PRIMARY KEY (idPrestacion)
ALTER TABLE Produccion ADD CONSTRAINT PK_Produccion PRIMARY KEY (idProduccion)
ALTER TABLE Producto ADD CONSTRAINT PK_Producto PRIMARY KEY (idProducto)
ALTER TABLE Proveedor ADD CONSTRAINT PK_Proveedor PRIMARY KEY (idProveedor)
ALTER TABLE Puesto ADD CONSTRAINT PK_Puesto PRIMARY KEY (idPuesto)
ALTER TABLE Receta ADD CONSTRAINT PK_Receta PRIMARY KEY (idReceta)
ALTER TABLE Representante ADD CONSTRAINT PK_Representante PRIMARY KEY (idRepresentante)
ALTER TABLE Sucursal ADD CONSTRAINT PK_Sucursal PRIMARY KEY (idSucursal)
ALTER TABLE Transporte ADD CONSTRAINT PK_Transporte PRIMARY KEY (idTransporte)
ALTER TABLE Venta ADD CONSTRAINT PK_Venta PRIMARY KEY (idVenta)


--Foraneas
--Agenda
ALTER TABLE Agenda ADD CONSTRAINT FK_AgendaDoctor FOREIGN KEY (idDoctor) REFERENCES 
Doctor(idDoctor)
--Bodega
ALTER TABLE Bodega ADD CONSTRAINT FK_BodegaSucursal FOREIGN KEY (idSucursal) REFERENCES 
Sucursal(idSucursal)
--Caja
ALTER TABLE Caja ADD CONSTRAINT FK_CajaSucursal FOREIGN KEY (idSucursal) REFERENCES 
Sucursal(idSucursal)
--Cita
ALTER TABLE Cita ADD CONSTRAINT FK_CitaAgenda FOREIGN KEY (idAgenda) REFERENCES 
Agenda(idAgenda)
--Cliente
ALTER TABLE Cliente ADD CONSTRAINT FK_ClienteCredito FOREIGN KEY (idCredito) REFERENCES 
Credito(idCredito)
--Compra
ALTER TABLE Compra ADD CONSTRAINT FK_CompraComprobante FOREIGN KEY (idComprobante) REFERENCES 
Comprobante(idComprobante)
ALTER TABLE Compra ADD CONSTRAINT FK_CompraCotizacion FOREIGN KEY (idCotizacion) REFERENCES 
Cotizacion(idCotizacion)
--Consulta
ALTER TABLE Consulta ADD CONSTRAINT FK_ConsultaPaciente FOREIGN KEY (idPaciente) REFERENCES 
Paciente(idPaciente)
ALTER TABLE Consulta ADD CONSTRAINT FK_ConsultaDoctor FOREIGN KEY (idDoctor) REFERENCES 
Doctor(idDoctor)
--Convenio
ALTER TABLE Convenio ADD CONSTRAINT FK_ConvenioCliente FOREIGN KEY (idCliente) REFERENCES 
Cliente(idCliente)
--Cotizacion
ALTER TABLE Cotizacion ADD CONSTRAINT FK_CotizacionCliente FOREIGN KEY (idCliente) REFERENCES 
Cliente(idCliente)
--Delivery
ALTER TABLE Delivery ADD CONSTRAINT FK_DeliverySucursal FOREIGN KEY (idSucursal) REFERENCES 
Sucursal(idSucursal)
--Estacionamiento
ALTER TABLE Estacionamiento ADD CONSTRAINT FK_EstacionamientoSucursal FOREIGN KEY (idSucursal) REFERENCES 
Sucursal(idSucursal)
--FacturaCliente
ALTER TABLE FacturaCliente ADD CONSTRAINT FK_FacturaClienteContador FOREIGN KEY (idContador) REFERENCES 
Contador(idContador)
ALTER TABLE FacturaCliente ADD CONSTRAINT FK_FacturaClienteCliente FOREIGN KEY (idCliente) REFERENCES 
Cliente(idCliente)
--FacturaProveedor
ALTER TABLE FacturaProveedor ADD CONSTRAINT FK_FacturaProveedorContador FOREIGN KEY (idContador) REFERENCES 
Contador(idContador)
ALTER TABLE FacturaProveedor ADD CONSTRAINT FK_FacturaProveedorProveedor FOREIGN KEY (idProveedor) REFERENCES 
Proveedor(idProveedor)
--HorarioTrabajo
ALTER TABLE HorarioTrabajo ADD CONSTRAINT FK_HorarioTrabajo FOREIGN KEY (idEmpleado) REFERENCES 
Empleado(idEmpleado)
--Instrumentos
ALTER TABLE Instrumento ADD CONSTRAINT FK_InstrumentoDoctor FOREIGN KEY (idDoctor) REFERENCES 
Doctor(idDoctor)
--Mantenimiento
ALTER TABLE Mantenimiento ADD CONSTRAINT FK_MantenimientoSucursal FOREIGN KEY (idSucursal) REFERENCES 
Sucursal(idSucursal)
--Marketing
ALTER TABLE Marketing ADD CONSTRAINT FK_MarketingSucursal FOREIGN KEY (idSucursal) REFERENCES 
Sucursal(idSucursal)
--Medicamento
ALTER TABLE Medicamento ADD CONSTRAINT FK_MedicamentoDoctor FOREIGN KEY (idDoctor) REFERENCES 
Doctor(idDoctor)
--Moviliario
ALTER TABLE Mobiliario ADD CONSTRAINT FK_MobiliarioSucursal FOREIGN KEY (idSucursal) REFERENCES 
Sucursal(idSucursal)
--PagoServicio
ALTER TABLE PagoServicio ADD CONSTRAINT FK_PagoServicio FOREIGN KEY (idSucursal) REFERENCES 
Sucursal(idSucursal)
--Paquete
ALTER TABLE Paquete ADD CONSTRAINT FK_PaqueteEnvio FOREIGN KEY (idEnvio) REFERENCES 
Envio(idEnvio)
ALTER TABLE Paquete ADD CONSTRAINT FK_PaquetePedido FOREIGN KEY (idPedido) REFERENCES 
Pedido(idPedido)
ALTER TABLE Paquete ADD CONSTRAINT FK_PaqueteTransporte FOREIGN KEY (idTransporte) REFERENCES 
Transporte(idTransporte)
--Producto
ALTER TABLE Producto ADD CONSTRAINT FK_ProductoPedido FOREIGN KEY (idPedido) REFERENCES 
Pedido(idPedido)
ALTER TABLE Producto ADD CONSTRAINT FK_ProductoMateriaPrima FOREIGN KEY (idMateriaPrima) REFERENCES 
MateriaPrima(idMateriaPrima)
ALTER TABLE Producto ADD CONSTRAINT FK_ProductoApartado FOREIGN KEY (idApartado) REFERENCES 
Apartado(idApartado)
ALTER TABLE Producto ADD CONSTRAINT FK_ProductoEnvio FOREIGN KEY (idEnvio) REFERENCES 
Envio(idEnvio)
ALTER TABLE Producto ADD CONSTRAINT FK_ProductoDevolucion FOREIGN KEY (idDevolucion) REFERENCES 
Devolucion(idDevolucion)
ALTER TABLE Producto ADD CONSTRAINT FK_ProductoCompra FOREIGN KEY (idCompra) REFERENCES 
Compra(idCompra)
--Puesto
ALTER TABLE Puesto ADD CONSTRAINT FK_PuestoEmpleado FOREIGN KEY (idEmpleado) REFERENCES 
Empleado(idEmpleado)
--Receta
ALTER TABLE Receta ADD CONSTRAINT FK_RecetaDoctor FOREIGN KEY (idDoctor) REFERENCES 
Doctor(idDoctor)
ALTER TABLE Receta ADD CONSTRAINT FK_RecetaPaciente FOREIGN KEY (idPaciente) REFERENCES 
Paciente(idPaciente)
--Representante
ALTER TABLE Representante ADD CONSTRAINT FK_RepresentanteEmpresa FOREIGN KEY (idEmpresa) REFERENCES 
Empresa(idEmpresa)
--ApartadoProducto
ALTER TABLE ApartadoProducto ADD CONSTRAINT FK_ApartadoProductoApartado FOREIGN KEY (idApartado) REFERENCES 
Apartado(idApartado)
ALTER TABLE ApartadoProducto ADD CONSTRAINT FK_ApartadoProductoProducto FOREIGN KEY (idProducto) REFERENCES 
Producto(idProducto)
--CompraCliente
ALTER TABLE CompraCliente ADD CONSTRAINT FK_CompraClienteCompra FOREIGN KEY (idCompra) REFERENCES 
Compra(idCompra)
ALTER TABLE CompraCliente ADD CONSTRAINT FK_CompraClienteCliente FOREIGN KEY (idCliente) REFERENCES 
Cliente(idCliente)
--EmpleadoCapacitacion
ALTER TABLE EmpleadoCapacitacion ADD CONSTRAINT FK_EmpleadoCpaciacionEmpleado FOREIGN KEY (idEmpleado) REFERENCES 
Empleado(idEmpleado)
ALTER TABLE EmpleadoCapacitacion ADD CONSTRAINT FK_EmpleadoCapacitacionCapacitacion FOREIGN KEY (idCapacitacion) REFERENCES 
Capacitacion(idCapacitacion)
--MarcaProducto
ALTER TABLE MarcaProducto ADD CONSTRAINT FK_MarcaProductoMarca FOREIGN KEY (idMarca) REFERENCES 
Marca(idMarca)
ALTER TABLE MarcaProducto ADD CONSTRAINT FK_MarcaProductoProducto FOREIGN KEY (idProducto) REFERENCES 
Producto(idProducto)
--ProductoOferta
ALTER TABLE ProductoOferta ADD CONSTRAINT FK_ProductoOfertaProducto FOREIGN KEY (idProducto) REFERENCES 
Producto(idProducto)
ALTER TABLE ProductoOferta ADD CONSTRAINT FK_ProductoOfertaOferta FOREIGN KEY (idOferta) REFERENCES 
Oferta(idOferta)
--ProductoVenta
ALTER TABLE ProductoVenta ADD CONSTRAINT FK_ProductoVentaProducto FOREIGN KEY (idProducto) REFERENCES 
Producto(idProducto)
ALTER TABLE ProductoVenta ADD CONSTRAINT FK_ProductoVentaVenta FOREIGN KEY (idVenta) REFERENCES 
Venta(idVenta)
--SucursalEmpleado
ALTER TABLE SucursalEmpleado ADD CONSTRAINT FK_SucursalEmpleadoSucursal FOREIGN KEY (idSucursal) REFERENCES 
Sucursal(idSucursal)
ALTER TABLE SucursalEmpleado ADD CONSTRAINT FK_SucursalEmpleadoEmpleado FOREIGN KEY (idEmpleado) REFERENCES 
Empleado(idEmpleado)





--Index
CREATE INDEX IX_Agenda ON Agenda(idAgenda)
CREATE INDEX IX_Apartado ON Apartado(idApartado)
CREATE INDEX IX_Bodega ON Bodega(idBodega)
CREATE INDEX IX_Caja ON Caja(idCaja)
CREATE INDEX IX_Capacitacion ON Capacitacion(idCapacitacion)
CREATE INDEX IX_Cita ON Cita(idCita)
CREATE INDEX IX_Cliente ON Cliente (idCliente)
CREATE INDEX IX_Compra ON Compra(idCompra)
CREATE INDEX IX_Comprobante ON Comprobante (idComprobante)
CREATE INDEX IX_Consulta ON Consulta (idConsulta)
CREATE INDEX IX_Contador ON Contador(idContador)
CREATE INDEX IX_Contrato ON Contrato(idContrato)
CREATE INDEX IX_Convenio ON Convenio(idConvenio)
CREATE INDEX IX_Cotizacion ON Cotizacion(idCotizacion)
CREATE INDEX IX_Credito ON Credito(idCredito)
CREATE INDEX IX_Delivery ON Delivery(idDelivery)
CREATE INDEX IX_Departamento ON Departamento(idDepartamento)
CREATE INDEX IX_Devolucion ON Devolucion(idDevolucion)
CREATE INDEX IX_Doctor ON Doctor(idDoctor)
CREATE INDEX IX_Empleado ON Empleado(idEmpleado)
CREATE INDEX IX_Empresa ON Empresa(idEmpresa)
CREATE INDEX IX_Envio ON Envio(idEnvio)
CREATE INDEX IX_Estacionamiento ON Estacionamiento(idEstacionamiento)
CREATE INDEX IX_FacturaCliente ON FacturaCliente(idFacturaCliente)
CREATE INDEX IX_FacturaProveedor ON FacturaProveedor(idFacturaProveedor)
CREATE INDEX IX_HorarioTrabajo ON HorarioTrabajo(idHorarioTrabajo)
CREATE INDEX IX_Instrumento ON Instrumento(idInstrumento)
CREATE INDEX IX_Mantenimiento ON Mantenimiento(idMantenimiento)
CREATE INDEX IX_Marca ON Marca(idMarca)
CREATE INDEX IX_Marketing ON Marketing(idMarketing)
CREATE INDEX IX_MateriaPrima ON MateriaPrima(idMateriaPrima)
CREATE INDEX IX_Medicamento ON Medicamento(idMedicamento)
CREATE INDEX IX_MetodoPago ON MetodoPago(idMetodoPago)
CREATE INDEX IX_Mobiliario ON Mobiliario(idMobiliario)
CREATE INDEX IX_Nomina ON Nomina(idNomina)
CREATE INDEX IX_Oferta ON Oferta(idOferta)
CREATE INDEX IX_Paciente ON Paciente(idPaciente)
CREATE INDEX IX_PagoServicio ON PagoServicio(idPagoServicio)
CREATE INDEX IX_Paquete ON Paquete(idPaquete)
CREATE INDEX IX_Pedido ON Pedido(idPedido)
CREATE INDEX IX_Prestacion ON Prestacion(idPrestacion)
CREATE INDEX IX_Produccion ON Produccion(idProduccion)
CREATE INDEX IX_Producto ON Producto(idProducto)
CREATE INDEX IX_Proveedor ON Proveedor(idProveedor)
CREATE INDEX IX_Puesto ON Puesto(idPuesto)
CREATE INDEX IX_Receta ON Receta(idReceta)
CREATE INDEX IX_Representante ON Representante(idRepresentante)
CREATE INDEX IX_Sucursal ON Sucursal(idSucursal)
CREATE INDEX IX_Transporte ON Transporte(idTransporte)
CREATE INDEX IX_Venta ON Venta(idVenta)

--Apartado
INSERT INTO Apartado(nombre, cantidad, abono, fecha) values ('Apartado1', 100, 10, '1/12/2022')
GO
INSERT INTO Apartado(nombre, cantidad, abono, fecha) values ('Apartado2', 200, 20, '1/12/2022')
GO
INSERT INTO Apartado(nombre, cantidad, abono, fecha) values ('Apartado3', 300, 30, '1/12/2022')
GO
INSERT INTO Apartado(nombre, cantidad, abono, fecha) values ('Apartado4', 400, 40, '1/12/2022')
GO
INSERT INTO Apartado(nombre, cantidad, abono, fecha) values ('Apartado5', 500, 50, '1/12/2022')
GO
INSERT INTO Apartado(nombre, cantidad, abono, fecha) values ('Apartado6', 600, 60, '1/12/2022')
GO
INSERT INTO Apartado(nombre, cantidad, abono, fecha) values ('Apartado7', 700, 70, '1/12/2022')
GO
INSERT INTO Apartado(nombre, cantidad, abono, fecha) values ('Apartado8', 800, 80, '1/12/2022')
GO
INSERT INTO Apartado(nombre, cantidad, abono, fecha) values ('Apartado9', 900, 90, '1/12/2022')
GO
INSERT INTO Apartado(nombre, cantidad, abono, fecha) values ('Apartado10', 1000, 100, '1/12/2022')
GO

--Capacitacion
INSERT INTO Capacitacion(nombre, tipo, numero) values ('Capacitacion 1', 'Tipo1', 1)
GO
INSERT INTO Capacitacion(nombre, tipo, numero) values ('Capacitacion 2', 'Tipo2', 2)
GO
INSERT INTO Capacitacion(nombre, tipo, numero) values ('Capacitacion 3', 'Tipo3', 3)
GO
INSERT INTO Capacitacion(nombre, tipo, numero) values ('Capacitacion 4', 'Tipo4', 4)
GO
INSERT INTO Capacitacion(nombre, tipo, numero) values ('Capacitacion 5', 'Tipo5', 5)
GO
INSERT INTO Capacitacion(nombre, tipo, numero) values ('Capacitacion 6', 'Tipo6', 6)
GO
INSERT INTO Capacitacion(nombre, tipo, numero) values ('Capacitacion 7', 'Tipo7', 7)
GO
INSERT INTO Capacitacion(nombre, tipo, numero) values ('Capacitacion 8', 'Tipo8', 8)
GO
INSERT INTO Capacitacion(nombre, tipo, numero) values ('Capacitacion 9', 'Tipo9', 9)
GO
INSERT INTO Capacitacion(nombre, tipo, numero) values ('Capacitacion 10', 'Tipo10', 10)
GO

--Comprobante
INSERT INTO Comprobante(fecha, cantidad, productos) values ('1/12/2022', 1, 'producto1')
GO
INSERT INTO Comprobante(fecha, cantidad, productos) values ('1/12/2022', 2, 'producto2')
GO
INSERT INTO Comprobante(fecha, cantidad, productos) values ('1/12/2022', 3, 'producto3')
GO
INSERT INTO Comprobante(fecha, cantidad, productos) values ('1/12/2022', 4, 'producto4')
GO
INSERT INTO Comprobante(fecha, cantidad, productos) values ('1/12/2022', 5, 'producto5')
GO
INSERT INTO Comprobante(fecha, cantidad, productos) values ('1/12/2022', 6, 'producto6')
GO
INSERT INTO Comprobante(fecha, cantidad, productos) values ('1/12/2022', 7, 'producto7')
GO
INSERT INTO Comprobante(fecha, cantidad, productos) values ('1/12/2022', 8, 'producto8')
GO
INSERT INTO Comprobante(fecha, cantidad, productos) values ('1/12/2022', 9, 'producto9')
GO
INSERT INTO Comprobante(fecha, cantidad, productos) values ('1/12/2022', 10, 'producto10')
GO

--Contador
INSERT INTO Contador(nombre, apellidop, apellidom, calle, numero, ciudad, telefono) values ('nombre1', 'apellidop1', 'apellidom1', 'calle1', 1, 'ciudad1', 1)
GO
INSERT INTO Contador(nombre, apellidop, apellidom, calle, numero, ciudad, telefono) values ('nombre2', 'apellidop2', 'apellidom2', 'calle2', 2,'ciudad2', 2)
GO
INSERT INTO Contador(nombre, apellidop, apellidom, calle, numero, ciudad, telefono) values ('nombre3', 'apellidop3', 'apellidom3', 'calle3', 3, 'ciudad3', 3)
GO
INSERT INTO Contador(nombre, apellidop, apellidom, calle, numero, ciudad, telefono) values ('nombre4', 'apellidop4', 'apellidom4', 'calle4', 4,'ciudad4', 4)
GO
INSERT INTO Contador(nombre, apellidop, apellidom, calle, numero, ciudad, telefono) values ('nombre5', 'apellidop5', 'apellidom5', 'calle5', 5, 'ciudad5', 5)
GO
INSERT INTO Contador(nombre, apellidop, apellidom, calle, numero, ciudad, telefono) values ('nombre6', 'apellidop6', 'apellidom6', 'calle6', 6, 'ciudad6', 6)
GO
INSERT INTO Contador(nombre, apellidop, apellidom, calle, numero, ciudad, telefono) values ('nombre7', 'apellidop7', 'apellidom7', 'calle7', 7, 'ciudad7', 7)
GO
INSERT INTO Contador(nombre, apellidop, apellidom, calle, numero, ciudad, telefono) values ('nombre8', 'apellidop8', 'apellidom8', 'calle8', 8, 'ciudad8', 8)
GO
INSERT INTO Contador(nombre, apellidop, apellidom, calle, numero, ciudad, telefono) values ('nombre9', 'apellidop9', 'apellidom9', 'calle9', 9, 'ciudad9',9)
GO
INSERT INTO Contador(nombre, apellidop, apellidom, calle, numero, ciudad, telefono) values ('nombre10', 'apellidop10', 'apellidom10', 'calle10', 10,'ciudad10', 10)
GO

--Credito
INSERT INTO Credito(creditoDisponible, creditoDebe, fecha) values ('CreditoDisponible1','CreditoDebe1', '1/12/2022')
GO
INSERT INTO Credito(creditoDisponible, creditoDebe, fecha) values ('CreditoDisponible2','CreditoDebe2', '1/12/2022')
GO
INSERT INTO Credito(creditoDisponible, creditoDebe, fecha) values ('CreditoDisponible3','CreditoDebe3', '1/12/2022')
GO
INSERT INTO Credito(creditoDisponible, creditoDebe, fecha) values ('CreditoDisponible4','CreditoDebe4', '1/12/2022')
GO
INSERT INTO Credito(creditoDisponible, creditoDebe, fecha) values ('CreditoDisponible5','CreditoDebe5', '1/12/2022')
GO
INSERT INTO Credito(creditoDisponible, creditoDebe, fecha) values ('CreditoDisponible6','CreditoDebe6', '1/12/2022')
GO
INSERT INTO Credito(creditoDisponible, creditoDebe, fecha) values ('CreditoDisponible7','CreditoDebe7', '1/12/2022')
GO
INSERT INTO Credito(creditoDisponible, creditoDebe, fecha) values ('CreditoDisponible8','CreditoDebe8', '1/12/2022')
GO
INSERT INTO Credito(creditoDisponible, creditoDebe, fecha) values ('CreditoDisponible9','CreditoDebe9', '1/12/2022')
GO
INSERT INTO Credito(creditoDisponible, creditoDebe, fecha) values ('CreditoDisponible10','CreditoDebe10', '1/12/2022')
GO

--Deartamento
INSERT INTO Departamento(nombre, numero, cantidad) values ('nombre1', 1, 'cantidad1')
GO
INSERT INTO Departamento(nombre, numero, cantidad) values ('nombre2', 2, 'cantidad2')
GO
INSERT INTO Departamento(nombre, numero, cantidad) values ('nombre3', 3, 'cantidad3')
GO
INSERT INTO Departamento(nombre, numero, cantidad) values ('nombre4', 4, 'cantidad4')
GO
INSERT INTO Departamento(nombre, numero, cantidad) values ('nombre5', 5, 'cantidad5')
GO
INSERT INTO Departamento(nombre, numero, cantidad) values ('nombre6', 6, 'cantidad6')
GO
INSERT INTO Departamento(nombre, numero, cantidad) values ('nombre7', 7, 'cantidad7')
GO
INSERT INTO Departamento(nombre, numero, cantidad) values ('nombre8', 8, 'cantidad8')
GO
INSERT INTO Departamento(nombre, numero, cantidad) values ('nombre9', 9, 'cantidad9')
GO
INSERT INTO Departamento(nombre, numero, cantidad) values ('nombre10', 10, 'cantidad10')
GO

--Devolucion
INSERT INTO Devolucion(producto, cantidad, cantidadmonetaria, fecha) values ('producto1', 1, 'cantidadmonetaria1', '1/12/2022')
GO
INSERT INTO Devolucion(producto, cantidad, cantidadmonetaria, fecha) values ('producto2', 2, 'cantidadmonetaria2', '1/12/2022')
GO
INSERT INTO Devolucion(producto, cantidad, cantidadmonetaria, fecha) values ('producto3', 3, 'cantidadmonetaria3', '1/12/2022')
GO
INSERT INTO Devolucion(producto, cantidad, cantidadmonetaria, fecha) values ('producto4', 4, 'cantidadmonetaria4', '1/12/2022')
GO
INSERT INTO Devolucion(producto, cantidad, cantidadmonetaria, fecha) values ('producto5', 5, 'cantidadmonetaria5', '1/12/2022')
GO
INSERT INTO Devolucion(producto, cantidad, cantidadmonetaria, fecha) values ('producto6', 6, 'cantidadmonetaria6', '1/12/2022')
GO
INSERT INTO Devolucion(producto, cantidad, cantidadmonetaria, fecha) values ('producto7', 7, 'cantidadmonetaria7', '1/12/2022')
GO
INSERT INTO Devolucion(producto, cantidad, cantidadmonetaria, fecha) values ('producto8', 8, 'cantidadmonetaria8', '1/12/2022')
GO
INSERT INTO Devolucion(producto, cantidad, cantidadmonetaria, fecha) values ('producto9', 9, 'cantidadmonetaria9', '1/12/2022')
GO
INSERT INTO Devolucion(producto, cantidad, cantidadmonetaria, fecha) values ('producto10', 10, 'cantidadmonetaria10', '1/12/2022')
GO


--Doctor
INSERT INTO Doctor (nombre, apellidop, apellidom) values('Doctor1', 'Apellido1', 'Apellido1')
GO
INSERT INTO Doctor (nombre, apellidop, apellidom) values('Doctor2', 'Apellido2', 'Apellido2')
GO
INSERT INTO Doctor (nombre, apellidop, apellidom) values('Doctor3', 'Apellido3', 'Apellido3')
GO
INSERT INTO Doctor (nombre, apellidop, apellidom) values('Doctor4', 'Apellido4', 'Apellido4')
GO
INSERT INTO Doctor (nombre, apellidop, apellidom) values('Doctor5', 'Apellido5', 'Apellido5')
GO
INSERT INTO Doctor (nombre, apellidop, apellidom) values('Doctor6', 'Apellido6', 'Apellido6')
GO
INSERT INTO Doctor (nombre, apellidop, apellidom) values('Doctor7', 'Apellido7', 'Apellido7')
GO
INSERT INTO Doctor (nombre, apellidop, apellidom) values('Doctor8', 'Apellido8', 'Apellido8')
GO
INSERT INTO Doctor (nombre, apellidop, apellidom) values('Doctor9', 'Apellido8', 'Apellido9')
GO
INSERT INTO Doctor (nombre, apellidop, apellidom) values('Doctor10', 'Apellido10', 'Apellido10')
GO

--Empleado
INSERT INTO Empleado(puesto, sueldo, nombre, apellidop, apellidom, calle, numero, ciudad, telefono) values('puesto1', 'sueldo1', 'nombre1', 'apellidop1', 'apellidom1', 'calle1', 1, 'ciudad1', 1)
GO
INSERT INTO Empleado(puesto, sueldo, nombre, apellidop, apellidom, calle, numero, ciudad, telefono) values('puesto2', 'sueldo2', 'nombre2', 'apellidop2', 'apellidom2', 'calle2', 2, 'ciudad2', 2)
GO
INSERT INTO Empleado(puesto, sueldo, nombre, apellidop, apellidom, calle, numero, ciudad, telefono) values('puesto3', 'sueldo3', 'nombre3', 'apellidop3', 'apellidom3', 'calle3', 3, 'ciudad3', 3)
GO
INSERT INTO Empleado(puesto, sueldo, nombre, apellidop, apellidom, calle, numero, ciudad, telefono) values('puesto4', 'sueldo4', 'nombre4', 'apellidop4', 'apellidom4', 'calle4',4 , 'ciudad4', 4)
GO
INSERT INTO Empleado(puesto, sueldo, nombre, apellidop, apellidom, calle, numero, ciudad, telefono) values('puesto5', 'sueldo5', 'nombre5', 'apellidop5', 'apellidom5', 'calle5', 5, 'ciudad5', 5)
GO
INSERT INTO Empleado(puesto, sueldo, nombre, apellidop, apellidom, calle, numero, ciudad, telefono) values('puesto6', 'sueldo6', 'nombre6', 'apellidop6', 'apellidom6', 'calle6', 6, 'ciudad6', 6)
GO
INSERT INTO Empleado(puesto, sueldo, nombre, apellidop, apellidom, calle, numero, ciudad, telefono) values('puesto7', 'sueldo7', 'nombre7', 'apellidop7', 'apellidom7', 'calle7', 7, 'ciudad7', 7)
GO
INSERT INTO Empleado(puesto, sueldo, nombre, apellidop, apellidom, calle, numero, ciudad, telefono) values('puesto8', 'sueldo8', 'nombre8', 'apellidop8', 'apellidom8', 'calle8', 8, 'ciudad8', 8)
GO
INSERT INTO Empleado(puesto, sueldo, nombre, apellidop, apellidom, calle, numero, ciudad, telefono) values('puesto9', 'sueldo9', 'nombre9', 'apellidop9', 'apellidom9', 'calle9', 9, 'ciudad9', 9)
GO
INSERT INTO Empleado(puesto, sueldo, nombre, apellidop, apellidom, calle, numero, ciudad, telefono) values('puesto10', 'sueldo10', 'nombre10', 'apellidop10', 'apellidom10', 'calle10', 10, 'ciudad10', 10)
GO

--Empresa
INSERT INTO Empresa(nombre, telefono, calle, estado, numero, colonia, ciudad) values('nombre1', 1, 'calle1', 'estado1', 1, 'colonia1', 'ciudad1')
GO
INSERT INTO Empresa(nombre, telefono, calle, estado, numero, colonia, ciudad) values('nombre2', 2, 'calle2', 'estado2', 2, 'colonia2', 'ciudad2')
GO
INSERT INTO Empresa(nombre, telefono, calle, estado, numero, colonia, ciudad) values('nombre3', 3, 'calle3', 'estado3', 3, 'colonia3', 'ciudad3')
GO
INSERT INTO Empresa(nombre, telefono, calle, estado, numero, colonia, ciudad) values('nombre4', 4, 'calle4', 'estado4', 4, 'colonia4', 'ciudad4')
GO
INSERT INTO Empresa(nombre, telefono, calle, estado, numero, colonia, ciudad) values('nombre5', 5, 'calle5', 'estado5', 5, 'colonia5', 'ciudad5')
GO
INSERT INTO Empresa(nombre, telefono, calle, estado, numero, colonia, ciudad) values('nombre6', 6, 'calle6', 'estado6', 6, 'colonia6', 'ciudad6')
GO
INSERT INTO Empresa(nombre, telefono, calle, estado, numero, colonia, ciudad) values('nombre7', 7, 'calle7', 'estado7', 7, 'colonia7', 'ciudad7')
GO
INSERT INTO Empresa(nombre, telefono, calle, estado, numero, colonia, ciudad) values('nombre8', 8, 'calle8', 'estado8', 8, 'colonia8', 'ciudad8')
GO
INSERT INTO Empresa(nombre, telefono, calle, estado, numero, colonia, ciudad) values('nombre9', 9, 'calle9', 'estado9', 9, 'colonia9', 'ciudad9')
GO
INSERT INTO Empresa(nombre, telefono, calle, estado, numero, colonia, ciudad) values('nombre10', 10, 'calle10', 'estado10', 10, 'colonia10', 'ciudad10')
GO

--Envio
INSERT INTO Envio(fechaSalida, fechaLlegada, productos, cantidad) values('1/12/2022', '1/12/2022', 'producto1', 1)
GO
INSERT INTO Envio(fechaSalida, fechaLlegada, productos, cantidad) values('1/12/2022', '1/12/2022', 'producto2', 2)
GO
INSERT INTO Envio(fechaSalida, fechaLlegada, productos, cantidad) values('1/12/2022', '1/12/2022', 'producto3', 3)
GO
INSERT INTO Envio(fechaSalida, fechaLlegada, productos, cantidad) values('1/12/2022', '1/12/2022', 'producto4', 4)
GO
INSERT INTO Envio(fechaSalida, fechaLlegada, productos, cantidad) values('1/12/2022', '1/12/2022', 'producto5', 5)
GO
INSERT INTO Envio(fechaSalida, fechaLlegada, productos, cantidad) values('1/12/2022', '1/12/2022', 'producto6', 6)
GO
INSERT INTO Envio(fechaSalida, fechaLlegada, productos, cantidad) values('1/12/2022', '1/12/2022', 'producto7', 7)
GO
INSERT INTO Envio(fechaSalida, fechaLlegada, productos, cantidad) values('1/12/2022', '1/12/2022', 'producto8', 8)
GO
INSERT INTO Envio(fechaSalida, fechaLlegada, productos, cantidad) values('1/12/2022', '1/12/2022', 'producto9', 9)
GO
INSERT INTO Envio(fechaSalida, fechaLlegada, productos, cantidad) values('1/12/2022', '1/12/2022', 'producto10', 10)
GO

--Marca
INSERT INTO Marca(nombre, modelo) values('nombre1','modelo1')
GO
INSERT INTO Marca(nombre, modelo) values('nombre2','modelo2')
GO
INSERT INTO Marca(nombre, modelo) values('nombre3','modelo3')
GO
INSERT INTO Marca(nombre, modelo) values('nombre4','modelo4')
GO
INSERT INTO Marca(nombre, modelo) values('nombre5','modelo5')
GO
INSERT INTO Marca(nombre, modelo) values('nombre6','modelo6')
GO
INSERT INTO Marca(nombre, modelo) values('nombre7','modelo7')
GO
INSERT INTO Marca(nombre, modelo) values('nombre8','modelo8')
GO
INSERT INTO Marca(nombre, modelo) values('nombre9','modelo9')
GO
INSERT INTO Marca(nombre, modelo) values('nombre10','modelo10')
GO

--MateriaPrima
INSERT INTO MateriaPrima(material, nombre, cantidad) values('material1','nomre1', 1)
GO
INSERT INTO MateriaPrima(material, nombre, cantidad) values('material2','nomre2', 2)
GO
INSERT INTO MateriaPrima(material, nombre, cantidad) values('material3','nomre3', 3)
GO
INSERT INTO MateriaPrima(material, nombre, cantidad) values('material4','nomre4', 4)
GO
INSERT INTO MateriaPrima(material, nombre, cantidad) values('material5','nomre5', 5)
GO
INSERT INTO MateriaPrima(material, nombre, cantidad) values('material6','nomre6', 6)
GO
INSERT INTO MateriaPrima(material, nombre, cantidad) values('material7','nomre7', 7)
GO
INSERT INTO MateriaPrima(material, nombre, cantidad) values('material8','nomre8', 8)
GO
INSERT INTO MateriaPrima(material, nombre, cantidad) values('material9','nomre9', 9)
GO
INSERT INTO MateriaPrima(material, nombre, cantidad) values('material10','nomre10', 10)
GO

--MetodoPago
INSERT INTO MetodoPago(tipo) values('tipo1')
GO
INSERT INTO MetodoPago(tipo) values('tipo2')
GO
INSERT INTO MetodoPago(tipo) values('tipo3')
GO
INSERT INTO MetodoPago(tipo) values('tipo4')
GO
INSERT INTO MetodoPago(tipo) values('tipo5')
GO
INSERT INTO MetodoPago(tipo) values('tipo6')
GO
INSERT INTO MetodoPago(tipo) values('tipo7')
GO
INSERT INTO MetodoPago(tipo) values('tipo8')
GO
INSERT INTO MetodoPago(tipo) values('tipo9')
GO
INSERT INTO MetodoPago(tipo) values('tipo10')
GO

--Nomina
INSERT INTO Nomina(numero, fecha, persona) values(1, '1/12/2022', 'persona1')
GO
INSERT INTO Nomina(numero, fecha, persona) values(2, '1/12/2022', 'persona2')
GO
INSERT INTO Nomina(numero, fecha, persona) values(3, '1/12/2022', 'persona3')
GO
INSERT INTO Nomina(numero, fecha, persona) values(4, '1/12/2022', 'persona4')
GO
INSERT INTO Nomina(numero, fecha, persona) values(5, '1/12/2022', 'persona5')
GO
INSERT INTO Nomina(numero, fecha, persona) values(6, '1/12/2022', 'persona6')
GO
INSERT INTO Nomina(numero, fecha, persona) values(7, '1/12/2022', 'persona7')
GO
INSERT INTO Nomina(numero, fecha, persona) values(8, '1/12/2022', 'persona8')
GO
INSERT INTO Nomina(numero, fecha, persona) values(9, '1/12/2022', 'persona9')
GO
INSERT INTO Nomina(numero, fecha, persona) values(10, '1/12/2022', 'persona10')
GO


--Oferta
INSERT INTO Oferta(producto, precio, precioAnterior, fecha) values('producto1', 'precio1', 'precioAnterior1', '1/12/2022')
GO
INSERT INTO Oferta(producto, precio, precioAnterior, fecha) values('producto1', 'precio1', 'precioAnterior1', '1/12/2022')
GO
INSERT INTO Oferta(producto, precio, precioAnterior, fecha) values('producto1', 'precio1', 'precioAnterior1', '1/12/2022')
GO
INSERT INTO Oferta(producto, precio, precioAnterior, fecha) values('producto1', 'precio1', 'precioAnterior1', '1/12/2022')
GO
INSERT INTO Oferta(producto, precio, precioAnterior, fecha) values('producto1', 'precio1', 'precioAnterior1', '1/12/2022')
GO
INSERT INTO Oferta(producto, precio, precioAnterior, fecha) values('producto1', 'precio1', 'precioAnterior1', '1/12/2022')
GO
INSERT INTO Oferta(producto, precio, precioAnterior, fecha) values('producto1', 'precio1', 'precioAnterior1', '1/12/2022')
GO
INSERT INTO Oferta(producto, precio, precioAnterior, fecha) values('producto1', 'precio1', 'precioAnterior1', '1/12/2022')
GO
INSERT INTO Oferta(producto, precio, precioAnterior, fecha) values('producto1', 'precio1', 'precioAnterior1', '1/12/2022')
GO
INSERT INTO Oferta(producto, precio, precioAnterior, fecha) values('producto1', 'precio1', 'precioAnterior1', '1/12/2022')
GO

--Paciente
INSERT INTO Paciente(nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento) values('nombre1', 'apellidop1', 'apellidom1', '1/12/2022')
GO
INSERT INTO Paciente(nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento) values('nombre2', 'apellidop2', 'apellidom2', '1/12/2022')
GO
INSERT INTO Paciente(nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento) values('nombre3', 'apellidop3', 'apellidom3', '1/12/2022')
GO
INSERT INTO Paciente(nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento) values('nombre4', 'apellidop4', 'apellidom4', '1/12/2022')
GO
INSERT INTO Paciente(nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento) values('nombre5', 'apellidop5', 'apellidom5', '1/12/2022')
GO
INSERT INTO Paciente(nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento) values('nombre6', 'apellidop6', 'apellidom6', '1/12/2022')
GO
INSERT INTO Paciente(nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento) values('nombre7', 'apellidop7', 'apellidom7', '1/12/2022')
GO
INSERT INTO Paciente(nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento) values('nombre8', 'apellidop8', 'apellidom8', '1/12/2022')
GO
INSERT INTO Paciente(nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento) values('nombre9', 'apellidop9', 'apellidom9', '1/12/2022')
GO
INSERT INTO Paciente(nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento) values('nombre10', 'apellidop10', 'apellidom10', '1/12/2022')
GO

--Pedido
INSERT INTO Pedido(productos, cantidad, costo) values('producto1', 1, 'costo1')
GO
INSERT INTO Pedido(productos, cantidad, costo) values('producto2', 2, 'costo2')
GO
INSERT INTO Pedido(productos, cantidad, costo) values('producto3', 3, 'costo3')
GO
INSERT INTO Pedido(productos, cantidad, costo) values('producto4', 4, 'costo4')
GO
INSERT INTO Pedido(productos, cantidad, costo) values('producto5', 5, 'costo5')
GO
INSERT INTO Pedido(productos, cantidad, costo) values('producto6', 6, 'costo6')
GO
INSERT INTO Pedido(productos, cantidad, costo) values('producto7', 7, 'costo7')
GO
INSERT INTO Pedido(productos, cantidad, costo) values('producto8', 8, 'costo8')
GO
INSERT INTO Pedido(productos, cantidad, costo) values('producto9', 9, 'costo9')
GO
INSERT INTO Pedido(productos, cantidad, costo) values('producto10', 10, 'costo10')
GO

--Prestacion
INSERT INTO Prestacion(clasificacion, descripcion) values('clasificacion1', 'descripcion1')
GO
INSERT INTO Prestacion(clasificacion, descripcion) values('clasificacion2', 'descripcion2')
GO
INSERT INTO Prestacion(clasificacion, descripcion) values('clasificacion3', 'descripcion3')
GO
INSERT INTO Prestacion(clasificacion, descripcion) values('clasificacion4', 'descripcion4')
GO
INSERT INTO Prestacion(clasificacion, descripcion) values('clasificacion5', 'descripcion5')
GO
INSERT INTO Prestacion(clasificacion, descripcion) values('clasificacion6', 'descripcion6')
GO
INSERT INTO Prestacion(clasificacion, descripcion) values('clasificacion7', 'descripcion7')
GO
INSERT INTO Prestacion(clasificacion, descripcion) values('clasificacion8', 'descripcion8')
GO
INSERT INTO Prestacion(clasificacion, descripcion) values('clasificacion9', 'descripcion9')
GO
INSERT INTO Prestacion(clasificacion, descripcion) values('clasificacion10', 'descripcion10')
GO


--Produccion
INSERT INTO Produccion(cantidadFinal, ingresos) values(1, 'ingreso1')
GO
INSERT INTO Produccion(cantidadFinal, ingresos) values(2, 'ingreso2')
GO
INSERT INTO Produccion(cantidadFinal, ingresos) values(3, 'ingreso3')
GO
INSERT INTO Produccion(cantidadFinal, ingresos) values(4, 'ingreso4')
GO
INSERT INTO Produccion(cantidadFinal, ingresos) values(5, 'ingreso5')
GO
INSERT INTO Produccion(cantidadFinal, ingresos) values(6, 'ingreso6')
GO
INSERT INTO Produccion(cantidadFinal, ingresos) values(7, 'ingreso7')
GO
INSERT INTO Produccion(cantidadFinal, ingresos) values(8, 'ingreso8')
GO
INSERT INTO Produccion(cantidadFinal, ingresos) values(9, 'ingreso9')
GO
INSERT INTO Produccion(cantidadFinal, ingresos) values(10, 'ingreso10')
GO

--Sucursal
INSERT INTO Sucursal(nombre, telefoo, calle, estado, colonia, ciudad) values('nombre1', 1, 'calle1', 'estado1', 'colonia1', 'ciudad1')
GO
INSERT INTO Sucursal(nombre, telefoo, calle, estado, colonia, ciudad) values('nombre2', 2, 'calle2', 'estado2', 'colonia2', 'ciudad2')
GO
INSERT INTO Sucursal(nombre, telefoo, calle, estado, colonia, ciudad) values('nombre3', 3, 'calle3', 'estado3', 'colonia3', 'ciudad3')
GO
INSERT INTO Sucursal(nombre, telefoo, calle, estado, colonia, ciudad) values('nombre4', 4, 'calle4', 'estado4', 'colonia4', 'ciudad4')
GO
INSERT INTO Sucursal(nombre, telefoo, calle, estado, colonia, ciudad) values('nombre5', 5, 'calle5', 'estado5', 'colonia5', 'ciudad5')
GO
INSERT INTO Sucursal(nombre, telefoo, calle, estado, colonia, ciudad) values('nombre6', 6, 'calle6', 'estado6', 'colonia6', 'ciudad6')
GO
INSERT INTO Sucursal(nombre, telefoo, calle, estado, colonia, ciudad) values('nombre7', 7, 'calle7', 'estado7', 'colonia7', 'ciudad7')
GO
INSERT INTO Sucursal(nombre, telefoo, calle, estado, colonia, ciudad) values('nombre8', 8, 'calle8', 'estado8', 'colonia8', 'ciudad8')
GO
INSERT INTO Sucursal(nombre, telefoo, calle, estado, colonia, ciudad) values('nombre9', 9, 'calle9', 'estado9', 'colonia9', 'ciudad9')
GO
INSERT INTO Sucursal(nombre, telefoo, calle, estado, colonia, ciudad) values('nombre10', 10, 'calle10', 'estado10', 'colonia10', 'ciudad10')
GO


--Venta
INSERT INTO Venta(fecha, cantidad) values('1/12/2022', 'cantidad1')
GO
INSERT INTO Venta(fecha, cantidad) values('1/12/2022', 'cantidad2')
GO
INSERT INTO Venta(fecha, cantidad) values('1/12/2022', 'cantidad3')
GO
INSERT INTO Venta(fecha, cantidad) values('1/12/2022', 'cantidad4')
GO
INSERT INTO Venta(fecha, cantidad) values('1/12/2022', 'cantidad5')
GO
INSERT INTO Venta(fecha, cantidad) values('1/12/2022', 'cantidad6')
GO
INSERT INTO Venta(fecha, cantidad) values('1/12/2022', 'cantidad7')
GO
INSERT INTO Venta(fecha, cantidad) values('1/12/2022', 'cantidad8')
GO
INSERT INTO Venta(fecha, cantidad) values('1/12/2022', 'cantidad9')
GO
INSERT INTO Venta(fecha, cantidad) values('1/12/2022', 'cantidad10')
GO

--Proveedor
INSERT INTO Proveedor(nombre, apellidoPaterno, apellidMaterno, calle, numero, ciudad, telefono) values('nombre1', 'apellidop1', 'apellidom1', 'calle1', 1, 'ciudad1', 1)
GO
INSERT INTO Proveedor(nombre, apellidoPaterno, apellidMaterno, calle, numero, ciudad, telefono) values('nombre2', 'apellidop2', 'apellidom2', 'calle2', 2, 'ciudad2', 2)
GO
INSERT INTO Proveedor(nombre, apellidoPaterno, apellidMaterno, calle, numero, ciudad, telefono) values('nombre3', 'apellidop3', 'apellidom3', 'calle3', 3, 'ciudad3', 3)
GO
INSERT INTO Proveedor(nombre, apellidoPaterno, apellidMaterno, calle, numero, ciudad, telefono) values('nombre4', 'apellidop4', 'apellidom4', 'calle4', 4, 'ciudad4', 4)
GO
INSERT INTO Proveedor(nombre, apellidoPaterno, apellidMaterno, calle, numero, ciudad, telefono) values('nombre5', 'apellidop5', 'apellidom5', 'calle5', 5, 'ciudad5', 5)
GO
INSERT INTO Proveedor(nombre, apellidoPaterno, apellidMaterno, calle, numero, ciudad, telefono) values('nombre6', 'apellidop6', 'apellidom6', 'calle6', 6, 'ciudad6', 6)
GO
INSERT INTO Proveedor(nombre, apellidoPaterno, apellidMaterno, calle, numero, ciudad, telefono) values('nombre7', 'apellidop7', 'apellidom7', 'calle7', 7, 'ciudad7', 7)
GO
INSERT INTO Proveedor(nombre, apellidoPaterno, apellidMaterno, calle, numero, ciudad, telefono) values('nombre8', 'apellidop8', 'apellidom8', 'calle8', 8, 'ciudad8', 8)
GO
INSERT INTO Proveedor(nombre, apellidoPaterno, apellidMaterno, calle, numero, ciudad, telefono) values('nombre9', 'apellidop9', 'apellidom9', 'calle9', 9, 'ciudad9', 9)
GO
INSERT INTO Proveedor(nombre, apellidoPaterno, apellidMaterno, calle, numero, ciudad, telefono) values('nombre10', 'apellidop10', 'apellidom10', 'calle10', 10, 'ciudad10', 10)
GO

--Transporte
INSERT INTO Transporte(marca, matricula, modelo, cilindros) values('marca1', 'matricula1', 'modelo1', 'cilindro1')
GO
INSERT INTO Transporte(marca, matricula, modelo, cilindros) values('marca2', 'matricula2', 'modelo2', 'cilindro2')
GO
INSERT INTO Transporte(marca, matricula, modelo, cilindros) values('marca3', 'matricula3', 'modelo3', 'cilindro3')
GO
INSERT INTO Transporte(marca, matricula, modelo, cilindros) values('marca4', 'matricula4', 'modelo4', 'cilindro4')
GO
INSERT INTO Transporte(marca, matricula, modelo, cilindros) values('marca5', 'matricula5', 'modelo5', 'cilindro5')
GO
INSERT INTO Transporte(marca, matricula, modelo, cilindros) values('marca6', 'matricula6', 'modelo6', 'cilindro6')
GO
INSERT INTO Transporte(marca, matricula, modelo, cilindros) values('marca7', 'matricula7', 'modelo7', 'cilindro7')
GO
INSERT INTO Transporte(marca, matricula, modelo, cilindros) values('marca8', 'matricula8', 'modelo8', 'cilindro8')
GO
INSERT INTO Transporte(marca, matricula, modelo, cilindros) values('marca9', 'matricula9', 'modelo9', 'cilindro9')
GO
INSERT INTO Transporte(marca, matricula, modelo, cilindros) values('marca10', 'matricula10', 'modelo10', 'cilindro9')
GO

--Agenda
INSERT INTO Agenda(nombre, fecha, idDoctor, estatus) values ('Agenda1', '1/12/2022', '1', '1')
GO
INSERT INTO Agenda(nombre, fecha, idDoctor, estatus) values ('Agenda2', '1/12/2022', '2', '1')
GO
INSERT INTO Agenda(nombre, fecha, idDoctor, estatus) values ('Agenda3', '1/12/2022', '3', '1')
GO
INSERT INTO Agenda(nombre, fecha, idDoctor, estatus) values ('Agenda4', '1/12/2022', '4', '1')
GO
INSERT INTO Agenda(nombre, fecha, idDoctor, estatus) values ('Agenda5', '1/12/2022', '5', '1')
GO
INSERT INTO Agenda(nombre, fecha, idDoctor, estatus) values ('Agenda6', '1/12/2022', '6', '1')
GO
INSERT INTO Agenda(nombre, fecha, idDoctor, estatus) values ('Agenda7', '1/12/2022', '7', '1')
GO
INSERT INTO Agenda(nombre, fecha, idDoctor, estatus) values ('Agenda8', '1/12/2022', '8', '1')
GO
INSERT INTO Agenda(nombre, fecha, idDoctor, estatus) values ('Agenda9', '1/12/2022', '9', '1')
GO
INSERT INTO Agenda(nombre, fecha, idDoctor, estatus) values ('Agenda10', '1/12/2022', '10', '1')
GO
SELECT *FROM Agenda


--Bodega
INSERT INTO Bodega(nombre, calle, numero, ciudad, idSucursal, estatus) values ('Bodega1', 'calle1',1, 'ciudad1', '1', '1')
GO
INSERT INTO Bodega(nombre, calle, numero, ciudad, idSucursal, estatus) values ('Bodega2', 'calle2',2,  'ciudad2', '2', '1')
GO
INSERT INTO Bodega(nombre, calle, numero, ciudad, idSucursal, estatus) values ('Bodega3', 'calle3',3, 'ciudad3', '3', '1')
GO
INSERT INTO Bodega(nombre, calle, numero, ciudad, idSucursal, estatus) values ('Bodega4', 'calle4',4, 'ciudad4', '4', '1')
GO
INSERT INTO Bodega(nombre, calle, numero, ciudad, idSucursal, estatus) values ('Bodega5', 'calle5',5, 'ciudad5', '5', '1')
GO
INSERT INTO Bodega(nombre, calle, numero, ciudad, idSucursal, estatus) values ('Bodega6', 'calle6',6, 'ciudad6', '6', '1')
GO
INSERT INTO Bodega(nombre, calle, numero, ciudad, idSucursal, estatus) values ('Bodega7', 'calle7',7, 'ciudad7', '7', '1')
GO
INSERT INTO Bodega(nombre, calle, numero, ciudad, idSucursal, estatus) values ('Bodega8', 'calle8',8, 'ciudad8', '8', '1')
GO
INSERT INTO Bodega(nombre, calle, numero, ciudad, idSucursal, estatus) values ('Bodega9', 'calle9',9, 'ciudad9', '9', '1')
GO
INSERT INTO Bodega(nombre, calle, numero, ciudad, idSucursal, estatus) values ('Bodega10', 'calle10',10, 'ciudad10', '10', '1')
GO

SELECT *FROM Bodega

--Caja
INSERT INTO Caja(numer, persona, computadora, idSucursal, estatus) values (1, 'persona1', 'computadora1', '1', '1')
GO
INSERT INTO Caja(numer, persona, computadora, idSucursal, estatus) values (2, 'persona2', 'computadora2', '2', '1')
GO
INSERT INTO Caja(numer, persona, computadora, idSucursal, estatus) values (3, 'persona3', 'computadora3', '3', '1')
GO
INSERT INTO Caja(numer, persona, computadora, idSucursal, estatus) values (4, 'persona4', 'computadora4', '4', '1')
GO
INSERT INTO Caja(numer, persona, computadora, idSucursal, estatus) values (5, 'persona5', 'computadora5', '5', '1')
GO
INSERT INTO Caja(numer, persona, computadora, idSucursal, estatus) values (6, 'persona6', 'computadora6', '6', '1')
GO
INSERT INTO Caja(numer, persona, computadora, idSucursal, estatus) values (7, 'persona7', 'computadora7', '7', '1')
GO
INSERT INTO Caja(numer, persona, computadora, idSucursal, estatus) values (8, 'persona8', 'computadora8', '8', '1')
GO
INSERT INTO Caja(numer, persona, computadora, idSucursal, estatus) values (9, 'persona9', 'computadora9', '9', '1')
GO
INSERT INTO Caja(numer, persona, computadora, idSucursal, estatus) values (10, 'persona10', 'computadora110', '10', '1')
GO

--Cita
INSERT INTO Cita(fecha, asunto, nombre, edad, idAgenda, estatus) values ('1/12/2022', 'asunto1', 'nombre1', 1, '1', '1')
GO
INSERT INTO Cita(fecha, asunto, nombre, edad, idAgenda, estatus) values ('1/12/2022', 'asunto2', 'nombre2', 2, '2', '1')
GO
INSERT INTO Cita(fecha, asunto, nombre, edad, idAgenda, estatus) values ('1/12/2022', 'asunto3', 'nombre3', 3, '3', '1')
GO
INSERT INTO Cita(fecha, asunto, nombre, edad, idAgenda, estatus) values ('1/12/2022', 'asunto4', 'nombre4', 4, '4', '1')
GO
INSERT INTO Cita(fecha, asunto, nombre, edad, idAgenda, estatus) values ('1/12/2022', 'asunto5', 'nombre5', 5, '5', '1')
GO
INSERT INTO Cita(fecha, asunto, nombre, edad, idAgenda, estatus) values ('1/12/2022', 'asunto6', 'nombre6', 6, '6', '1')
GO
INSERT INTO Cita(fecha, asunto, nombre, edad, idAgenda, estatus) values ('1/12/2022', 'asunto7', 'nombre7', 7, '7', '1')
GO
INSERT INTO Cita(fecha, asunto, nombre, edad, idAgenda, estatus) values ('1/12/2022', 'asunto8', 'nombre8', 8, '8', '1')
GO
INSERT INTO Cita(fecha, asunto, nombre, edad, idAgenda, estatus) values ('1/12/2022', 'asunto9', 'nombre9', 9, '9', '1')
GO
INSERT INTO Cita(fecha, asunto, nombre, edad, idAgenda, estatus) values ('1/12/2022', 'asunto10', 'nombre10', 10, '10', '1')
GO

--Cliente
INSERT INTO Cliente(nombre, apellidoPaterno, apellidoMaterno, curp, calle,  telefono, numero, estado, idCredito, estatus) values ('nombre1', 'apellidoPaterno1', 'apellidoMaterno', 'curp1','calle1', 1, 1, 'Estado1', '1', '1')
GO
INSERT INTO Cliente(nombre, apellidoPaterno, apellidoMaterno, curp, calle, telefono, numero, estado, idCredito, estatus) values ('nombre1', 'apellidoPaterno1', 'apellidoMaterno', 'curp1', 'Calle2', 2, 2, 'Estado2', '1', '1')
GO
INSERT INTO Cliente(nombre, apellidoPaterno, apellidoMaterno, curp, calle,  telefono, numero, estado, idCredito, estatus) values ('nombre1', 'apellidoPaterno1', 'apellidoMaterno', 'curp1', 'Calle3',3, 3, 'Estado3','1', '1')
GO
INSERT INTO Cliente(nombre, apellidoPaterno, apellidoMaterno, curp, calle,  telefono, numero, estado, idCredito, estatus) values ('nombre1', 'apellidoPaterno1', 'apellidoMaterno', 'curp1', 'Calle4', 4, 4, 'Estado4', '1', '1')
GO
INSERT INTO Cliente(nombre, apellidoPaterno, apellidoMaterno, curp, calle,  telefono, numero, estado, idCredito, estatus) values ('nombre1', 'apellidoPaterno1', 'apellidoMaterno', 'curp1', 'Calle5', 5, 5, 'Estado5', '1', '1')
GO
INSERT INTO Cliente(nombre, apellidoPaterno, apellidoMaterno, curp, calle,  telefono, numero, estado, idCredito, estatus) values ('nombre1', 'apellidoPaterno1', 'apellidoMaterno', 'curp1', 'Calle6', 6,6, 'Estado6',  '1', '1')
GO
INSERT INTO Cliente(nombre, apellidoPaterno, apellidoMaterno, curp, calle,  telefono, numero, estado, idCredito, estatus) values ('nombre1', 'apellidoPaterno1', 'apellidoMaterno', 'curp1','Calle7', 7, 7, 'Estado7', '1', '1')
GO
INSERT INTO Cliente(nombre, apellidoPaterno, apellidoMaterno, curp, calle, telefono, numero, estado, idCredito, estatus) values ('nombre1', 'apellidoPaterno1', 'apellidoMaterno', 'curp1', 'Calle8', 8,8, 'Estado8', '1', '1')
GO
INSERT INTO Cliente(nombre, apellidoPaterno, apellidoMaterno, curp, calle,  telefono, numero, estado, idCredito, estatus) values ('nombre1', 'apellidoPaterno1', 'apellidoMaterno', 'curp1', 'Calle9',  9, 9, 'Estado9', '1', '1')
GO
INSERT INTO Cliente(nombre, apellidoPaterno, apellidoMaterno, curp, calle,  telefono, numero, estado, idCredito, estatus) values ('nombre1', 'apellidoPaterno1', 'apellidoMaterno', 'curp1', 'Calle10', 10, 10, 'Estado10', '1', '1')
GO

--Cotizacion
INSERT INTO Cotizacion(cantidad, fecha, idCliente , estatus) values (1, '1/12/2022', '1', '1')
GO
INSERT INTO Cotizacion(cantidad, fecha, idCliente , estatus) values (2, '1/12/2022', '2', '1')
GO
INSERT INTO Cotizacion(cantidad, fecha, idCliente , estatus) values (3, '1/12/2022', '3', '1')
GO
INSERT INTO Cotizacion(cantidad, fecha, idCliente , estatus) values (4, '1/12/2022', '4', '1')
GO
INSERT INTO Cotizacion(cantidad, fecha, idCliente , estatus) values (5, '1/12/2022', '5', '1')
GO
INSERT INTO Cotizacion(cantidad, fecha, idCliente , estatus) values (6, '1/12/2022', '6', '1')
GO
INSERT INTO Cotizacion(cantidad, fecha, idCliente , estatus) values (7, '1/12/2022', '7', '1')
GO
INSERT INTO Cotizacion(cantidad, fecha, idCliente , estatus) values (8, '1/12/2022', '8', '1')
GO
INSERT INTO Cotizacion(cantidad, fecha, idCliente , estatus) values (9, '1/12/2022', '9', '1')
GO
INSERT INTO Cotizacion(cantidad, fecha, idCliente , estatus) values (10, '1/12/2022', '10', '1')
GO


--Compra
INSERT INTO Compra(cantidad, fecha, idComprobante, idCotizacion, estatus) values (1, '1/12/2022', '1', '1', '1')
GO
INSERT INTO Compra(cantidad, fecha, idComprobante, idCotizacion, estatus) values (2, '1/12/2022', '2', '2', '1')
GO
INSERT INTO Compra(cantidad, fecha, idComprobante, idCotizacion, estatus) values (3, '1/12/2022', '3', '3', '1')
GO
INSERT INTO Compra(cantidad, fecha, idComprobante, idCotizacion, estatus) values (4, '1/12/2022', '4', '4', '1')
GO
INSERT INTO Compra(cantidad, fecha, idComprobante, idCotizacion, estatus) values (5, '1/12/2022', '5', '5', '1')
GO
INSERT INTO Compra(cantidad, fecha, idComprobante, idCotizacion, estatus) values (6, '1/12/2022', '6', '6', '1')
GO
INSERT INTO Compra(cantidad, fecha, idComprobante, idCotizacion, estatus) values (7, '1/12/2022', '7', '7', '1')
GO
INSERT INTO Compra(cantidad, fecha, idComprobante, idCotizacion, estatus) values (8, '1/12/2022', '8', '8', '1')
GO
INSERT INTO Compra(cantidad, fecha, idComprobante, idCotizacion, estatus) values (9, '1/12/2022', '9', '9', '1')
GO
INSERT INTO Compra(cantidad, fecha, idComprobante, idCotizacion, estatus) values (10, '1/12/2022', '10', '10', '1')
GO



--Consulta
INSERT INTO Consulta(fecha, precio, nombre, idPaciente, idDoctor, estatus) values ('1/12/2022', 1, 'nombre1', '1', '1', '1')
GO
INSERT INTO Consulta(fecha, precio, nombre, idPaciente, idDoctor, estatus) values ('1/12/2022', 2, 'nombre2', '2', '2', '1')
GO
INSERT INTO Consulta(fecha, precio, nombre, idPaciente, idDoctor, estatus) values ('1/12/2022', 3, 'nombre3', '3', '3', '1')
GO
INSERT INTO Consulta(fecha, precio, nombre, idPaciente, idDoctor, estatus) values ('1/12/2022', 4, 'nombre4', '4', '4', '1')
GO
INSERT INTO Consulta(fecha, precio, nombre, idPaciente, idDoctor, estatus) values ('1/12/2022', 5, 'nombre5', '5', '5', '1')
GO
INSERT INTO Consulta(fecha, precio, nombre, idPaciente, idDoctor, estatus) values ('1/12/2022', 6, 'nombre6', '6', '6', '1')
GO
INSERT INTO Consulta(fecha, precio, nombre, idPaciente, idDoctor, estatus) values ('1/12/2022', 7, 'nombre7', '7', '7', '1')
GO
INSERT INTO Consulta(fecha, precio, nombre, idPaciente, idDoctor, estatus) values ('1/12/2022', 8, 'nombre8', '8', '8', '1')
GO
INSERT INTO Consulta(fecha, precio, nombre, idPaciente, idDoctor, estatus) values ('1/12/2022', 9, 'nombre9', '9', '9', '1')
GO
INSERT INTO Consulta(fecha, precio, nombre, idPaciente, idDoctor, estatus) values ('1/12/2022', 10, 'nombre10', '10', '10', '1')
GO

--Contrato
INSERT INTO Contrato(fecha, nombre, servicio, idEmpleado, estatus) values ('1/12/2022', 'nombre1', 'servicio1', '1', '1')
GO
INSERT INTO Contrato(fecha, nombre, servicio, idEmpleado, estatus) values ('1/12/2022', 'nombre2', 'servicio2', '2', '1')
GO
INSERT INTO Contrato(fecha, nombre, servicio, idEmpleado, estatus) values ('1/12/2022', 'nombre3', 'servicio3', '3', '1')
GO
INSERT INTO Contrato(fecha, nombre, servicio, idEmpleado, estatus) values ('1/12/2022', 'nombre4', 'servicio4', '4', '1')
GO
INSERT INTO Contrato(fecha, nombre, servicio, idEmpleado, estatus) values ('1/12/2022', 'nombre5', 'servicio5', '5', '1')
GO
INSERT INTO Contrato(fecha, nombre, servicio, idEmpleado, estatus) values ('1/12/2022', 'nombre6', 'servicio6', '6', '1')
GO
INSERT INTO Contrato(fecha, nombre, servicio, idEmpleado, estatus) values ('1/12/2022', 'nombre7', 'servicio7', '7', '1')
GO
INSERT INTO Contrato(fecha, nombre, servicio, idEmpleado, estatus) values ('1/12/2022', 'nombre8', 'servicio8', '8', '1')
GO
INSERT INTO Contrato(fecha, nombre, servicio, idEmpleado, estatus) values ('1/12/2022', 'nombre9', 'servicio9', '9', '1')
GO
INSERT INTO Contrato(fecha, nombre, servicio, idEmpleado, estatus) values ('1/12/2022','nombre10','servicio10','10','1')
GO

--Convenio
INSERT INTO Convenio(fecha, cantidad, idCliente, estatus) values ('1/12/2022', 1, '1', '1')
GO
INSERT INTO Convenio(fecha, cantidad, idCliente, estatus) values ('1/12/2022', 2, '2', '1')
GO
INSERT INTO Convenio(fecha, cantidad, idCliente, estatus) values ('1/12/2022', 3, '3', '1')
GO
INSERT INTO Convenio(fecha, cantidad, idCliente, estatus) values ('1/12/2022', 4, '4', '1')
GO
INSERT INTO Convenio(fecha, cantidad, idCliente, estatus) values ('1/12/2022', 5, '5', '1')
GO
INSERT INTO Convenio(fecha, cantidad, idCliente, estatus) values ('1/12/2022', 6, '6', '1')
GO
INSERT INTO Convenio(fecha, cantidad, idCliente, estatus) values ('1/12/2022', 7, '7', '1')
GO
INSERT INTO Convenio(fecha, cantidad, idCliente, estatus) values ('1/12/2022', 8, '8', '1')
GO
INSERT INTO Convenio(fecha, cantidad, idCliente, estatus) values ('1/12/2022', 9, '9', '1')
GO
INSERT INTO Convenio(fecha, cantidad, idCliente, estatus) values ('1/12/2022', 10, '10', '1')
GO

--Delivery
INSERT INTO Delivery(cantidad, producto, direccion, horasalida, horallegada, idSucursal, estatus) values ('Cantidad1','Producto1', 'Direccion1', '1/12/2022', '1/12/2022', '1', '1')
GO
INSERT INTO Delivery(cantidad, producto, direccion, horasalida, horallegada, idSucursal, estatus) values ('Cantidad2','Producto2', 'Direccion2', '1/12/2022', '1/12/2022', '2', '1')
GO
INSERT INTO Delivery(cantidad, producto, direccion, horasalida, horallegada, idSucursal, estatus) values ('Cantidad3','Producto3', 'Direccion3', '1/12/2022', '1/12/2022', '3', '1')
GO
INSERT INTO Delivery(cantidad, producto, direccion, horasalida, horallegada, idSucursal, estatus) values ('Cantidad4','Producto4', 'Direccion4', '1/12/2022', '1/12/2022', '4', '1')
GO
INSERT INTO Delivery(cantidad, producto, direccion, horasalida, horallegada, idSucursal, estatus) values ('Cantidad5','Producto5', 'Direccion5', '1/12/2022', '1/12/2022', '5', '1')
GO
INSERT INTO Delivery(cantidad, producto, direccion, horasalida, horallegada, idSucursal, estatus) values ('Cantidad6','Producto6', 'Direccion6', '1/12/2022', '1/12/2022', '6', '1')
GO
INSERT INTO Delivery(cantidad, producto, direccion, horasalida, horallegada, idSucursal, estatus) values ('Cantidad7','Producto7', 'Direccion7', '1/12/2022', '1/12/2022', '7', '1')
GO
INSERT INTO Delivery(cantidad, producto, direccion, horasalida, horallegada, idSucursal, estatus) values ('Cantidad8','Producto8', 'Direccion8', '1/12/2022', '1/12/2022', '8', '1')
GO
INSERT INTO Delivery(cantidad, producto, direccion, horasalida, horallegada, idSucursal, estatus) values ('Cantidad9','Producto9', 'Direccion9', '1/12/2022', '1/12/2022', '9', '1')
GO
INSERT INTO Delivery(cantidad, producto, direccion, horasalida, horallegada, idSucursal, estatus) values ('Cantidad10','Producto10', 'Direccion10', '1/12/2022', '1/12/2022', '10', '1')
GO


--Estacionamiento
INSERT INTO Estacionamiento(numero, numerodiscapacitados, idSucursal, estatus) values(1,  1, '1', '1')
GO
INSERT INTO Estacionamiento(numero, numerodiscapacitados, idSucursal, estatus) values(2,  2, '2', '1')
GO
INSERT INTO Estacionamiento(numero, numerodiscapacitados, idSucursal, estatus) values(3,  3, '3', '1')
GO
INSERT INTO Estacionamiento(numero, numerodiscapacitados, idSucursal, estatus) values(4,  4, '4', '1')
GO
INSERT INTO Estacionamiento(numero, numerodiscapacitados, idSucursal, estatus) values(5,  5, '5', '1')
GO
INSERT INTO Estacionamiento(numero, numerodiscapacitados, idSucursal, estatus) values(6,  6, '6', '1')
GO
INSERT INTO Estacionamiento(numero, numerodiscapacitados, idSucursal, estatus) values(7,  7, '7', '1')
GO
INSERT INTO Estacionamiento(numero, numerodiscapacitados, idSucursal, estatus) values(8,  8, '8', '1')
GO
INSERT INTO Estacionamiento(numero, numerodiscapacitados, idSucursal, estatus) values(9,  9, '9', '1')
GO
INSERT INTO Estacionamiento(numero, numerodiscapacitados, idSucursal, estatus) values(10,  10, '10', '1')
GO

--FacturaCliente
INSERT INTO FacturaCliente(fecha, remitente, cantidad, idContador, idCliente, estatus) values('1/12/2022', 'remitente1', 1, '1', '1', '1')
GO
INSERT INTO FacturaCliente(fecha, remitente, cantidad, idContador, idCliente, estatus) values('1/12/2022', 'remitente2', 2, '2', '2', '1')
GO
INSERT INTO FacturaCliente(fecha, remitente, cantidad, idContador, idCliente, estatus) values('1/12/2022', 'remitente3', 3, '3', '3', '1')
GO
INSERT INTO FacturaCliente(fecha, remitente, cantidad, idContador, idCliente, estatus) values('1/12/2022', 'remitente4', 4, '4', '4', '1')
GO
INSERT INTO FacturaCliente(fecha, remitente, cantidad, idContador, idCliente, estatus) values('1/12/2022', 'remitente5', 5, '5', '5', '1')
GO
INSERT INTO FacturaCliente(fecha, remitente, cantidad, idContador, idCliente, estatus) values('1/12/2022', 'remitente6', 6, '6', '6', '1')
GO
INSERT INTO FacturaCliente(fecha, remitente, cantidad, idContador, idCliente, estatus) values('1/12/2022', 'remitente7', 7, '7', '7', '1')
GO
INSERT INTO FacturaCliente(fecha, remitente, cantidad, idContador, idCliente, estatus) values('1/12/2022', 'remitente8', 8, '8', '8', '1')
GO
INSERT INTO FacturaCliente(fecha, remitente, cantidad, idContador, idCliente, estatus) values('1/12/2022', 'remitente9', 9, '9', '9', '1')
GO
INSERT INTO FacturaCliente(fecha, remitente, cantidad, idContador, idCliente, estatus) values('1/12/2022', 'remitente10', 10, '10', '10', '1')
GO

--FacturaProveedor
INSERT INTO FacturaProveedor(fecha, remitente, cantidad, idContador,idProveedor, estatus) values('1/12/2022', 'remitente1', 1, '1', '1', '1')
GO
INSERT INTO FacturaProveedor(fecha, remitente, cantidad, idContador, idProveedor, estatus) values('1/12/2022', 'remitente2', 2, '2', '2', '1')
GO
INSERT INTO FacturaProveedor(fecha, remitente, cantidad, idContador, idProveedor, estatus) values('1/12/2022', 'remitente3', 3, '3', '3', '1')
GO
INSERT INTO FacturaProveedor(fecha, remitente, cantidad, idContador, idProveedor, estatus) values('1/12/2022', 'remitente4', 4, '4', '4', '1')
GO
INSERT INTO FacturaProveedor(fecha, remitente, cantidad, idContador, idProveedor, estatus) values('1/12/2022', 'remitente5', 5, '5', '5', '1')
GO
INSERT INTO FacturaProveedor(fecha, remitente, cantidad, idContador, idProveedor, estatus) values('1/12/2022', 'remitente6', 6, '6', '6', '1')
GO
INSERT INTO FacturaProveedor(fecha, remitente, cantidad, idContador, idProveedor,estatus) values('1/12/2022', 'remitente7', 7, '7', '7', '1')
GO
INSERT INTO FacturaProveedor(fecha, remitente, cantidad, idContador, idProveedor, estatus) values('1/12/2022', 'remitente8', 8, '8', '8','1')
GO
INSERT INTO FacturaProveedor(fecha, remitente, cantidad, idContador, idProveedor, estatus) values('1/12/2022', 'remitente9', 9, '9', '9','1')
GO
INSERT INTO FacturaProveedor(fecha, remitente, cantidad, idContador, idProveedor, estatus) values('1/12/2022', 'remitente10', 10, '10', '10','1')
GO

--HorarioTrabajo
INSERT INTO HorarioTrabajo(entrada, salida, horasextras, idEmpleado, estatus) values('8:50', '8:50', 'horaextra1', '1', '1')
GO
INSERT INTO HorarioTrabajo(entrada, salida, horasextras, idEmpleado, estatus) values('8:50', '8:50', 'horaextra2', '2', '1')
GO
INSERT INTO HorarioTrabajo(entrada, salida, horasextras, idEmpleado, estatus) values('8:50', '8:50', 'horaextra3', '3', '1')
GO
INSERT INTO HorarioTrabajo(entrada, salida, horasextras, idEmpleado, estatus) values('8:50', '8:50', 'horaextra4', '4', '1')
GO
INSERT INTO HorarioTrabajo(entrada, salida, horasextras, idEmpleado, estatus) values('8:50', '8:50', 'horaextra5', '5', '1')
GO
INSERT INTO HorarioTrabajo(entrada, salida, horasextras, idEmpleado, estatus) values('8:50', '8:50', 'horaextra6', '6', '1')
GO
INSERT INTO HorarioTrabajo(entrada, salida, horasextras, idEmpleado, estatus) values('8:50', '8:50', 'horaextra7', '7', '1')
GO
INSERT INTO HorarioTrabajo(entrada, salida, horasextras, idEmpleado, estatus) values('8:50', '8:50', 'horaextra8', '8', '1')
GO
INSERT INTO HorarioTrabajo(entrada, salida, horasextras, idEmpleado, estatus) values('8:50', '8:50', 'horaextra9', '9', '1')
GO
INSERT INTO HorarioTrabajo(entrada, salida, horasextras, idEmpleado, estatus) values('8:50', '8:50', 'horaextra10', '10', '1')
GO

--Instrumento
INSERT INTO Instrumento(nombre, tamaño, marca, idDoctor, estatus) values('nombre1', 'tamaño1', 'marca1','1', '1')
GO
INSERT INTO Instrumento(nombre, tamaño,marca, idDoctor, estatus) values('nombre2', 'tamaño2', 'marca2', '2', '1')
GO
INSERT INTO Instrumento(nombre, tamaño, marca,idDoctor, estatus) values('nombre3', 'tamaño3', 'marca3','3', '1')
GO
INSERT INTO Instrumento(nombre, tamaño, marca,idDoctor, estatus) values('nombre4', 'tamaño4', 'marca4','4', '1')
GO
INSERT INTO Instrumento(nombre, tamaño, marca,idDoctor, estatus) values('nombre5', 'tamaño5', 'marca5','5', '1')
GO
INSERT INTO Instrumento(nombre, tamaño, marca,idDoctor, estatus) values('nombre6', 'tamaño6', 'marca6','6', '1')
GO
INSERT INTO Instrumento(nombre, tamaño, marca, idDoctor, estatus) values('nombre7', 'tamaño7', 'marca7','7', '1')
GO
INSERT INTO Instrumento(nombre, tamaño, marca ,idDoctor, estatus) values('nombre8', 'tamaño8','marca8', '8', '1')
GO
INSERT INTO Instrumento(nombre, tamaño, marca ,idDoctor, estatus) values('nombre9', 'tamaño9','marca9', '9', '1')
GO
INSERT INTO Instrumento(nombre, tamaño,marca, idDoctor, estatus) values('nombre10', 'tamaño10','marca10', '10', '1')
GO

--Mantenimiento
INSERT INTO Mantenimiento(fecha, costo, persona, idSucursal, estatus) values('1/12/2022','costo1','persona1', '1', '1')
GO
INSERT INTO Mantenimiento(fecha, costo, persona, idSucursal, estatus) values('1/12/2022','costo2','persona2', '2', '1')
GO
INSERT INTO Mantenimiento(fecha, costo, persona, idSucursal, estatus) values('1/12/2022','costo3','persona3', '3', '1')
GO
INSERT INTO Mantenimiento(fecha, costo, persona, idSucursal, estatus) values('1/12/2022','costo4','persona4', '4', '1')
GO
INSERT INTO Mantenimiento(fecha, costo, persona, idSucursal, estatus) values('1/12/2022','costo5','persona5', '5', '1')
GO
INSERT INTO Mantenimiento(fecha, costo, persona, idSucursal, estatus) values('1/12/2022','costo6','persona6', '6', '1')
GO
INSERT INTO Mantenimiento(fecha, costo, persona, idSucursal, estatus) values('1/12/2022','costo7','persona7', '7', '1')
GO
INSERT INTO Mantenimiento(fecha, costo, persona, idSucursal, estatus) values('1/12/2022','costo8','persona8', '8', '1')
GO
INSERT INTO Mantenimiento(fecha, costo, persona, idSucursal, estatus) values('1/12/2022','costo9','persona9', '9', '1')
GO
INSERT INTO Mantenimiento(fecha, costo, persona, idSucursal, estatus) values('1/12/2022','costo10','persona10', '10', '1')
GO



--Marketing
INSERT INTO Marketing(tipo, lugar, idSucursal, estatus) values('tipo1','lugar1', '1', '1')
GO
INSERT INTO Marketing(tipo, lugar, idSucursal, estatus) values('tipo2','lugar2', '2', '1')
GO
INSERT INTO Marketing(tipo, lugar, idSucursal, estatus) values('tipo3','lugar3', '3', '1')
GO
INSERT INTO Marketing(tipo, lugar, idSucursal, estatus) values('tipo4','lugar4', '4', '1')
GO
INSERT INTO Marketing(tipo, lugar, idSucursal, estatus) values('tipo5','lugar5', '5', '1')
GO
INSERT INTO Marketing(tipo, lugar, idSucursal, estatus) values('tipo6','lugar6', '6', '1')
GO
INSERT INTO Marketing(tipo, lugar, idSucursal, estatus) values('tipo7','lugar7', '7', '1')
GO
INSERT INTO Marketing(tipo, lugar, idSucursal, estatus) values('tipo8','lugar8', '8', '1')
GO
INSERT INTO Marketing(tipo, lugar, idSucursal, estatus) values('tipo9','lugar9', '9', '1')
GO
INSERT INTO Marketing(tipo, lugar, idSucursal, estatus) values('tipo10','lugar10', '10', '1')
GO



--Medicamento
INSERT INTO Medicamento(nombre, existencia, salida, idDoctor, estatus) values('nombre1',1, 1, '1', '1')
GO
INSERT INTO Medicamento(nombre, existencia, salida, idDoctor, estatus) values('nombre2',2, 2, '1', '1')
GO
INSERT INTO Medicamento(nombre, existencia, salida, idDoctor, estatus) values('nombre3',3, 3, '1', '1')
GO
INSERT INTO Medicamento(nombre, existencia, salida, idDoctor, estatus) values('nombre4',4, 4, '1', '1')
GO
INSERT INTO Medicamento(nombre, existencia, salida, idDoctor, estatus) values('nombre5',5, 5, '1', '1')
GO
INSERT INTO Medicamento(nombre, existencia, salida, idDoctor, estatus) values('nombre6',6, 6, '1', '1')
GO
INSERT INTO Medicamento(nombre, existencia, salida, idDoctor, estatus) values('nombre7',7, 7, '1', '1')
GO
INSERT INTO Medicamento(nombre, existencia, salida, idDoctor, estatus) values('nombre8',8, 8, '1', '1')
GO
INSERT INTO Medicamento(nombre, existencia, salida, idDoctor, estatus) values('nombre9',9, 9, '1', '1')
GO
INSERT INTO Medicamento(nombre, existencia, salida, idDoctor, estatus) values('nombre10',10, 10, '1', '1')
GO

	

--Mobiliario
INSERT INTO Mobiliario(nombre, cantidad, material, idSucursal, estatus) values('nombre1', 1, 'material1', '1', '1')
GO
INSERT INTO Mobiliario(nombre, cantidad, material, idSucursal, estatus) values('nombre2', 2, 'material2', '2', '1')
GO
INSERT INTO Mobiliario(nombre, cantidad, material, idSucursal, estatus) values('nombre3', 3, 'material3', '3', '1')
GO
INSERT INTO Mobiliario(nombre, cantidad, material, idSucursal, estatus) values('nombre4', 4, 'material4', '4', '1')
GO
INSERT INTO Mobiliario(nombre, cantidad, material, idSucursal, estatus) values('nombre5', 5, 'material5', '5', '1')
GO
INSERT INTO Mobiliario(nombre, cantidad, material, idSucursal, estatus) values('nombre6', 6, 'material6', '6', '1')
GO
INSERT INTO Mobiliario(nombre, cantidad, material, idSucursal, estatus) values('nombre7', 7, 'material7', '7', '1')
GO
INSERT INTO Mobiliario(nombre, cantidad, material, idSucursal, estatus) values('nombre8', 8, 'material8', '8', '1')
GO
INSERT INTO Mobiliario(nombre, cantidad, material, idSucursal, estatus) values('nombre9', 9, 'material9', '9', '1')
GO
INSERT INTO Mobiliario(nombre, cantidad, material, idSucursal, estatus) values('nombre10', 10, 'material10', '10', '1')
GO





--PagoServicio
INSERT INTO PagoServicio(catidad, servicio, fecha, idSucursal, estatus) values(1, 'servicio1', '1/12/2022', '1', '1')
GO
INSERT INTO PagoServicio(catidad, servicio, fecha, idSucursal, estatus) values(2, 'servicio2', '1/12/2022', '2', '1')
GO
INSERT INTO PagoServicio(catidad, servicio, fecha, idSucursal, estatus) values(3, 'servicio3', '1/12/2022', '3', '1')
GO
INSERT INTO PagoServicio(catidad, servicio, fecha, idSucursal, estatus) values(4, 'servicio4', '1/12/2022', '4', '1')
GO
INSERT INTO PagoServicio(catidad, servicio, fecha, idSucursal, estatus) values(5, 'servicio5', '1/12/2022', '5', '1')
GO
INSERT INTO PagoServicio(catidad, servicio, fecha, idSucursal, estatus) values(6, 'servicio6', '1/12/2022', '6', '1')
GO
INSERT INTO PagoServicio(catidad, servicio, fecha, idSucursal, estatus) values(7, 'servicio7', '1/12/2022', '7', '1')
GO
INSERT INTO PagoServicio(catidad, servicio, fecha, idSucursal, estatus) values(8, 'servicio8', '1/12/2022', '8', '1')
GO
INSERT INTO PagoServicio(catidad, servicio, fecha, idSucursal, estatus) values(9, 'servicio9', '1/12/2022', '9', '1')
GO
INSERT INTO PagoServicio(catidad, servicio, fecha, idSucursal, estatus) values(10, 'servicio10', '1/12/2022', '10', '1')
GO

--Paquete
INSERT INTO Paquete(numero, peso, remitente, destinatario, idEnvio, idPedido, idTransporte, estatus) values(1, 'peso1', 'remitente1', 'destinatario1', '1', '1', '1', '1')
GO
INSERT INTO Paquete(numero, peso, remitente, destinatario, idEnvio, idPedido, idTransporte, estatus) values(2, 'peso2', 'remitente2', 'destinatario2', '2', '2', '1', '1')
GO
INSERT INTO Paquete(numero, peso, remitente, destinatario, idEnvio, idPedido, idTransporte, estatus) values(3, 'peso3', 'remitente3', 'destinatario3', '3', '3', '1', '1')
GO
INSERT INTO Paquete(numero, peso, remitente, destinatario, idEnvio, idPedido, idTransporte, estatus) values(4, 'peso4', 'remitente4', 'destinatario4', '4', '4', '1', '1')
GO
INSERT INTO Paquete(numero, peso, remitente, destinatario, idEnvio, idPedido, idTransporte, estatus) values(5, 'peso5', 'remitente5', 'destinatario5', '5', '5', '1', '1')
GO
INSERT INTO Paquete(numero, peso, remitente, destinatario, idEnvio, idPedido, idTransporte, estatus) values(6, 'peso6', 'remitente6', 'destinatario6', '6', '6', '1', '1')
GO
INSERT INTO Paquete(numero, peso, remitente, destinatario, idEnvio, idPedido, idTransporte, estatus) values(7, 'peso7', 'remitente7', 'destinatario7', '7', '7', '1', '1')
GO
INSERT INTO Paquete(numero, peso, remitente, destinatario, idEnvio, idPedido, idTransporte, estatus) values(8, 'peso8', 'remitente8', 'destinatario8', '8', '8', '1', '1')
GO
INSERT INTO Paquete(numero, peso, remitente, destinatario, idEnvio, idPedido, idTransporte, estatus) values(9, 'peso9', 'remitente9', 'destinatario9', '9', '9', '1', '1')
GO
INSERT INTO Paquete(numero, peso, remitente, destinatario, idEnvio, idPedido, idTransporte, estatus) values(10, 'peso10', 'remitente10', 'destinatario10', '10', '10', '1', '1')
GO





--Producto
INSERT INTO Producto(nombre, precio, cantidad, idPedido, idMateriaPrima, idApartado, idEnvio, idDevolucion, idCompra, estatus) values('nombre1', 1, 1, '1', '1', '1', '1', '1', '1', '1')
GO
INSERT INTO Producto(nombre, precio, cantidad, idPedido, idMateriaPrima, idApartado, idEnvio, idDevolucion, idCompra, estatus) values('nombre2', 2, 2, '2', '2', '2', '2', '2', '2', '1')
GO
INSERT INTO Producto(nombre, precio, cantidad, idPedido, idMateriaPrima, idApartado, idEnvio, idDevolucion, idCompra, estatus) values('nombre3', 3, 3, '3', '3', '3', '3', '3', '3', '1')
GO
INSERT INTO Producto(nombre, precio, cantidad, idPedido, idMateriaPrima, idApartado, idEnvio, idDevolucion, idCompra, estatus) values('nombre4', 4, 4, '4', '4', '4', '4', '4', '4', '1')
GO
INSERT INTO Producto(nombre, precio, cantidad, idPedido, idMateriaPrima, idApartado, idEnvio, idDevolucion, idCompra, estatus) values('nombre5', 5, 5, '5', '5', '5', '5', '5', '5', '1')
GO
INSERT INTO Producto(nombre, precio, cantidad, idPedido, idMateriaPrima, idApartado, idEnvio, idDevolucion, idCompra, estatus) values('nombre6', 6, 6, '6', '6', '6', '6', '6', '6', '1')
GO
INSERT INTO Producto(nombre, precio, cantidad, idPedido, idMateriaPrima, idApartado, idEnvio, idDevolucion, idCompra, estatus) values('nombre7', 7, 7, '7', '7', '7', '7', '7', '7', '1')
GO
INSERT INTO Producto(nombre, precio, cantidad, idPedido, idMateriaPrima, idApartado, idEnvio, idDevolucion, idCompra, estatus) values('nombre8', 8, 8, '8', '8', '8', '8', '8', '8', '1')
GO
INSERT INTO Producto(nombre, precio, cantidad, idPedido, idMateriaPrima, idApartado, idEnvio, idDevolucion, idCompra, estatus) values('nombre9', 9, 9, '9', '9', '9', '9', '9', '9', '1')
GO
INSERT INTO Producto(nombre, precio, cantidad, idPedido, idMateriaPrima, idApartado, idEnvio, idDevolucion, idCompra, estatus) values('nombre10', 10, 10, '10', '10', '10', '10', '10', '1', '1')
GO


--Puesto
INSERT INTO Puesto(puesto, numero, idEmpleado, estatus) values('puesto1', 1, '1', '1')
GO
INSERT INTO Puesto(puesto, numero, idEmpleado, estatus) values('puesto2', 2, '2', '1')
GO
INSERT INTO Puesto(puesto, numero, idEmpleado, estatus) values('puesto3', 3, '3', '1')
GO
INSERT INTO Puesto(puesto, numero, idEmpleado, estatus) values('puesto4', 4, '4', '1')
GO
INSERT INTO Puesto(puesto, numero, idEmpleado, estatus) values('puesto5', 5, '5', '1')
GO
INSERT INTO Puesto(puesto, numero, idEmpleado, estatus) values('puesto6', 6, '6', '1')
GO
INSERT INTO Puesto(puesto, numero, idEmpleado, estatus) values('puesto7', 7, '7', '1')
GO
INSERT INTO Puesto(puesto, numero, idEmpleado, estatus) values('puesto8', 8, '8', '1')
GO
INSERT INTO Puesto(puesto, numero, idEmpleado, estatus) values('puesto9', 9, '9', '1')
GO
INSERT INTO Puesto(puesto, numero, idEmpleado, estatus) values('puesto10', 10, '10', '1')
GO

--Receta
INSERT INTO Receta(descripcion, medicamento, cantidad, idDoctor, idPaciente, estatus) values('descrpcion1', 'medicamento1', 1, '1', '1', '1')
GO
INSERT INTO Receta(descripcion, medicamento, cantidad, idDoctor, idPaciente, estatus) values('descrpcion2', 'medicamento2', 2, '2', '2', '1')
GO
INSERT INTO Receta(descripcion, medicamento, cantidad, idDoctor, idPaciente, estatus) values('descrpcion3', 'medicamento3', 3, '3', '3', '1')
GO
INSERT INTO Receta(descripcion, medicamento, cantidad, idDoctor, idPaciente, estatus) values('descrpcion4', 'medicamento4', 4, '4', '4', '1')
GO
INSERT INTO Receta(descripcion, medicamento, cantidad, idDoctor, idPaciente, estatus) values('descrpcion5', 'medicamento5', 5, '5', '5', '1')
GO
INSERT INTO Receta(descripcion, medicamento, cantidad, idDoctor, idPaciente, estatus) values('descrpcion6', 'medicamento6', 6, '6', '6', '1')
GO
INSERT INTO Receta(descripcion, medicamento, cantidad, idDoctor, idPaciente, estatus) values('descrpcion7', 'medicamento7', 7, '7', '7', '1')
GO
INSERT INTO Receta(descripcion, medicamento, cantidad, idDoctor, idPaciente, estatus) values('descrpcion8', 'medicamento8', 8, '8', '8', '1')
GO
INSERT INTO Receta(descripcion, medicamento, cantidad, idDoctor, idPaciente, estatus) values('descrpcion9', 'medicamento9', 9, '9', '9', '1')
GO
INSERT INTO Receta(descripcion, medicamento, cantidad, idDoctor, idPaciente, estatus) values('descrpcion10', 'medicamento10', 10, '10', '10', '1')
GO

--Representante
INSERT INTO Representante(nombre, apellidoPaterno, apellidoMaterno, calle, numero, ciudad, telefono, idEmpresa, estatus) values('nombre1', 'apellidop1', 'apellidom1', 'calle1', 1, 'ciudad1', 1, '1', '1')
GO
INSERT INTO Representante(nombre, apellidoPaterno, apellidoMaterno, calle, numero, ciudad, telefono, idEmpresa, estatus) values('nombre2', 'apellidop2', 'apellidom2', 'calle2', 2, 'ciudad2', 2, '2', '1')
GO
INSERT INTO Representante(nombre, apellidoPaterno, apellidoMaterno, calle, numero, ciudad, telefono, idEmpresa, estatus) values('nombre3', 'apellidop3', 'apellidom3', 'calle3', 3, 'ciudad3', 3, '3', '1')
GO
INSERT INTO Representante(nombre, apellidoPaterno, apellidoMaterno, calle, numero, ciudad, telefono, idEmpresa, estatus) values('nombre4', 'apellidop4', 'apellidom4', 'calle4', 4, 'ciudad4', 4, '4', '1')
GO
INSERT INTO Representante(nombre, apellidoPaterno, apellidoMaterno, calle, numero, ciudad, telefono, idEmpresa, estatus) values('nombre5', 'apellidop5', 'apellidom5', 'calle5', 5, 'ciudad5', 5, '5', '1')
GO
INSERT INTO Representante(nombre, apellidoPaterno, apellidoMaterno, calle, numero, ciudad, telefono, idEmpresa, estatus) values('nombre6', 'apellidop6', 'apellidom6', 'calle6', 6, 'ciudad6', 6, '6', '1')
GO
INSERT INTO Representante(nombre, apellidoPaterno, apellidoMaterno, calle, numero, ciudad, telefono, idEmpresa, estatus) values('nombre7', 'apellidop7', 'apellidom7', 'calle7', 7, 'ciudad7', 7, '7', '1')
GO
INSERT INTO Representante(nombre, apellidoPaterno, apellidoMaterno, calle, numero, ciudad, telefono, idEmpresa, estatus) values('nombre8', 'apellidop8', 'apellidom8', 'calle8', 8, 'ciudad8', 8, '8', '1')
GO
INSERT INTO Representante(nombre, apellidoPaterno, apellidoMaterno, calle, numero, ciudad, telefono, idEmpresa, estatus) values('nombre9', 'apellidop9', 'apellidom9', 'calle9', 9, 'ciudad9', 9, '9', '1')
GO
INSERT INTO Representante(nombre, apellidoPaterno, apellidoMaterno, calle, numero, ciudad, telefono, idEmpresa, estatus) values('nombre10', 'apellidop10', 'apellidom9', 'calle9', 10, 'ciudad10', 10, '10', '1')
GO

SELECT *FROM Apartado
--ApartadoProducto
INSERT INTO ApartadoProducto(cantidad, idApartado, idProducto, estatus) values(1, '1', '1', '1')
GO
INSERT INTO ApartadoProducto(cantidad, idApartado, idProducto, estatus) values(1, '2', '2', '2')
GO
INSERT INTO ApartadoProducto(cantidad, idApartado, idProducto, estatus) values(3, '3', '3', '3')
GO
INSERT INTO ApartadoProducto(cantidad, idApartado,  idProducto, estatus) values(4, '4', '4', '4')
GO
INSERT INTO ApartadoProducto(cantidad, idApartado, idProducto,  estatus) values(5, '5', '5', '5')
GO
INSERT INTO ApartadoProducto(cantidad, idApartado, idProducto, estatus) values(6,'6', '6', '6')
GO
INSERT INTO ApartadoProducto(cantidad, idApartado, idProducto, estatus) values(7, '7', '7', '7')
GO
INSERT INTO ApartadoProducto(cantidad, idApartado,  idProducto, estatus) values(8, '8', '8', '8')
GO
INSERT INTO ApartadoProducto(cantidad, idApartado, idProducto, estatus) values(9, '9', '9', '9')
GO
INSERT INTO ApartadoProducto(cantidad, idApartado, idProducto, estatus) values(10, '10', '10', '10')
GO

--ClienteMetodoPago
INSERT INTO ClienteMetodoPago(idCliente, idMetodoPago, estatus) values('1', '1', '1')
GO
INSERT INTO ClienteMetodoPago(idCliente, idMetodoPago, estatus) values('2', '2', '1')
GO
INSERT INTO ClienteMetodoPago(idCliente, idMetodoPago, estatus) values('3', '3', '1')
GO
INSERT INTO ClienteMetodoPago(idCliente, idMetodoPago, estatus) values('4', '4', '1')
GO
INSERT INTO ClienteMetodoPago(idCliente, idMetodoPago, estatus) values('5', '5', '1')
GO
INSERT INTO ClienteMetodoPago(idCliente, idMetodoPago, estatus) values('6', '6', '1')
GO
INSERT INTO ClienteMetodoPago(idCliente, idMetodoPago, estatus) values('7', '7', '1')
GO
INSERT INTO ClienteMetodoPago(idCliente, idMetodoPago, estatus) values('8', '8', '1')
GO
INSERT INTO ClienteMetodoPago(idCliente, idMetodoPago, estatus) values('9', '9', '1')
GO
INSERT INTO ClienteMetodoPago(idCliente, idMetodoPago, estatus) values('10', '10', '1')
GO

--CompraCliente
INSERT INTO CompraCliente(idCompra, idCliente, estatus) values('1', '1', '1')
GO
INSERT INTO CompraCliente(idCompra, idCliente, estatus) values('2', '2', '1')
GO
INSERT INTO CompraCliente(idCompra, idCliente, estatus) values('3', '3', '1')
GO
INSERT INTO CompraCliente(idCompra, idCliente, estatus) values('4', '4', '1')
GO
INSERT INTO CompraCliente(idCompra, idCliente, estatus) values('5', '5', '1')
GO
INSERT INTO CompraCliente(idCompra, idCliente, estatus) values('6', '6', '1')
GO
INSERT INTO CompraCliente(idCompra, idCliente, estatus) values('7', '7', '1')
GO
INSERT INTO CompraCliente(idCompra, idCliente, estatus) values('8', '8', '1')
GO
INSERT INTO CompraCliente(idCompra, idCliente, estatus) values('9', '9', '1')
GO
INSERT INTO CompraCliente(idCompra, idCliente, estatus) values('10', '10', '1')
GO

--EmpleadoCapacitacion
INSERT INTO EmpleadoCapacitacion(idEmpleado, idCapacitacion, estatus) values('1', '1', '1')
GO
INSERT INTO EmpleadoCapacitacion(idEmpleado, idCapacitacion, estatus) values('2', '2', '1')
GO
INSERT INTO EmpleadoCapacitacion(idEmpleado, idCapacitacion, estatus) values('3', '3', '1')
GO
INSERT INTO EmpleadoCapacitacion(idEmpleado, idCapacitacion, estatus) values('4', '4', '1')
GO
INSERT INTO EmpleadoCapacitacion(idEmpleado, idCapacitacion, estatus) values('5', '5', '1')
GO
INSERT INTO EmpleadoCapacitacion(idEmpleado, idCapacitacion, estatus) values('6', '6', '1')
GO
INSERT INTO EmpleadoCapacitacion(idEmpleado, idCapacitacion, estatus) values('7', '7', '1')
GO
INSERT INTO EmpleadoCapacitacion(idEmpleado, idCapacitacion, estatus) values('8', '8', '1')
GO
INSERT INTO EmpleadoCapacitacion(idEmpleado, idCapacitacion, estatus) values('9', '9', '1')
GO
INSERT INTO EmpleadoCapacitacion(idEmpleado, idCapacitacion, estatus) values('10', '10', '1')
GO

--MarcaProducto
INSERT INTO MarcaProducto(idMarca, idProducto, estatus) values('1', '1', '1')
GO
INSERT INTO MarcaProducto(idMarca, idProducto, estatus) values('2', '2', '1')
GO
INSERT INTO MarcaProducto(idMarca, idProducto, estatus) values('3', '3', '1')
GO
INSERT INTO MarcaProducto(idMarca, idProducto, estatus) values('4', '4', '1')
GO
INSERT INTO MarcaProducto(idMarca, idProducto, estatus) values('5', '5', '1')
GO
INSERT INTO MarcaProducto(idMarca, idProducto, estatus) values('6', '6', '1')
GO
INSERT INTO MarcaProducto(idMarca, idProducto, estatus) values('7', '7', '1')
GO
INSERT INTO MarcaProducto(idMarca, idProducto, estatus) values('8', '8', '1')
GO
INSERT INTO MarcaProducto(idMarca, idProducto, estatus) values('9', '9', '1')
GO
INSERT INTO MarcaProducto(idMarca, idProducto, estatus) values('10', '10', '1')
GO

--ProductoOferta
INSERT INTO ProductoOferta(idProducto, idOferta, estatus) values('1', '1', '1')
GO
INSERT INTO ProductoOferta(idProducto, idOferta, estatus) values('2', '2', '1')
GO
INSERT INTO ProductoOferta(idProducto, idOferta, estatus) values('3', '3', '1')
GO
INSERT INTO ProductoOferta(idProducto, idOferta, estatus) values('4', '4', '1')
GO
INSERT INTO ProductoOferta(idProducto, idOferta, estatus) values('5', '5', '1')
GO
INSERT INTO ProductoOferta(idProducto, idOferta, estatus) values('6', '6', '1')
GO
INSERT INTO ProductoOferta(idProducto, idOferta, estatus) values('7', '7', '1')
GO
INSERT INTO ProductoOferta(idProducto, idOferta, estatus) values('8', '8', '1')
GO
INSERT INTO ProductoOferta(idProducto, idOferta, estatus) values('9', '9', '1')
GO
INSERT INTO ProductoOferta(idProducto, idOferta, estatus) values('10', '10', '1')
GO

--ProductoVenta
INSERT INTO ProductoVenta(idProducto, idVenta, estatus) values('1', '1', '1')
GO
INSERT INTO ProductoVenta(idProducto, idVenta, estatus) values('2', '2', '1')
GO
INSERT INTO ProductoVenta(idProducto, idVenta, estatus) values('3', '3', '1')
GO
INSERT INTO ProductoVenta(idProducto, idVenta, estatus) values('4', '4', '1')
GO
INSERT INTO ProductoVenta(idProducto, idVenta, estatus) values('5', '5', '1')
GO
INSERT INTO ProductoVenta(idProducto, idVenta, estatus) values('6', '6', '1')
GO
INSERT INTO ProductoVenta(idProducto, idVenta, estatus) values('7', '7', '1')
GO
INSERT INTO ProductoVenta(idProducto, idVenta, estatus) values('8', '8', '1')
GO
INSERT INTO ProductoVenta(idProducto, idVenta, estatus) values('9', '9', '1')
GO
INSERT INTO ProductoVenta(idProducto, idVenta, estatus) values('10', '10', '1')
GO

--SucursalEmpleado
INSERT INTO SucursalEmpleado(idSucursal, idEmpleado, estatus) values('1', '1', '1')
GO
INSERT INTO SucursalEmpleado(idSucursal, idEmpleado, estatus) values('2', '2', '1')
GO
INSERT INTO SucursalEmpleado(idSucursal, idEmpleado, estatus) values('3', '3', '1')
GO
INSERT INTO SucursalEmpleado(idSucursal, idEmpleado, estatus) values('4', '4', '1')
GO
INSERT INTO SucursalEmpleado(idSucursal, idEmpleado, estatus) values('5', '5', '1')
GO
INSERT INTO SucursalEmpleado(idSucursal, idEmpleado, estatus) values('6', '6', '1')
GO
INSERT INTO SucursalEmpleado(idSucursal, idEmpleado, estatus) values('7', '7', '1')
GO
INSERT INTO SucursalEmpleado(idSucursal, idEmpleado, estatus) values('8', '8', '1')
GO
INSERT INTO SucursalEmpleado(idSucursal, idEmpleado, estatus) values('9', '9', '1')
GO
INSERT INTO SucursalEmpleado(idSucursal, idEmpleado, estatus) values('10', '10', '1')
GO

--Agenda
SELECT *FROM Agenda
UPDATE Agenda SET nombre = 'nombre2' WHERE idAgenda = 1
GO
SELECT *FROM Agenda
--DELETE FROM Apartado WHERE idApartado = 1
--GO
SELECT *FROM Agenda


--Apartado
SELECT *FROM Apartado
UPDATE Apartado SET nombre = 'Apartado1.0' WHERE idApartado = 1
GO
SELECT *FROM Apartado
--DELETE FROM Apartado WHERE idApartado = 1
--GO
SELECT *FROM Apartado

--Bodega
SELECT *FROM Bodega
UPDATE Bodega SET nombre = 'Bodega1.0' WHERE idBodega = 1
GO
SELECT *FROM Bodega
DELETE FROM Bodega WHERE idBodega = 1
GO
SELECT *FROM Bodega

--Caja
SELECT *FROM Caja
UPDATE Caja SET numer = '2' WHERE idCaja = 1
GO
SELECT *FROM Caja
DELETE FROM Caja WHERE idCaja = 1
GO
SELECT *FROM Caja

--Capacitacion
SELECT *FROM Capacitacion
UPDATE Capacitacion SET nombre = 'Capacitacion1.0' WHERE idCapacitacion = 1
GO
SELECT *FROM Capacitacion
--DELETE FROM Capacitacion WHERE idCapacitacion = 1
--GO
SELECT *FROM Capacitacion

--Cita
SELECT *FROM Cita
UPDATE Cita SET fecha = '2/12/2002' WHERE idCita = 1
GO
SELECT *FROM Cita
DELETE FROM Cita WHERE idCita = 1
GO
SELECT *FROM Cita

--Cliente
SELECT *FROM Cliente
UPDATE Cliente SET nombre = 'Apartado1.0' WHERE idCliente = 1
GO
SELECT *FROM Cliente
--DELETE FROM Cliente WHERE idCliente = 2
--GO
SELECT *FROM Cliente

--Compra
SELECT *FROM Compra
UPDATE Compra SET cantidad = '2' WHERE idCompra = 1
GO
SELECT *FROM Compra
--DELETE FROM Compra WHERE idCompra = 1
--GO
SELECT *FROM Compra

--Comprobante
SELECT *FROM Comprobante
UPDATE Comprobante SET cantidad = '2' WHERE idComprobante = 1
GO
SELECT *FROM Comprobante
--DELETE FROM Comprobante WHERE idComprobante = 1
--GO
SELECT *FROM Comprobante

--Consulta
SELECT *FROM Consulta
UPDATE Consulta SET nombre = 'nombre1-0' WHERE idConsulta = 1
GO
SELECT *FROM Consulta
DELETE FROM Consulta WHERE idConsulta = 1
GO
SELECT *FROM Consulta

--Contador
SELECT *FROM Contador
UPDATE Contador SET nombre = 'contador1.0' WHERE idContador = 1
GO
SELECT *FROM Contador
--DELETE FROM Contador WHERE idContador = 1
--GO
SELECT *FROM Contador

--Contrato
SELECT *FROM Contrato
UPDATE Contrato SET nombre = 'nombre1.0' WHERE idContrato = 1
GO
SELECT *FROM Contrato
DELETE FROM Contrato WHERE idContrato = 1
GO
SELECT *FROM Contrato

--Convenio
SELECT *FROM Convenio
UPDATE Convenio SET cantidad = '2' WHERE idConvenio = 1
GO
SELECT *FROM Convenio
DELETE FROM Convenio WHERE idConvenio = 1
GO
SELECT *FROM Convenio

--Cotizacion
SELECT *FROM Cotizacion
UPDATE Cotizacion SET cantidad = '2' WHERE idCotizacion = 1
GO
SELECT *FROM Cotizacion	
--DELETE FROM Cotizacion WHERE idCotizacion = 1
GO
SELECT *FROM Cotizacion

--Credito
SELECT *FROM Credito
UPDATE Credito SET creditoDisponible = 'CreditoDisponible2' WHERE idCredito = 1
GO
SELECT *FROM Credito
--DELETE FROM Credito WHERE idCredito = 1
--GO
SELECT *FROM Credito

--Delivery
SELECT *FROM Delivery
UPDATE Delivery SET cantidad = '2' WHERE idDelivery = 1
GO
SELECT *FROM Delivery
DELETE FROM Delivery WHERE idDelivery = 1
GO
SELECT *FROM Delivery

--Departamento
SELECT *FROM Departamento
UPDATE Departamento SET nombre = 'Departamento2' WHERE idDepartamento = 1
GO
SELECT *FROM Departamento
DELETE FROM Departamento WHERE idDepartamento = 1
GO
SELECT *FROM Departamento

--Devoluciones
SELECT *FROM Devolucion
UPDATE Devolucion SET producto = 'producto2' WHERE idDevolucion = 1
GO
SELECT *FROM Devolucion
--DELETE FROM Devolucion WHERE idDevolucion = 1
--GO
SELECT *FROM Devolucion

--Doctor
SELECT *FROM Doctor
UPDATE Doctor SET nombre = 'Doctor2' WHERE idDoctor = 1
GO
SELECT *FROM Doctor
--DELETE FROM Doctor WHERE idDoctor = 1
GO
SELECT *FROM Doctor

--Empleado
SELECT *FROM Empleado
UPDATE Empleado SET nombre = 'Empleado2' WHERE idEmpleado = 1
GO
SELECT *FROM Empleado
--DELETE FROM Empleado WHERE idEmpleado = 1
--GO
SELECT *FROM Empleado

--Empresa
SELECT *FROM Empresa
UPDATE Empresa SET nombre = 'Empresa2' WHERE idEmpresa = 1
GO
SELECT *FROM Empresa
--DELETE FROM Empresa WHERE idEmpresa = 1
GO
SELECT *FROM Empresa

--Envio
SELECT *FROM Envio
UPDATE Envio SET fechaSalida = '2/12/2022' WHERE idEnvio = 1
GO
SELECT *FROM Envio
--DELETE FROM Envio WHERE idEnvio = 1
--GO
SELECT *FROM Envio

--Estacionamiento
SELECT *FROM Estacionamiento
UPDATE Estacionamiento SET numero = '2' WHERE idEstacionamiento = 1
GO
SELECT *FROM Estacionamiento
DELETE FROM Estacionamiento WHERE idEstacionamiento = 1
GO
SELECT *FROM Estacionamiento

--FacturaCliente
SELECT *FROM FacturaCliente
UPDATE FacturaCliente SET remitente = 'remitente2' WHERE idFacturaCliente = 1
GO
SELECT *FROM FacturaCliente
DELETE FROM FacturaCliente WHERE idFacturaCliente = 1
GO
SELECT *FROM FacturaCliente

--FacturaProveedor
SELECT *FROM FacturaProveedor
UPDATE FacturaProveedor SET remitente = 'remitente2' WHERE idFacturaProveedor = 1
GO
SELECT *FROM FacturaProveedor
DELETE FROM FacturaProveedor WHERE idFacturaProveedor = 1
GO
SELECT *FROM FacturaProveedor

--HorarioTrabajo
SELECT *FROM HorarioTrabajo
UPDATE HorarioTrabajo SET horasextras = '8horas' WHERE idHorarioTrabajo = 1
GO
SELECT *FROM HorarioTrabajo
DELETE FROM HorarioTrabajo WHERE idHorarioTrabajo = 1
GO
SELECT *FROM HorarioTrabajo

--Instrumentos
SELECT *FROM Instrumento
UPDATE Instrumento SET nombre = 'nombre2' WHERE idInstrumento = 1
GO
SELECT *FROM Instrumento
DELETE FROM Instrumento WHERE idInstrumento = 1
GO
SELECT *FROM Instrumento

--Mantenimiento
SELECT *FROM Mantenimiento
UPDATE Mantenimiento SET persona = 'persona2' WHERE idMantenimiento = 1
GO
SELECT *FROM Mantenimiento
DELETE FROM Mantenimiento WHERE idMantenimiento = 1
GO
SELECT *FROM Mantenimiento

--Marca
SELECT *FROM Marca
UPDATE Marca SET nombre = 'marca2' WHERE idMarca = 1
GO
SELECT *FROM Marca
--DELETE FROM Marca WHERE idMarca = 1
GO
SELECT *FROM Marca

--Marketing
SELECT *FROM Marketing
UPDATE Marketing SET lugar = 'lugar2' WHERE idMarketing = 1
GO
SELECT *FROM Marketing
DELETE FROM Marketing WHERE idMarketing = 1
GO
SELECT *FROM Marketing

--MateriaPrima
SELECT *FROM MateriaPrima
UPDATE MateriaPrima SET nombre = 'nombre' WHERE idMateriaPrima = 1
GO
SELECT *FROM MateriaPrima
--DELETE FROM MateriaPrima WHERE idMateriaPrima = 1
--GO
SELECT *FROM MateriaPrima

--Medicamento
SELECT *FROM Medicamento
UPDATE Medicamento SET nombre = 'nombre2' WHERE idMedicamento = 1
GO
SELECT *FROM Medicamento
DELETE FROM Medicamento WHERE idMedicamento = 1
GO
SELECT *FROM Medicamento

--MetodoPago
SELECT *FROM MetodoPago
UPDATE MetodoPago SET tipo = 'tipo2' WHERE idMetodoPago = 1
GO
SELECT *FROM MetodoPago
DELETE FROM MetodoPago WHERE idMetodoPago = 1
GO
SELECT *FROM MetodoPago

--Mobiliario
SELECT *FROM Mobiliario
UPDATE Mobiliario SET nombre = 'Mobiliario2' WHERE idMobiliario = 1
GO
SELECT *FROM Mobiliario
DELETE FROM Mobiliario WHERE idMobiliario = 1
GO
SELECT *FROM Mobiliario

--Nomina
SELECT *FROM Nomina
UPDATE Nomina SET persona = 'Persona2' WHERE idNomina = 1
GO
SELECT *FROM Nomina
DELETE FROM Nomina WHERE idNomina = 1
GO
SELECT *FROM Nomina

--Oferta
SELECT *FROM Oferta
UPDATE Oferta SET producto = 'producto2' WHERE idOferta = 1
GO
SELECT *FROM Oferta
--DELETE FROM Oferta WHERE idOferta = 1
--GO
SELECT *FROM Oferta

--Paciente
SELECT *FROM Paciente
UPDATE Paciente SET nombre = 'nombre2' WHERE idPaciente = 1
GO
SELECT *FROM Paciente
--DELETE FROM Paciente WHERE idPaciente = 1
--GO
SELECT *FROM Paciente

--PagoServicio
SELECT *FROM PagoServicio
UPDATE PagoServicio SET servicio = 'Servicio2' WHERE idPagoServicio = 1
GO
SELECT *FROM PagoServicio
DELETE FROM PagoServicio WHERE idPagoServicio = 1
GO
SELECT *FROM PagoServicio

--Paquete
SELECT *FROM Paquete
UPDATE Paquete SET destinatario = 'destinatario2' WHERE idPaquete = 1
GO
SELECT *FROM Paquete
DELETE FROM Paquete WHERE idPaquete = 1
GO
SELECT *FROM Paquete

--Pedido
SELECT *FROM Pedido
UPDATE Pedido SET productos = 'producto2' WHERE idPedido = 1
GO
SELECT *FROM Pedido
--DELETE FROM Pedido WHERE idPedido = 1
--GO
SELECT *FROM Pedido

--Prestaciones
SELECT *FROM Prestacion
UPDATE Prestacion SET clasificacion = 'clasificacion2' WHERE idPrestacion = 1
GO
SELECT *FROM Prestacion
DELETE FROM Prestacion WHERE idPrestacion = 1
GO
SELECT *FROM Prestacion

--Produccion
SELECT *FROM Produccion
UPDATE Produccion SET cantidadFinal = '100' WHERE idProduccion = 1
GO
SELECT *FROM Produccion
DELETE FROM Produccion WHERE idProduccion = 1
GO
SELECT *FROM Produccion

--Producto
SELECT *FROM Producto
UPDATE Producto SET nombre = 'producto2' WHERE idProducto = 1
GO
SELECT *FROM Producto
--DELETE FROM Producto WHERE idProducto = 1
--GO
SELECT *FROM Producto

--Proveedor
SELECT *FROM Proveedor
UPDATE Proveedor SET nombre = 'Proveedor2' WHERE idProveedor = 1
GO
SELECT *FROM Proveedor
DELETE FROM Proveedor WHERE idProveedor = 1
GO
SELECT *FROM Proveedor

--Puesto
SELECT *FROM Puesto
UPDATE Puesto SET puesto = 'Puesto2' WHERE idPuesto = 1
GO
SELECT *FROM Puesto
DELETE FROM Puesto WHERE idPuesto = 1
GO
SELECT *FROM Puesto

--Receta
SELECT *FROM Receta
UPDATE Receta SET descripcion = 'descripcion2' WHERE idReceta = 1
GO
SELECT *FROM Receta
DELETE FROM Receta WHERE idReceta = 1
GO
SELECT *FROM Receta

--Representante
SELECT *FROM Representante
UPDATE Representante SET nombre = 'nombre' WHERE idRepresentante = 1
GO
SELECT *FROM Representante
DELETE FROM Representante WHERE idRepresentante = 1
GO
SELECT *FROM Representante

--Sucursal
SELECT *FROM Sucursal
UPDATE Sucursal SET nombre = 'sucursal2' WHERE idSucursal = 1
GO
SELECT *FROM Sucursal
--DELETE FROM Sucursal WHERE idSucursal = 1
--GO
SELECT *FROM Sucursal

--Transporte
SELECT *FROM Transporte
UPDATE Transporte SET modelo = 'modelo2' WHERE idTransporte = 1
GO
SELECT *FROM Transporte
--DELETE FROM Transporte WHERE idTransporte = 1
--GO
SELECT *FROM Transporte

--Venta
SELECT *FROM Venta
UPDATE Venta SET cantidad = '20' WHERE idVenta = 1
GO
SELECT *FROM Venta
--DELETE FROM Venta WHERE idVenta = 1
GO
SELECT *FROM Venta

