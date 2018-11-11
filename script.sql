CREATE DATABASE TP2;

CREATE TABLE persona
(
  id SERIAL PRIMARY KEY,
  apellido VARCHAR(50), 
  nombre VARCHAR(50), 
  usuario VARCHAR(50),
  clave TEXT
);

CREATE TABLE peliculas
(
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(50)
);

CREATE TABLE pelis_que_vio
(
  usuario_id INT,
  pelicula_id INT,
  FOREIGN KEY (usuario_id) REFERENCES persona (Id),
  FOREIGN KEY (pelicula_id) REFERENCES peliculas (Id)
);


insert into persona (apellido, nombre, usuario, clave) values ('Cazzari', 'Fernanda', 'Fernanda', '1234');
insert into persona (apellido, nombre, usuario, clave) values ('Rick', 'Dario', 'Rick', '1234');

insert into peliculas (nombre) values ('Titanic');
insert into peliculas (nombre) values ('Jurasic Park');
insert into peliculas (nombre) values ('Matrix');
insert into peliculas (nombre) values ('Venom');
insert into peliculas (nombre) values ('Spiderman');
insert into peliculas (nombre) values ('Batman');
insert into peliculas (nombre) values ('Aquaman');
insert into peliculas (nombre) values ('Superman');
insert into peliculas (nombre) values ('Avengers 1');
insert into peliculas (nombre) values ('Avengers 2');

insert into pelis_que_vio (usuario_id, pelicula_id) values (1,1);
insert into pelis_que_vio (usuario_id, pelicula_id) values (1,2);
insert into pelis_que_vio (usuario_id, pelicula_id) values (1,3);
insert into pelis_que_vio (usuario_id, pelicula_id) values (1,4);
insert into pelis_que_vio (usuario_id, pelicula_id) values (1,5);
insert into pelis_que_vio (usuario_id, pelicula_id) values (2,1);
insert into pelis_que_vio (usuario_id, pelicula_id) values (2,2);
insert into pelis_que_vio (usuario_id, pelicula_id) values (2,3);
insert into pelis_que_vio (usuario_id, pelicula_id) values (2,4);

select u1.id, u2.id as id2
	from usuario as u1 
	inner join usuario as u2 on u1.id != u2.id 
	where not exists (select p3.pelicula_id from pelis_que_vio as p3 where p3.usuario_id = u3.id or p3.usuarioid = u2.id
						except (
						select p1.pelicula_id from pelis_que_vio as p1 where p1.usuario_id = u1.id
						intersect 
						select p2.pelicula_id from pelis_que_vio where p2.usuario_id = u2.id)
					)
	and u1.id < u2.id;