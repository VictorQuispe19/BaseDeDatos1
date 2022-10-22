CREATE DATABASE defensa_hito3_unifranzitos;
USE defensa_hito3_unifranzitos;

CREATE TABLE campeonato(id_campeonato varchar (20) PRIMARY KEY not null,
nombre_campeonato varchar (40) not null,
sede varchar(30) not null);

INSERT INTO campeonato(id_campeonato,nombre_campeonato,sede)
values('camp-111','Campeonato Unifranz','El Alto');

INSERT INTO campeonato(id_campeonato,nombre_campeonato,sede)
values('camp-222','Campeonato Unifranz','Cochabamba');

CREATE TABLE equipo(id_equipo varchar (20) PRIMARY KEY not null,
nombre_equipo varchar(30) not null,
categoria varchar (10) not null,
id_campeonato varchar (20),
FOREIGN KEY (id_campeonato) REFERENCES campeonato(id_campeonato));

INSERT INTO equipo(id_equipo,nombre_equipo,categoria,id_campeonato)
Values('equ-111','Google','VARONES','camp-111');

INSERT INTO equipo(id_equipo,nombre_equipo,categoria,id_campeonato)
Values('equ-222','404 Not found','VARONES','camp-111');

INSERT INTO equipo(id_equipo,nombre_equipo,categoria,id_campeonato)
Values('equ-333','girls unifranz','MUJERES','camp-111');

CREATE TABLE jugador(id_jugador varchar(12) PRIMARY KEY not null,
nombres varchar(30) not null,
apellidos varchar(50) not null,
ci varchar (15) not null,
edad int not null,
id_equipo varchar(20) not null,
FOREIGN KEY (id_equipo) REFERENCES equipo(id_equipo));

Select count (*)
From jugador
WHERE nombres LIKE 'S%';

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
FROM jugador as ju
WHERE ju.nombres LIKE 'S%' and ju.apellidos LIKE '%s';

SELECT ju.nombres,ju.apellidos,ju.edad
FROM jugador as ju
INNER JOIN equipo as eq ON eq.id_equipo=ju.id_equipo
WHERE ju.edad<=20 AND eq.nombre_equipo='404 Not found';

SELECT ju.nombres,ju.apellidos,ju.edad,ju.id_equipo,eq.nombre_equipo
FROM jugador as ju
inner join equipo as eq ON eq.id_equipo=ju.id_equipo
Inner Join campeonato as cam ON cam.id_campeonato=eq.id_campeonato
WHERE cam.sede='El Alto' AND eq.id_equipo='equ-333' AND ju.edad>20;

Create Table premios(id_posicion int Primary Key not null,
id_equipo varchar(20) not null,
id_campeonato varchar(20) not null,
premio varchar (50) not null,
FOREIGN KEY (id_equipo) REFERENCES equipo(id_equipo),
Foreign Key(id_campeonato) REFERENCES campeonato(id_campeonato));

INSERT INTO premios(id_posicion,id_equipo,id_campeonato,premio)
Values (1,'equ-222','camp-111','1000 Bs.');

INSERT INTO premios(id_posicion,id_equipo,id_campeonato,premio)
Values (2,'equ-111','camp-111','500 Bs.');

SELECT *
FROM premios;

Select ju.nombres,ju.apellidos, pr.premio,pr.id_posicion
From jugador as ju
INNER join equipo as eq ON eq.id_equipo=ju.id_equipo
INNER JOIN premios as pr ON pr.id_equipo=eq.id_equipo
WHERE pr.id_posicion=1 AND eq.categoria='VARONES';

Select count (*) inscritos
From jugador as ju
INNER JOIN equipo as eq ON eq.id_equipo=ju.id_equipo
WHERE ju.id_equipo='equ-222';