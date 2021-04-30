use miprimeradb;
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
                     foreign key(idEmpleado) references Empleado(idEmpleado));
                     
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


#Cliente
Insert into cliente values(default,'Dilia Maribel', 'Sanchez', 'Barahona', 'Tarjeta de identidad', '0801199906671', 'Col. Villanueva', '96871708','dilia@gmail.com');
Insert into cliente values(default,'Andre Michelle', 'Paz', 'Duarte', 'Tarjeta de identidad', '08011992089101', 'Col. Kennedy', '88909888','andrea@gmail.com');
Insert into cliente values(default,'Julio Florencio', 'Cortazar', NULL, 'Tarjeta de identidad', '08011914001233', 'Col. Ixelles', NULL,'cortazar@gmail.com');
Insert into cliente values(default,'Gabriel Jose', 'Garcia', 'Marquez', 'Tarjeta de identidad', '0801195099981', 'Col. Macondo', '88767600','gabo@gmail.com');
Insert into cliente values(default,'Ricardo Eliecer', 'Reyes', 'Basoalto', 'Tarjeta de identidad', '0801190400001', 'Col. Parral', '33778899','neruda@gmail.com');
Insert into cliente values(default,'Jorge Mario', 'Vargas', 'Llosa', 'Tarjeta de identidad', '0801193600002', 'Col. Arequipa', '99881200','vargas@gmail.com');
Insert into cliente values(default,'Juan Carlos', 'Onetti', 'Borges', 'Tarjeta de identidad', '0801190901234', 'Col. Buenos Aires', '22344421','onetti@gmail.com');
Insert into cliente values(default,'Jose Julian', 'Marti', 'Perez', 'Pasaporte', 'B43123321', 'Col. La Habana', '98977888','marti@gmail.com');
Insert into cliente values(default,'Jorge Francisco', 'Luis', 'Borjes', 'Pasaporte', 'D89882211', 'Col. Buenos Aires', NULL,'jborjes@gmail.com');
Insert into cliente values(default,'Isabel Angelica', 'Allende', 'Llona', 'Pasaporte', 'B45889234', 'Col. Peru', '32445588','isa12@gmail.com');
Insert into cliente values(default,'Lucia', 'Godoy', 'Alcayaga', 'Pasaporte', 'D90762288', 'Col. Vicuña', '98715112','lugodoy@gmail.com');
Insert into cliente values(default,'Maria Concepcion', 'Urquiza', 'Del Valle', 'Pasaporte', 'C67524466', 'Col. Morelia', '98654166','concha@gmail.com');
Insert into cliente values(default,'Rosario', 'Castellanos', 'Figueroa', 'Pasaporte', 'C76723311', 'Col. Mexico', '22912315','rosa@gmail.com');
Insert into cliente values(default,'Lucila', 'Gamero', 'Moncada', 'Tarjeta de identidad', '0703187389771', 'Danli', NULL,'lugamero@gmail.com');
Insert into cliente values(default,'Blanca Leonor', 'Varela', 'Gonzales', 'Pasaporte', 'D33221245', 'Col. Lima', '98653288','blanquita@gmail.com');

#Empleados
insert into Empleado values(default, 'Aaron Isacc', 'Valle', 'Raudales', 'Tarjeta de identidad', '0801199978231','Col. Hato','99771234','aaron@yahoo.com',11500,'aaron123','1234');
insert into Empleado values(default, 'Luis Fariz', 'Sanchez', 'Vleriano', 'Tarjeta de identidad', '080119970921','Col. Villanueva','99764568','luisf@yahoo.com',11500,'luisf','luis');
insert into Empleado values(default, 'Rossy Abigail', 'Valle', 'Rivera', 'Tarjeta de identidad', '0801200098771','Col. San Antonio','22342144','rossy@gmail.com',11500,'rossy123','1234');
insert into Empleado values(default, 'Sonia Maria', 'Diaz', 'Moncada', 'Tarjeta de identidad', '0801196599075','Col. El Guayabo','88945678','sonia@gmail.com',20678,'sonia65','1234');
insert into Empleado values(default, 'Andrea Yaqueline', 'Caracamo', 'Rosales', 'Tarjeta de identidad', '0701197590911','Col. Bella Vista','22987551','yaqueline@yahoo.com',11500,'yaque123','secreto');
insert into Empleado values(default, 'Victor Hugo', 'Zepeda', 'Sosa', 'Tarjeta de identidad', '0801197977861','Col. Cerro Grande','33556212','victorh@gmail.com',15987,'victorh','victor1');
insert into Empleado values(default, 'Melisa Yolany', 'Galeas', 'Barrientos', 'Tarjeta de identidad', '0801199178231','Col. Kennedy','33786312','melisa1@gmail.com',11500,'melisa','1234');
insert into Empleado values(default, 'Oscar David', 'Carranza', 'Morazan', 'Tarjeta de identidad', '0801198299021','Col. La Union','88973312','oscard@gmail.com',11500,'oscar','4441');
insert into Empleado values(default, 'Ana Gabriela', 'Lopez', 'Jacome', 'Tarjeta de identidad', '0801199988932','Col. Bella Vista','88775533','ana44@gmail.com',11500,'anaglj','ana123');
insert into Empleado values(default, 'Rosa America', 'Ipiña', 'Castellanos', 'Tarjeta de identidad', '08011989089123','Col. Hato','33543211','rosaipina@yahoo.com',11500,'rosaipina','1234');

