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

-- drop table asistencia; -- Porque cree otra tabla de AsistenciaGeneral que registra todos los ingresos al gimnasio

create table especialidad ( id_especialidad int auto_increment primary key, nombre varchar(50)not null unique);

-- Ajuste en Entrenador para usar FK
alter table entrenador
add column id_especialidad int,
add foreign key (id_especialidad) references especialidad(id_especialidad);

create table suscripcion (
  id_suscripcion int auto_increment primary key,  id_cliente int not null, id_membresia int not null,
  fecha_inicio date not null, fecha_fin date not null, estado varchar(20) not null,
  foreign key (id_cliente) references cliente(id_cliente),
  foreign key (id_membresia) references membresia(id_membresia)
);

create table ejercicio (
  id_ejercicio int auto_increment primary key, nombre varchar(100) not null, grupo_muscular varchar(50) not null);
  
create table rutina_detalle (
  id_rutina int not null, id_ejercicio int not null, series int not null, repeticiones int not null, peso decimal(5,2),
  primary key (id_rutina, id_ejercicio), -- PK compuesta
  foreign key (id_rutina) references rutinapesas(id_rutina),
  foreign key (id_ejercicio) references ejercicio(id_ejercicio)
);

create table asistencia_general (
  id_asistencia_general int auto_increment primary key, fecha date not null, id_cliente int not null,
  foreign key (id_cliente) references cliente(id_cliente)
);

create table asistencia_boxeo (
  id_asistencia int auto_increment primary key, id_sesion int not null, id_cliente int not null,
  foreign key (id_sesion) references sesionboxeo(id_sesion),
  foreign key (id_cliente) references cliente(id_cliente)
);

create table producto (
  id_producto int auto_increment primary key, nombre varchar(100) not null,
  precio decimal(10,2) not null);

create table venta (
  id_venta int auto_increment primary key, fecha date not null, id_cliente int not null,
  id_producto int not null, cantidad int not null,
  foreign key (id_cliente) references cliente(id_cliente),
  foreign key (id_producto) references producto(id_producto)
);

create table hecho_pagos (
  id_hecho int auto_increment primary key, id_cliente int not null, id_membresia int not null,
  fecha date not null, monto decimal(10,2) not null,
  foreign key (id_cliente) references cliente(id_cliente),
  foreign key (id_membresia) references membresia(id_membresia)
);













