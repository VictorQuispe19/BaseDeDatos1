Create DATABASE universidad;
use universidad;

CREATE TABLE materias(
id_mat integer IDENTITY PRIMARY KEY not null,
nombre_mat varchar(100) not null,
cod_mat varchar(100) not null);

CREATE TABLE escuela(
id_esc integer  IDENTITY PRIMARY KEY not null,
nombre varchar(100) not null,
direccion varchar(100) not null);

CREATE TABLE periodo(
id_per integer IDENTITY PRIMARY KEY not null,
ano_gestion integer not null,
semestre varchar(50) not null);

CREATE TABLE estudiantes(
id_est_cedula integer IDENTITY PRIMARY KEY not null,
nombres varchar(100) not null,
apellidos varchar(100) not null,
sexo varchar(10) not null,
direccion varchar(200) not null,
telefono integer not null,
email varchar(50),
edad integer not null,
id_esc integer not null,
FOREIGN KEY (id_esc) REFERENCES escuela(id_esc));

CREATE TABLE kardex(
id_kar integer IDENTITY PRIMARY KEY not null,
nota_num integer not null,
nota_alfabe varchar(100) not null,
estado varchar(10) not null,
id_mat integer not null,
id_est_cedula integer not null,
id_per integer not null,
FOREIGN KEY (id_mat) REFERENCES materias(id_mat),
FOREIGN KEY (id_est_cedula) REFERENCES estudiantes(id_est_cedula),
FOREIGN KEY (id_per) REFERENCES periodo(id_per));
INSERT INTO kardex(nota_num,nota_alfabe,estado,id_mat,id_est_cedula,id_per)
Values (51,'cincuenta y uno','APROBADO',1,1,1)
INSERT INTO kardex(nota_num,nota_alfabe,estado,id_mat,id_est_cedula,id_per)
Values (31,'treinta y uno','REPROBADO',2,2,2)
INSERT INTO kardex(nota_num,nota_alfabe,estado,id_mat,id_est_cedula,id_per)
Values (61,'sesenta y uno','APROBADO',1,3,1)
INSERT INTO kardex(nota_num,nota_alfabe,estado,id_mat,id_est_cedula,id_per)
Values (41,'cuarenta y uno','REPROBADO',2,4,2)
INSERT INTO kardex(nota_num,nota_alfabe,estado,id_mat,id_est_cedula,id_per)
Values (81,'ochenta y uno','APROBADO',4,4,4)
TRUNCATE TABLE kardex;

INSERT INTO escuela (nombre, direccion) VALUES ('San Felipe Asturias II', 'Zona Illampu Av. Prol. San Lorenzo');

INSERT INTO estudiantes (nombres, apellidos, sexo, direccion, telefono, email, edad, id_esc) VALUES
  ('Ximena', 'Arias Ballesteros', 'femenino', 'Av. 6 de Agosto', 79617575, 'xime@gmail.com', 25, 1);
INSERT INTO estudiantes (nombres, apellidos, sexo, direccion, telefono, email, edad, id_esc) VALUES
  ('Saul', 'Montes Valenzuela', 'masculino', 'Av. 6 de Agosto', 79617576, 'saul@gmail.com', 24, 1);
INSERT INTO estudiantes (nombres, apellidos, sexo, direccion, telefono, email, edad, id_esc) VALUES
  ('Carla', 'Mavir Uria', 'femenino', 'Av. 6 de Agosto', 79617577, 'carla@gmail.com', 28, 1);
INSERT INTO estudiantes (nombres, apellidos, sexo, direccion, telefono, email, edad, id_esc) VALUES
  ('Joel', 'Castillo Fuentes', 'masculino', 'Av. 6 de Agosto', 79617578, 'joel@gmail.com', 21, 1);
INSERT INTO estudiantes (nombres, apellidos, sexo, direccion, telefono, email, edad, id_esc) VALUES
  ('Augusto', 'Copar Copar', 'femenino', 'Av. 6 de Agosto', 79617579, 'augusto@gmail.com', 20, 1);

INSERT INTO materias (nombre_mat, cod_mat) VALUES ('Introduccion a la Arquitectura','ARQ-101');
INSERT INTO materias (nombre_mat, cod_mat) VALUES ('Urbanismo y Diseno','ARQ-102');
INSERT INTO materias (nombre_mat, cod_mat) VALUES ('Dibujo y Pintura Arquitectonico','ARQ-103');
INSERT INTO materias (nombre_mat, cod_mat) VALUES ('Matematica discreta','ARQ-104');
INSERT INTO materias (nombre_mat, cod_mat) VALUES ('Fisica Basica','ARQ-105');

INSERT INTO periodo (ano_gestion, semestre) VALUES (2016, 'Semestre 1');
INSERT INTO periodo (ano_gestion, semestre) VALUES (2016, 'Semestre 2');
INSERT INTO periodo (ano_gestion, semestre) VALUES (2017, 'Semestre 1');
INSERT INTO periodo (ano_gestion, semestre) VALUES (2017, 'Semestre 2');
INSERT INTO periodo (ano_gestion, semestre) VALUES (2018, 'Semestre 1');
SELECT*
FROM kardex;

SELECT est.nombres,est.apellidos
FROM kardex AS kar,estudiantes AS est
WHERE kar.id_est_cedula=est.id_est_cedula AND
kar.nota_num >= 51;

SELECT est.nombres,est.apellidos
FROM estudiantes AS est
WHERE est.edad >= 24 AND est.sexo = 'masculino';

SELECT est.nombres, est.apellidos, kar.nota_num
FROM estudiantes AS est
INNER JOIN kardex AS kar ON kar.id_est_cedula = est.id_est_cedula
WHERE kar.nota_num >= 51;

SELECT est.nombres, est.apellidos
FROM kardex AS kar
INNER JOIN estudiantes AS est ON kar.id_est_cedula = est.id_est_cedula AND est.edad>25
WHERE kar.nota_num >= 51;
--MOSTRAR los nombres,apellidos y la edad de los reprobados masculino
SELECT est.nombres, est.apellidos, est.edad
FROM kardex AS kar
INNER JOIN estudiantes AS est ON kar.id_est_cedula = est.id_est_cedula 
WHERE kar.nota_num < 51 and est.sexo='masculino';

SELECT per.ano_gestion,per.semestre 
FROM periodo AS per
INNER JOIN kardex AS kar ON kar.id_per = per.id_per
WHERE kar.id_est_cedula = 4; 