#Habitaciones
insert into habitacion values(default,1,'Habitacion con dos camas familiares, vista a la ciudad', 800);
insert into habitacion values(default,2,'Habitacion matrimonial, aire acondicionado, vista a la ciudad', 1000);
insert into habitacion values(default,3,'Habitacion personal, cama unipersonal', 300);
insert into habitacion values(default,4,'Habitacion con dos camas familiares, vista a la ciudad', 500);
insert into habitacion values(default,5,'Habitacion con dos camas familiares, vista a la ciudad', 500);
insert into habitacion values(default,6,'Habitacion con dos camas familiares, vista a la ciudad', 500);
insert into habitacion values(default,7,'Habitacion con dos camas familiares, vista a la ciudad', 500);
insert into habitacion values(default,8,'Habitacion con dos camas familiares, vista a la ciudad', 500);
insert into habitacion values(default,9,'Habitacion para eventos especiales, capcidad para 50 personas', 15000);
insert into habitacion values(default,10,'Habitacion presidencial, aire acondicionado, tina de baño, vista a la ciudad', 2000);
insert into habitacion values(default,11,'Habitacion presidencial, aire acondicionado, tina de baño, vista a la ciudad', 2000);
insert into habitacion values(default,12,'Habitacion para conferencias, capacidad para 30 personas', '10000');
insert into habitacion values(default,13,'Dos camas,aire acondicionado, agua caliente, bañera, televisión por cable y WiFi.', 1800);
insert into habitacion values(default,14,'Una cama,aire acondicionado, agua caliente, bañera, televisión por cable y WiFi', 1500);
insert into habitacion values(default,15,'Una cama King, amplio baño y closet', 1500);
insert into habitacion values(default,16,'Una cama,aire acondicionado, agua caliente, bañera, televisión por cable y WiFi', 1500);
insert into habitacion values(default,17,'Cuatro camas,aire acondicionado, agua caliente, bañera, televisión por cable y WiFi', 2000);
insert into habitacion values(default,18,'Cuatro camas,aire acondicionado, agua caliente, bañera, televisión por cable y WiFi', 2000);
insert into habitacion values(default,19,'Dos camas,aire acondicionado, agua caliente, bañera, televisión por cable y WiFi', 1500);
insert into habitacion values(default,20,'Una cama,aire acondicionado, agua caliente, bañera, televisión por cable y WiFi', 1500);

#Producto
insert into producto values(default,'cola cola', 'coca cola portatil', 15);
insert into producto values(default,'pepsi', 'pepsi portatil', 15);
insert into producto values(default,'mirinda', 'mirinda portatil', 15);
insert into producto values(default,'banana', 'banana portatil', 15);
insert into producto values(default,'Pizza', 'pizza con peperoni y queso', 99);
insert into producto values(default,'hamburguesa', 'hamburguesa con queso y papas', 55);
insert into producto values(default,'snickers', 'barra de chocolate snickers', 23);
insert into producto values(default,'Gafas de sol', 'Gafas de sol, color negro', 45);
insert into producto values(default,'Recargas moviles', 'Recargas moviles de tigo y claro de L 25', 25);
insert into producto values(default,'Cigarrillos', 'Paquete de cigarrillos belmont rojo', 30);
insert into producto values(default,'Cartas de juegos', 'Cartas de juego de mesa', 20);
insert into producto values(default,'Pepeleria', 'Lapices, cuadernos, agendas, etc.', 15);
insert into producto values(default,'Panadol', 'Panadol Ultra roja', 5);
insert into producto values(default,'Acetaminofen', 'Acetaminofen de niño', 6);
insert into producto values(default,'Acetaminofen adulto', 'Acetaminofen de adulto', 8);
insert into producto values(default,'Cliques Trident', 'Chicles trident, rojo, verde y azul', 5);
insert into producto values(default,'Llaveros', 'Llaveros personalizados', 30);

