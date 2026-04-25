/* STORE PROCEDURES */

delimiter //

-- Registrar rutina de pesas
create procedure sp_registrarRutinaPesas(
  in descripcion text,
  in idCliente int,
  in idEntrenador int
)
begin
  insert into rutinapesas(descripcion, id_cliente, id_entrenador)
  values(descripcion, idCliente, idEntrenador);
end;
//

-- Registrar pago
create procedure sp_registrarPago(
  in fecha date,
  in idCliente int,
  in idMembresia int
)
begin
  insert into pago(fecha, id_cliente, id_membresia)
  values(fecha, idCliente, idMembresia);
end;
//

-- Extra: Registrar suscripción
create procedure sp_registrarSuscripcion(
  in idCliente int,
  in idMembresia int,
  in fechaInicio date
)
begin
  declare duracion int;
  declare fechaFin date;

  -- ejemplo: duración fija de 3 meses
  set duracion = 90;
  set fechaFin = date_add(fechaInicio, interval duracion day);

  insert into suscripcion(id_cliente, id_membresia, fecha_inicio, fecha_fin, estado)
  values(idCliente, idMembresia, fechaInicio, fechaFin, 'activa');
end;
//
delimiter ;



/****************************************************************************************************************************/



/* PRUEBAS */

-- Registrar una rutina de pesas para el cliente 1 con el entrenador 1
call sp_registrarRutinaPesas('Rutina fuerza básica', 1, 1);
-- Verificar que se insertó
select * from rutinapesas;

-- Registrar un pago para el cliente 1 con membresía 1
call sp_registrarPago('2024-04-25', 1, 1);
-- Verificar que se insertó
select * from pago;

-- Registrar una suscripción de 3 meses para el cliente 2 con membresía 2
call sp_registrarSuscripcion(2, 2, '2024-04-01');
-- Verificar que se insertó
select * from suscripcion;


