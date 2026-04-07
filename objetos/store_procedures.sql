/* STORE PROCEDURES */

/* inserta una nueva rutina asociada a un cliente y entrenador */
delimiter //
create procedure sp_registrarRutinaPesas(
in descrpicion text, in idCliente int, in idEntrenador int)
begin 
insert into rutinaspesas(descripcion, id_cliente,id_entrenador) values(descripcion, idCliente, idEntreandor);
end;

/* inserta un nuevo pago de un cliente por una membresia */
delimiter //
create procedure sp_registrarPago( in fecha date, in idCliente int, in idMembresia int)
begin
insert into pago(fecha, id_cliente, id_membresia) values(fecha, idCliente, idMembresia);
end;


/****************************************************************************************************************************/