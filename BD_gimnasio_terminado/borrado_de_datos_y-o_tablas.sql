/*
--Borrado de datos de las tablas

-- Desactivar chequeo de claves foráneas
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE rutina_detalle;
TRUNCATE TABLE rutinapesas;
TRUNCATE TABLE asistencia_general;
TRUNCATE TABLE sesionboxeo;
TRUNCATE TABLE asistencia_boxeo;
TRUNCATE TABLE venta;
TRUNCATE TABLE hecho_pagos;
TRUNCATE TABLE cliente;
TRUNCATE TABLE entrenador;
TRUNCATE TABLE especialidad;
TRUNCATE TABLE suscripcion;
TRUNCATE TABLE ejercicio;
TRUNCATE TABLE producto;
TRUNCATE TABLE membresia;

-- Reactivar chequeo de claves foráneas
SET FOREIGN_KEY_CHECKS = 1;

-- Borrado de tablas
set foreign_key_checks = 0;

-- Borrar primero las tablas hijas
drop table if exists asistencia_boxeo;
drop table if exists asistencia_general;
drop table if exists rutina_detalle;
drop table if exists rutinapesas;
drop table if exists suscripcion;
drop table if exists pago;
drop table if exists venta;
drop table if exists hecho_pagos;

-- Luego las tablas padres
drop table if exists sesionboxeo;
drop table if exists ejercicio;
drop table if exists producto;
drop table if exists membresia;
drop table if exists entrenador;
drop table if exists especialidad;
drop table if exists cliente;


set foreign_key_checks = 1;

*/
