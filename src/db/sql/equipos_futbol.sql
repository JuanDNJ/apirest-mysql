-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 03-09-2023 a las 20:38:44
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
-- Base de datos: `equipos_futbol`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

DROP TABLE IF EXISTS `equipos`;
CREATE TABLE IF NOT EXISTS `equipos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `club` char(50) NOT NULL,
  `email` char(50) NOT NULL,
  `telefonos` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `direccion` char(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id`, `club`, `email`, `telefonos`, `direccion`) VALUES
(1, 'AE Abrera', 'aeabrera@gmail.com', '937702554,678456088,647149973,616689839', 'www.aeabrera.com'),
(2, 'CF Begues', 'http://www.cfbegues.com/pages/contacta', '', 'http://www.cfbegues.com/pages/contacta'),
(3, 'UE Castelldefels', 'administracio@uecastelldefels.com', '', ''),
(4, 'UD Vista Alegre', '', '936644262', 'https://udvistaalegre.wordpress.com/'),
(5, 'UE La Palma Cervelló', 'uelapalma@hotmail.com', '607486978,936720186,607486978', 'https://www.fcf.cat/club/1415/la-palma-cervello-ue'),
(6, 'Corbera FC', 'cfcorbera@cfcorbera.cat', '619665259,936502852', 'www.cfcorbera.cat'),
(7, 'UE Cornellà', 'info@fundaciouecornella.cat', '934741063', 'fundaciouecornella.cat'),
(8, 'CD Almeda', 'cdalmedaef@gmail.com', '935971445', 'https://www.cdalmeda.com/'),
(9, 'UE Sant Ildefons', 'infosani@uesantildefons.com', '9359714 04', 'https://www.uesantildefons.com/'),
(10, 'CD Fontsanta-Fatjó', 'cdfontsantafatjo@gmail.com', '934751145', 'https://www.cdfontsantafatjo.com/'),
(11, 'AE Prat', 'administracio@aeprat.com', '934782733,691126409', 'https://www.aeprat.com/'),
(12, 'CB Terlenka', 'cbterlenka@gmail.com', '605392170,656315632,606088314', 'http://cbterlenka.com/'),
(13, 'Atlètic Prat Delta', 'atletic.prat@gmail.com', '933790306', 'https://atleticprat.wordpress.com/'),
(14, 'CE Esparreguera', 'direccioceesparreguera@gmail.com', '931418823', 'https://esparreguera.cat/ciutat/directori/organitzacions/centre-d-esports-esparreguera-ce-esparregue'),
(15, 'Esparraguera Athetic Club', 'athclubesparreguera@hotmail.com', '655466438,937764375', 'https://www.instagram.com/ath.esparreguera/'),
(16, 'CFA Espluguenc', 'info@cfaespluguenc.com', '608556215,633766046', 'www.cfaespluguenc.com'),
(17, 'CD Cervelló', '', '', ''),
(18, 'CF Can Vidalet', 'info@cfcanvidalet.com', '934731402', 'https://www.cfcanvidalet.com'),
(19, 'Gavà CF', '', '', ''),
(20, 'CF Gavà Mar', 'cfgavamar@hotmail.com', '640 626 038', 'https://cfgavamar.blogspot.com/'),
(21, 'Escola F. Gavà', 'secretariaclubesgava@gmail.com', '936383435,616936363,936624622', 'www.efgava.com'),
(22, 'Martorell CF', 'club@cfmartorell.cat', '930500708', 'https://cfmartorell.cat/'),
(23, 'Molins de Rei CF', 'info@molinsdereicf.com', '683635433,608174477,646784246,699357005', 'www.molinsdereicf.com'),
(24, 'CF Olesa Montserrat', 'efo-87@hotmail.com', '937729556', 'https://efo87.es/'),
(25, 'CF Pallejà', 'administracio@cfpalleja.cat', '659897154,659636387', 'www.cfpalleja.cat'),
(26, 'UE Papiol', 'uepapiol@hotmail.com', '644388862', 'Instagram: @uepapiol / Twitter: @UE_Papiol / Facebook: UE Papiol'),
(27, 'CE Santa Coloma Cervellò', '', '', ''),
(28, 'CF Sant Andreu de la Barca Agrupa', 'cfsaba1949@gmail.com', '936356561,636588266,649398105,622049117', 'https://www.facebook.com/CF-Sant-Andreu-de-la-Barca-738958179637192/'),
(29, 'FC Santboià', '', '', ''),
(30, 'CF Vinyets Molí-Vell', 'vinyetsmolivell@gmail.com', '667451778,678606259,678606264', 'https://cfvinyetsmolivell.com/'),
(31, 'FC Casablanca', 'ronier_22@hotmail.com', '665284191,665284191', ''),
(32, 'UD Marianao Poblet', 'oficina@cdmarianaopoblet.com', '936307843,616661960,936307843', 'www.cdmarianaopoblet.com'),
(33, 'CF Ciudad Cooperativa', 'c.f.ciudadcooperativa@hotmail.com', '936308325, 647010800, 650879889', 'www.cfciudadcooperativa.com'),
(34, 'FC Sant Esteve Sesrovires', 'fcses1932@gmail.com', '936356561, 636588266, 649398105, 622049117', ''),
(35, 'Sanfeliuenc FC', 'alberto.prieto.sfc@hotmail.com', '676643588 , 657322856', 'www.santfefc.com'),
(36, 'Pª Recr. Sant Feliu de Llobregat', 'prsantfeliu@hotmail.com', '936663052, 605667384', 'https://es-es.facebook.com/precreativa/'),
(37, 'Pª Blanc Blava Sant Feliu Ll', 'pbsantfeliu@hotmail.com', '640917380', ' www.pbsantfeliudellobregat.com'),
(38, 'Pª Barc. Iniesta 24', '', '', ''),
(39, 'UE Sant Joan Despí San Pancracio', 'info@udsanpancracio.com', '643714950,624465045', 'http://udsanpancracio.com/'),
(40, 'FC Levante Las Planas', 'administracion@fclevantelasplanas.es', '933738754', 'www.fclevantelasplanas.es'),
(41, 'Sant Just Desvern CF', '', '', ''),
(42, 'Atlètic Sant Just FC', 'deportiva.atletic@gmail.com', '639769231,', 'www.atsantjustfc.com'),
(43, 'Pª Barc. Sant Vicenç Horts', 'secretariapbsv@gmail.com', '675183682,675808397', 'www.penyabarcelonista.com'),
(44, 'Sant Vicenç H.-At Vicentí Esc', '', '', ''),
(45, 'CD La Guardia', '', '', ''),
(46, 'UE Torrelles', 'uetorrelles@gmail.com', '667528258,675646706,936891918', 'www.uetorrelles.cat'),
(47, 'Pª Blaugrana Vallirana', 'escola@pbvallirana.cat', '936831589, 690805059', 'www.pbvallirana.cat'),
(48, 'UD Sector Montserratina', 'udstmontserratina@gmail.com', '936379410,606879751,667959850,645938574', 'www.udstmontserratina.com'),
(49, 'Viladecans UD', 'administracion@udviladecans.com', '9936371328,936584396,936371328,637526161', 'www.udviladecans.com'),
(50, 'ATHLETIC VILADECANS FUTBOL CLUB', 'estordeportivoathleticviladecans@hotmail.com', '672681018,696216667,605864849', 'www.athleticviladecansfc.com');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
