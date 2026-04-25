/* VISTAS */

-- Clientes con membresías
create view vista_clientes_membresias as
select c.nombre, c.email, m.tipo, m.precio
from cliente c
join suscripcion s on c.id_cliente = s.id_cliente
join membresia m on s.id_membresia = m.id_membresia;

-- Rutinas de pesas con cliente y entrenador
create view vista_rutinas_clientes as
select r.descripcion, c.nombre as cliente, e.nombre as entrenador
from rutinapesas r
join cliente c on r.id_cliente = c.id_cliente
join entrenador e on r.id_entrenador = e.id_entrenador;

-- Asistencias generales (entrada al gimnasio)
create view vista_asistencias_general as
select ag.fecha, c.nombre as cliente
from asistencia_general ag
join cliente c on ag.id_cliente = c.id_cliente;

-- Pagos realizados por clientes
create view vista_pagos_clientes as
select c.nombre, p.fecha, m.tipo, m.precio
from pago p
join cliente c on p.id_cliente = c.id_cliente
join membresia m on p.id_membresia = m.id_membresia;

-- Entrenadores y especialidades
create view vista_entrenadores_especialidades as
select nombre, especialidad
from entrenador;

-- Extra: Suscripciones activas
create view vista_suscripciones_activas as
select s.id_suscripcion, c.nombre, m.tipo, s.fecha_inicio, s.fecha_fin, s.estado
from suscripcion s
join cliente c on s.id_cliente = c.id_cliente
join membresia m on s.id_membresia = m.id_membresia
where s.fecha_fin >= curdate();



/****************************************************************************************************************************/



/* PRUEBAS */

-- Ver todos los clientes con sus membresías
select * from vista_clientes_membresias;
-- Ejemplo: filtrar por cliente específico
select * from vista_clientes_membresias where nombre = 'Juan Pérez';

-- Ver todas las rutinas con cliente y entrenador
select * from vista_rutinas_clientes;
-- Ejemplo: buscar rutinas de un entrenador
select * from vista_rutinas_clientes where entrenador = 'Ana Torres';

-- Ver todas las asistencias registradas
select * from vista_asistencias_general;
-- Ejemplo: asistencias de un cliente en particular
select * from vista_asistencias_general where cliente = 'Carlos Ruiz';

-- Ver todos los pagos
select * from vista_pagos_clientes;
-- Ejemplo: pagos de un cliente específico
select * from vista_pagos_clientes where nombre = 'Juan Pérez';

-- Ver todos los entrenadores con su especialidad
select * from vista_entrenadores_especialidades;
-- Ejemplo: entrenadores de Boxeo
select * from vista_entrenadores_especialidades where especialidad = 'Boxeo';

-- Ver todas las suscripciones activas
select * from vista_suscripciones_activas;
-- Ejemplo: suscripciones activas de un cliente
select * from vista_suscripciones_activas where nombre = 'Juan Pérez';
