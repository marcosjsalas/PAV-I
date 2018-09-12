create table TipoDoc
(
IdTipoDoc int identity(1,1),
Descripcion varchar(50),
constraint PK_TipoDoc primary key (IdTipoDoc)
)


create table FormaPago
(
IdTipoFP int identity(1,1),
Descripcion varchar(50),
constraint PK_TipoFP primary key (IdTipoFP),
)
create table Provincia
(
 IdProvincia int identity(1,1),
 Descripcion varchar(50),
 constraint pk_idProvincia primary key(idProvincia),
)

create table Departamento
(
 IdDepartamento int identity(1,1) ,
 Descripcion varchar(max),
 IdProvincia int,
 constraint pk_Deptamento primary key (IdDepartamento),
 constraint fk_Provincia foreign key (IdProvincia) references Provincia(IdProvincia),
)

create table Localidad
(
IdLocalidad int identity(1,1),
Descripcion varchar(max),
IdDepartamento int,
CodigoPostal int,
constraint PK_IdLocalidad primary key (IdLocalidad),
constraint PK_IdDeptoLo foreign key (IdDepartamento) references Departamento(IdDepartamento),
)

create table Barrio
(
IdBarrio int identity(1,1),
Descripcion varchar(max),
IdLocalidad int,
constraint pk_Barrio primary key (IdBarrio,IdLocalidad),
constraint fk_Localidad foreign key (IdLocalidad) references Localidad(IdLocalidad),
)



create table TipoEquipo
(
IdTipoEquipo int identity(1,1),
Descripcion varchar(50),
constraint PK_TipoEquipo primary key (IdTipoEquipo)
)
create table Estado
(
IdEstado int identity(1,1),
Descripcion varchar(50)
constraint pk_iEstado primary key (IdEstado)
)
create table Tarea
(
IdTarea int identity(1,1),
Descripcion varchar(50),
TiempoEstimado int,
Estado int,
constraint pk_idTarea primary key (IdTarea),
constraint fk_TareaEstado foreign key (Estado) references Estado(IdEstado)
)


Create table Cliente
(
IdCliente int identity(1,1),
Nombre varchar(50),
Apellido varchar(50),
Cuit int,
IdTipoDoc int,
NroDoc int,
TipoCliente varchar(50),
IdBarrio int,
IdLocalidad int,
IdDepartamento int,
IdProvincia int,
nroTelefono int,
Email varchar(50),
Calle varchar(25),
NroCalle int,
IdEstado int,
constraint pk_Cliente primary key (IdCliente),
constraint fk_IdTD foreign key (IdTipoDoc) references TipoDoc(IdTipoDoc),
constraint fk_IdBarrio foreign key (IdBarrio,IdLocalidad) references Barrio(IdBarrio,IdLocalidad),
constraint fk_IdLocalidad foreign key (IdLocalidad) references Localidad(IdLocalidad),
constraint fk_IdDepartamento foreign key (IdDepartamento) references Departamento(IdDepartamento),
constraint fk_IdProvincia foreign key (IdProvincia) references Provincia(IdProvincia),
constraint fk_IdEstadoC foreign key (IdEstado) references Estado(IdEstado)
)

Create table Articulo
(
IdArticulo int identity(1,1),
Descripcion Varchar(Max),
Estado int,
StockActual Int,
StockMinimo Int,
Precio int,
constraint pk_Articulo primary key (IdArticulo),
constraint fk_EstadoArticulo foreign key (Estado) references Estado(IdEstado)
)


Create table Empleado
(
IdEmpleado int identity(1,1),
Nombre varchar(50),
Apellido varchar(50),
IdTipoDoc int,
NroDoc int,
IdBarrio int,
IdLocalidad int,
IdDepartamento int,
IdProvincia int,
nroTelefono int,
Email varchar(50),
Calle varchar(25),
NroCalle int,
IdEstado int,
constraint pk_Empleado primary key (IdEmpleado),
constraint fk_IdTDoc foreign key (IdTipoDoc) references TipoDoc(IdTipoDoc),
constraint fk_IdBarrioe foreign key (IdBarrio,IdLocalidad) references Barrio(IdBarrio,IdLocalidad),
constraint fk_IdLocalidade foreign key (IdLocalidad) references Localidad(IdLocalidad),
constraint fk_IdDepartamentoe foreign key (IdDepartamento) references Departamento(IdDepartamento),
constraint fk_IdProvinciae foreign key (IdProvincia) references Provincia(IdProvincia),
constraint fk_IdEstadoE foreign key (IdEstado) references Estado(IdEstado)
)
Create table Proveedor
(
IdProveedor int identity(1,1),
Nombre varchar(50),
Apellido varchar(50),
IdTipoDoc int,
NroDoc int,
IdBarrio int,
IdLocalidad int,
IdDepartamento int,
IdProvincia int,
NroTelefono int,
Email varchar(50),
Fax int,
Calle varchar(25),
NroCalle int,
IdEstado int,
constraint pk_Proveedor primary key (IdProveedor),
constraint fk_IdTDOCP foreign key (IdTipoDoc) references TipoDoc(IdTipoDoc),
constraint fk_IdBarrioP foreign key (IdBarrio,IdLocalidad) references Barrio(IdBarrio,IdLocalidad),
constraint fk_IdLocalidadP foreign key (IdLocalidad) references Localidad(IdLocalidad),
constraint fk_IdDepartamentoP foreign key (IdDepartamento) references Departamento(IdDepartamento),
constraint fk_IdProvinciaP foreign key (IdProvincia) references Provincia(IdProvincia),
constraint fk_IdEstadoP foreign key (IdEstado) references Estado(IdEstado)

)

