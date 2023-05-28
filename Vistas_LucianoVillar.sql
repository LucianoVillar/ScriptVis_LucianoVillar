create schema lifegame;
use lifegame;
create table Pais( 
id_pais INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
nombre VARCHAR(50) 
);  

create table categoria( 
id_categoria INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
nombre VARCHAR(50) 
); 

create table usuario( 
id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
nombre VARCHAR(50) NOT NULL, 
documento VARCHAR(15) NOT NULL, 
birthdate DATE NOT NULL, 
id_pais INT NOT NULL, 
direccion VARCHAR(50), 
mail VARCHAR(50), 
telefono INT, 
FOREIGN KEY fk_id_pais(id_pais) REFERENCES Pais(id_pais)
);

create table empresa( 
id_empresa INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
nombre VARCHAR(50) NOT NULL, 
id_pais INT NOT NULL, 
FOREIGN KEY fk_id_pais(id_pais)REFERENCES Pais(id_pais) 
); 

create table juego( 
id_juego INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
nombre VARCHAR(50) NOT NULL, 
id_empresa INT NOT NULL, 
fecha DATE, 
id_categoria INT NOT NULL, 
descripcion VARCHAR(250), 
FOREIGN KEY fk_id_empresa(id_empresa)REFERENCES empresa(id_empresa), 
FOREIGN KEY fk_id_categoria(id_categoria)REFERENCES categoria(id_categoria) 
); 

create table valoracion( 
id_reseña INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
id_juego INT NOT NULL, 
valoracion INT NOT NULL, 
reseña VARCHAR(250), 
id_usuario INT NOT NULL, 
FOREIGN KEY fk_id_juego(id_juego)REFERENCES juego(id_juego), 
FOREIGN KEY fk_id_usuario(id_usuario)REFERENCES usuario(id_usuario) 
); 

create table compra( 
id_compra INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
id_usuario INT NOT NULL, 
id_juego INT NOT NULL, 
monto DECIMAL(6,2), 
FOREIGN KEY fk_id_usuario (id_usuario)REFERENCES usuario(id_usuario), 
FOREIGN KEY fk_id_juego(id_juego)REFERENCES juego(id_juego) 
);


SELECT * FROM lifegame.categoria;
select * from lifegame.pais;
select * from lifegame.usuario;
select * from lifegame.empresa;
select * from lifegame.juego;
select * from lifegame.valoracion;
select * from lifegame.compra;

select * from lifegame.pais;
INSERT INTO pais (id_pais, nombre) VALUES (11, 'Peru'), (12,'Bolivia'),(13,'Ecuador'); 
select * from lifegame.pais;
INSERT INTO pais(id_pais, nombre) VALUES (14,"Suecia"),(15,"Corea del Sur");
INSERT INTO empresa(id_empresa, nombre, id_pais) VALUES (4,"Epic Games", 5 ),(5,"Mojang Studios",14),(6,"Pubg Studios",15);INSERT INTO juego (id_juego, nombre,id_empresa, fecha,id_categoria, descripcion) VALUES 
(4, 'Fortnite', 4,'2017-09-26', 3,'Battle Royale y juego de acción'),
(5, 'Minecraft',5, '2009-11-18', 7,'Sandbox y Mundo Abierto'),
(6, 'PUBG', 6,'2017-08-23', 3,'Battle Royale multijugador');

CREATE VIEW contacto_usuarios as select usuario.nombre,usuario.mail, usuario.telefono from usuario;
select * from lifegame.contacto_usuarios;
CREATE VIEW descripcion as select juego.nombre, juego.descripcion from juego;
select * from lifegame.descripcion;
CREATE VIEW Uruguay as select * from usuario where id_pais = 1;
Select * from lifegame.Uruguay;
CREATE or replace VIEW juegos_USA as select juego.nombre as juego, juego.descripcion, empresa.nombre from juego inner join empresa on juego.id_empresa = empresa.id_empresa where empresa.id_pais = 5;
select * FROM juegos_usa;
CREATE or replace VIEW notFreeBuy as select usuario.nombre, compra.id_compra, compra.id_juego,compra.monto from usuario inner join compra on usuario.id_usuario = compra.id_usuario where monto != 0;
select * from notfreebuy;





