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
insert into usuario (id,username,password,tipo,alumno_id) values (42,'daraivanac2014@gmail.com','123321','alumno',102);
insert into curso (id,codigo_curso,nombre_curso,ciclo,docente_id) values(22,'MAT125','MATEMÁTICA 2','1',10);

INSERT INTO confiedy.evaluacion_curso(id,curso_id, numero_unidad, horario, link_material, link_clase) VALUES(8,22, 'PC4', 'Miercoles 4:00-6:00 pm y Jueves 5:30-7:30 ', 'https://drive.google.com/drive/u/2/folders/1YeOtQzXCe8xj4wRabAQ30SSb0GPSGCc0', 'https://meet.jit.si/ClasesIntroEstad%C3%ADsticaPC4PUCP');
insert into confiedy.alumno_evaluacion_curso (alumno_id,evaluacion_curso_id,fecha_matricula)
VALUES (102,8,CURDATE());

insert into curso (id,codigo_curso,nombre_curso,ciclo,docente_id) values(23,'MATEFI','MATEMÁTICA FINANCIERA','1',10);
insert into alumno (id,nombre,apellido,carrera, fecha_nacimiento) values (103,'Jackeline',' Llacza','',CURDATE());
insert into usuario (id,username,password,tipo,alumno_id) values (43,'jackeline.llacza21@gmail.com','123321','alumno',103);
INSERT INTO confiedy.evaluacion_curso(curso_id, numero_unidad, horario, link_material, link_clase) 
  VALUES(23, 'PC2', 'Domingo 11 febrero 9am-12pm y Domingo 11 febrero 3-6pm ', 'https://drive.google.com/drive/u/0/folders/1kJ5MfH_4Iz47Jx9g0OrOZS7p3vMEx8C6', 'https://meet.jit.si/ClasePC2MatefinancieraPUCP');
insert into confiedy.alumno_evaluacion_curso (alumno_id,evaluacion_curso_id,fecha_matricula)
VALUES (103,9,CURDATE());


-- docente como alumno
insert into alumno (id,nombre,apellido,carrera, fecha_nacimiento) values (104,'Gino',' Bonilla','',CURDATE());
insert into usuario (id,username,password,tipo,alumno_id) values (44,'gbonillac@pucp.pe','123321','docente',104);
insert into confiedy.alumno_evaluacion_curso (alumno_id,evaluacion_curso_id,fecha_matricula)
VALUES (104,9,CURDATE());

CREATE TABLE tarea (
    id INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(255) NOT NULL,
    tipo VARCHAR(255) NOT NULL, -- Planificación, Enseñanza, Evaluación, etc.
    estado TINYINT NOT NULL DEFAULT 1, -- 1: Pendiente, 2: En curso, 3: Finalizada
    PRIMARY KEY (id)
);

CREATE TABLE docente_tarea (
    id_docente INT NOT NULL,
    id_tarea INT NOT NULL,
    PRIMARY KEY (id_docente, id_tarea),
    FOREIGN KEY (id_docente) REFERENCES docente(id),
    FOREIGN KEY (id_tarea) REFERENCES tarea(id)
);

insert into tarea (descripcion,tipo,estado) values ('Lenguaje y sociedad','Tarea',1);
insert into tarea (descripcion,tipo,estado) values ('Ética','Tarea',1);
insert into tarea (descripcion,tipo,estado) values ('Argumentación','Tarea',1);
insert into tarea (descripcion,tipo,estado) values ('Taller de escritura e interpretación de Textos','Tarea',1);
insert into tarea (descripcion,tipo,estado) values ('Investigación académica','Tarea',1);


