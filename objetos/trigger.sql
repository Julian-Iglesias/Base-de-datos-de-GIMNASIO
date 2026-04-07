/* TRIGGER */

/* Al insertar un pago de sesionde boxeo, se registra automaticamente alasistencia */
delimiter //
create trigger tgr_asistencia_auto after insert on pago for each row
begin
insert into asistencia(fecha, id_cliente, id_sesion) values (new.fecha, new.id_cliente,1); /*ejemplo: sesion fija*/
end;