-- Inserción de datos desde EXCEL

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cliente.csv'
into table cliente
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(id_cliente, nombre, email);

-- Primero insertar este para que no salte error al cargar los datos de "entrenador"
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/especialidad.csv'
into table especialidad
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(id_especialidad, nombre);

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/entrenador.csv'
into table entrenador
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(id_entrenador, nombre,especialidad, id_especialidad);

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/membresia.csv'
into table membresia
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(id_membresia, tipo, precio);

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/suscripcion.csv'
into table suscripcion
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(id_suscripcion, id_cliente, id_membresia, fecha_inicio, fecha_fin, estado);

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ejercicio.csv'
into table ejercicio
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(id_ejercicio, nombre, grupo_muscular);

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/rutinapesas.csv'
into table rutinapesas
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(id_rutina, id_cliente, id_entrenador, descripcion);

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/rutinadetalle.csv'
into table rutina_detalle
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(id_rutina, id_ejercicio, series, repeticiones, peso);

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/asistenciageneral.csv'
into table asistencia_general
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(id_asistencia_general, fecha, id_cliente);

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sesionboxeo.csv'
into table sesionboxeo
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(id_sesion, fecha, id_entrenador);

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/asistenciaboxeo.csv'
into table asistencia_boxeo
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(id_sesion, id_cliente);

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/producto.csv'
into table producto
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(id_producto, nombre, precio);

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/venta.csv'
into table venta
fields terminated by ';'
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows
(id_venta, id_cliente, id_producto, cantidad, fecha);

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/hechospagos.csv'
into table hecho_pagos
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(id_hecho, id_cliente,id_membresia, fecha, monto);

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/pagos.csv'
into table pago
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(id_pago,fecha,id_cliente,id_membresia);

