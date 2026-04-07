/* ejemplos de inserciones */

-- Clientes
insert into cliente (nombre, email) values
("Juan Perez", "juanperez@gmail.com"),
("Maria Lopez", "marialopez@gmail.com"),
("Carlos Díaz", "carlosdiaz@gmail.com");

-- Entrenadores
insert into entrenador(nombre, especialidad) values
("Ana Torres", "Boxeo"),
("Luis Fernández", "Pesas");

-- Membresías
insert into membresia(tipo, precio) values
("Mensual", 5000.00),
("Anual", 45000.00);

-- Pagos
insert into pago(fecha, id_cliente, id_membresia) values
("2026-04-01", 1, 1), -- Juan paga mensual
("2026-04-02", 2, 2); -- María paga anual

-- Rutinas de pesas
insert into rutinapesas (descripcion, id_cliente, id_entrenador) values
("Rutina fuerza nivel 1", 1, 2),
("Rutina resistencia nivel 2", 2, 2);

-- Sesiones de boxeo
insert into sesionboxeo (fecha, id_entrenador) values
("2026-04-03", 1),
("2026-04-04", 1);

-- Asistencias
insert into asistencia (fecha, id_cliente, id_sesion) values
("2026-04-03", 1, 1),
("2026-04-04", 2, 2);


/****************************************************************************************************************/


/* prueba de vistas */
select * from vista_clientes_membresia;
select * from vista_rutinas_clientes;
select * from vista_asistencias_boxeo;
select * from vista_pagos_clientes;
select * from vista_entrenadores_especialidad;


/* prueba de funciones*/
select fn_totalPagosCliente(1) as TotalPagosJuan;
select fn_cantidadAsistenciasCliente(2) as AsistenciasMaria;


/* prueba de stored procedures */
call sp_registrarRutinaPesas('Rutina fuerza nivel 3', 1, 2);
call sp_registrarPago('2026-04-05', 6, 1);