#Reserva
insert into reserva values(default, 1, 1, 1, '2021-01-10','2021-01-11',800);
insert into reserva values(default, 2, 2, 1, '2021-01-11','2021-01-12',1000);
insert into reserva values(default, 3, 3, 1, '2021-01-12','2021-01-13',300);
insert into reserva values(default, 3, 4, 1, '2021-01-18','2021-01-19',300);
insert into reserva values(default, 3, 5, 1, '2021-01-22','2021-01-23',300);

insert into reserva values(default, 4, 4, 2, '2021-02-1','2021-02-2',500);
insert into reserva values(default, 3, 5, 2, '2021-02-2','2021-02-3',300);
insert into reserva values(default, 2, 6, 2, '2021-02-13','2021-02-14',1000);
insert into reserva values(default, 5, 1, 1, '2021-02-14','2021-02-15',500);
insert into reserva values(default, 3, 7, 2, '2021-02-16','2021-02-17',300);

insert into reserva values(default, 6, 6, 3, '2021-03-15','2021-03-16',500);
insert into reserva values(default, 7, 7, 3, '2021-03-17','2021-03-18',500);
insert into reserva values(default, 6, 2, 3, '2021-03-17','2021-03-18',500);
insert into reserva values(default, 8, 1, 4, '2021-03-20','2021-03-21',500);

insert into reserva values(default, 2, 3, 3, '2021-04-11','2021-04-12',500);
insert into reserva values(default, 7, 10, 3, '2021-04-17','2021-04-18',500);
insert into reserva values(default, 8, 11, 4, '2021-04-20','2021-04-21',500);
insert into reserva values(default, 8, 1, 4, '2021-04-22','2021-04-23',500);
insert into reserva values(default, 1, 13, 4, '2021-04-27','2021-04-28',500);
insert into reserva values(default, 9, 2, 4, '2021-04-27','2021-04-29',15000);
insert into reserva values(default, 2, 10, 1, '2021-04-27','2021-04-29',500);
insert into reserva values(default, 6, 8, 6, '2021-04-27','2021-04-29',500);
insert into reserva values(default, 10, 14, 6, '2021-04-27','2021-04-29',2000);
insert into reserva values(default, 1, 15, 2, '2021-04-29','2021-05-1',1600);
insert into reserva values(default, 11, 1, 5, '2021-04-29','2021-04-30',2000);
insert into reserva values(default, 12, 13, 7, '2021-04-29','2021-04-30',10000);
insert into reserva values(default, 17, 9, 3, '2021-04-29','2021-04-30',2000);


#Consumo
insert into consumo values(1,1,3,45);
insert into consumo values(1,5,1,99);
insert into consumo values(2,1,1,15);
insert into consumo values(2,6,2,110);
insert into consumo values(3,2,2,30);
insert into consumo values(4,10,1,30);
insert into consumo values(4,1,1,15);
insert into consumo values(5,11,1,20);
insert into consumo values(6,13,3,15);
insert into consumo values(7,7,3,69);
insert into consumo values(8,8,1,45);
insert into consumo values(24,1,2,30);
insert into consumo values(24,8,1,45);
insert into consumo values(25,3,2,30);
insert into consumo values(26,1,15,225);
insert into consumo values(26,5,7,480);
insert into consumo values(27,2,2,30);

