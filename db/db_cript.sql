insert into alumno (nombre,apellido,carrera, fecha_nacimiento) values ('Cesar','Estrada','Sistemas',CURDATE());
insert into usuario (username,password,tipo,alumno_id) values ('cesarestrada090@gmail.com','123321','alumno',1);

INSERT INTO confiedy.docente(nombre, apellidos, link_cv) VALUES('DocenteCesar','Docente', 'www.confiedy.com');

insert into curso (codigo_curso,nombre_curso,ciclo,docente_id) values('mat','Matematica 01','1',1);

INSERT INTO confiedy.evaluacion_curso
(curso_id, numero_unidad, horario, link_material, link_clase)
VALUES(1, 'Unidad I', 'Miercoles y Viernes 3 pm ', 'gmail', 'NULL');

INSERT INTO confiedy.evaluacion_curso
(curso_id, numero_unidad, horario, link_material, link_clase)
VALUES(1, 'Unidad II', 'Lunes y Viernes 2 pm ', 'gmail', 'NULL');
