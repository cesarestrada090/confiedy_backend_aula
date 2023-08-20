SET SQL_SAFE_UPDATES = 0;
delete from equipo;
delete from modelo;
delete from cliente;
delete from area_has_sede;
delete from sede;
delete from ubicacion_sede;
delete from area;
delete from contrato;
delete from proveedor_servicio;
delete from hardware_modelo;
delete from tipo_modelo;
delete from estado_equipo;
delete from estado_sede;
delete from estado_visita_tecnica;
delete from estado_suministro;
delete from estado_proveedor_servicio;
delete from tipo_suministro;
delete from proveedor_servicio;

insert into area (id,nombre,CECO) values (1,'Area','TestCECO');
insert into area (id,nombre,CECO) values (2,'Area2','TestCECO');

insert into contrato (id,nombre, fecha_inicio, fecha_fin) values (1,'Contrato 1', CURDATE() ,CURDATE() );
insert into cliente (id,razon_social,ruc,contrato_id) values (1,'Test Razon Social','1046554431',1 );
insert into tipo_modelo(id,nombre) values (1,'Impresora');
insert into tipo_modelo(id,nombre) values (2,'Scanner');
insert into tipo_modelo(id,nombre) values (3,'Fotocopiadora');
insert into estado_sede(id,estado) values (1,'Activo');
insert into estado_sede(id,estado) values (2,'Inactivo');
insert into estado_visita_tecnica(id,estado) values (1,'Activo');
insert into estado_visita_tecnica(id,estado) values (2,'Inactivo');
insert into ubicacion_sede(id,nombre,direccion,ciudad,provincia,departamento) values (1,'sede lima','mogrevejo','Lima','Lima,','Lima');
insert into sede (id,nombre,ubicacion_sede_id,estado_id) values (1,'sedeLima',1,1);
insert into estado_suministro(id,estado) values (1,'Activo');
insert into estado_suministro(id,estado) values (2,'Inactivo');
-- estado proveedor servicio
insert into estado_proveedor_servicio(id,estado) values (1,'Activo');
insert into estado_proveedor_servicio(id,estado) values (2,'Inactivo');
-- estado equipo
insert into estado_equipo(id,estado) values (1,'Activo');
insert into estado_equipo(id,estado) values (2,'De Baja');
insert into estado_equipo(id,estado) values (3,'En Reparacion');
-- tipo suministro
insert into tipo_suministro(id,nombre) values (1,'Cabezal');
insert into tipo_suministro(id,nombre) values (2,'Bandeja');
insert into tipo_suministro(id,nombre,color) values (3,'Cartucho','Color');
insert into tipo_suministro(id,nombre,color) values (4,'Cartucho','Blanco y Negro');
-- hardware
insert into hardware_modelo (id,bandejas,conectividad,procesador,disco,memoria,impresion_velocidad,impresion_resolucion)
values (1,'3','USB','2.1 GHz', '400mb','2gb','40 pag/min','1024');
insert into hardware_modelo (id,bandejas,conectividad,procesador,disco,memoria,impresion_velocidad,impresion_resolucion)
values (2,'4','USB','2.2 GHz', '4300mb','2gb','45 pag/min','2048');
-- modelo
insert into modelo (id,tipo_modelo_id,hardware_modelo_id,codigo_modelo,nombre_modelo) values (1,1,1,'modelo1','modelo3');
insert into modelo (id,tipo_modelo_id,hardware_modelo_id,codigo_modelo,nombre_modelo) values (2,2,2,'modelo2','modelo5');
-- proveedor servicio
insert into proveedor_servicio (id,nombre,estado_id) values (1,'movistar',1);
insert into proveedor_servicio (id,nombre,estado_id) values (2,'claro',1);
-- area has sede
insert into area_has_sede (sede_id,area_id) values (1,1);
-- equipo
insert into equipo (serie,modelo_id,estado_id,sede_id,area_id,cliente_id) values ('serie1',1,1,1,1,1);
insert into equipo (serie,modelo_id,estado_id,sede_id,area_id,cliente_id) values ('serie2',1,1,1,1,1);