-- Active: 1681160272799@@localhost@3306@appmascotas

DROP DATABASE IF EXISTS mascotas;

CREATE DATABASE mascotas;

SHOW databases;

USE mascotas;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
	user_id int not null auto_increment,
    user_handle varchar(50) not null unique,
    email_address varchar(50) not null unique,
    first_name varchar(50) not null,
    last_name varchar(100) not null,
    phonenumber char(10) unique,
    create_at timestamp not null default (now()),
    primary key(user_id)
);

INSERT INTO users(user_handle, email_address, first_name, last_name, phonenumber)
VALUES
("mother","ange@gmail.com","Mª Ange","Matias Reverte","654987123"),
("father","pierr@gmail.com","Pierr","Garcia Bilbo","821654753"),
("juandfe","juandnjv@gmail.com","Juan Antonio","Garcia Matias","640282614"),
("bolas79","francisco@gmail.com","Francisco","Garcia Matias","369852147"),
("fabiolo","fabi@gmail.com","Fabian","Garcia Matias","789951357"),
("nereas","nerea@gmail.com","Nerea","Garcia Amoros","852654753"),
("jolelito","joel@gmail.com","Joel","Garcia Amoros","963357951");

/**/

DROP TABLE IF EXISTS pets;

CREATE TABLE pets(
	pet_id int not null auto_increment,
    name varchar(20) not null,
	create_at timestamp not null default (now()),
    primary key(pet_id)
);
INSERT INTO pets(name) 
VALUES 
("Winter"),
("Sunn"),
("Moonlight"),
("Toby"),
("Jinnx"),
("Po");