#Pago
insert into pago values(default,1,'factura', 944,'2021-01-11');
insert into pago values(default,2,'factura', 1125,'2021-01-12');
insert into pago values(default,3,'factura', 330,'2021-01-13');
insert into pago values(default,4,'factura', 545,'2021-02-02');
insert into pago values(default,5,'factura', 320,'2021-02-03');
insert into pago values(default,6,'factura', 1015,'2021-02-14');
insert into pago values(default,7,'factura', 569,'2021-02-15');
insert into pago values(default,8,'factura', 540,'2021-03-16');
insert into pago values(default,9,'factura', 500,'2021-03-18');
insert into pago values(default,10,'factura', 500,'2021-03-21');
insert into pago values(default,11,'factura', 500,'2021-04-12');
insert into pago values(default,12,'factura', 500,'2021-04-18');
insert into pago values(default,13,'factura', 500,'2021-04-21');
insert into pago values(default,14,'factura', 500,'2021-04-23');
insert into pago values(default,15,'factura', 500,'2021-03-18');
insert into pago values(default,16,'factura', 300,'2021-02-17');
insert into pago values(default,17,'factura', 300,'2021-01-19');
insert into pago values(default,18,'factura', 300,'2021-01-23');
insert into pago values(default,19,'factura', 500,'2021-04-28');

#EJERCICIO 1
select* from reserva;
WITH primeraFecha AS (
SELECT r.idCliente, MIN(r.fecha_ingresa) AS NuevoIngreso 
FROM reserva AS r
GROUP BY idCliente
)
SELECT YEAR(NuevoIngreso) AS YEAR, MONTH(NuevoIngreso) AS MONTH, COUNT(idCliente) AS NuevosClientes
FROM primeraFecha GROUP BY YEAR, MONTH;

#EJERCICIO 2
select* from reserva;
SELECT r.idHabitacion,
CASE 
	WHEN MAX(r.fecha_sale) < CURDATE() THEN CURDATE()
    ELSE MAX(r.fecha_sale)
END AS Siguiente_Fecha_Disponible
FROM reserva AS r
GROUP BY r.idHabitacion
ORDER BY r.idHabitacion DESC;

#EJERCICIO 3
select* FROM reserva
where idHabitacion=2;
SELECT idHabitacion, COUNT(idReserva) AS Conteo_Reserva
FROM reserva
WHERE fecha_ingresa> CURDATE() - INTERVAL 3 MONTH
GROUP BY idHabitacion
ORDER BY Conteo_Reserva DESC LIMIT 3;

#EJERCICIO 4
select* from consumo;
select* from reserva;
SELECT c.idReserva,r.idHabitacion,SUM(c.precio_total) AS Consumo_Actual
FROM reserva AS r
INNER JOIN consumo as c
ON r.idReserva = c.idReserva
WHERE CURDATE() BETWEEN fecha_ingresa AND fecha_sale
GROUP BY r.idReserva;

#EJERCICIO 5
select* from producto;
select* from consumo
where idProducto=5;
select* from reserva;
SELECT p.idProducto AS Id_Producto, 
COUNT(r.idReserva) AS Conteo_Reserva_solicitado,
SUM(c.cantidad) AS Unidades_Vendidas,
SUM(c.precio_total) AS Suma_Vendido
FROM producto AS p 
INNER JOIN consumo AS c
ON p.idProducto=c.idProducto 
INNER JOIN reserva AS r 
ON c.idReserva=r.idReserva 
WHERE fecha_ingresa> curdate()-INTERVAL 3 MONTH AND YEAR(fecha_ingresa)= YEAR(NOW())
GROUP BY p.idProducto
ORDER BY unidades_vendidas DESC LIMIT 3 ;

#EJERCICIO 6

SELECT* FROM reserva
where idCliente=3;
WITH tabla1 AS (
SELECT idCliente, MAX(fecha_sale) AS Ultima_Fecha FROM reserva
 GROUP BY idCliente 
)
SELECT r.idCliente,t1.Ultima_Fecha, 
	   DATEDIFF(CURDATE(),t1.Ultima_Fecha) AS Dias_Transcurridos_Desde_La_Ultima, 
	   COUNT(idReserva) AS Numero_Reservas
FROM reserva AS r
INNER JOIN tabla1 AS t1
ON r.idCliente=t1.idCliente
GROUP BY r.idCliente, t1.Ultima_Fecha, Dias_Transcurridos_Desde_La_Ultima HAVING Numero_Reservas>1;



