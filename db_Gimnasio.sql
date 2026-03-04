/*create database GimnasioDB;
use GimnasioDB;*/

create table cliente( id_cliente int auto_increment primary key, nombre varchar(100) not null, email varchar(150) unique not null );

create table entrenador (id_entrenador int auto_increment primary key, nombre varchar(100) not null, especialidad varchar(50) not null);

create table membresia ( id_membresia int auto_increment primary key, tipo varchar(50) not null, precio decimal(10,2) not null);

create table rutinapesas (id_rutina int auto_increment primary key, descripcion text not null, id_cliente int,id_entrenador int, 
foreign key(id_cliente) references cliente(id_cliente),
foreign key( id_entrenador) references entrenador(id_entrenador));

create table sesionboxeo (id_sesion int auto_increment primary key, fecha date not null, id_entrenador int,
foreign key (id_entrenador) references entrenador(id_entrenador));

create table pago( id_pago int auto_increment primary key, fecha date not null, id_cliente int, id_membresia int,
foreign key(id_cliente) references cliente(id_cliente),
foreign key(id_membresia) references membresia(id_membresia));

create table asistencia (id_asistencia int auto_increment primary key, fecha date not null, id_cliente int, id_sesion int,
foreign key(id_cliente) references cliente(id_cliente),
foreign key(id_sesion) references sesionboxeo(id_sesion));




