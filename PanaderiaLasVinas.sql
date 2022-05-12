create database PedidosLasVinas
use PedidosLasVinas

create table CATEGORIA(
idCategoria int primary key not null IDENTITY(1,1),
categoria varchar(30) not null
)

create table PRODUCTO(
idProducto int primary key not null IDENTITY(1,1),
nombre varchar(40) not null,
descripcion varchar(100) not null,
precio decimal(8,2) not null,
disponibilidad bit not null,
image_path varchar(20)
idCategoria int not null,
foreign key (idCategoria) references CATEGORIA(idCategoria)
)

create table CARRITO(
idCarrito int primary key not null IDENTITY(1,1),
precioDelCarrito decimal(8,2) not null
)

create table PEDIDO(
idPedido int primary key not null IDENTITY(1,1),
nombre varchar(50) not null,
telefono varchar(10) not null,
direccion varchar(100) not null,
fechaDePedido date not null,
estatus varchar(20) not null,
idCarrito int not null,
foreign key (idCarrito) references CARRITO(idCarrito)
)

create table ELEMENTO_CARRITO(
idElemento int primary key not null IDENTITY(1,1),
cantidad int not null,
precioDelElemento decimal(8,2) not null,
idCarrito int not null,
idProducto int not null,
foreign key (idCarrito) references CARRITO(idCarrito),
foreign key (idProducto) references PRODUCTO(idProducto)
)

create table TIPO_DE_USUARIO(
idTipoUsuario int primary key not null IDENTITY(1,1),
tipoUsuario varchar(20) not null
)

create table USUARIO(
idUsuario int primary key not null IDENTITY(1,1),
nombre varchar(20) not null,
primerApellido varchar(20) not null,
segundoApellido varchar(20) not null,
correo varchar(100) not null,
contraseña varchar(30) not null,
activo bit not null,
tipoDeUsuario int not null,
foreign key (tipoDeUsuario) references TIPO_DE_USUARIO(idTipoUsuario)
)