-- admin users
insert into alumno (id,nombre,apellido,carrera, fecha_nacimiento) values (40,'Admin','User','Generico',CURDATE());
insert into usuario (id,username,password,tipo,alumno_id) values (40,'admin@confiedy.com','123456','alumno',40);

-- Docentes Registrados
INSERT INTO docente(id,nombre, apellidos, link_cv) VALUES(10,'Juan Carlos','Minaya', 'Pendiente');
INSERT INTO docente(id,nombre, apellidos, link_cv) VALUES(11,'Gino','Bonilla', 'Pendiente');
INSERT INTO docente(id,nombre, apellidos, link_cv) VALUES(12,'Aarón','Diaz', 'Pendiente');

-- Cursos Matemática
insert into curso (id,codigo_curso,nombre_curso,ciclo,docente_id) values(20,'MAT124','Matematica 01','Varios',10);

-- Evaluaciones para curso Matemática
INSERT INTO evaluacion_curso (id,curso_id, numero_unidad, horario, link_material, link_clase) VALUES(5,20, 'Unidad I', 'Miércoles y Jueves 4-6pm ', 'https://pucp.zoom.us/j/98878411077', 'https://drive.google.com/drive/u/2/folders/1n8K2XrzV_t8UnwUF58C8A7Z5K9HsXTR4');

-- Alumnos
insert into alumno (id,nombre,apellido,carrera, fecha_nacimiento) values (100,'Leonardo','Velasquez','Pendiente',CURDATE());
insert into usuario (id,username,password,tipo,alumno_id) values (31,'lvelasquezfernandez921@gmail.com','leonardo','alumno',100);

-- Matrícula

insert into alumno_evaluacion_curso (alumno_id,evaluacion_curso_id,fecha_matricula) VALUES (100,5,CURDATE());
