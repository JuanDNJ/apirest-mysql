DROP DATABASE IF EXISTS mascotas;

CREATE DATABASE mascotas;

SHOW databases;

USE mascotas;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
	user_id int not null auto_increment,
    user_handle varchar(50) not null unique,
    first_name varchar(50) not null,
    last_name varchar(100) not null,
    email varchar(50) not null unique,
    password char(50) null,
    role char(20) not null default('user'),
    is_active boolean not null default false,
    age int(3) null default(null),
    address varchar(255) null,
    photo_url varchar(500) not null default('http://avatar.png'),
    phone_number char(12) unique,
    create_at timestamp not null default (now()),
    primary key(user_id)
);

INSERT INTO users(user_handle, first_name, last_name, email, password, role, age, address, phone_number)
VALUES
("mother","Mª Angeles", "Camacho Lorente", "angeles@gmail.com", "test123", "user", "85", "", "654987123"),
("father","Juan", "Valdivia Bizarro", "juan@gmail.com", "test123", "user", "87",  "", "821654753"),
("juandfe", "Juan Antonio", "Valdivia Camacho", "juandnjv@gmail.com", "test123", "admin", "48",  "", "640282614"),
("bolas79", "Francisco", "Valdivia Camacho", "francisco@gmail.com", "test123", "user", "45",  "", "369852147"),
("fabiolo", "Fabian", "Valdivia Camacho", "fabi@gmail.com", "test123", "user", "46",  "", "789951357"),
("nereas", "Nerea", "Valdivia Amoros", "nerea@gmail.com", "test123", "user", "13",  "", "852654753"),
("jolelito", "Joel", "Valdivia Amoros", "joel@gmail.com", "test123", "user", "10",  "", "963357951");

/**/

DROP TABLE IF EXISTS pets;

CREATE TABLE pets(
	pet_id int not null auto_increment,
    name varchar(20) not null,
    photo_url varchar(255) null,
    years int(3) null default(null),
    category char(20) not null,
	create_at timestamp not null default (now()),
    primary key(pet_id)
);
INSERT INTO pets(name,photo_url,years, category) 
VALUES 
("Winter","https://fotografias.lasexta.com/clipping/cmsimages01/2022/08/09/3FFA8546-05CE-4608-9B69-6602D02A4C58/cachorro-pomsky_103.jpg?crop=1183,887,x0,y0&width=1200&height=900&optimize=low&format=webply",8,"dogs"),
("Sunn","https://estaticos-cdn.prensaiberica.es/clip/823f515c-8143-4044-8f13-85ea1ef58f3a_16-9-discover-aspect-ratio_default_0.jpg",3,"dogs"),
("Moonlight","https://images.unsplash.com/photo-1535591273668-578e31182c4f?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjM2NTI5fQ",1,"fish"),
("Toby","https://images.theconversation.com/files/525305/original/file-20230510-15-ol6krl.jpg?ixlib=rb-1.1.0&rect=0%2C552%2C4500%2C2250&q=45&auto=format&w=668&h=324&fit=crop",1,"rodents"),
("Sit","https://www.diariodesevilla.es/2023/05/07/sociedad/Descubre-curiosidades-hamster-mascotas_1790831708_183903754_667x375.jpg",2,"rodents"),
("Small","https://www.elmueble.com/medio/2022/06/09/hamster_b72d1bb0_1200x630.jpg",3,"rodents"),
("Black Elles","https://www.elmueble.com/medio/2022/06/09/hamster_608da04e_1000x686.jpg",6,"rodents"),
("Mari","https://images.hola.com/imagenes/mascotas/20211116199664/hamster-cuanto-tiempo-vive-dn/1-20-137/cuanto-vive-hamster-enfermedades-t.jpg",1,"rodents"),
("Jinnx","https://c.files.bbci.co.uk/48DD/production/_107435681_perro1.jpg",2,"dogs"),
("Jilger","https://www.thesprucepets.com/thmb/r23RBk0t4DC9UHp2pTzuXLz7Jj4=/3600x0/filters:no_upscale():strip_icc()/popular-small-bird-species-390926-hero-d3d0af7bb6ed4947b0c3c5afb4784456.jpg",0.5,"birds"),
("Yellow","https://scx2.b-cdn.net/gfx/news/hires/2022/birds-1.jpg",5,"birds"),
("Colorin","https://media.newyorker.com/photos/5a95a5b13d9089123c9fdb7e/1:1/w_3289,h_3289,c_limit/Petrusich-Dont-Mess-with-the-Birds.jpg",1,"birds"),
("Shaco","https://www.thespruce.com/thmb/8gZkGMzHNAMhbMPY6bbFsLT2Os4=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/types-of-birds-of-prey-387307-hero-bbcd393587da4b039f58dfbe4e996cf4.jpg",2,"birds"),
("Boby","https://images.hola.com/imagenes/mascotas/20230428231045/razas-perros-toy/1-242-978/schnauzer-miniatura-m.jpg?tx=w_680",7,"dogs"),
("Serpi","https://www.hospitalveterinariglories.com/wp-content/uploads/2022/03/30-03-22-%C2%BFQue%CC%81-es-la-brumacio%CC%81n-en-los-reptiles-676x451.jpg",2,"reptiles"),
("Tobias","https://www.nationalgeographic.com.es/medio/2022/04/26/camaleon_4fcd8b91_800x800.jpg",10,"reptiles"),
("Slow","https://www.prensa-latina.cu/wp-content/uploads/2022/06/64-A-Las-tortugas-son-animales-anfibios-1.jpg",15,"reptiles"),
("Lara","https://cdn-prd.content.metamorphosis.com/wp-content/uploads/sites/6/2022/12/shutterstock_781327003-1-768x512.jpg",1,"cats"),
("Misino","https://s01.sgp1.cdn.digitaloceanspaces.com/article/51036-cwobnirfka-1580816618.jpeg",1,"cats"),
("Po","https://icatcare.org/app/uploads/2018/07/Thinking-of-getting-a-cat.png",5,"cats");

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


