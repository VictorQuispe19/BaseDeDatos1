USE universidad;
CREATE TABLE letras_A
(letra char PRIMARY KEY NOT NULL);
CREATE TABLE letras_B 
(letras char PRIMARY KEY NOT NULL);
INSERT INTO letras_A(letra)values ('D');
INSERT INTO letras_A(letra)values ('E');
INSERT INTO letras_A(letra)values ('F');
INSERT INTO letras_A(letra)values ('G');
INSERT INTO letras_A(letra)values ('H');
INSERT INTO letras_B(letras)VALUES ('A');
INSERT INTO letras_B(letras)values ('B');
INSERT INTO letras_B(letras)values ('E');
INSERT INTO letras_B(letras)values ('H');

SELECT ta.letra,tb.letras
FROM letras_A as ta
INNER JOIN letras_B AS tb ON ta.letra=tb.letras;

CREATE TABLE numeros_A
(numer int NOT NULL);
INSERT INTO numeros_A(numer)values (1);
INSERT INTO numeros_A(numer)values (2);
INSERT INTO numeros_A(numer)values (3);
INSERT INTO numeros_A(numer)values (4);
INSERT INTO numeros_A(numer)values (5);
INSERT INTO numeros_A(numer)values (6);
INSERT INTO numeros_A(numer)values (7);
SELECT ta. * FROM numeros_A AS ta;

CREATE TABLE numeros_B
(numero int NOT NULL);
INSERT INTO numeros_B(numero)values (4);
INSERT INTO numeros_B(numero)values (5);
INSERT INTO numeros_B(numero)values (6);
INSERT INTO numeros_B(numero)values (7);
INSERT INTO numeros_B(numero)values (8);
INSERT INTO numeros_B(numero)values (9);
SELECT tb. * FROM numeros_B AS tb;

SELECT ta.numer,tb.numero
FROM numeros_A as ta
INNER JOIN numeros_B AS tb ON ta.numer=tb.numero;

SELECT ta.numer,tb.numero
FROM numeros_A as ta
INNER JOIN numeros_B AS tb ON ta.numer=tb.numero
WHERE tb.numero>5 AND ta.numer>5;

--INSERT INTO numeros_A (numer) VALUES (1);
--(2),
--(3),
--(4),
--(5),
--(6),
--(7);
--INSERT INTO numeros_B (numer) VALUES 
--(4);
--(5),
--(6),
--(7),
--(8),
--(9);
CREATE TABLE notas_p1(notas int);
INSERT INTO notas_p1(notas) VALUES 
(51),
(40),
(60),
(75),
(30);
SELECT *
FROM notas_p1;

CREATE TABLE notas_p2(notas int);
INSERT INTO notas_p2(notas) VALUES 
(51),
(60),
(100);
CREATE TABLE notas_p3(notas int);
INSERT INTO notas_p3(notas) VALUES 
(20),
(21),
(23),
(48),
(51),
(60);

SELECT noa.notas,nob.notas,noc.notas
FROM notas_p1 as noa
INNER JOIN notas_p2 AS nob ON noa.notas=nob.notas
INNER JOIN notas_p3 AS noc ON noa.notas=noc.notas;

SELECT noa.notas,nob.notas,noc.notas
FROM notas_p1 as noa
INNER JOIN notas_p2 AS nob ON noa.notas=nob.notas
INNER JOIN notas_p3 AS noc ON nob.notas=noc.notas
WHERE noc.notas BETWEEN 51 AND 100;

