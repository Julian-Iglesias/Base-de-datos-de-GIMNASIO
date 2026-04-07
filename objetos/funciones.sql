/* FUNCIONES */

/* Calcula el totalabonado por un cliente */
delimiter //
create function fn_totalPagosCliente(idCliente int) returns decimal(10,2)
deterministic
begin 
declare total decimal(10,2);
select sum(m.precio) into total from pago p
join membresia m on p.id_membresia = m.id_membresia where p.id_cliente = idCliente;
return total;
end;

/* Devuelve la cantidad de asistencias de un cliente */
delimiter //
create function fn_cantidadAsistenciasCliente(idCliente int) returns int
deterministic
begin
declare cantidad int;
select count(*) into cantidad from asistencia where id_cliente = idCliente;
return cantidad;
end;


/****************************************************************************************************************************/