create table Usuario
(
IdUsuario Int identity(1,1),
Nombre Varchar(25),
Contraseña int,
IdEmpleado int ,
IdEstado int,
constraint pk_Usuario primary key (IdUsuario,IdEmpleado),
constraint fk_IdEmpleadoUs foreign key (IdEmpleado) references Empleado(IdEmpleado),
constraint fk_IdEstadoU foreign key (IdEstado) references Estado(IdEstado)

)

Create table Marca
(
IdMarca int identity(1,1),
Descripcion varchar(50),
Constraint pk_IdMarca primary key (IdMarca)

)

create table Equipo
(
IdEquipo int identity(1,1),
Descripcion varchar(50),
IdCliente int,
IdMarca int,
Observaciones varchar(max),
IdEstado int,
Constraint pk_IdEquipo primary key (IdEquipo),
constraint fk_ClienteE foreign key (IdCliente) references Cliente(IdCliente),
constraint fk_IdMarcaE foreign key (IdMarca) references Marca(IdMarca),
constraint fk_IdEstadoEQ foreign key (IdEstado) references Estado(IdEstado)

)

create table Venta
(
IdVenta int identity(1,1),
IdEmpleado int,
IdCliente int,
Nro int,
IdFormaPago int,
FechaVenta Date,
Total float,
Constraint pk_IdVenta primary key (IdVenta,IdEmpleado,IdCliente),
Constraint fk_EmpleadoVe foreign key (IdEmpleado) references Empleado(IdEmpleado),
constraint fk_ClienteVe foreign key (IdCliente) references Cliente(IdCliente),
constraint fk_FormaPagoVe foreign key (IdFormaPago) references FormaPago(IdTipoFP)
)

create table detalleVenta
(
IdDetalleVenta int identity(1,1),
IdVenta int,
IdArticulo int,
IdEmpleado int,
IdCliente int,
Descuento float,
Cantidad int,
Subtotal float,
constraint pk_IdDetalleVenta primary key (IdDetalleVenta,IdVenta,IdArticulo),
constraint fk_IdVenta foreign key (IdVenta,IdEmpleado,IdCliente) references Venta(IdVenta,IdEmpleado,IdCliente),
constraint fk_Articulo foreign key (IdArticulo) references Articulo(IdArticulo)
)

create table Pedido
(
IdPedido int identity(1,1),
IdProveedor int,
IdFormaPago int,
FechaCompra date,
FechaPrevisto date,
Total int,
Observaciones varchar(max),
IdEstado int,
constraint pk_Pedido primary key(IdPedido,IdProveedor),
constraint fk_Proveedor foreign key (IdProveedor) references Proveedor(IdProveedor),
constraint fk_FormaP foreign key (IdFormaPago) references FormaPago(IdTipoFP),
 constraint CK_fechacompra check(FechaCompra is not null),
 constraint fk_IdEstadoPE foreign key (IdEstado) references Estado(IdEstado)

)

Create table DetallePedido
(
IdDetallePedido int identity(1,1),
IdArticulo	 int,
Cantidad int,
PrecioCompra int,
SubTotal float,
Descuento float,
constraint pk_DetallePedido primary key(IdDetallePedido,IdArticulo)
)

create table Orden
(
IdOrden int identity(1,1),
Nro int,
IdEquipo int,
IdEmpleadoAsi int,
IdTarea int,
Falla varchar(50),
Respuesta varchar(50),
IdEmpleadoG int,
TiempoRealizado Float,
FechaEntrega Date,
IdEstado int,
constraint pk_Orden primary key(IdOrden,IdEquipo,IdEmpleadoAsi,IdTarea,IdEmpleadoG),
constraint fk_EquipoO foreign key (IdEquipo) references Equipo(IdEquipo),
constraint fk_EmpleadoA foreign key (IdEmpleadoAsi) references Empleado(IdEmpleado),
constraint fk_TareaA foreign key (IdTarea) references Tarea(IdTarea),
constraint fk_IdEmpleadoG foreign key (IdEmpleadoG) references Empleado(IdEmpleado),
constraint CK_FechaEntrega check(FechaEntrega is not null),
constraint fk_IdEstadoO foreign key (IdEstado) references Estado(IdEstado)

)

insert tipoDoc values('DNI')
insert tipoDoc values('Pasaporte')
insert Estado values ('Alta')
insert Estado values ('Baja')
insert Estado values ('Pendiente')
insert Estado values ('Realizada')
select * from Barrio
insert Provincia values('Cordoba')
insert Provincia values('Mendoza')
 insert Departamento values('Centro',1)
 insert Departamento values('Colon',2)
 
 insert localidad values('Mendiolaza',1,'5105')
  insert localidad values('Mendoza',2,'5105')

insert barrio values('Talar',1)
insert barrio values('San Martin',2)

 Insert Articulo values ('Memoria ram DDR3',1,2,1,2000)
insert empleado values ('Administrador','Admin',1,405060902,1,1,1,1,1,'Adminprueba.com','Sol Del Este',157,1)
insert usuario values('Admin',123,1,NULL)

insert Cliente values ('','',NUll,1,123,'Particular',1,1,1,1,324534,'adqwetr','asdgert',1234,1)
