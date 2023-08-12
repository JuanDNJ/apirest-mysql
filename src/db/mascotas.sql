-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 12-08-2023 a las 00:40:01
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mascotas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `article_id` int NOT NULL AUTO_INCREMENT,
  `title` char(50) NOT NULL,
  `text` varchar(1000) NOT NULL,
  `photo_url` varchar(255) DEFAULT NULL,
  `title_color` char(20) DEFAULT NULL,
  `text_color` char(20) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `articles`
--

INSERT INTO `articles` (`article_id`, `title`, `text`, `photo_url`, `title_color`, `text_color`, `is_active`, `create_at`) VALUES
(1, 'Por que adoptar, beneficios?', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Unde officiis quasi deserunt quia suscipit. Laborum quasi, veritatis esse repudiandae cumque, magni iusto cum repellat enim dolores numquam maxime omnis doloribus? Beatae, nobis quis. Modi dolorum doloremque aspernatur aut similique fuga itaque, voluptas vero? Dolore, doloribus! Iure aperiam quisquam accusantium ipsam quidem exercitationem laboriosam facilis, earum nesciunt expedita assumenda atque voluptatibus officia ex animi non inventore cumque tempora consectetur nisi ullam voluptatem quam? Voluptate magnam velit beatae deleniti quos vitae eos sit minima! Non, quae? Voluptatibus consequuntur ducimus porro sequi voluptates similique est laborum repellendus, rem dolores eum tempore, molestias quam!', NULL, NULL, NULL, 1, '2023-07-31 07:50:05'),
(2, 'Mi segundo articulo', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Unde officiis quasi deserunt quia suscipit. Laborum quasi, veritatis esse repudiandae cumque, magni iusto cum repellat enim dolores numquam maxime omnis doloribus? Beatae, nobis quis. Modi dolorum doloremque aspernatur aut similique fuga itaque, voluptas vero? Dolore, doloribus! Iure aperiam quisquam accusantium ipsam quidem exercitationem laboriosam facilis, earum nesciunt expedita assumenda atque voluptatibus officia ex animi non inventore cumque tempora consectetur nisi ullam voluptatem quam? Voluptate magnam velit beatae deleniti quos vitae eos sit minima! Non, quae? Voluptatibus consequuntur ducimus porro sequi voluptates similique est laborum repellendus, rem dolores eum tempore, molestias quam!', NULL, NULL, NULL, 0, '2023-07-31 07:50:05'),
(3, 'Mi tercer articulo', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Unde officiis quasi deserunt quia suscipit. Laborum quasi, veritatis esse repudiandae cumque, magni iusto cum repellat enim dolores numquam maxime omnis doloribus? Beatae, nobis quis. Modi dolorum doloremque aspernatur aut similique fuga itaque, voluptas vero? Dolore, doloribus! Iure aperiam quisquam accusantium ipsam quidem exercitationem laboriosam facilis, earum nesciunt expedita assumenda atque voluptatibus officia ex animi non inventore cumque tempora consectetur nisi ullam voluptatem quam? Voluptate magnam velit beatae deleniti quos vitae eos sit minima! Non, quae? Voluptatibus consequuntur ducimus porro sequi voluptates similique est laborum repellendus, rem dolores eum tempore, molestias quam!', NULL, NULL, NULL, 0, '2023-07-31 07:50:05'),
(4, 'Mi cuarto articulo', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Unde officiis quasi deserunt quia suscipit. Laborum quasi, veritatis esse repudiandae cumque, magni iusto cum repellat enim dolores numquam maxime omnis doloribus? Beatae, nobis quis. Modi dolorum doloremque aspernatur aut similique fuga itaque, voluptas vero? Dolore, doloribus! Iure aperiam quisquam accusantium ipsam quidem exercitationem laboriosam facilis, earum nesciunt expedita assumenda atque voluptatibus officia ex animi non inventore cumque tempora consectetur nisi ullam voluptatem quam? Voluptate magnam velit beatae deleniti quos vitae eos sit minima! Non, quae? Voluptatibus consequuntur ducimus porro sequi voluptates similique est laborum repellendus, rem dolores eum tempore, molestias quam!', NULL, NULL, NULL, 0, '2023-07-31 07:50:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banners`
--

DROP TABLE IF EXISTS `banners`;
CREATE TABLE IF NOT EXISTS `banners` (
  `banner_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `text` varchar(255) NOT NULL,
  `color` char(10) DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `banners`
--

INSERT INTO `banners` (`banner_id`, `title`, `text`, `color`, `create_at`) VALUES
(1, 'Por que adoptar?', 'Adoptar una mascota es una de las mejores cosas que puedes hacer en tu vida. Si adoptas una mascota, no solo le das una nueva oportunidad de vida, sino que también le das una nueva oportunidad a tu vida..', 'white', '2023-07-31 07:50:05'),
(2, 'Beneficios al adoptar', ' Adoptar un animal de compañía puede traer beneficios a la salud, ya que el cuidado diario hace olvidar a muchas personas otro tipo de preocupaciones, evita la depresión y nos hace sentir útiles.', 'pink', '2023-07-31 07:50:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `photo_url` varchar(255) DEFAULT NULL,
  `text_color` char(10) DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `photo_url`, `text_color`, `create_at`) VALUES
(1, 'All', NULL, NULL, '2023-07-31 07:50:05'),
(2, 'Dogs', NULL, NULL, '2023-07-31 07:50:05'),
(3, 'Cats', NULL, NULL, '2023-07-31 07:50:05'),
(4, 'Birds', NULL, NULL, '2023-07-31 07:50:05'),
(5, 'Reptiles', NULL, NULL, '2023-07-31 07:50:05'),
(6, 'Rodents', NULL, NULL, '2023-07-31 07:50:05'),
(7, 'Fish', NULL, NULL, '2023-07-31 07:50:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config`
--

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `config_id` int NOT NULL AUTO_INCREMENT,
  `title` char(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `admin` char(50) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` char(100) NOT NULL,
  `photo_url` varchar(255) DEFAULT NULL,
  `logo_url` varchar(255) NOT NULL,
  `title_color` char(20) DEFAULT NULL,
  `text_color` char(20) DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `config`
--

INSERT INTO `config` (`config_id`, `title`, `description`, `admin`, `address`, `email`, `photo_url`, `logo_url`, `title_color`, `text_color`, `create_at`) VALUES
(1, 'ADOPTA UN AMIGO', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Unde officiis quasi deserunt quia suscipit. Laborum quasi, veritatis esse repudiandae cumque, magni iusto cum repellat enim dolores numquam maxime omnis doloribus? Beatae, nobis quis. Modi dolorum doloremque aspernatur aut similique fuga itaque, voluptas vero? Dolore, doloribus! Iure aperiam quisquam accusantium ipsam quidem exercitationem laboriosam facilis, earum nesciunt expedita assumenda atque voluptatibus officia ex animi non inventore cumque tempora consectetur nisi ullam voluptatem quam? Voluptate magnam velit beatae deleniti quos vitae eos sit minima! Non, quae? Voluptatibus consequuntur ducimus porro sequi voluptates similique est laborum repellendus, rem dolores eum tempore, molestias quam!', 'Juan Antonio Valdivia Camacho', NULL, 'juandevnjv@gmail.com', 'https://firebasestorage.googleapis.com/v0/b/juandfe.appspot.com/o/api%2Fv1%2Fpets%2Fdogs%2Fperros1024x1024.jpg?alt', 'react.svg', 'snow', 'silver', '2023-07-31 07:50:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docs_pets`
--

DROP TABLE IF EXISTS `docs_pets`;
CREATE TABLE IF NOT EXISTS `docs_pets` (
  `idDocPet` int NOT NULL AUTO_INCREMENT,
  `idVet` int NOT NULL,
  `pet_id` int NOT NULL,
  `vaccinated` tinyint(1) NOT NULL DEFAULT '0',
  `pedigree` tinyint(1) NOT NULL DEFAULT '0',
  `dewormed` tinyint(1) NOT NULL DEFAULT '0',
  `observations` varchar(255) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idDocPet`),
  KEY `pet_id` (`pet_id`),
  KEY `idVet` (`idVet`),
  KEY `idVet_2` (`idVet`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `docs_pets`
--

INSERT INTO `docs_pets` (`idDocPet`, `idVet`, `pet_id`, `vaccinated`, `pedigree`, `dewormed`, `observations`, `create_at`) VALUES
(1, 1, 1, 1, 0, 0, '', '2023-08-12 00:26:41'),
(2, 1, 2, 1, 1, 0, '', '2023-08-12 00:26:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `front_pages`
--

DROP TABLE IF EXISTS `front_pages`;
CREATE TABLE IF NOT EXISTS `front_pages` (
  `front_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `text` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `photo_url` varchar(255) DEFAULT NULL,
  `bg_color` char(20) DEFAULT NULL,
  `text_color` char(10) DEFAULT NULL,
  `title_color` char(10) DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`front_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `front_pages`
--

INSERT INTO `front_pages` (`front_id`, `title`, `text`, `active`, `photo_url`, `bg_color`, `text_color`, `title_color`, `create_at`) VALUES
(1, 'Presentamos a tus nuevos amigos', 'Ayúdanos a mejorar la vida de estos pequeños amigos, que necesitan de tu ayuda, para poder tener una vida mejor.', 1, 'https://firebasestorage.googleapis.com/v0/b/juandfe.appspot.com/o/api%2Fv1%2Fpets%2Fdogs%2Fperros1024x1024.jpg?alt=media&token=e629ebfb-f72a-4d8f-b01c-98a989eb4259', '#223', '#fff', '#fff', '2023-07-31 07:50:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pets`
--

DROP TABLE IF EXISTS `pets`;
CREATE TABLE IF NOT EXISTS `pets` (
  `pet_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `photo_url` varchar(255) DEFAULT NULL,
  `years` int DEFAULT (NULL),
  `category` char(20) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `pets`
--

INSERT INTO `pets` (`pet_id`, `name`, `photo_url`, `years`, `category`, `create_at`) VALUES
(1, 'Winter', 'https://fotografias.lasexta.com/clipping/cmsimages01/2022/08/09/3FFA8546-05CE-4608-9B69-6602D02A4C58/cachorro-pomsky_103.jpg?crop=1183,887,x0,y0&width=1200&height=900&optimize=low&format=webply', 8, 'dogs', '2023-07-31 07:50:05'),
(2, 'Sunn', 'https://estaticos-cdn.prensaiberica.es/clip/823f515c-8143-4044-8f13-85ea1ef58f3a_16-9-discover-aspect-ratio_default_0.jpg', 3, 'dogs', '2023-07-31 07:50:05'),
(3, 'Moonlight', 'https://images.unsplash.com/photo-1535591273668-578e31182c4f?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjM2NTI5fQ', 1, 'fish', '2023-07-31 07:50:05'),
(4, 'Toby', 'https://images.theconversation.com/files/525305/original/file-20230510-15-ol6krl.jpg?ixlib=rb-1.1.0&rect=0%2C552%2C4500%2C2250&q=45&auto=format&w=668&h=324&fit=crop', 1, 'rodents', '2023-07-31 07:50:05'),
(5, 'Sit', 'https://www.diariodesevilla.es/2023/05/07/sociedad/Descubre-curiosidades-hamster-mascotas_1790831708_183903754_667x375.jpg', 2, 'rodents', '2023-07-31 07:50:05'),
(6, 'Small', 'https://www.elmueble.com/medio/2022/06/09/hamster_b72d1bb0_1200x630.jpg', 3, 'rodents', '2023-07-31 07:50:05'),
(7, 'Black Elles', 'https://www.elmueble.com/medio/2022/06/09/hamster_608da04e_1000x686.jpg', 6, 'rodents', '2023-07-31 07:50:05'),
(8, 'Mari', 'https://images.hola.com/imagenes/mascotas/20211116199664/hamster-cuanto-tiempo-vive-dn/1-20-137/cuanto-vive-hamster-enfermedades-t.jpg', 1, 'rodents', '2023-07-31 07:50:05'),
(9, 'Jinnx', 'https://c.files.bbci.co.uk/48DD/production/_107435681_perro1.jpg', 2, 'dogs', '2023-07-31 07:50:05'),
(10, 'Jilger', 'https://www.thesprucepets.com/thmb/r23RBk0t4DC9UHp2pTzuXLz7Jj4=/3600x0/filters:no_upscale():strip_icc()/popular-small-bird-species-390926-hero-d3d0af7bb6ed4947b0c3c5afb4784456.jpg', 1, 'birds', '2023-07-31 07:50:05'),
(11, 'Yellow', 'https://scx2.b-cdn.net/gfx/news/hires/2022/birds-1.jpg', 5, 'birds', '2023-07-31 07:50:05'),
(12, 'Colorin', 'https://media.newyorker.com/photos/5a95a5b13d9089123c9fdb7e/1:1/w_3289,h_3289,c_limit/Petrusich-Dont-Mess-with-the-Birds.jpg', 1, 'birds', '2023-07-31 07:50:05'),
(13, 'Shaco', 'https://www.thespruce.com/thmb/8gZkGMzHNAMhbMPY6bbFsLT2Os4=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/types-of-birds-of-prey-387307-hero-bbcd393587da4b039f58dfbe4e996cf4.jpg', 2, 'birds', '2023-07-31 07:50:05'),
(14, 'Boby', 'https://images.hola.com/imagenes/mascotas/20230428231045/razas-perros-toy/1-242-978/schnauzer-miniatura-m.jpg?tx=w_680', 7, 'dogs', '2023-07-31 07:50:05'),
(15, 'Serpi', 'https://www.hospitalveterinariglories.com/wp-content/uploads/2022/03/30-03-22-%C2%BFQue%CC%81-es-la-brumacio%CC%81n-en-los-reptiles-676x451.jpg', 2, 'reptiles', '2023-07-31 07:50:05'),
(16, 'Tobias', 'https://www.nationalgeographic.com.es/medio/2022/04/26/camaleon_4fcd8b91_800x800.jpg', 10, 'reptiles', '2023-07-31 07:50:05'),
(17, 'Slow', 'https://www.prensa-latina.cu/wp-content/uploads/2022/06/64-A-Las-tortugas-son-animales-anfibios-1.jpg', 15, 'reptiles', '2023-07-31 07:50:05'),
(18, 'Lara', 'https://cdn-prd.content.metamorphosis.com/wp-content/uploads/sites/6/2022/12/shutterstock_781327003-1-768x512.jpg', 1, 'cats', '2023-07-31 07:50:05'),
(19, 'Misino', 'https://s01.sgp1.cdn.digitaloceanspaces.com/article/51036-cwobnirfka-1580816618.jpeg', 1, 'cats', '2023-07-31 07:50:05'),
(20, 'Po', 'https://icatcare.org/app/uploads/2018/07/Thinking-of-getting-a-cat.png', 5, 'cats', '2023-07-31 07:50:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `refugios`
--

DROP TABLE IF EXISTS `refugios`;
CREATE TABLE IF NOT EXISTS `refugios` (
  `refugio_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(10000) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`refugio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `refugios`
--

INSERT INTO `refugios` (`refugio_id`, `name`, `description`, `create_at`) VALUES
(1, 'Refugio del Vado de Ordiso', 'El refugio del Vado de Ordiso es un  refugio libre situado a 1610 mts. de altitud, a una hora de camino por pista desde San Nicolu00e1s de Bujaruelo.\r\n\r\n Estu00e1 compuesto por dos habitu00e1culos, ambos con puerta y uno de ellos con chimenea y ventana. \r\n\r\nConsidero que es un refugio para pasar la noche en caso de urgencia, ya que no estu00e1 muy limpio(pero tampoco estu00e1 sucio, deju00e9moslo en un tu00e9rmino medio), y en tan su00f3lo 1 hora puedes estar perfectamente en el refugio guardado de Bujaruelo.  \r\n\r\nGrandes vistas sobre la cara sur del Vignemale', '2023-07-31 07:50:05'),
(2, 'Sant Salvador de les Espases', 'HISTORIA \r\n\r\nLa capilla de San Salvador de las Espadas se encuentra situada en lo alto de un acantilado aislado, el punto de confluencia entre los obispados de Sant Feliu y Vic y los tu00e9rminos municipales de Esparreguera, Olesa de Montserrat y Vacarisses. Documentada a partir del siglo XIV, era la antigua capilla del Castillo de las Espadas, documentado desde el au00f1o 985, y del que su00f3lo queda el basamento de una torre circular. \r\n\r\nLigada histu00f3ricamente a la poblaciu00f3n de Esparreguera pertenece al tu00e9rmino municipal de esta localidad y en la parroquia de Santa Maru00edu00ada de Olesa desde el 18 de marzo de 1868. \r\n\r\nEl edificio actual corresponde a una reforma del siglo XVI. Tiene una sola nave, de vuelta baja en un principio de cau00f1u00f3n y sin u00c3u00a1bside. Fue totalmente restaurada en 1924 gracias a la labor del padre Joan Solu00ed , escolapio de Terrassa. Los primeros du00edu00adas de la guerra civil espau00f1ola unos incontrolados quemaron el interior de la capilla, destruyendo su retablo gu00f3tico, el armonio y los objetos litu00fargicos. \r\n\r\nActualmente preside la capilla una imagen del Salvador, obra del artista olesano Amadeu Paltor. En el Museo de Terrassa (castillo cartuja de Vallparadu00edu00ads) se conserva la predela del antiguo retablo. \r\n\r\nEl 22 de abril de 1949 fue declarado Bien Cultural de Interu00e9s Nacional (BCIN), protecciu00f3n publicada en el Boletu00edu00adn Oficial del Estado (BOE) el 5 de mayo de 1949. \r\n\r\nEn 1970 fue constituida la asociaciu00f3n Amigos de San Salvador de las Espadas, con sede en la iglesia parroquial de Santa Maru00eda de Olesa de Montserrat, vela por su conservaciu00f3n, organiza anualmente la romeru00eda el primer domingo de septiembre y abre las puertas de la capilla todos los jueves y domingos. \r\n\r\n\r\nCu00d3MO LLEGAR? \r\n\r\nNos llegamos en Olesa de Montserrat. Una vez en Olesa tenemos que buscar uno de los dos polideportivos que hay en el pueblo: El Salvador Boada. Es el polideportivo que estu00e1 en la parte mu00e1s alta de Olesa. Hay un aparcamiento, dejamos el coche. \r\n\r\n\r\nITINERARIO \r\n\r\nTomamos una pista forestal que sale de detru00e1s del polideportivo. Al cabo de unos \r\n50 metros, giramos a la derecha direcciu00f3n al Pla del Fideuer. (Pal indicador). \r\nSeguimos la pista principal, muy evidente, dejando las pistas forestales que \r\nsalen a ambos lados de la principal. De vez en cuando hay seu00f1ales amarillas y \r\nverdes. \r\nLlegamos a un mirador - Fuente de la Roureda -, donde podemos contemplar por \r\nprimera vez una magnu00c3u00adfica vista del macizo de Montserrat. \r\n\r\nNos olvidamos de la pista que llega al mirador por la izquierda y seguimos la \r\npista que lleva al Plan del Fideuer (poste indicador). \r\nUna vez en el plan del Fideuer - ya llevamos, aproximadamente, una hora caminando \r\n- Si miramos a la izquierda podemos ver una colina con la ermita de San \r\nSalvador y al fondo Montserrat. \r\nEn el Plan Fideuer encontramos postes indicadores del camino hacia San Salvador. \r\nSeguimos unas marcas blancas que se alternan con otras de color \r\nrojo con un cu00edu00adrculo blanco en medio. Llegamos a un collado. Seguimos los \r\nseu00f1ales y empezamos a bajar hacia un segundo collado. \r\nEn la explanada del segundo collado vamos hacia la izquierda siguiendo las seu00f1ales. \r\nAl cabo de unos metros, las seu00f1ales suben arriba por la derecha. Hay que seguir \r\nunos metros, hasta que encontramos a la izquierda un camino con escaleras que ya \r\nlleva directamente a la cima de Sant Salvador de las espadas. \r\nDisfrutamos un rato de la fantu00e1stica vista de los entornos y sobre todo de \r\nMontserrat y volvemos a Olesa por el mismo camino. \r\n\r\nTIEMPO APROXIMADO DE ASCENSIu00d3N: una hora y media', '2023-07-31 07:50:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `rol_id` int NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL,
  `level` int NOT NULL DEFAULT 1,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rol_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`rol_id`, `name`, `level`, `create_at`) VALUES
(1, 'admin', 4, '2023-07-31 07:50:05'),
(2, 'moderator', 3, '2023-07-31 07:50:05'),
(3, 'colaborator', 2, '2023-07-31 07:50:05'),
(4, 'guest', 0, '2023-07-31 07:50:05'),
(5, 'user', 1, '2023-07-31 07:50:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_handle` varchar(20) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(500) DEFAULT NULL,
  `role` char(20) NOT NULL DEFAULT 'user',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `age` int DEFAULT 0,
  `address` varchar(255) DEFAULT NULL,
  `photo_url` varchar(500) NOT NULL DEFAULT 'http://localhost:5174/juan-perfil32x32.jpg',
  `phone_number` char(12) DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_handle` (`user_handle`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `user_handle`, `first_name`, `last_name`, `email`, `password`, `role`, `is_active`, `age`, `address`, `photo_url`, `phone_number`, `create_at`) VALUES
(1, 'juandevnjv', 'Juan Antonio', 'Valdivia Camacho', 'admin@gmail.com', '$2b$10$Scl04aPWvyRDYlHzVbW1qOM2lLmh3PenlScNIttRtmL39XilkWjMW', 'admin', 1, 48, 'Sant Boi de Llobregat, Barcelona, España', 'http://localhost:5174/juan-perfil32x32.jpg', '666 666 666', '2023-08-07 11:02:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vets`
--

DROP TABLE IF EXISTS `vets`;
CREATE TABLE IF NOT EXISTS `vets` (
  `idVet` int NOT NULL AUTO_INCREMENT,
  `name` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `photoUrl` varchar(255) NOT NULL,
  `description` varchar(500) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idVet`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `vets`
--

INSERT INTO `vets` (`idVet`, `name`, `photoUrl`, `description`, `create_at`) VALUES
(1, 'Ernesto', 'asdasdasdasd', 'asdasdasd', '2023-08-12 00:32:42'),
(2, 'Franciso', 'asdasdasd', 'asdasd', '2023-08-12 00:32:42');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `docs_pets`
--
ALTER TABLE `docs_pets`
  ADD CONSTRAINT `idVet` FOREIGN KEY (`idVet`) REFERENCES `vets` (`idVet`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `pet_id` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`pet_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
