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
("mother","angeles@gmail.com","Mª Angeles","Camacho Lorente","654987123"),
("father","juan@gmail.com","Juan","Valdivia Bizarro","821654753"),
("juandfe","juandnjv@gmail.com","Juan Antonio","Valdivia Camacho","640282614"),
("bolas79","francisco@gmail.com","Francisco","Valdivia Camacho","369852147"),
("fabiolo","fabi@gmail.com","Fabian","Valdivia Camacho","789951357"),
("nereas","nerea@gmail.com","Nerea","Valdivia Amoros","852654753"),
("jolelito","joel@gmail.com","Joel","Valdivia Amoros","963357951");

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

DROP TABLE IF EXISTS banners;

CREATE TABLE banners(
	banner_id int not null auto_increment,
    title varchar(50) not null,
    text varchar(255) not null,
    color char(10) null,
	create_at timestamp not null default (now()),
    primary key(banner_id)
);
INSERT INTO banners(title, text, color) 
VALUES 
("Por que adoptar?","Facere at pariatur, repellendus nulla, neque dolorem accusamus debitis quasi nostrum nihil perferendis quae quisquam dolorum corporis cumque temporibus quaerat placeat rerum.","white"),
("Beneficios al adoptar","Facere at pariatur, repellendus nulla, neque dolorem accusamus debitis quasi nostrum nihil perferendis quae quisquam dolorum corporis cumque temporibus quaerat placeat rerum.","pink");