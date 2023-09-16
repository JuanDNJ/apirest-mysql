-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 16-09-2023 a las 07:01:44
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
(2, 'Sant Salvador de les Espases', 'La capilla de San Salvador de las Espadas se encuentra situada en lo alto de un acantilado aislado, el punto de confluencia entre los obispados de Sant Feliu y Vic y los tu00e9rminos municipales de Esparreguera, Olesa de Montserrat y Vacarisses. Documentada a partir del siglo XIV, era la antigua capilla del Castillo de las Espadas, documentado desde el au00f1o 985, y del que su00f3lo queda el basamento de una torre circular. \r\n\r\nLigada histu00f3ricamente a la poblaciu00f3n de Esparreguera pertenece al tu00e9rmino municipal de esta localidad y en la parroquia de Santa Maru00edu00ada de Olesa desde el 18 de marzo de 1868. \r\n\r\nEl edificio actual corresponde a una reforma del siglo XVI. Tiene una sola nave, de vuelta baja en un principio de cau00f1u00f3n y sin u00c3u00a1bside. Fue totalmente restaurada en 1924 gracias a la labor del padre Joan Solu00ed , escolapio de Terrassa. Los primeros du00edu00adas de la guerra civil espau00f1ola unos incontrolados quemaron el interior de la capilla, destruyendo su retablo gu00f3tico, el armonio y los objetos litu00fargicos. \r\n\r\nActualmente preside la capilla una imagen del Salvador, obra del artista olesano Amadeu Paltor. En el Museo de Terrassa (castillo cartuja de Vallparadu00edu00ads) se conserva la predela del antiguo retablo. \r\n\r\nEl 22 de abril de 1949 fue declarado Bien Cultural de Interu00e9s Nacional (BCIN), protecciu00f3n publicada en el Boletu00edu00adn Oficial del Estado (BOE) el 5 de mayo de 1949. \r\n\r\nEn 1970 fue constituida la asociaciu00f3n Amigos de San Salvador de las Espadas, con sede en la iglesia parroquial de Santa Maru00eda de Olesa de Montserrat, vela por su conservaciu00f3n, organiza anualmente la romeru00eda el primer domingo de septiembre y abre las puertas de la capilla todos los jueves y domingos. \r\n\r\n\r\nCu00d3MO LLEGAR? \r\n\r\nNos llegamos en Olesa de Montserrat. Una vez en Olesa tenemos que buscar uno de los dos polideportivos que hay en el pueblo: El Salvador Boada. Es el polideportivo que estu00e1 en la parte mu00e1s alta de Olesa. Hay un aparcamiento, dejamos el coche. \r\n\r\n\r\nITINERARIO \r\n\r\nTomamos una pista forestal que sale de detru00e1s del polideportivo. Al cabo de unos \r\n50 metros, giramos a la derecha direcciu00f3n al Pla del Fideuer. (Pal indicador). \r\nSeguimos la pista principal, muy evidente, dejando las pistas forestales que \r\nsalen a ambos lados de la principal. De vez en cuando hay seu00f1ales amarillas y \r\nverdes. \r\nLlegamos a un mirador - Fuente de la Roureda -, donde podemos contemplar por \r\nprimera vez una magnu00c3u00adfica vista del macizo de Montserrat. \r\n\r\nNos olvidamos de la pista que llega al mirador por la izquierda y seguimos la \r\npista que lleva al Plan del Fideuer (poste indicador). \r\nUna vez en el plan del Fideuer - ya llevamos, aproximadamente, una hora caminando \r\n- Si miramos a la izquierda podemos ver una colina con la ermita de San \r\nSalvador y al fondo Montserrat. \r\nEn el Plan Fideuer encontramos postes indicadores del camino hacia San Salvador. \r\nSeguimos unas marcas blancas que se alternan con otras de color \r\nrojo con un cu00edu00adrculo blanco en medio. Llegamos a un collado. Seguimos los \r\nseu00f1ales y empezamos a bajar hacia un segundo collado. \r\nEn la explanada del segundo collado vamos hacia la izquierda siguiendo las seu00f1ales. \r\nAl cabo de unos metros, las seu00f1ales suben arriba por la derecha. Hay que seguir \r\nunos metros, hasta que encontramos a la izquierda un camino con escaleras que ya \r\nlleva directamente a la cima de Sant Salvador de las espadas. \r\nDisfrutamos un rato de la fantu00e1stica vista de los entornos y sobre todo de \r\nMontserrat y volvemos a Olesa por el mismo camino. \r\n\r\nTIEMPO APROXIMADO DE ASCENSIu00d3N: una hora y media', '2023-07-31 07:50:05');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
