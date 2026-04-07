/* VISTAS */

/* Muestra clientes junto con el tipo de mebresia que tienen */
create view vista_clientes_membresias as select c.nombre,c.email,m.tipo,m.precio from cliente c
join pago p on c.id_cliente = p.id_cliente
join membresia m on p.id_membresia = m.id_membresia;

/* Lista las rutinas de pesas con el cliente y el entrenador asignado */
create view vista_rutinas_clientes as select r.descripcion,c.nombre as cliente, e.nombre as entrenador from rutinapesas r
join cliente c on r.id_cliente = c.id_cliente
join entrenador e on r.id_entrenador = e.id_entrenador;

/* muestra las asistencias de clientes a sesiones de boxeo */
create view vista_asistencias_boxeo as select a.fecha, c.nombre as cliente, s.fecha as sesion from asistencia a 
join cliente c on a.id_cliente = c.id_cliente
join sesionboxeo s on a.id_Sesion = s.id_sesion;

/* lista los pagos realizados por cada cliente */
create view vista_pagos_cliente as select c.nombre, p.fecha, m.tipo, m.precio from pago p
join cliente c on p.id_cliente = c.id_cliente
join membresia m on p.id_membresia = m.id_membresia;

/* muestra entenadores y sus especialidades */
create view vista_entrenadores_especialidades as select nombre,especialidad from entrenador;


/****************************************************************************************************************************/








