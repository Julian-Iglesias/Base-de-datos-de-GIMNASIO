/* FUNCIONES */

delimiter //

-- Total de pagos por cliente
create function fn_totalPagosCliente(idCliente int) returns decimal(10,2)
deterministic
begin
  declare total decimal(10,2);
  select sum(m.precio) into total
  from pago p
  join membresia m on p.id_membresia = m.id_membresia
  where p.id_cliente = idCliente;
  return total;
end;
//

-- Cantidad de asistencias generales por cliente
create function fn_cantidadAsistenciasCliente(idCliente int) returns int
deterministic
begin
  declare cantidad int;
  select count(*) into cantidad
  from asistencia_general
  where id_cliente = idCliente;
  return cantidad;
end;
//

-- Extra: Cliente activo
create function fn_clienteActivo(idCliente int) returns boolean
deterministic
begin
  declare activo boolean;
  select count(*) > 0 into activo
  from suscripcion
  where id_cliente = idCliente and fecha_fin >= curdate();
  return activo;
end;
//
delimiter ;



/****************************************************************************************************************************/



/* PRUEBAS */

-- Total de pagos del cliente con id = 1
select fn_totalPagosCliente(1) as total_cliente1;
-- Total de pagos del cliente con id = 2
select fn_totalPagosCliente(2) as total_cliente2;

-- Cantidad de asistencias del cliente con id = 1
select fn_cantidadAsistenciasCliente(1) as asistencias_cliente1;
-- Cantidad de asistencias del cliente con id = 2
select fn_cantidadAsistenciasCliente(2) as asistencias_cliente2;

-- ¿El cliente con id = 1 está activo?
select fn_clienteActivo(1) as cliente1_activo;
-- ¿El cliente con id = 2 está activo?
select fn_clienteActivo(2) as cliente2_activo;


