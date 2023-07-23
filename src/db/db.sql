DROP DATABASE IF EXISTS mascotas;

CREATE DATABASE mascotas;

SHOW databases;

USE mascotas;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
	user_id int not null auto_increment,
    user_handle varchar(20) not null unique,
    first_name varchar(50) null,
    last_name varchar(100) null,
    email varchar(50) not null unique,
    password varchar(500) null,
    role char(20) not null default('user'),
    is_active boolean not null default true,
    age int(3) null default(null),
    address varchar(255) null,
    photo_url varchar(500) not null default('http://localhost:5174/juan-perfil32x32.jpg'),
    phone_number char(12) unique,
    create_at timestamp not null default (now()),
    primary key(user_id)
);
/*
INSERT INTO users(user_handle, first_name, email, password, role, phone_number)
VALUES
("admin","admin", "admin@gmail.com", "admin@2023", "admin", "654987123");
*/
/**/
DROP TABLE IF EXISTS roles;

CREATE TABLE roles(
	rol_id int not null auto_increment,
    name char(20) not null unique,
    level int(2) not null default(0),
    create_at timestamp not null default (now()),
    primary key(rol_id)
);
INSERT INTO roles(name, level) 
VALUES
("admin", 4),
("moderator", 3),
("colaborator", 2),
("guest", 0),
("user",1);

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
(
"Por que adoptar?",
"Facere at pariatur, repellendus nulla, neque dolorem accusamus debitis quasi nostrum nihil perferendis quae quisquam dolorum corporis cumque temporibus quaerat placeat rerum.",
"https://firebasestorage.googleapis.com/v0/b/juandfe.appspot.com/o/api%2Fv1%2Fpets%2Fdogs%2Fperros1024x1024.jpg?alt=media&token=e629ebfb-f72a-4d8f-b01c-98a989eb4259",
"#223",
"#fff",
"#fff"
);

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

DROP TABLE IF EXISTS refugios;

CREATE TABLE IF NOT EXISTS  refugios(
    refugio_id int not null auto_increment,
    name varchar(50) not null,
    description varchar(10000) not null,
    create_at timestamp not null default (now()),
    primary key(refugio_id)
);

INSERT INTO refugios(name, description)
VALUE 
("Refugio del Vado de Ordiso","El refugio del Vado de Ordiso es un  refugio libre situado a 1610 mts. de altitud, a una hora de camino por pista desde San Nicol\u00e1s de Bujaruelo.\r\n\r\n Est\u00e1 compuesto por dos habit\u00e1culos, ambos con puerta y uno de ellos con chimenea y ventana. \r\n\r\nConsidero que es un refugio para pasar la noche en caso de urgencia, ya que no est\u00e1 muy limpio(pero tampoco est\u00e1 sucio, dej\u00e9moslo en un t\u00e9rmino medio), y en tan s\u00f3lo 1 hora puedes estar perfectamente en el refugio guardado de Bujaruelo.  \r\n\r\nGrandes vistas sobre la cara sur del Vignemale"),
("Sant Salvador de les Espases","HISTORIA \r\n\r\nLa capilla de San Salvador de las Espadas se encuentra situada en lo alto de un acantilado aislado, el punto de confluencia entre los obispados de Sant Feliu y Vic y los t\u00e9rminos municipales de Esparreguera, Olesa de Montserrat y Vacarisses. Documentada a partir del siglo XIV, era la antigua capilla del Castillo de las Espadas, documentado desde el a\u00f1o 985, y del que s\u00f3lo queda el basamento de una torre circular. \r\n\r\nLigada hist\u00f3ricamente a la poblaci\u00f3n de Esparreguera pertenece al t\u00e9rmino municipal de esta localidad y en la parroquia de Santa Mar\u00ed\u00ada de Olesa desde el 18 de marzo de 1868. \r\n\r\nEl edificio actual corresponde a una reforma del siglo XVI. Tiene una sola nave, de vuelta baja en un principio de ca\u00f1\u00f3n y sin \u00c3\u00a1bside. Fue totalmente restaurada en 1924 gracias a la labor del padre Joan Sol\u00ed , escolapio de Terrassa. Los primeros d\u00ed\u00adas de la guerra civil espa\u00f1ola unos incontrolados quemaron el interior de la capilla, destruyendo su retablo g\u00f3tico, el armonio y los objetos lit\u00fargicos. \r\n\r\nActualmente preside la capilla una imagen del Salvador, obra del artista olesano Amadeu Paltor. En el Museo de Terrassa (castillo cartuja de Vallparad\u00ed\u00ads) se conserva la predela del antiguo retablo. \r\n\r\nEl 22 de abril de 1949 fue declarado Bien Cultural de Inter\u00e9s Nacional (BCIN), protecci\u00f3n publicada en el Bolet\u00ed\u00adn Oficial del Estado (BOE) el 5 de mayo de 1949. \r\n\r\nEn 1970 fue constituida la asociaci\u00f3n Amigos de San Salvador de las Espadas, con sede en la iglesia parroquial de Santa Mar\u00eda de Olesa de Montserrat, vela por su conservaci\u00f3n, organiza anualmente la romer\u00eda el primer domingo de septiembre y abre las puertas de la capilla todos los jueves y domingos. \r\n\r\n\r\nC\u00d3MO LLEGAR? \r\n\r\nNos llegamos en Olesa de Montserrat. Una vez en Olesa tenemos que buscar uno de los dos polideportivos que hay en el pueblo: El Salvador Boada. Es el polideportivo que est\u00e1 en la parte m\u00e1s alta de Olesa. Hay un aparcamiento, dejamos el coche. \r\n\r\n\r\nITINERARIO \r\n\r\nTomamos una pista forestal que sale de detr\u00e1s del polideportivo. Al cabo de unos \r\n50 metros, giramos a la derecha direcci\u00f3n al Pla del Fideuer. (Pal indicador). \r\nSeguimos la pista principal, muy evidente, dejando las pistas forestales que \r\nsalen a ambos lados de la principal. De vez en cuando hay se\u00f1ales amarillas y \r\nverdes. \r\nLlegamos a un mirador - Fuente de la Roureda -, donde podemos contemplar por \r\nprimera vez una magn\u00c3\u00adfica vista del macizo de Montserrat. \r\n\r\nNos olvidamos de la pista que llega al mirador por la izquierda y seguimos la \r\npista que lleva al Plan del Fideuer (poste indicador). \r\nUna vez en el plan del Fideuer - ya llevamos, aproximadamente, una hora caminando \r\n- Si miramos a la izquierda podemos ver una colina con la ermita de San \r\nSalvador y al fondo Montserrat. \r\nEn el Plan Fideuer encontramos postes indicadores del camino hacia San Salvador. \r\nSeguimos unas marcas blancas que se alternan con otras de color \r\nrojo con un c\u00ed\u00adrculo blanco en medio. Llegamos a un collado. Seguimos los \r\nse\u00f1ales y empezamos a bajar hacia un segundo collado. \r\nEn la explanada del segundo collado vamos hacia la izquierda siguiendo las se\u00f1ales. \r\nAl cabo de unos metros, las se\u00f1ales suben arriba por la derecha. Hay que seguir \r\nunos metros, hasta que encontramos a la izquierda un camino con escaleras que ya \r\nlleva directamente a la cima de Sant Salvador de las espadas. \r\nDisfrutamos un rato de la fant\u00e1stica vista de los entornos y sobre todo de \r\nMontserrat y volvemos a Olesa por el mismo camino. \r\n\r\nTIEMPO APROXIMADO DE ASCENSI\u00d3N: una hora y media");