DROP TABLE IF EXISTS front_pages;

CREATE TABLE front_pages(
	front_id int not null auto_increment,
    title varchar(50) not null,
    text varchar(255) not null,
    photo_url varchar(255) null,
    bg_color char(20) null,
    text_color char(10) null,
    title_color char(10) null,
	create_at timestamp not null default (now()),
    primary key(front_id)
);
INSERT INTO front_pages(title, text, photo_url, bg_color, text_color, title_color) 
VALUES 
("Por que adoptar?","Facere at pariatur, repellendus nulla, neque dolorem accusamus debitis quasi nostrum nihil perferendis quae quisquam dolorum corporis cumque temporibus quaerat placeat rerum.","https://firebasestorage.googleapis.com/v0/b/juandfe.appspot.com/o/api%2Fv1%2Fpets%2Fdogs%2Fperros1024x1024.jpg?alt=media&token=e629ebfb-f72a-4d8f-b01c-98a989eb4259","#223","#fff","#fff");

DROP TABLE IF EXISTS categories;

CREATE TABLE categories(
	category_id int not null auto_increment,
    name varchar(50) not null,
    photo_url varchar(255) null,
    text_color char(10) null,
	create_at timestamp not null default (now()),
    primary key(category_id)
);
INSERT INTO categories(name) 
VALUES 
("Dogs"),
("Cats"),
("Birds"),
("Reptils"),
("Rodents"),
("Fishs");

DROP TABLE IF EXISTS articles;

