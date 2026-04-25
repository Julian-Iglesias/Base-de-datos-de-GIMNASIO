/* TRIGGER */

delimiter //

-- Registrar asistencia general automática al pagar
create trigger trg_asistencia_general_auto
after insert on pago
for each row
begin
  insert into asistencia_general(fecha, id_cliente)
  values (new.fecha, new.id_cliente);
end;
//

-- Extra: Actualizar tabla de hechos de pagos
create trigger trg_pago_fact
after insert on pago
for each row
begin
  insert into hecho_pagos(id_cliente, id_membresia, fecha, monto)
  values (new.id_cliente, new.id_membresia, new.fecha,
          (select precio from membresia where id_membresia = new.id_membresia));
end;
//
delimiter ;




/****************************************************************************************************************************/



/* PRUEBAS */

-- Insertar un pago de prueba
insert into pago(fecha, id_cliente, id_membresia)
values ('2024-04-25', 1, 1);
-- Verificar que se insertó asistencia automáticamente
select * from asistencia_general where id_cliente = 1;

-- Insertar otro pago de prueba
insert into pago(fecha, id_cliente, id_membresia)
values ('2024-04-26', 2, 2);
-- Verificar que se insertó en hecho_pagos
select * from hecho_pagos where id_cliente = 2;
