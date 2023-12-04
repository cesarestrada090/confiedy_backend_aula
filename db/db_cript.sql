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

insert into alumno (nombre,apellido,carrera, fecha_nacimiento) values ('Luis Marcelo',' Rivera Campos','Ninguna',CURDATE());
insert into usuario (username,password,tipo,alumno_id) values ('luisrivera@confiedy.com','123321','alumno',101);
insert into curso (codigo_curso,nombre_curso,ciclo,docente_id) values('1EST10','Introducción a la Estadística y Probabilidad','1',10);
INSERT INTO confiedy.evaluacion_curso(curso_id, numero_unidad, horario, link_material, link_clase) VALUES(21, 'PC4', 'Miercoles 4:00-6:00 pm y Jueves 5:30-7:30 ', 'https://drive.google.com/drive/u/2/folders/1YeOtQzXCe8xj4wRabAQ30SSb0GPSGCc0', 'https://meet.jit.si/ClasesIntroEstad%C3%ADsticaPC4PUCP');
insert into confiedy.alumno_evaluacion_curso (alumno_id,evaluacion_curso_id,fecha_matricula)
VALUES (101,7,CURDATE());


insert into alumno (id,nombre,apellido,carrera, fecha_nacimiento) values (102,'Dara',' Choque Paucar','GESTIÓN Y ALTA DIRECCIÓN',CURDATE());
insert into usuario (id,username,password,tipo,alumno_id) values ('daraivanac2014@gmail.com','123321','alumno',102);
insert into curso (id,codigo_curso,nombre_curso,ciclo,docente_id) values(22,'MAT125','MATEMÁTICA 2','1',10);
INSERT INTO confiedy.evaluacion_curso(curso_id, numero_unidad, horario, link_material, link_clase) VALUES(22, 'PC4', 'Miercoles 4:00-6:00 pm y Jueves 5:30-7:30 ', 'https://drive.google.com/drive/u/2/folders/1YeOtQzXCe8xj4wRabAQ30SSb0GPSGCc0', 'https://meet.jit.si/ClasesIntroEstad%C3%ADsticaPC4PUCP');
insert into confiedy.alumno_evaluacion_curso (alumno_id,evaluacion_curso_id,fecha_matricula)
VALUES (102,21,CURDATE());