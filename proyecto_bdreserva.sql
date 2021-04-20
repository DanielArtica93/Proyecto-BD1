
use proyecto_bdreserva;
create table cliente(idCliente int primary key NOT NULL AUTO_INCREMENT,
 nombre nvarchar(100) NOT NULL,
 a_paterno nvarchar(40) NOT NULL,
 a_materno nvarchar(40),
 tipoDocumento nvarchar(40) NOT NULL,
 num_documento nvarchar(25) NOT NULL, 
 direccion nvarchar(100),
 telefono nvarchar(25),
 email nvarchar(40));
 
 create table Empleado(idEmpleado int primary key NOT NULL AUTO_INCREMENT, 
 nombre nvarchar(100) NOT NULL,
 a_paterno nvarchar(40) NOT NULL,
 a_materno nvarchar(40) NOT NULL,
 tipoDocumento nvarchar(40) NOT NULL,
 num_documento nvarchar(25) NOT NULL, 
 direccion nvarchar(100)NOT NULL,
 telefono nvarchar(25)NOT NULL,
 email nvarchar(40)NOT NULL,
 sueldo DECIMAL(7,2) NOT NULL ,
 login nvarchar(20) NOT NULL, 
 contrasenia nvarchar(20) NOT NULL);

create table habitacion(idHabitacion int primary key NOT NULL AUTO_INCREMENT, 
numero int NOT NULL,
descripcion varchar(255)NOT NULL, 
precio decimal(7,2) NOT NULL);

create table reserva(idReserva int primary key NOT NULL AUTO_INCREMENT, 
idHabitacion int NOT NULL,
idCliente int NOT NULL, 
idEmpleado int NOT NULL,
fecha_ingresa date NOT NULL, 
fecha_sale date NOT NULL, 
costo_total_alojamiento decimal(7,2) NOT NULL,

					 foreign key(idHabitacion) references habitacion(idHabitacion),
                     foreign key(idCliente) references cliente(idCliente),
                     foreign key(idEmpleado) references empleado(idEmpleado));
                     
create table producto(idProducto int primary key NOT NULL AUTO_INCREMENT, 
nombre_producto nvarchar(100) NOT NULL, 
descripcion_producto nvarchar(100) NOT NULL, 
precio_venta decimal(7,2) NOT NULL);                     

create table consumo(idReserva int NOT NULL ,
 idProducto int NOT NULL,
 cantidad int NOT NULL,
 precio_total decimal(7,2) NOT NULL,
					primary key(idReserva, idProducto),
                    foreign key(idReserva) references reserva(idReserva),
                    foreign key(idProducto) references producto(idProducto));

create table pago(idPago int primary key NOT NULL AUTO_INCREMENT, 
idReserva int NOT NULL, 
tipo_comprobante nvarchar(20) NOT NULL,
total_pago decimal(7,2) NOT NULL, 
fecha_pago date NOT NULL,
				  foreign key(idReserva) references reserva(idReserva)) ;

