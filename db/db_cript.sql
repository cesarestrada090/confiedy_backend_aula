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

insert into confiedy.alumno_evaluacion_curso (alumno_id,evaluacion_curso_id,fecha_matricula)
VALUES (1,1,CURDATE());

-- axel

insert into alumno (nombre,apellido,carrera, fecha_nacimiento) values ('Axel','Mendoza','Administración',CURDATE());
insert into usuario (username,password,tipo,alumno_id) values ('axel.mendoza@confiedy.com','123456','alumno',2);
insert into confiedy.alumno_evaluacion_curso (alumno_id,evaluacion_curso_id,fecha_matricula)
VALUES (2,1,CURDATE());


insert into alumno (nombre,apellido,carrera, fecha_nacimiento) values ('Juan Carlos','Minaya','Ingeniería Industrial',CURDATE());
insert into usuario (username,password,tipo,alumno_id) values ('juan.minaya@confiedy.com','1234','alumno',3);
insert into confiedy.alumno_evaluacion_curso (alumno_id,evaluacion_curso_id,fecha_matricula)
VALUES (3,1,CURDATE());