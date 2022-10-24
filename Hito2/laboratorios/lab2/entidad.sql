--Creamos la base de datos
CREATE DATABASE ventas;
USE ventas;
--Creamos las tablas correspondientes
CREATE TABLE cliente(CI varchar(15) PRIMARY KEY not null,
nombres varchar(50) not null, telefono integer not null,email varchar(100) not null);

CREATE TABLE vehiculo(num_serie varchar (50) PRIMARY KEY,
marca varchar (30) not null, color varchar (30) not null);

CREATE TABLE empresa(
id_emp varchar (50) PRIMARY KEY not null,
nombre_empresa varchar (100),
telefono integer);

--Relacionamos las tablas
CREATE TABLE compra(
nºcompra integer Primary Key,
id_emp varchar (50),
CI varchar(15),
num_serie varchar(50),

FOREIGN KEY (id_emp) REFERENCES empresa(id_emp),
FOREIGN KEY (CI) REFERENCES cliente(CI),
FOREIGN KEY (num_serie) REFERENCES vehiculo(num_serie)
);

--LLenamos con datos las tablas
Insert into cliente(CI,nombres,telefono,email)
values('123456789LP','cliente1',78945612,'cliente1@gmail.com');

Insert into vehiculo(num_serie,marca,color)
values('2500-dpe','SUZUKI','ROJO');

Insert into empresa(id_emp,nombre_empresa,telefono)
values('3300-Empresa1','Imcruz',800456123);
TRUNCATE TABLE cliente;
INSERT INTO compra(nºcompra,id_emp,CI,num_serie)
values(789456,'3300-Empresa1','123456789LP','2500-dpe');

SELECT *
FROM compra;