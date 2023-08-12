-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 12-08-2023 a las 17:57:58
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
  `description` varchar(1000) DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `pets`
--

INSERT INTO `pets` (`pet_id`, `name`, `photo_url`, `years`, `category`, `description`, `create_at`) VALUES
(1, 'Winter', 'https://fotografias.lasexta.com/clipping/cmsimages01/2022/08/09/3FFA8546-05CE-4608-9B69-6602D02A4C58/cachorro-pomsky_103.jpg?crop=1183,887,x0,y0&width=1200&height=900&optimize=low&format=webply', 8, 'dogs', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam porttitor molestie lorem id lobortis. Vivamus tempor ullamcorper ante et consequat. Vestibulum sit amet lacinia dui. Mauris iaculis rutrum cursus. Aenean posuere orci in eleifend posuere. Suspendisse pellentesque porta tortor quis scelerisque. Etiam mollis diam et ultrices eleifend. Maecenas a tristique dui.', '2023-07-31 07:50:05'),
(2, 'Sunn', 'https://estaticos-cdn.prensaiberica.es/clip/823f515c-8143-4044-8f13-85ea1ef58f3a_16-9-discover-aspect-ratio_default_0.jpg', 3, 'dogs', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc volutpat ante diam, in vehicula erat volutpat et. Pellentesque dignissim leo sit amet odio pretium mattis. Nam auctor tellus eget velit venenatis, eget malesuada massa laoreet. Donec posuere, risus in cursus euismod, ipsum leo elementum quam, a facilisis magna tellus at sapien. Etiam convallis blandit libero ac dictum. Vestibulum erat purus, blandit sit amet elit ut, finibus imperdiet leo. Nulla mollis nulla ac lacinia feugiat. Aenean turpis lectus, dapibus at pretium et, pretium ut nisl. Nulla eu metus lacinia, dignissim sem in, maximus nulla. Integer sem elit, aliquet sed urna vel, pretium condimentum quam. Nam id diam eu ex vestibulum lacinia. In hac habitasse platea dictumst. Quisque gravida vehicula enim vitae rhoncus. Nulla scelerisque ex sed vulputate sagittis. Etiam metus massa, tristique ac massa eget, eleifend feugiat augue.', '2023-07-31 07:50:05'),
(3, 'Moonlight', 'https://images.unsplash.com/photo-1535591273668-578e31182c4f?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjM2NTI5fQ', 1, 'fish', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget nibh lectus. Etiam lobortis velit ipsum, a fringilla tellus hendrerit sit amet. Vivamus bibendum, ex vel ultricies venenatis, nisl diam dictum metus, eu aliquam ipsum ante vel nisl. Donec laoreet nisl quis lectus malesuada accumsan. Maecenas aliquam arcu felis, feugiat porttitor magna euismod sit amet. Nulla tristique elit vitae ipsum rutrum tempor. Etiam quis ultricies lorem, vel laoreet quam. Integer placerat volutpat erat in ultrices. Sed nulla magna, pharetra quis turpis ac, tristique egestas nibh.', '2023-07-31 07:50:05'),
(4, 'Toby', 'https://images.theconversation.com/files/525305/original/file-20230510-15-ol6krl.jpg?ixlib=rb-1.1.0&rect=0%2C552%2C4500%2C2250&q=45&auto=format&w=668&h=324&fit=crop', 1, 'rodents', 'Donec ornare eleifend urna sit amet tincidunt. Fusce aliquet libero quis urna pulvinar, sed posuere felis ullamcorper. Integer ut arcu cursus, tincidunt quam ut, pulvinar quam. Proin at orci ut diam commodo tristique vel placerat augue. Sed placerat tortor nec augue volutpat, nec commodo elit pretium. Duis eget luctus orci. Nam sed aliquam quam. Vestibulum efficitur accumsan sem et fringilla.', '2023-07-31 07:50:05'),
(5, 'Sit', 'https://www.diariodesevilla.es/2023/05/07/sociedad/Descubre-curiosidades-hamster-mascotas_1790831708_183903754_667x375.jpg', 2, 'rodents', 'Vestibulum vel dignissim lorem, non convallis mauris. Donec pulvinar imperdiet augue, in finibus velit laoreet sed. Nam suscipit id diam vel tincidunt. Vestibulum vulputate dui a ex pharetra, eget ornare magna tincidunt. Morbi sollicitudin volutpat mi a interdum. Nulla facilisi. Vestibulum lacus nisi, efficitur nec blandit in, porta sit amet orci. Mauris lacus ante, fringilla sed eleifend nec, maximus quis lacus. Quisque arcu tellus, finibus ac tincidunt non, lobortis ut libero. Nullam augue sem, aliquet non nibh ac, semper malesuada turpis. Vivamus aliquet at ante at maximus. Etiam sit amet odio at quam aliquam imperdiet vel non lorem. Mauris tincidunt lacus in velit auctor gravida. Sed eu viverra dui.', '2023-07-31 07:50:05'),
(6, 'Small', 'https://www.elmueble.com/medio/2022/06/09/hamster_b72d1bb0_1200x630.jpg', 3, 'rodents', 'Ut magna justo, finibus vel massa tristique, scelerisque consectetur leo. Vestibulum at felis consequat lacus volutpat scelerisque. Praesent tincidunt ut ligula sit amet laoreet. Duis porta, felis ut maximus semper, est elit accumsan ex, sed pellentesque mi ligula ut est. Donec bibendum odio quis feugiat venenatis. Donec cursus condimentum nibh, feugiat dapibus massa pellentesque non. Nam et felis ut lorem viverra ultrices at eget dolor. Aenean est sapien, consequat sed facilisis quis, vestibulum eget augue. Maecenas finibus elit nunc, a consequat ipsum consectetur ut. Suspendisse id fermentum lectus. Vivamus elementum diam ac turpis malesuada, sed tempus ipsum vestibulum. Morbi vestibulum id nisi ut tempus. Praesent ac ultrices nulla, sit amet porta sem. Suspendisse potenti.\n\nUt magna justo, finibus vel massa tristique, scelerisque consectetur leo. Vestibulum at felis consequat lacus volutpat scelerisque. Praesent tincidunt ut ligula sit amet laoreet. Duis porta, felis ut maximus semp', '2023-07-31 07:50:05'),
(7, 'Black Elles', 'https://www.elmueble.com/medio/2022/06/09/hamster_608da04e_1000x686.jpg', 6, 'rodents', 'Ut magna justo, finibus vel massa tristique, scelerisque consectetur leo. Vestibulum at felis consequat lacus volutpat scelerisque. Praesent tincidunt ut ligula sit amet laoreet. Duis porta, felis ut maximus semper, est elit accumsan ex, sed pellentesque mi ligula ut est. Donec bibendum odio quis feugiat venenatis. Donec cursus condimentum nibh, feugiat dapibus massa pellentesque non. Nam et felis ut lorem viverra ultrices at eget dolor. Aenean est sapien, consequat sed facilisis quis, vestibulum eget augue. Maecenas finibus elit nunc, a consequat ipsum consectetur ut. Suspendisse id fermentum lectus. Vivamus elementum diam ac turpis malesuada, sed tempus ipsum vestibulum. Morbi vestibulum id nisi ut tempus. Praesent ac ultrices nulla, sit amet porta sem. Suspendisse potenti.', '2023-07-31 07:50:05'),
(8, 'Mari', 'https://images.hola.com/imagenes/mascotas/20211116199664/hamster-cuanto-tiempo-vive-dn/1-20-137/cuanto-vive-hamster-enfermedades-t.jpg', 1, 'rodents', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam sed tincidunt urna. Morbi facilisis ligula ipsum, sed maximus purus fermentum non. Nam maximus, orci quis accumsan congue, est ligula lobortis quam, ut porttitor lorem quam eget mi. Pellentesque in ipsum nec turpis pretium euismod ac nec felis. Nunc ac elit aliquam, maximus felis in, volutpat libero. Praesent commodo vitae mi eu tempus. Suspendisse cursus libero id congue dignissim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla ipsum odio, varius eu sagittis eget, fringilla non felis. Nunc non erat eget ligula luctus volutpat. Fusce maximus facilisis ante eu pharetra.', '2023-07-31 07:50:05'),
(9, 'Jinnx', 'https://c.files.bbci.co.uk/48DD/production/_107435681_perro1.jpg', 2, 'dogs', 'In hac habitasse platea dictumst. Pellentesque arcu metus, aliquet sed magna id, viverra venenatis justo. Aenean eu vestibulum ante. Praesent vitae elit in felis posuere sollicitudin. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Quisque ex diam, pharetra elementum odio at, fermentum porttitor orci. Quisque blandit id velit nec mattis. Sed mattis odio a lorem vulputate interdum. Aliquam nec velit at justo eleifend pretium. Morbi ac molestie nibh.', '2023-07-31 07:50:05'),
(10, 'Jilger', 'https://www.thesprucepets.com/thmb/r23RBk0t4DC9UHp2pTzuXLz7Jj4=/3600x0/filters:no_upscale():strip_icc()/popular-small-bird-species-390926-hero-d3d0af7bb6ed4947b0c3c5afb4784456.jpg', 1, 'birds', 'Ut faucibus felis vel leo maximus, sit amet rutrum ante dapibus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris porttitor nec nulla pulvinar consequat. Maecenas vel lacus vitae velit condimentum pretium. Ut quis orci pellentesque, tincidunt nunc non, tincidunt purus. Pellentesque sapien metus, tristique ornare malesuada quis, imperdiet vel sem. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin hendrerit varius lacus ut tincidunt. Nam eu ante aliquet, rutrum quam sodales, tincidunt felis. Nam consectetur ante quis risus porta, quis blandit erat fringilla. Donec tempus dapibus arcu et finibus. Praesent dolor nisi, scelerisque ut metus non, vehicula malesuada sapien. Morbi orci neque, venenatis in pharetra eget, vehicula ac elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per incepto', '2023-07-31 07:50:05'),
(11, 'Yellow', 'https://scx2.b-cdn.net/gfx/news/hires/2022/birds-1.jpg', 5, 'birds', 'Suspendisse pretium consectetur arcu, quis vehicula ipsum. Nam sagittis porttitor dui et aliquam. Sed malesuada dignissim tincidunt. Morbi bibendum dui sit amet ligula porttitor, sit amet tincidunt tortor posuere. Vivamus iaculis auctor ultricies. Nullam convallis lobortis dictum. Morbi et sollicitudin sapien. Quisque turpis purus, ultricies sit amet efficitur vestibulum, vehicula at justo. Nunc consectetur fermentum lorem ut condimentum. Mauris non consequat sapien. Duis convallis id augue eu ornare.', '2023-07-31 07:50:05'),
(12, 'Colorin', 'https://media.newyorker.com/photos/5a95a5b13d9089123c9fdb7e/1:1/w_3289,h_3289,c_limit/Petrusich-Dont-Mess-with-the-Birds.jpg', 1, 'birds', 'Suspendisse gravida nisi in metus porttitor tincidunt. Vivamus vitae ultricies leo. Vivamus eget leo et lacus volutpat commodo vulputate id est. Nulla lobortis eu massa vel ultrices. Sed fermentum odio a massa eleifend efficitur. Duis sollicitudin sagittis sapien, a lacinia nibh. Proin eu augue non diam faucibus convallis. Nam sem sapien, malesuada ac leo quis, laoreet blandit justo. Sed pellentesque commodo lacus, eget dignissim ligula rhoncus eget. Pellentesque interdum elit nulla, sit amet commodo neque pellentesque lacinia. Curabitur in tortor consectetur, luctus purus vitae, consequat nulla.', '2023-07-31 07:50:05'),
(13, 'Shaco', 'https://www.thespruce.com/thmb/8gZkGMzHNAMhbMPY6bbFsLT2Os4=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/types-of-birds-of-prey-387307-hero-bbcd393587da4b039f58dfbe4e996cf4.jpg', 2, 'birds', 'Praesent mauris quam, tincidunt vitae aliquet eget, aliquam egestas nisi. Duis tristique bibendum arcu ac semper. Aliquam at purus erat. In hac habitasse platea dictumst. Vivamus ut eleifend tellus. Curabitur aliquet tellus eu dui ultrices iaculis. Curabitur tortor metus, pretium et purus ut, pretium ultrices lorem. Pellentesque mollis orci enim, non aliquam nulla interdum a. Proin fermentum metus id arcu porttitor molestie. Sed eu tellus molestie, dictum nisi quis, feugiat dolor. Nam faucibus sagittis dignissim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur nec velit ligula. Praesent gravida nulla sed lectus lacinia ullamcorper.', '2023-07-31 07:50:05'),
(14, 'Boby', 'https://images.hola.com/imagenes/mascotas/20230428231045/razas-perros-toy/1-242-978/schnauzer-miniatura-m.jpg?tx=w_680', 7, 'dogs', 'Nam id ipsum lacus. Integer malesuada dolor ultricies convallis vestibulum. Proin ultrices ante orci, ac elementum lacus mollis at. In dictum tincidunt leo, sed scelerisque eros dapibus at. Donec mollis lacinia sapien, eu commodo purus tristique quis. Donec iaculis placerat diam nec finibus. Sed neque neque, elementum eu est et, semper ultricies urna. In posuere volutpat tempus. Nam ac semper eros, a consequat purus. Nullam sed posuere risus. Phasellus porta ante tortor, vitae accumsan augue consequat in. Morbi dolor tortor, tristique non posuere non, pulvinar vel augue. Sed in sagittis dui. Phasellus porttitor magna id ipsum hendrerit dapibus.', '2023-07-31 07:50:05'),
(15, 'Serpi', 'https://www.hospitalveterinariglories.com/wp-content/uploads/2022/03/30-03-22-%C2%BFQue%CC%81-es-la-brumacio%CC%81n-en-los-reptiles-676x451.jpg', 2, 'reptiles', 'Nullam tincidunt lorem eu tellus luctus, et placerat mauris iaculis. Phasellus rutrum pharetra mauris, vel tincidunt urna faucibus mollis. Sed interdum consequat massa, eget pulvinar purus tincidunt eu. Ut sapien mauris, faucibus vitae massa sit amet, lobortis sollicitudin ligula. Ut bibendum est nisl, ut tincidunt augue gravida sit amet. Ut tempor bibendum arcu, id eleifend tortor cursus sit amet. Phasellus varius enim magna, quis luctus neque consectetur at. Vivamus eget congue odio. Aliquam fermentum tortor vel consequat eleifend. Sed mauris quam, pellentesque at iaculis sit amet, sodales quis ante. Curabitur sed volutpat ligula. Ut sodales vehicula felis, eget porta justo venenatis vitae.', '2023-07-31 07:50:05'),
(16, 'Tobias', 'https://www.nationalgeographic.com.es/medio/2022/04/26/camaleon_4fcd8b91_800x800.jpg', 10, 'reptiles', 'Pellentesque pulvinar, neque ac pellentesque hendrerit, mauris quam tempor dui, ut ornare massa odio lobortis nunc. Praesent arcu magna, semper id nisi varius, auctor sollicitudin odio. Praesent molestie sollicitudin leo ac tincidunt. Donec porttitor sodales nisl, in interdum libero tristique nec. Aenean iaculis tellus et quam semper efficitur. Maecenas laoreet leo nunc, eget consectetur ligula aliquet eu. Integer quis risus eu eros viverra suscipit. Quisque varius tempus massa, sed rhoncus ante sagittis id. Mauris ornare egestas nisl, non blandit urna. Fusce viverra facilisis lacus at mollis. Nam interdum metus et consectetur egestas. Nulla non egestas leo. Pellentesque eget consequat augue. Nulla at mauris eleifend, sagittis mauris quis, fringilla quam. Nunc et malesuada massa.', '2023-07-31 07:50:05'),
(17, 'Slow', 'https://www.prensa-latina.cu/wp-content/uploads/2022/06/64-A-Las-tortugas-son-animales-anfibios-1.jpg', 15, 'reptiles', 'In dapibus nisl eget elit dapibus porttitor. Duis ac tempor orci. Nullam quis finibus tellus. Nullam ornare ultricies quam, quis venenatis eros porta vel. Fusce dui ipsum, dignissim ut purus sit amet, dapibus ultricies dui. Ut pharetra dui quis augue vehicula volutpat. Maecenas eu luctus purus, et consectetur nunc. Nam viverra enim non fermentum lobortis. Donec volutpat non purus vitae maximus. Integer suscipit justo nibh, id pharetra ex egestas at. Vivamus vitae finibus neque, eu pulvinar augue. Proin sed odio volutpat, accumsan lacus vel, lobortis lacus. Phasellus rhoncus auctor interdum.', '2023-07-31 07:50:05'),
(18, 'Lara', 'https://cdn-prd.content.metamorphosis.com/wp-content/uploads/sites/6/2022/12/shutterstock_781327003-1-768x512.jpg', 1, 'cats', 'Nam non varius elit. Quisque lacus nisi, finibus ac nibh in, viverra sagittis lectus. Cras augue dui, rutrum in placerat id, aliquam sed arcu. Phasellus blandit egestas nisl, sed finibus dui volutpat interdum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi et ornare metus, a vestibulum metus. Aliquam bibendum pulvinar efficitur. Aenean eget molestie lorem.', '2023-07-31 07:50:05'),
(19, 'Misino', 'https://s01.sgp1.cdn.digitaloceanspaces.com/article/51036-cwobnirfka-1580816618.jpeg', 1, 'cats', 'Fusce eu diam sed purus fermentum condimentum porta ac neque. Integer faucibus, urna vitae aliquam sollicitudin, neque augue viverra metus, in ullamcorper nunc enim a orci. Maecenas finibus purus quis egestas pretium. Cras dignissim faucibus gravida. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam rutrum turpis at tellus elementum, ut fermentum justo tempor. Pellentesque sagittis vehicula lorem. In cursus sed metus in finibus. Fusce pretium orci iaculis aliquam efficitur. Duis nec consequat sem. Etiam quis risus consequat, eleifend magna ut, interdum arcu.', '2023-07-31 07:50:05'),
(20, 'Po', 'https://icatcare.org/app/uploads/2018/07/Thinking-of-getting-a-cat.png', 5, 'cats', 'Suspendisse potenti. Integer consectetur congue urna molestie aliquet. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Integer vel nulla quis mi rutrum placerat id eu turpis. Nunc vitae sem lectus. Duis lacinia erat mi, vel eleifend risus sollicitudin id. Curabitur eu ornare magna. Curabitur efficitur leo dui, at elementum eros dictum ut. Donec sollicitudin tincidunt magna, sit amet iaculis metus pellentesque in. Duis lacus neque, fermentum hendrerit diam et, ultrices tristique mauris. Donec cursus erat non dictum gravida. Quisque lacinia scelerisque ipsum eget pulvinar.', '2023-07-31 07:50:05');

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
  `level` int NOT NULL DEFAULT '1',
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
  `age` int DEFAULT '0',
  `address` varchar(255) DEFAULT NULL,
  `photo_url` varchar(500) NOT NULL DEFAULT 'http://localhost:5174/juan-perfil32x32.jpg',
  `phone_number` char(12) DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_handle` (`user_handle`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `user_handle`, `first_name`, `last_name`, `email`, `password`, `role`, `is_active`, `age`, `address`, `photo_url`, `phone_number`, `create_at`) VALUES
(2, 'juandevnjv', 'Juan Antonio', 'Valdivia Camacho', 'admin@gmail.com', '$2b$10$JUZUO24rKD.xPHcAujpZVemszq.ldaTRj72ymevi8mJbPObVEx3u.', 'admin', 1, 48, 'Sant Boi de Llobregat, Barcelona, España', 'http://localhost:5174/juan-perfil32x32.jpg', '666 666 666', '2023-08-12 17:08:37');

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