#EJERCICIO 7
select* from reserva
where idEmpleado=6;
WITH EmpleadoReserva AS ( 

SELECT Empleado.idEmpleado, Empleado.nombre,
CASE
    WHEN ((fecha_sale) >= CURDATE()) THEN '1'
    ELSE 0
END AS Cantidad_reservas_activas, count(reserva.idEmpleado) as count_empleado
FROM reserva
RIGHT JOIN Empleado ON reserva.idEmpleado = Empleado.idEmpleado
GROUP BY Empleado.idEmpleado,Empleado.nombre, CASE
    WHEN ((fecha_sale) >= CURDATE()) THEN '1'
    ELSE 0
END
)
SELECT idEmpleado, nombre, count_empleado as reservas_activas
FROM EmpleadoReserva
WHERE (Cantidad_reservas_activas > 0 AND count_empleado > 0)
	  OR (Cantidad_reservas_activas = 0 AND count_empleado = 0);


#PROCESOS ALMACENADOS

#EJERCICIO 1 
delimiter $$
Create procedure crear_Reserva(in idHabitacion int,
 in idCliente int,
 in idEmpleado int,
 in fecha_ingresa date,
 in fecha_sale date, 
 in costoTotal decimal(7,2))
 begin
 insert into reserva (idHabitacion,
 idCliente,
 idEmpleado,
 fecha_ingresa,
 fecha_sale,
 costo_total_alojamiento) values (idHabitacion, idCliente,idEmpleado,fecha_ingresa, fecha_sale,costoTotal);
 end $$
 
Call crear_Reserva(19,2,1,'2021-04-30','2021-05-01',1500);

select * from reserva;

#EJERCICIO 3
delimiter $$
Create procedure agregar_Producto(in idReserva int,
 in idProducto int,
 in cantidad int,
 in precio_total decimal(7,2))

 begin
 insert into consumo (idReserva,
 idProducto,
 cantidad,
 precio_total) values (idReserva, idProducto,cantidad,precio_total);
 end $$
 
Call agregar_Producto(29,4,1,15);
select* from consumo;


#EJERCICIO 5

delimiter $$
Create procedure crear_Producto(
 in nombrep varchar(100),
 in descripcionp varchar(100), 
 in preciov decimal(7,2))
 begin
 insert into producto(
 nombre_producto,
 descripcion_producto,
 precio_venta) values (nombrep,descripcionp,preciov);
 end $$
 
 call crear_Producto('Dorito','Nacho atrevido',20);
select* from producto;



#EJERCICIO 6

delimiter $$
Create procedure crear_Empleado(
 in nombreE varchar(100),
 in apaterno varchar(40), 
 in amaterno varchar(40),
 in tipoDoc varchar(40),
 in numDoc varchar(25),
 in direc varchar(100),
 in tel varchar(25),
 in email varchar(40),
 in sueldo decimal(7,2),
 in logi varchar(20),
 in contra varchar(20))
 
 
 begin
 insert into Empleado(
 nombre,
 a_paterno,
 a_materno,
 tipoDocumento ,
 num_documento ,
 direccion,
 telefono ,
 email ,
 sueldo ,
 login ,
 contrasenia) values (nombreE,apaterno, amaterno,tipoDoc, numDoc,direc,tel,email,sueldo, logi,contra);
 end $$
 
 call crear_Empleado('Erick',
 'Arguijo',
 'Turcios',
 'Tarjeta de identidad',
 '0801199700152',
 'Col. La Esperanza',
 '22456789',
 'erickarguijo@gmail.com',
 250000,
 'erick',
 '4567');
 
 select* from Empleado;
 
 
 
 #EJERCICIO 7
 delimiter $$
Create procedure crear_Cliente(
 in nombreC varchar(100),
 in apaterno varchar(40), 
 in amaterno varchar(40),
 in tipoDoc varchar(40),
 in numDoc varchar(25),
 in direc varchar(100),
 in tel varchar(25),
 in email varchar(40))
 begin
 insert into cliente(
 nombre,
 a_paterno,
 a_materno,
 tipoDocumento ,
 num_documento ,
 direccion,
 telefono ,
 email) values (nombreC,apaterno, amaterno,tipoDoc, numDoc,direc,tel,email);
 end $$


call crear_Cliente('Miguel ',
 'Rivera',
 'Turcios',
 'Tarjeta de identidad',
 '080119500120',
 'Col. San Miguel',
 '98452596',
 'miguel@gmail.com');

select* from cliente;
 