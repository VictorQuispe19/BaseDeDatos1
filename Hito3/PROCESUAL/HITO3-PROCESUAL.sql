CREATE DATABASE defensa_hito3_unifranzitos;

USE defensa_hito3_unifranzitos;
--Creacion tabla campeonato
CREATE TABLE campeonato(id_campeonato varchar (12) PRIMARY KEY not null,
nombre_campeonato varchar (30) not null,
sede varchar(20) not null);

--Insertar valores
INSERT INTO campeonato(id_campeonato,nombre_campeonato,sede)
values('camp-111','Campeonato Unifranz','El Alto');
INSERT INTO campeonato(id_campeonato,nombre_campeonato,sede)
values('camp-222','Campeonato Unifranz','Cochabamba');

--Creacion tabla equipo
CREATE TABLE equipo(id_equipo varchar (12) PRIMARY KEY not null,
nombre_equipo varchar(30) not null,
categoria varchar (10) not null,
id_campeonato varchar (12),
FOREIGN KEY (id_campeonato) REFERENCES campeonato(id_campeonato));

--Insertar valores
INSERT INTO equipo(id_equipo,nombre_equipo,categoria,id_campeonato)
Values('equ-111','Google','VARONES','camp-111');
INSERT INTO equipo(id_equipo,nombre_equipo,categoria,id_campeonato)
Values('equ-222','404 Not found','VARONES','camp-111');
INSERT INTO equipo(id_equipo,nombre_equipo,categoria,id_campeonato)
Values('equ-333','girls unifranz','MUJERES','camp-111');

--Creacion tabla jugador
CREATE TABLE jugador(id_jugador varchar(12) PRIMARY KEY not null,
nombres varchar(30) not null,
apellidos varchar(50) not null,
ci varchar (15) not null,
edad int not null,
id_equipo varchar(12) not null,
FOREIGN KEY (id_equipo) REFERENCES equipo(id_equipo));

--Insertar valores a la tabla
INSERT INTO jugador(id_jugador,nombres,apellidos,ci,edad,id_equipo)
VALUES('jug-111','Carlos','Villa','8997811LP',19,'equ-222');
INSERT INTO jugador(id_jugador,nombres,apellidos,ci,edad,id_equipo)
VALUES('jug-222','Pedro','Salas','8997822LP',20,'equ-222');
INSERT INTO jugador(id_jugador,nombres,apellidos,ci,edad,id_equipo)
VALUES('jug-333','Saul','Araj','8997833LP',21,'equ-222');
INSERT INTO jugador(id_jugador,nombres,apellidos,ci,edad,id_equipo)
VALUES('jug-444','Sandra','Solis','8997844LP',20,'equ-333');
INSERT INTO jugador(id_jugador,nombres,apellidos,ci,edad,id_equipo)
VALUES('jug-555','Ana','Mica','8997855LP',23,'equ-333');

SELECT *
FROM equipo;

Select ju.nombres,ju.apellidos,ju.edad
FROM jugador as ju
inner JOIN equipo as eq on eq.id_equipo=ju.id_equipo
WHERE ju.edad<=20 AND eq.nombre_equipo='404 Not found';



SELECT ju.nombres,ju.apellidos,ju.edad,cam.nombre_campeonato,eq.nombre_equipo
FROM jugador as ju
INNER JOIN equipo as eq on eq.id_equipo=ju.id_equipo
INNER JOIN campeonato as cam on cam.id_campeonato=eq.id_campeonato
WHERE cam.sede='El Alto' AND eq.id_equipo='equ-333' AND ju.edad>20;

--Manejo de consultas
--Ejercicio 3.1
Select *
FROM jugador as ju
WHERE ju.id_equipo='equ-222';

--Ejercicio 3.2
SELECT ju.nombres, ju.apellidos
FROM jugador as ju
INNER JOIN equipo as eq ON eq.id_equipo=ju.id_equipo
INNER JOIN campeonato as cam ON cam.id_campeonato=eq.id_campeonato
WHERE cam.sede='El Alto';

--Ejercicio 3.3
Select *
From jugador as ju
Inner JOIN equipo as eq ON eq.id_equipo=ju.id_equipo
WHERE ju.edad>=21 AND eq.categoria='VARONES';

--Ejercicio 3.4
SELECT *
FROM jugador as ju
WHERE ju.nombres LIKE 'S%';

--Ejercicio 3.5
SELECT eq.nombre_equipo
FROM equipo as eq
INNER join campeonato as cam on cam.id_campeonato=eq.id_campeonato
WHERE eq.id_campeonato='camp-111' AND eq.categoria='MUJERES';

--Ejercicio 3.6
SELECT eq.nombre_equipo
FROM equipo as eq
INNER JOIN jugador as ju ON ju.id_equipo=eq.id_equipo
WHERE ju.id_jugador='jug-333';

--Ejercicio 3.7
SELECT cam.nombre_campeonato
FROM campeonato as cam
Inner Join equipo as eq ON cam.id_campeonato=eq.id_campeonato
inner join jugador as ju ON eq.id_equipo=ju.id_equipo
WHERE  ju.id_jugador='jug-333';

--Ejercicio 3.8
SELECT ju.nombres,ju.apellidos,cam.nombre_campeonato,eq.nombre_equipo
FROM jugador as ju
INNER JOIN equipo as eq on eq.id_equipo=ju.id_equipo
INNER JOIN campeonato as cam on cam.id_campeonato=eq.id_campeonato
WHERE eq.id_equipo='equ-222' AND cam.sede='El Alto';

--Ejercicio 3.9
Select count (*) equipos_inscritos
FROM equipo as eq
INNER JOIN campeonato as cam ON cam.id_campeonato=eq.id_campeonato;

--Ejercicio 3.10
Select count (eq.categoria) varones_inscritos
FROM equipo as eq
INNER JOIN jugador as ju ON ju.id_equipo=eq.id_equipo
WHERE eq.categoria='VARONES';

