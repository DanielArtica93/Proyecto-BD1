create database hotel;
use hotel;

create table cliente(idCliente int primary key NOT NULL AUTO_INCREMENT,
 nombre varchar(255),
 apaterno varchar(40),
 amaterno varchar(40),
 tipoDocumento varchar(40),
 num_documento int, 
 direccion varchar(50),
 telefono varchar(10),
 email varchar(40));
 

create table trabajador(idTrabajador int primary key NOT NULL AUTO_INCREMENT, 
 nombre varchar(255),
 apaterno varchar(40),
 amaterno varchar(40),
 tipoDocumento varchar(40),
 num_documento int, 
 direccion varchar(50),
 telefono varchar(10),
 email varchar(40),
 sueldo int,
 acceso varchar(20),
 login varchar(20), 
 password varchar(20),
 estado varchar(10));
						
 select * from trabajador;                 
create table habitacion(idHabitacion int primary key NOT NULL AUTO_INCREMENT, 
numero int, piso int, 
descripcion varchar(255),
caracteristicas varchar(255), 
precio int, estado varchar(20), 
tipo_de_habitacion varchar(20));

create table reserva(idReserva int primary key NOT NULL AUTO_INCREMENT, 
idHabitacion int NOT NULL,
idCliente int NOT NULL, 
idtrabajador int NOT NULL,
tipo_reserva varchar(20), 
fecha_ingresa date, 
fecha_sale date, 
costo_alojamiento int,
estado varchar(20),
					 foreign key(idHabitacion) references habitacion(idHabitacion),
                     foreign key(idCliente) references cliente(idCliente),
                     foreign key(idTrabajador) references trabajador(idTrabajador));
 
create table producto(idProducto int primary key NOT NULL AUTO_INCREMENT, 
nombre varchar(40), 
descripcion varchar(80),
unidad_medida varchar(20), 
precio int);

create table consumo(idReserva int, idProducto int, cantidad int, precio_venta int, estado varchar(20),
					primary key(idReserva, idProducto),
                    foreign key(idReserva) references reserva(idReserva),
                    foreign key(idProducto) references producto(idProducto));

create table pago(idPago int primary key NOT NULL AUTO_INCREMENT, 
idReserva int, 
tipo_comprobante varchar(20),
num_comprobante int, isv int, 
total_pago int,
fecha_emision date, 
fecha_pago date,
				  foreign key(idReserva) references reserva(idReserva)) ;