CREATE TABLE articles(
	article_id int not null auto_increment,
    title char(50) not null,
    text varchar(1000) not null,
    photo_url varchar(255) null,
    title_color char(20) null,
    text_color char(20) null,
    is_active boolean not null default false,
	create_at timestamp not null default (now()),
    primary key(article_id)
);
INSERT INTO articles(title, text, is_active) 
VALUES 
("Por que adoptar, beneficios?","Lorem, ipsum dolor sit amet consectetur adipisicing elit. Unde officiis quasi deserunt quia suscipit. Laborum quasi, veritatis esse repudiandae cumque, magni iusto cum repellat enim dolores numquam maxime omnis doloribus? Beatae, nobis quis. Modi dolorum doloremque aspernatur aut similique fuga itaque, voluptas vero? Dolore, doloribus! Iure aperiam quisquam accusantium ipsam quidem exercitationem laboriosam facilis, earum nesciunt expedita assumenda atque voluptatibus officia ex animi non inventore cumque tempora consectetur nisi ullam voluptatem quam? Voluptate magnam velit beatae deleniti quos vitae eos sit minima! Non, quae? Voluptatibus consequuntur ducimus porro sequi voluptates similique est laborum repellendus, rem dolores eum tempore, molestias quam!",true),
("Mi segundo articulo","Lorem, ipsum dolor sit amet consectetur adipisicing elit. Unde officiis quasi deserunt quia suscipit. Laborum quasi, veritatis esse repudiandae cumque, magni iusto cum repellat enim dolores numquam maxime omnis doloribus? Beatae, nobis quis. Modi dolorum doloremque aspernatur aut similique fuga itaque, voluptas vero? Dolore, doloribus! Iure aperiam quisquam accusantium ipsam quidem exercitationem laboriosam facilis, earum nesciunt expedita assumenda atque voluptatibus officia ex animi non inventore cumque tempora consectetur nisi ullam voluptatem quam? Voluptate magnam velit beatae deleniti quos vitae eos sit minima! Non, quae? Voluptatibus consequuntur ducimus porro sequi voluptates similique est laborum repellendus, rem dolores eum tempore, molestias quam!",false),
("Mi tercer articulo","Lorem, ipsum dolor sit amet consectetur adipisicing elit. Unde officiis quasi deserunt quia suscipit. Laborum quasi, veritatis esse repudiandae cumque, magni iusto cum repellat enim dolores numquam maxime omnis doloribus? Beatae, nobis quis. Modi dolorum doloremque aspernatur aut similique fuga itaque, voluptas vero? Dolore, doloribus! Iure aperiam quisquam accusantium ipsam quidem exercitationem laboriosam facilis, earum nesciunt expedita assumenda atque voluptatibus officia ex animi non inventore cumque tempora consectetur nisi ullam voluptatem quam? Voluptate magnam velit beatae deleniti quos vitae eos sit minima! Non, quae? Voluptatibus consequuntur ducimus porro sequi voluptates similique est laborum repellendus, rem dolores eum tempore, molestias quam!",false),
("Mi cuarto articulo","Lorem, ipsum dolor sit amet consectetur adipisicing elit. Unde officiis quasi deserunt quia suscipit. Laborum quasi, veritatis esse repudiandae cumque, magni iusto cum repellat enim dolores numquam maxime omnis doloribus? Beatae, nobis quis. Modi dolorum doloremque aspernatur aut similique fuga itaque, voluptas vero? Dolore, doloribus! Iure aperiam quisquam accusantium ipsam quidem exercitationem laboriosam facilis, earum nesciunt expedita assumenda atque voluptatibus officia ex animi non inventore cumque tempora consectetur nisi ullam voluptatem quam? Voluptate magnam velit beatae deleniti quos vitae eos sit minima! Non, quae? Voluptatibus consequuntur ducimus porro sequi voluptates similique est laborum repellendus, rem dolores eum tempore, molestias quam!",false);

DROP TABLE IF EXISTS config;

CREATE TABLE config(
	config_id int not null auto_increment,
    title char(50) not null,
    description varchar(1000) not null,
    admin char(50) not null,
    address varchar(100) null,
    email char(100) not null,
    photo_url varchar(255) null,
    logo_url varchar(255) not null,
    title_color char(20) null,
    text_color char(20) null,
	create_at timestamp not null default (now()),
    primary key(config_id)
);
INSERT INTO config(title, description, admin, email, photo_url, logo_url, title_color, text_color) 
VALUES 
(
    "ADOPTA UN AMIGO",
    "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Unde officiis quasi deserunt quia suscipit. Laborum quasi, veritatis esse repudiandae cumque, magni iusto cum repellat enim dolores numquam maxime omnis doloribus? Beatae, nobis quis. Modi dolorum doloremque aspernatur aut similique fuga itaque, voluptas vero? Dolore, doloribus! Iure aperiam quisquam accusantium ipsam quidem exercitationem laboriosam facilis, earum nesciunt expedita assumenda atque voluptatibus officia ex animi non inventore cumque tempora consectetur nisi ullam voluptatem quam? Voluptate magnam velit beatae deleniti quos vitae eos sit minima! Non, quae? Voluptatibus consequuntur ducimus porro sequi voluptates similique est laborum repellendus, rem dolores eum tempore, molestias quam!",
    "Juan Antonio Valdivia Camacho",
    "juandevnjv@gmail.com",
    "https://firebasestorage.googleapis.com/v0/b/juandfe.appspot.com/o/api%2Fv1%2Fpets%2Fdogs%2Fperros1024x1024.jpg?alt",
    "react.svg",
    "snow",
    "silver");