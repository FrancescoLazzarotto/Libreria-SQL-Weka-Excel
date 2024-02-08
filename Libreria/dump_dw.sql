-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Gen 31, 2024 alle 14:07
-- Versione del server: 10.4.28-MariaDB
-- Versione PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biblioteca_dw`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `autore`
--

CREATE TABLE `autore` (
  `CodAutore` int(11) NOT NULL,
  `Id_eta` int(11) NOT NULL,
  `Sesso` varchar(10) NOT NULL CHECK (`Sesso` in ('Maschio','Femmina'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `autore`
--

INSERT INTO `autore` (`CodAutore`, `Id_eta`, `Sesso`) VALUES
(1, 1, 'Maschio'),
(2, 2, 'Maschio'),
(3, 3, 'Maschio'),
(4, 4, 'Maschio'),
(5, 5, 'Maschio'),
(6, 6, 'Femmina'),
(7, 7, 'Femmina'),
(8, 8, 'Femmina'),
(9, 9, 'Femmina'),
(10, 10, 'Femmina'),
(11, 11, 'Femmina'),
(12, 12, 'Femmina'),
(13, 13, 'Femmina'),
(14, 14, 'Maschio'),
(15, 15, 'Maschio'),
(16, 16, 'Maschio'),
(17, 17, 'Femmina'),
(18, 18, 'Femmina'),
(19, 19, 'Femmina');

-- --------------------------------------------------------

--
-- Struttura della tabella `editore`
--

CREATE TABLE `editore` (
  `Cod_Editore` int(11) NOT NULL,
  `Id_Provincia` int(11) NOT NULL,
  `Nome` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `editore`
--

INSERT INTO `editore` (`Cod_Editore`, `Id_Provincia`, `Nome`) VALUES
(1, 1, 'Italiano Editore'),
(2, 2, 'Francese Editions'),
(3, 3, 'Ediciones Espanolas'),
(4, 4, 'Deutsche Verlag'),
(5, 5, 'United Kingdom Press'),
(6, 6, 'American Publishers'),
(7, 7, 'Taurinorum Editore'),
(8, 8, 'Mondadorium');

-- --------------------------------------------------------

--
-- Struttura della tabella `eta`
--

CREATE TABLE `eta` (
  `Cod_eta` int(11) NOT NULL,
  `Id_fascia` int(11) NOT NULL,
  `Eta_Autore` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `eta`
--

INSERT INTO `eta` (`Cod_eta`, `Id_fascia`, `Eta_Autore`) VALUES
(1, 1, 25),
(2, 1, 26),
(3, 1, 27),
(4, 2, 48),
(5, 2, 46),
(6, 2, 47),
(7, 3, 68),
(8, 3, 70),
(9, 3, 69),
(10, 3, 71),
(11, 1, 35),
(12, 1, 36),
(13, 1, 37),
(14, 2, 53),
(15, 2, 54),
(16, 2, 55),
(17, 3, 65),
(18, 3, 66),
(19, 3, 67);

-- --------------------------------------------------------

--
-- Struttura della tabella `fascia`
--

CREATE TABLE `fascia` (
  `Cod_Fascia` int(11) NOT NULL,
  `Fascia_Eta` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `fascia`
--

INSERT INTO `fascia` (`Cod_Fascia`, `Fascia_Eta`) VALUES
(1, 'Giovane'),
(2, 'Adulto'),
(3, 'Anziano');

-- --------------------------------------------------------

--
-- Struttura della tabella `genere`
--

CREATE TABLE `genere` (
  `Cod_Genere` int(11) NOT NULL,
  `Nome_Genere` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `genere`
--

INSERT INTO `genere` (`Cod_Genere`, `Nome_Genere`) VALUES
(1, 'Romanzo'),
(2, 'Fantasy'),
(3, 'Thriller'),
(4, 'Mistero'),
(5, 'Avventura'),
(6, 'Sci-Fi');

-- --------------------------------------------------------

--
-- Struttura della tabella `provincia`
--

CREATE TABLE `provincia` (
  `Cod_Provincia` int(11) NOT NULL,
  `Provincia_Editore` varchar(50) NOT NULL,
  `Id_Regione` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `provincia`
--

INSERT INTO `provincia` (`Cod_Provincia`, `Provincia_Editore`, `Id_Regione`) VALUES
(1, 'Teramo', 1),
(2, 'Bouches-du-Rhône', 2),
(3, 'Barcelona', 3),
(4, 'Munich', 4),
(5, 'London', 5),
(6, 'Los Angeles', 6),
(7, 'Torino', 7),
(8, 'Biella', 8);

-- --------------------------------------------------------

--
-- Struttura della tabella `pubblicazione_libro`
--

CREATE TABLE `pubblicazione_libro` (
  `Id_Libro_Pub` int(11) NOT NULL,
  `Anno` int(11) NOT NULL,
  `Titolo` varchar(100) NOT NULL,
  `Id_Genere` int(11) NOT NULL,
  `Id_Autore` int(11) NOT NULL,
  `Id_Editore` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `pubblicazione_libro`
--
-- I PRIMI VENTI TITOLI SONO STATI GENERATI IN MODO REALISTICO, I RESTANTI GENERATI AUTOMATICAMENTE IN LATINO PER OPERAZIONI DI DATA MINING
INSERT INTO `pubblicazione_libro` (`Id_Libro_Pub`, `Anno`, `Titolo`, `Id_Genere`, `Id_Autore`, `Id_Editore`) VALUES
(1, 2020, 'Il Segreto del Vento', 1, 1, 1),
(2, 2019, 'La Magia Oscura', 2, 2, 2),
(3, 2021, 'L\'Ultimo Inverno', 3, 3, 3),
(4, 2018, 'Ombre nella Notte', 1, 4, 1),
(5, 2022, 'Risveglio', 2, 5, 2),
(6, 2017, 'Il Codice Perduto', 4, 6, 4),
(7, 2023, 'L\'Incanto del Mare', 5, 7, 5),
(8, 2015, 'Oltre il Confine', 6, 8, 6),
(9, 2016, 'L\'Ultima Frontiera', 4, 9, 4),
(10, 2022, 'Segreti del Passato', 5, 10, 5),
(11, 2019, 'Notte Infinita', 6, 6, 6),
(12, 2020, 'Cronache del Futuro', 4, 7, 4),
(13, 2018, 'Sotto le Stelle', 5, 8, 5),
(14, 2021, 'Invisibile', 3, 9, 6),
(15, 2014, 'Risveglio dei Titani', 2, 10, 4),
(16, 2013, 'Ombre del Passato', 1, 6, 5),
(17, 2011, 'Viaggio nel Tempo', 1, 7, 6),
(18, 2012, 'Nebbia del Mattino', 4, 8, 4),
(19, 2010, 'L\'Alba del Destino', 2, 9, 5),
(20, 2014, 'L\'Ultimo Viaggio', 6, 10, 6),
(21, 2014, 'asperiores sed corporis', 1, 1, 8),
(22, 2002, 'accusantium adipisci minus', 1, 3, 5),
(23, 1989, 'consequatur voluptates maiores', 1, 1, 3),
(24, 2009, 'perspiciatis distinctio magni', 1, 2, 8),
(25, 1981, 'quos necessitatibus ratione', 1, 1, 5),
(26, 2019, 'optio placeat eaque', 1, 3, 1),
(27, 2006, 'ex veniam reprehenderit', 1, 1, 3),
(28, 1975, 'odit adipisci doloribus', 1, 2, 2),
(29, 2023, 'nemo delectus voluptatum', 1, 3, 8),
(30, 2006, 'eligendi unde amet', 1, 2, 2),
(31, 2023, 'alias amet ut', 1, 3, 3),
(32, 1979, 'magni soluta accusantium', 1, 2, 3),
(33, 1997, 'quis ut nostrum', 1, 1, 8),
(34, 2001, 'eaque dignissimos incidunt', 1, 1, 2),
(35, 2000, 'aliquam voluptatibus tempora', 1, 3, 6),
(36, 1988, 'quis doloribus magnam', 1, 1, 2),
(37, 1978, 'porro quis hic', 1, 2, 6),
(38, 1982, 'sint debitis voluptatibus', 1, 2, 4),
(39, 2012, 'incidunt saepe architecto', 1, 2, 1),
(40, 1977, 'quibusdam quas architecto', 1, 2, 8),
(41, 2010, 'molestias quidem iste', 1, 2, 8),
(42, 2021, 'in iusto repellendus', 1, 2, 2),
(43, 2012, 'quaerat unde nostrum', 1, 2, 2),
(44, 2013, 'veritatis beatae quidem', 1, 1, 4),
(45, 1987, 'reiciendis ullam est', 1, 1, 5),
(46, 2020, 'tempore modi reiciendis', 1, 2, 5),
(47, 2005, 'libero culpa ducimus', 1, 2, 8),
(48, 2014, 'eum occaecati tempore', 1, 3, 1),
(49, 2012, 'deserunt necessitatibus repellendus', 1, 3, 5),
(50, 2019, 'neque accusamus neque', 1, 3, 8),
(51, 2023, 'facere debitis nisi', 1, 1, 1),
(52, 1996, 'atque libero accusantium', 1, 3, 2),
(53, 2018, 'ad non praesentium', 1, 3, 1),
(54, 2019, 'odio esse numquam', 1, 3, 1),
(55, 1993, 'aut temporibus fugit', 1, 3, 6),
(56, 1995, 'tempora sapiente velit', 1, 1, 2),
(57, 2010, 'fugiat unde nihil', 1, 3, 5),
(58, 1997, 'nulla nihil nobis', 1, 2, 4),
(59, 2022, 'commodi impedit ipsum', 1, 1, 1),
(60, 1992, 'ratione ad occaecati', 1, 2, 4),
(61, 1985, 'facere molestiae magni', 1, 3, 4),
(62, 2002, 'quaerat enim tempora', 1, 2, 3),
(63, 2019, 'delectus corporis corrupti', 1, 1, 5),
(64, 2019, 'architecto officia fugiat', 1, 3, 5),
(65, 1983, 'expedita libero aperiam', 1, 1, 8),
(66, 2020, 'amet placeat soluta', 1, 3, 8),
(67, 2016, 'eveniet laudantium provident', 1, 1, 3),
(68, 1984, 'a aliquam repudiandae', 1, 1, 8),
(69, 2004, 'nulla debitis ipsa', 1, 3, 1),
(70, 2020, 'quas eos voluptatibus', 1, 3, 8),
(71, 2000, 'ullam provident unde', 1, 1, 6),
(72, 2021, 'quos animi ipsum', 1, 1, 8),
(73, 2014, 'totam velit reprehenderit', 1, 3, 6),
(74, 2016, 'pariatur quos pariatur', 1, 3, 1),
(75, 1992, 'dolor asperiores quibusdam', 1, 1, 6),
(76, 2024, 'consequuntur cum eius', 1, 2, 8),
(77, 1991, 'delectus iusto totam', 1, 3, 2),
(78, 1993, 'voluptas error modi', 1, 1, 2),
(79, 1981, 'animi sed repellat', 1, 3, 2),
(80, 1984, 'totam veniam nihil', 1, 3, 8),
(81, 1997, 'fugiat officia officiis', 1, 2, 4),
(82, 2016, 'quisquam hic nisi', 1, 1, 8),
(83, 1988, 'quam assumenda a', 1, 3, 4),
(84, 2016, 'placeat praesentium distinctio', 1, 1, 4),
(85, 1996, 'nesciunt dignissimos nostrum', 1, 2, 3),
(86, 2021, 'neque voluptate quam', 1, 1, 2),
(87, 1979, 'error commodi nobis', 1, 3, 4),
(88, 2024, 'atque pariatur nesciunt', 1, 3, 5),
(89, 2021, 'aperiam omnis ratione', 1, 1, 7),
(90, 1989, 'eaque nobis cumque', 1, 3, 3),
(91, 1979, 'amet animi officiis', 1, 1, 8),
(92, 2024, 'fugiat quidem itaque', 1, 1, 6),
(93, 2011, 'repellendus esse repudiandae', 1, 2, 2),
(94, 1999, 'modi vitae eum', 1, 2, 5),
(95, 1993, 'odit molestias rerum', 1, 2, 4),
(96, 2013, 'maxime ut eaque', 1, 2, 7),
(97, 2024, 'ducimus assumenda numquam', 1, 1, 3),
(98, 2021, 'veniam totam itaque', 1, 3, 4),
(99, 2010, 'rerum nostrum delectus', 1, 3, 5),
(100, 1986, 'aperiam dolores occaecati', 1, 1, 8),
(101, 2001, 'nostrum cum at', 1, 2, 5),
(102, 1980, 'fugiat quasi sunt', 1, 1, 3),
(103, 2019, 'tempora ullam unde', 1, 2, 2),
(104, 2012, 'laborum ratione officia', 1, 2, 4),
(105, 2001, 'quae sit nisi', 1, 2, 1),
(106, 1992, 'quia accusamus totam', 1, 2, 6),
(107, 1999, 'ex atque praesentium', 1, 2, 2),
(108, 2010, 'ullam mollitia maiores', 1, 2, 4),
(109, 2015, 'accusamus dolor dolor', 1, 3, 7),
(110, 1985, 'odio eos aliquid', 1, 1, 3),
(111, 1990, 'tempora eligendi ad', 1, 3, 6),
(112, 2002, 'explicabo atque totam', 1, 1, 6),
(113, 1980, 'adipisci vitae non', 1, 2, 3),
(114, 2010, 'velit sunt ex', 1, 2, 2),
(115, 2000, 'est molestiae odit', 1, 2, 3),
(116, 1986, 'dolore enim aperiam', 1, 2, 1),
(117, 2013, 'nulla natus perferendis', 1, 3, 7),
(118, 1989, 'temporibus veritatis dolores', 1, 3, 6),
(119, 1989, 'quaerat expedita occaecati', 1, 2, 3),
(120, 2007, 'rerum facere minima', 1, 1, 4),
(122, 1992, 'odio vero suscipit', 2, 6, 2),
(123, 1994, 'error nam facilis', 2, 5, 4),
(124, 2002, 'eius enim autem', 2, 6, 2),
(125, 1982, 'asperiores voluptatem dolores', 2, 6, 5),
(126, 2014, 'mollitia iusto nesciunt', 2, 4, 2),
(127, 1981, 'officia sunt tenetur', 2, 6, 8),
(128, 2009, 'rem delectus provident', 2, 6, 8),
(129, 2009, 'id voluptates sapiente', 2, 6, 7),
(130, 1990, 'excepturi animi facere', 2, 6, 4),
(131, 2012, 'consequatur dignissimos natus', 2, 4, 5),
(132, 1982, 'dolorem assumenda perspiciatis', 2, 5, 3),
(133, 1982, 'itaque libero expedita', 2, 4, 2),
(134, 2020, 'dignissimos tenetur consequuntur', 2, 6, 1),
(135, 1991, 'laboriosam praesentium maxime', 2, 5, 1),
(136, 1979, 'reprehenderit sapiente culpa', 2, 5, 4),
(137, 1998, 'explicabo et corporis', 2, 4, 6),
(138, 1996, 'libero modi quod', 2, 4, 7),
(139, 2018, 'quaerat id eos', 2, 6, 8),
(140, 2023, 'non voluptas itaque', 2, 4, 2),
(141, 2001, 'iste assumenda totam', 2, 5, 7),
(142, 2020, 'laborum ipsum at', 2, 6, 2),
(143, 2012, 'asperiores ipsam quaerat', 2, 4, 1),
(144, 2024, 'quo delectus voluptatibus', 2, 4, 5),
(145, 2019, 'accusamus cum ad', 2, 6, 4),
(146, 2015, 'ad id maiores', 2, 5, 5),
(147, 1990, 'cupiditate omnis laborum', 2, 6, 4),
(148, 1984, 'doloribus quibusdam tempora', 2, 5, 1),
(149, 2016, 'tenetur id numquam', 2, 5, 5),
(150, 1988, 'voluptas alias eligendi', 2, 4, 6),
(151, 2018, 'magnam eum modi', 2, 6, 4),
(152, 1999, 'rerum esse nulla', 2, 5, 5),
(153, 2009, 'expedita tempore voluptatum', 2, 5, 2),
(154, 2005, 'voluptate pariatur eum', 2, 5, 5),
(155, 2009, 'fugiat quidem consectetur', 2, 5, 6),
(156, 2006, 'quod soluta labore', 2, 5, 2),
(157, 2005, 'debitis dicta doloribus', 2, 4, 7),
(158, 1992, 'perferendis eveniet est', 2, 5, 2),
(159, 1997, 'quasi reiciendis saepe', 2, 6, 5),
(160, 2015, 'incidunt totam non', 2, 4, 8),
(161, 2011, 'praesentium recusandae amet', 2, 5, 3),
(162, 1986, 'saepe porro deleniti', 2, 6, 2),
(163, 2007, 'fuga corrupti officiis', 2, 4, 7),
(164, 2020, 'sit at error', 2, 4, 6),
(165, 2005, 'error nam officia', 2, 5, 3),
(166, 1997, 'possimus nostrum omnis', 2, 4, 7),
(167, 1980, 'ipsa atque repudiandae', 2, 5, 5),
(168, 2018, 'voluptates pariatur voluptate', 2, 6, 5),
(169, 2010, 'dolorem accusantium harum', 2, 4, 3),
(170, 2000, 'vitae nihil fuga', 2, 4, 1),
(171, 2020, 'impedit blanditiis unde', 2, 4, 5),
(172, 1982, 'dolores nesciunt optio', 2, 6, 3),
(173, 2002, 'hic iste nulla', 2, 6, 8),
(174, 2020, 'dolorem porro ut', 2, 6, 1),
(175, 1986, 'saepe ut est', 2, 4, 2),
(176, 1992, 'provident aliquam quidem', 2, 4, 4),
(177, 2003, 'assumenda nesciunt optio', 2, 6, 5),
(178, 2009, 'nostrum officia tempore', 2, 4, 2),
(179, 2023, 'nostrum ea dignissimos', 2, 6, 4),
(180, 1980, 'porro nemo cumque', 2, 6, 3),
(181, 1992, 'unde corporis ab', 2, 5, 3),
(182, 1996, 'esse dicta sint', 2, 6, 2),
(183, 2006, 'dolorem expedita sit', 2, 5, 5),
(184, 1998, 'totam impedit itaque', 2, 6, 8),
(185, 1988, 'neque dicta quis', 2, 6, 5),
(186, 2024, 'nostrum necessitatibus quasi', 2, 6, 1),
(187, 1989, 'eaque quisquam et', 2, 5, 2),
(188, 1987, 'soluta ullam ipsum', 2, 5, 4),
(189, 1981, 'velit deleniti molestiae', 2, 4, 3),
(190, 1984, 'ea incidunt ipsa', 2, 6, 8),
(191, 1984, 'maxime provident quasi', 2, 5, 2),
(192, 1994, 'animi non eos', 2, 4, 3),
(193, 1983, 'numquam id ipsa', 2, 4, 8),
(194, 1982, 'iusto in id', 2, 4, 1),
(195, 1988, 'porro velit maiores', 2, 6, 3),
(196, 2010, 'praesentium atque laboriosam', 2, 6, 7),
(197, 2000, 'id rerum dolore', 2, 5, 1),
(198, 1982, 'nihil repellat maxime', 2, 5, 7),
(199, 1982, 'doloremque similique illo', 2, 6, 6),
(200, 2019, 'rerum assumenda quos', 2, 6, 4),
(201, 2010, 'et quo eos', 2, 6, 8),
(202, 1977, 'facilis aspernatur ab', 2, 5, 3),
(203, 1990, 'repellendus officiis odio', 2, 6, 5),
(204, 2010, 'libero doloremque ipsum', 2, 6, 6),
(205, 2024, 'necessitatibus omnis minus', 2, 6, 6),
(206, 2006, 'animi illo inventore', 2, 5, 1),
(207, 1991, 'dolor velit dolores', 2, 4, 7),
(208, 2024, 'necessitatibus aspernatur inventore', 2, 4, 8),
(209, 2019, 'natus velit nostrum', 2, 4, 2),
(210, 1976, 'in quo magni', 2, 6, 4),
(211, 1977, 'ut repudiandae tenetur', 2, 5, 1),
(212, 1999, 'rem minima autem', 2, 4, 5),
(213, 2006, 'cumque occaecati nisi', 2, 6, 1),
(214, 1992, 'sed adipisci corporis', 2, 6, 1),
(215, 2006, 'incidunt voluptatibus ipsam', 2, 5, 7),
(216, 2000, 'laboriosam praesentium consectetur', 2, 4, 2),
(217, 2004, 'ut repellat quos', 2, 4, 8),
(218, 2017, 'officiis cumque consequuntur', 2, 4, 7),
(219, 1990, 'aliquid voluptate quidem', 2, 6, 6),
(220, 1990, 'quas dignissimos voluptas', 2, 6, 3),
(221, 1986, 'laudantium eligendi nesciunt', 2, 6, 6),
(223, 2013, 'optio in quasi', 3, 9, 8),
(224, 1995, 'ullam corporis aut', 3, 10, 6),
(225, 2022, 'eveniet quod repellendus', 3, 10, 6),
(226, 2011, 'modi error ducimus', 3, 8, 5),
(227, 1998, 'repellendus quos dicta', 3, 7, 1),
(228, 1975, 'incidunt consequuntur quis', 3, 10, 6),
(229, 2010, 'nostrum est mollitia', 3, 9, 7),
(230, 2012, 'magni dolor vero', 3, 8, 4),
(231, 2003, 'tempora dicta officiis', 3, 9, 4),
(232, 1984, 'maxime officiis veritatis', 3, 10, 1),
(233, 1994, 'in quibusdam voluptatem', 3, 9, 3),
(234, 1988, 'corporis accusamus culpa', 3, 10, 3),
(235, 1985, 'totam maiores nostrum', 3, 7, 7),
(236, 2010, 'iure consequatur hic', 3, 10, 1),
(237, 1980, 'asperiores exercitationem cum', 3, 9, 1),
(238, 2006, 'sint repellendus sint', 3, 8, 4),
(239, 1984, 'ad quibusdam sunt', 3, 10, 1),
(240, 1975, 'totam optio dolores', 3, 7, 4),
(241, 2006, 'repudiandae inventore non', 3, 7, 2),
(242, 2013, 'nisi optio numquam', 3, 8, 2),
(243, 2014, 'fugiat numquam numquam', 3, 7, 5),
(244, 1987, 'saepe veritatis ab', 3, 10, 1),
(245, 1985, 'nesciunt praesentium illo', 3, 8, 7),
(246, 1992, 'est minima at', 3, 7, 8),
(247, 1991, 'natus nesciunt sunt', 3, 8, 2),
(248, 1980, 'accusantium saepe sunt', 3, 9, 5),
(249, 1984, 'modi laboriosam quis', 3, 8, 8),
(250, 1980, 'provident vitae ipsam', 3, 7, 4),
(251, 2009, 'error magnam possimus', 3, 10, 1),
(252, 2023, 'temporibus sunt iure', 3, 7, 7),
(253, 2016, 'commodi veniam perferendis', 3, 9, 5),
(254, 2013, 'iure magni omnis', 3, 7, 3),
(255, 1996, 'maiores necessitatibus error', 3, 9, 4),
(256, 1994, 'deleniti debitis tenetur', 3, 9, 3),
(257, 2013, 'totam dicta ipsa', 3, 7, 1),
(258, 1997, 'sunt necessitatibus cum', 3, 8, 3),
(259, 1978, 'harum quis necessitatibus', 3, 8, 2),
(260, 2000, 'vitae ipsa aliquam', 3, 9, 3),
(261, 2023, 'delectus culpa ab', 3, 8, 7),
(262, 2012, 'harum sed vel', 3, 10, 2),
(263, 2017, 'nam quae fugit', 3, 9, 2),
(264, 2016, 'beatae velit fugit', 3, 8, 5),
(265, 1991, 'maiores saepe atque', 3, 7, 1),
(266, 1988, 'optio adipisci provident', 3, 9, 4),
(267, 1976, 'est quas cumque', 3, 9, 6),
(268, 1990, 'omnis id eaque', 3, 8, 6),
(269, 2024, 'quos sint sequi', 3, 10, 8),
(270, 2000, 'velit beatae nemo', 3, 10, 6),
(271, 2016, 'dolores atque velit', 3, 8, 5),
(272, 2004, 'nulla provident totam', 3, 10, 2),
(273, 2002, 'rerum impedit est', 3, 7, 4),
(274, 2020, 'possimus rerum eveniet', 3, 8, 3),
(275, 2019, 'non reiciendis facere', 3, 9, 2),
(276, 2011, 'numquam eum dolores', 3, 9, 2),
(277, 1989, 'omnis enim praesentium', 3, 10, 7),
(278, 2017, 'illo incidunt nisi', 3, 9, 6),
(279, 2018, 'voluptate magni dolorem', 3, 9, 8),
(280, 2007, 'iure debitis harum', 3, 8, 3),
(281, 2017, 'tempora hic occaecati', 3, 9, 4),
(282, 1995, 'consequatur nemo ducimus', 3, 9, 6),
(283, 1994, 'explicabo reiciendis dignissimos', 3, 9, 3),
(284, 1983, 'placeat accusamus nostrum', 3, 9, 6),
(285, 1976, 'odit hic recusandae', 3, 10, 1),
(286, 1995, 'eligendi neque quos', 3, 8, 3),
(287, 1993, 'magni quibusdam in', 3, 8, 6),
(288, 2004, 'modi omnis est', 3, 7, 2),
(289, 1982, 'possimus voluptas ipsum', 3, 10, 4),
(290, 2010, 'nam possimus aspernatur', 3, 8, 8),
(291, 1979, 'aut laudantium eveniet', 3, 9, 4),
(292, 2020, 'esse laboriosam quidem', 3, 7, 6),
(293, 1997, 'repudiandae iusto dignissimos', 3, 10, 5),
(294, 1989, 'veritatis id rerum', 3, 10, 2),
(295, 1982, 'nihil maiores dignissimos', 3, 7, 5),
(296, 2013, 'aut sequi repellendus', 3, 8, 6),
(297, 2023, 'ipsa fugit minus', 3, 8, 3),
(298, 2020, 'delectus dolorem exercitationem', 3, 10, 7),
(299, 1986, 'atque in eum', 3, 9, 1),
(300, 2000, 'quidem dolores maxime', 3, 9, 1),
(301, 2010, 'praesentium magnam perferendis', 3, 9, 5),
(302, 1989, 'quibusdam odio aspernatur', 3, 10, 2),
(303, 2017, 'iusto occaecati maiores', 3, 9, 2),
(304, 1999, 'omnis neque repellendus', 3, 8, 2),
(305, 2007, 'facilis quas officia', 3, 10, 1),
(306, 2010, 'ad deleniti ipsam', 3, 10, 5),
(307, 1980, 'ratione odio aliquam', 3, 7, 7),
(308, 1990, 'autem dicta tempore', 3, 7, 5),
(309, 2022, 'expedita harum vel', 3, 10, 4),
(310, 1979, 'tempora deserunt eos', 3, 7, 1),
(311, 2000, 'impedit culpa impedit', 3, 10, 4),
(312, 2002, 'ut sit dolore', 3, 8, 5),
(313, 2014, 'aspernatur repellat dolorem', 3, 10, 4),
(314, 2006, 'facilis quisquam quo', 3, 9, 3),
(315, 2013, 'magni doloribus eum', 3, 9, 7),
(316, 2006, 'labore earum iusto', 3, 8, 3),
(317, 2009, 'recusandae dolore ducimus', 3, 10, 2),
(318, 1988, 'quidem molestiae odit', 3, 8, 1),
(319, 2014, 'accusantium tenetur aspernatur', 3, 8, 4),
(320, 1979, 'hic ducimus perferendis', 3, 8, 1),
(321, 2006, 'ex corrupti consectetur', 3, 7, 1),
(322, 1984, 'saepe sint tenetur', 3, 9, 4),
(324, 1996, 'alias porro earum', 6, 11, 8),
(325, 1983, 'vitae voluptates deserunt', 6, 13, 2),
(326, 2002, 'itaque aliquam fuga', 6, 13, 4),
(327, 1990, 'perspiciatis pariatur at', 6, 12, 2),
(328, 1999, 'voluptate debitis possimus', 6, 13, 7),
(329, 2008, 'eos eveniet animi', 6, 11, 8),
(330, 1976, 'accusantium dicta excepturi', 6, 13, 1),
(331, 1982, 'hic reprehenderit nostrum', 6, 12, 7),
(332, 1975, 'asperiores labore unde', 6, 13, 5),
(333, 2010, 'officiis dolor nam', 6, 13, 5),
(334, 2005, 'accusantium minus atque', 6, 12, 2),
(335, 2014, 'tenetur adipisci maxime', 6, 11, 7),
(336, 1998, 'sit at nam', 6, 13, 2),
(337, 1994, 'alias enim amet', 6, 11, 5),
(338, 1986, 'debitis eos assumenda', 6, 11, 7),
(339, 1976, 'cumque doloribus nisi', 6, 12, 3),
(340, 1996, 'sapiente ab ea', 6, 13, 8),
(341, 2019, 'modi et numquam', 6, 13, 3),
(342, 2020, 'rerum harum sapiente', 6, 11, 6),
(343, 2001, 'repellendus eius deleniti', 6, 12, 2),
(344, 2013, 'unde sit et', 6, 12, 2),
(345, 1981, 'reprehenderit minima dolores', 6, 12, 6),
(346, 2010, 'sit ducimus perspiciatis', 6, 12, 8),
(347, 1984, 'iste aspernatur perspiciatis', 6, 11, 5),
(348, 1987, 'repellat animi voluptas', 6, 12, 6),
(349, 1997, 'voluptatem inventore porro', 6, 11, 6),
(350, 2022, 'alias nemo explicabo', 6, 12, 4),
(351, 1987, 'sint eum voluptas', 6, 13, 8),
(352, 2020, 'repellendus natus pariatur', 6, 12, 7),
(353, 2023, 'rerum vitae eos', 6, 11, 7),
(354, 2001, 'unde aspernatur veritatis', 6, 13, 8),
(355, 1977, 'maiores veniam reprehenderit', 6, 13, 1),
(356, 2002, 'qui eum in', 6, 13, 3),
(357, 1998, 'rerum architecto sed', 6, 12, 4),
(358, 1978, 'soluta vel officia', 6, 11, 1),
(359, 2009, 'dignissimos facilis velit', 6, 11, 2),
(360, 1991, 'ut fuga explicabo', 6, 11, 8),
(361, 2000, 'harum dicta dolorum', 6, 11, 3),
(362, 1986, 'officiis rerum perspiciatis', 6, 12, 7),
(363, 2013, 'magni nemo tenetur', 6, 12, 6),
(364, 1981, 'quae odio esse', 6, 12, 4),
(365, 2022, 'nobis doloribus fugiat', 6, 12, 7),
(366, 1983, 'animi vitae officia', 6, 11, 2),
(367, 1976, 'similique soluta quis', 6, 13, 1),
(368, 1989, 'nemo ullam qui', 6, 13, 7),
(369, 2007, 'voluptatem architecto suscipit', 6, 13, 4),
(370, 1982, 'hic ut ullam', 6, 13, 3),
(371, 1989, 'sequi vero soluta', 6, 13, 4),
(372, 1998, 'rem nulla dolores', 6, 12, 2),
(373, 1980, 'occaecati voluptatum alias', 6, 13, 3),
(374, 2013, 'tempore nulla vero', 6, 13, 1),
(375, 1976, 'provident vitae et', 6, 12, 7),
(376, 1981, 'voluptas beatae dignissimos', 6, 13, 1),
(377, 2015, 'voluptates velit temporibus', 6, 11, 5),
(378, 2011, 'temporibus non quasi', 6, 11, 6),
(379, 1999, 'officia quidem labore', 6, 13, 6),
(380, 2022, 'sunt fugiat voluptatem', 6, 13, 7),
(381, 1998, 'exercitationem ut placeat', 6, 12, 2),
(382, 2015, 'earum modi veritatis', 6, 11, 1),
(383, 1990, 'accusamus deleniti quas', 6, 11, 5),
(384, 1976, 'expedita ut veritatis', 6, 13, 5),
(385, 1995, 'dolores facere nulla', 6, 13, 4),
(386, 1977, 'explicabo ratione facilis', 6, 11, 7),
(387, 1993, 'placeat quasi ratione', 6, 11, 2),
(388, 1997, 'exercitationem omnis vero', 6, 11, 8),
(389, 1982, 'molestiae officiis deserunt', 6, 13, 5),
(390, 2001, 'voluptatum ab deserunt', 6, 11, 7),
(391, 1994, 'molestiae saepe eligendi', 6, 12, 1),
(392, 1996, 'a iure dicta', 6, 13, 7),
(393, 1984, 'iste quasi mollitia', 6, 13, 7),
(394, 2010, 'doloribus omnis reprehenderit', 6, 11, 4),
(395, 2020, 'vel molestiae illo', 6, 13, 1),
(396, 1990, 'amet odit ipsum', 6, 13, 4),
(397, 2010, 'quod molestiae eius', 6, 12, 5),
(398, 2022, 'modi id maxime', 6, 11, 3),
(399, 1991, 'velit minus facere', 6, 13, 4),
(400, 2017, 'necessitatibus impedit facilis', 6, 12, 2),
(401, 2004, 'quos nesciunt ut', 6, 11, 5),
(402, 2021, 'adipisci voluptas minima', 6, 13, 7),
(403, 1975, 'nulla sequi accusantium', 6, 13, 3),
(404, 1999, 'vel architecto ipsam', 6, 13, 4),
(405, 1979, 'dolorem distinctio aperiam', 6, 11, 6),
(406, 1997, 'distinctio expedita quasi', 6, 11, 8),
(407, 2023, 'earum veniam eos', 6, 13, 5),
(408, 2005, 'facere eligendi mollitia', 6, 11, 4),
(409, 2020, 'tempora natus similique', 6, 13, 2),
(410, 2005, 'ad quia totam', 6, 11, 6),
(411, 2006, 'non corporis delectus', 6, 12, 1),
(412, 1976, 'error fugiat ut', 6, 13, 8),
(413, 2000, 'accusamus distinctio ipsam', 6, 11, 2),
(414, 2015, 'ratione sunt consequatur', 6, 12, 2),
(415, 1977, 'pariatur qui et', 6, 12, 5),
(416, 2012, 'dolore error molestiae', 6, 12, 7),
(417, 1986, 'nesciunt explicabo quam', 6, 13, 1),
(418, 1999, 'assumenda fugiat aliquid', 6, 13, 4),
(419, 2007, 'explicabo doloribus temporibus', 6, 12, 2),
(420, 2004, 'aliquam nisi repellendus', 6, 12, 1),
(421, 1982, 'ex sit labore', 6, 13, 4),
(422, 1990, 'aliquam nostrum ratione', 6, 12, 8),
(423, 1980, 'corrupti iusto ullam', 6, 13, 5),
(424, 1999, 'deserunt delectus soluta', 5, 16, 5),
(425, 2020, 'possimus eos magni', 5, 14, 8),
(426, 1999, 'sint quae officiis', 5, 14, 1),
(427, 2021, 'omnis unde dolorum', 5, 16, 4),
(428, 1993, 'tenetur corporis excepturi', 5, 14, 1),
(429, 2024, 'a voluptate repellat', 5, 15, 1),
(430, 2005, 'accusantium tempore qui', 5, 14, 8),
(431, 1980, 'fuga commodi necessitatibus', 5, 14, 4),
(432, 1975, 'incidunt cum architecto', 5, 15, 5),
(433, 1997, 'error tenetur eligendi', 5, 15, 3),
(434, 2016, 'nobis asperiores distinctio', 5, 15, 2),
(435, 1980, 'quia consequuntur eaque', 5, 16, 6),
(436, 1981, 'ea neque quaerat', 5, 14, 5),
(437, 2006, 'aliquam praesentium aperiam', 5, 16, 2),
(438, 1986, 'sint cupiditate reiciendis', 5, 16, 1),
(439, 1984, 'voluptatum aperiam maxime', 5, 15, 5),
(440, 1975, 'optio autem necessitatibus', 5, 15, 7),
(441, 2008, 'cumque quas impedit', 5, 14, 5),
(442, 1998, 'atque ad amet', 5, 15, 6),
(443, 2006, 'beatae nemo eum', 5, 14, 6),
(444, 1981, 'saepe dignissimos labore', 5, 15, 3),
(445, 2003, 'voluptatibus qui perferendis', 5, 14, 3),
(446, 1992, 'incidunt voluptatem reprehenderit', 5, 14, 6),
(447, 2000, 'odio ea facilis', 5, 14, 8),
(448, 2015, 'nisi excepturi consequatur', 5, 14, 6),
(449, 1984, 'magnam consequuntur nulla', 5, 14, 5),
(450, 1982, 'ea provident velit', 5, 14, 2),
(451, 1975, 'dolorem cum nemo', 5, 14, 1),
(452, 2004, 'sequi excepturi vero', 5, 15, 7),
(453, 1997, 'eos assumenda quae', 5, 15, 5),
(454, 2007, 'pariatur suscipit animi', 5, 15, 4),
(455, 1997, 'aperiam quam explicabo', 5, 16, 8),
(456, 1986, 'magni molestias ipsum', 5, 15, 5),
(457, 1976, 'minima facere recusandae', 5, 14, 3),
(458, 1986, 'quaerat quae dolores', 5, 16, 2),
(459, 1986, 'qui occaecati quaerat', 5, 15, 2),
(460, 1995, 'debitis nobis ea', 5, 15, 4),
(461, 2017, 'libero incidunt quae', 5, 15, 6),
(462, 1976, 'rerum inventore aut', 5, 15, 7),
(463, 2005, 'laborum ut perspiciatis', 5, 15, 6),
(464, 2006, 'iusto enim possimus', 5, 16, 2),
(465, 2018, 'expedita necessitatibus debitis', 5, 15, 1),
(466, 1978, 'et vel esse', 5, 15, 7),
(467, 1986, 'magnam dicta quis', 5, 14, 6),
(468, 2000, 'mollitia expedita ad', 5, 15, 8),
(469, 1985, 'consequatur adipisci architecto', 5, 14, 2),
(470, 1996, 'nisi nobis aspernatur', 5, 15, 7),
(471, 1979, 'vel debitis autem', 5, 15, 6),
(472, 2021, 'illum ab tempora', 5, 15, 1),
(473, 1985, 'temporibus consequatur culpa', 5, 15, 4),
(474, 1981, 'neque amet ex', 5, 14, 3),
(475, 2016, 'temporibus quos ratione', 5, 16, 8),
(476, 1986, 'minus occaecati accusamus', 5, 16, 7),
(477, 1984, 'corrupti commodi enim', 5, 15, 3),
(478, 2001, 'itaque fugit molestias', 5, 16, 7),
(479, 1988, 'blanditiis quas facilis', 5, 15, 6),
(480, 2004, 'placeat animi ullam', 5, 15, 1),
(481, 1996, 'esse quod id', 5, 16, 2),
(482, 2004, 'eos repudiandae vero', 5, 14, 2),
(483, 2001, 'sit repellat autem', 5, 16, 8),
(484, 2004, 'consequatur cum quibusdam', 5, 15, 8),
(485, 2013, 'cumque laboriosam tempore', 5, 16, 4),
(486, 2018, 'voluptatem asperiores est', 5, 15, 5),
(487, 2008, 'molestias pariatur veritatis', 5, 15, 4),
(488, 2010, 'sapiente nihil dolorem', 5, 15, 8),
(489, 1987, 'fugiat illo similique', 5, 15, 2),
(490, 2003, 'suscipit incidunt asperiores', 5, 16, 3),
(491, 2013, 'suscipit aut ducimus', 5, 14, 4),
(492, 2016, 'dolorem rem maxime', 5, 14, 2),
(493, 2016, 'a suscipit repudiandae', 5, 14, 4),
(494, 2010, 'quae esse corrupti', 5, 16, 7),
(495, 2014, 'sunt consectetur similique', 5, 14, 1),
(496, 1999, 'ipsa inventore rem', 5, 15, 7),
(497, 1990, 'deserunt consectetur ad', 5, 14, 8),
(498, 2004, 'esse tempora iusto', 5, 15, 3),
(499, 1981, 'quis exercitationem accusantium', 5, 14, 4),
(500, 2010, 'iusto enim aspernatur', 5, 16, 8),
(501, 1979, 'esse magni eaque', 5, 16, 7),
(502, 1975, 'possimus debitis reiciendis', 5, 16, 3),
(503, 2020, 'architecto ducimus laudantium', 5, 15, 5),
(504, 1988, 'corrupti saepe expedita', 5, 16, 4),
(505, 1981, 'molestias repudiandae commodi', 5, 14, 7),
(506, 2006, 'magnam eveniet culpa', 5, 15, 8),
(507, 1975, 'nesciunt repellat est', 5, 15, 3),
(508, 2004, 'dolorum impedit eum', 5, 14, 3),
(509, 1991, 'earum est ullam', 5, 16, 8),
(510, 2003, 'repudiandae asperiores officiis', 5, 16, 8),
(511, 1980, 'ipsum natus incidunt', 5, 15, 6),
(512, 1986, 'earum voluptates quod', 5, 16, 4),
(513, 1986, 'asperiores omnis autem', 5, 16, 2),
(514, 1976, 'dolorem similique animi', 5, 15, 6),
(515, 1999, 'rerum odit natus', 5, 16, 1),
(516, 2022, 'molestiae omnis nobis', 5, 16, 8),
(517, 1976, 'consequatur molestias pariatur', 5, 15, 6),
(518, 1978, 'porro ipsam eligendi', 5, 16, 5),
(519, 1987, 'voluptas tempora molestiae', 5, 15, 6),
(520, 1995, 'inventore laborum sapiente', 5, 14, 5),
(521, 2009, 'totam quibusdam modi', 4, 17, 5),
(522, 1999, 'rerum libero neque', 4, 19, 4),
(523, 2006, 'voluptas voluptates praesentium', 4, 17, 6),
(524, 2002, 'labore veritatis veritatis', 4, 18, 6),
(525, 2023, 'id ullam ea', 4, 19, 5),
(526, 1982, 'porro quod enim', 4, 17, 3),
(527, 2015, 'rem necessitatibus odio', 4, 17, 2),
(528, 2016, 'illum quia soluta', 4, 18, 2),
(529, 1989, 'iste soluta porro', 4, 19, 5),
(530, 2014, 'impedit nihil facere', 4, 19, 4),
(531, 1994, 'nobis eveniet natus', 4, 17, 4),
(532, 1997, 'modi iure cupiditate', 4, 18, 2),
(533, 2017, 'cumque eveniet explicabo', 4, 17, 4),
(534, 1978, 'nam iure in', 4, 17, 2),
(535, 2019, 'delectus repellendus architecto', 4, 17, 1),
(536, 2019, 'ipsum voluptate itaque', 4, 17, 8),
(537, 2016, 'a harum consectetur', 4, 19, 5),
(538, 2024, 'repudiandae aperiam magnam', 4, 19, 2),
(539, 1995, 'iure accusamus atque', 4, 19, 1),
(540, 1998, 'culpa delectus excepturi', 4, 17, 4),
(541, 1992, 'sequi eius voluptas', 4, 18, 2),
(542, 1981, 'saepe laudantium repellat', 4, 17, 1),
(543, 1978, 'consectetur suscipit facere', 4, 18, 5),
(544, 2007, 'est optio impedit', 4, 17, 3),
(545, 1989, 'suscipit fuga hic', 4, 17, 8),
(546, 2014, 'illo iure doloremque', 4, 17, 1),
(547, 1992, 'occaecati vel animi', 4, 18, 4),
(548, 2002, 'cum corrupti dolorum', 4, 19, 5),
(549, 1978, 'aspernatur nulla aspernatur', 4, 18, 6),
(550, 2004, 'nihil maxime explicabo', 4, 18, 6),
(551, 2024, 'fuga optio quas', 4, 19, 3),
(552, 1981, 'asperiores ab in', 4, 18, 1),
(553, 1986, 'occaecati assumenda architecto', 4, 17, 4),
(554, 2002, 'deleniti minus corrupti', 4, 17, 1),
(555, 1978, 'laboriosam expedita quaerat', 4, 17, 6),
(556, 2024, 'magnam sunt at', 4, 18, 5),
(557, 2021, 'aspernatur architecto et', 4, 18, 5),
(558, 1987, 'harum unde sapiente', 4, 18, 3),
(559, 1979, 'atque reprehenderit magni', 4, 18, 7),
(560, 2020, 'porro ea cum', 4, 17, 7),
(561, 2005, 'repudiandae ad pariatur', 4, 17, 5),
(562, 2002, 'tempora accusamus est', 4, 19, 7),
(563, 2019, 'magni officia voluptatum', 4, 17, 7),
(564, 2003, 'voluptatem iste consequatur', 4, 18, 4),
(565, 1991, 'magnam earum modi', 4, 19, 4),
(566, 2007, 'architecto explicabo saepe', 4, 19, 7),
(567, 2024, 'reiciendis dolore eos', 4, 18, 4),
(568, 1994, 'repellendus numquam autem', 4, 18, 7),
(569, 2009, 'odio facere omnis', 4, 19, 4),
(570, 1977, 'harum labore similique', 4, 17, 7),
(571, 2015, 'voluptate fugit quos', 4, 18, 8),
(572, 1983, 'laboriosam tenetur excepturi', 4, 18, 8),
(573, 1986, 'placeat eos aperiam', 4, 18, 6),
(574, 1979, 'porro eligendi laborum', 4, 17, 2),
(575, 2007, 'assumenda voluptas ea', 4, 19, 7),
(576, 1994, 'recusandae eaque eos', 4, 17, 6),
(577, 1991, 'sint expedita dolores', 4, 17, 3),
(578, 1990, 'sed praesentium eligendi', 4, 18, 1),
(579, 2007, 'enim deleniti repellendus', 4, 19, 6),
(580, 2004, 'autem corrupti provident', 4, 17, 8),
(581, 1983, 'quas ipsam ut', 4, 19, 5),
(582, 1978, 'magnam et maxime', 4, 17, 8),
(583, 1981, 'molestias iusto accusamus', 4, 18, 1),
(584, 2016, 'similique pariatur fugit', 4, 18, 1),
(585, 1999, 'dignissimos dignissimos ratione', 4, 17, 4),
(586, 2018, 'eveniet in voluptates', 4, 18, 3),
(587, 1978, 'dolor eum nesciunt', 4, 17, 7),
(588, 1992, 'error totam quisquam', 4, 18, 1),
(589, 1984, 'amet fugit cupiditate', 4, 18, 7),
(590, 1996, 'ipsa saepe saepe', 4, 17, 6),
(591, 1991, 'libero ullam beatae', 4, 19, 7),
(592, 1981, 'officiis amet rem', 4, 18, 5),
(593, 2021, 'deserunt magnam fugit', 4, 17, 7),
(594, 1992, 'provident numquam cumque', 4, 18, 5),
(595, 1980, 'vel aut rem', 4, 18, 7),
(596, 2024, 'dolore consequatur aspernatur', 4, 17, 4),
(597, 2003, 'voluptas itaque officiis', 4, 18, 8),
(598, 1990, 'dolore alias doloribus', 4, 19, 3),
(599, 2009, 'distinctio expedita esse', 4, 19, 7),
(600, 2023, 'quas quae nihil', 4, 18, 1),
(601, 2003, 'cumque eius placeat', 4, 18, 4),
(602, 2011, 'iste culpa dolore', 4, 17, 1),
(603, 2007, 'deleniti nostrum accusamus', 4, 18, 5),
(604, 2021, 'tenetur impedit repellat', 4, 19, 8),
(605, 2011, 'omnis exercitationem provident', 4, 17, 5),
(606, 2022, 'beatae temporibus eius', 4, 18, 8),
(607, 1998, 'deleniti sint ipsam', 4, 17, 6),
(608, 1992, 'similique ut officia', 4, 19, 4),
(609, 1991, 'explicabo assumenda suscipit', 4, 17, 6),
(610, 2006, 'illo esse illo', 4, 18, 8),
(611, 1984, 'a incidunt non', 4, 18, 7),
(612, 2023, 'earum occaecati adipisci', 4, 18, 7),
(613, 1978, 'quod delectus cumque', 4, 17, 2),
(614, 1975, 'magni hic sint', 4, 17, 5),
(615, 2016, 'consequuntur culpa debitis', 4, 19, 5),
(616, 2003, 'eum exercitationem excepturi', 4, 18, 7),
(617, 1998, 'impedit ut libero', 4, 17, 6),
(618, 1984, 'molestiae nostrum dignissimos', 4, 17, 2),
(619, 1987, 'corrupti sapiente debitis', 4, 17, 1),
(620, 1994, 'fugiat facere officia', 4, 18, 5),
(621, 2016, 'eos veritatis aut', 4, 18, 1),
(622, 2017, 'tenetur culpa labore', 4, 17, 5),
(623, 2019, 'cum consequatur et', 4, 19, 8),
(624, 1975, 'repudiandae alias alias', 4, 17, 7),
(625, 1987, 'ducimus eveniet quas', 4, 19, 6),
(626, 2013, 'nemo temporibus consectetur', 4, 19, 5),
(627, 2023, 'officiis dolor quod', 4, 17, 7),
(628, 2005, 'dolor illo repellendus', 4, 17, 6),
(629, 2006, 'cupiditate explicabo earum', 4, 18, 5),
(630, 2011, 'reiciendis laudantium similique', 4, 19, 6),
(631, 1988, 'incidunt voluptatibus quasi', 4, 18, 1),
(632, 1978, 'quae perspiciatis saepe', 4, 19, 3),
(633, 1987, 'mollitia fugiat perspiciatis', 4, 17, 7),
(634, 1976, 'animi velit voluptates', 4, 18, 2),
(635, 2002, 'labore autem inventore', 4, 18, 7),
(636, 1992, 'saepe debitis ducimus', 4, 18, 6),
(637, 1980, 'officia quis officiis', 4, 17, 8),
(638, 1996, 'non ex eum', 4, 17, 7),
(639, 1991, 'accusantium ad quod', 4, 17, 7),
(640, 1996, 'eligendi libero enim', 4, 18, 7),
(641, 2000, 'nam corporis maxime', 4, 18, 2),
(642, 1975, 'assumenda maxime odit', 4, 19, 2),
(643, 2024, 'quis aut quod', 4, 17, 6),
(644, 2023, 'officiis numquam deleniti', 4, 19, 6),
(645, 2002, 'iusto labore harum', 4, 19, 8),
(646, 2003, 'ipsa quod veritatis', 4, 19, 4),
(647, 2018, 'magni totam similique', 4, 18, 6),
(648, 2006, 'delectus accusantium praesentium', 4, 17, 2),
(649, 1985, 'amet omnis quidem', 4, 17, 6),
(650, 2014, 'necessitatibus numquam ducimus', 4, 17, 5),
(651, 1982, 'dicta optio optio', 4, 19, 6),
(652, 1981, 'sit nobis in', 4, 19, 5),
(653, 2013, 'nihil iure ipsam', 4, 19, 1),
(654, 1984, 'accusantium voluptatibus tempore', 4, 19, 4),
(655, 1982, 'neque impedit quam', 4, 17, 5),
(656, 1990, 'quisquam architecto eos', 4, 19, 5),
(657, 2010, 'distinctio doloribus tempora', 4, 19, 2),
(658, 1981, 'accusamus fuga perferendis', 4, 18, 8),
(659, 2013, 'quam eius magnam', 4, 18, 6),
(660, 1978, 'aliquam sint perspiciatis', 4, 19, 6),
(661, 2014, 'cum voluptates cupiditate', 4, 17, 5),
(662, 1976, 'corporis exercitationem minus', 4, 18, 5),
(663, 1986, 'reiciendis laborum quis', 4, 17, 7),
(664, 1999, 'quis iure laborum', 4, 18, 2),
(665, 2024, 'quisquam harum voluptatem', 4, 19, 8),
(666, 2014, 'praesentium aut minima', 4, 18, 4),
(667, 2023, 'voluptas aspernatur ducimus', 4, 18, 6),
(668, 1987, 'consectetur dolorem consequuntur', 4, 19, 1),
(669, 1995, 'nisi accusamus et', 4, 17, 2),
(670, 2015, 'minima esse suscipit', 4, 19, 8),
(671, 1984, 'voluptatem fugit quia', 4, 18, 4),
(672, 2006, 'sequi pariatur excepturi', 4, 19, 6),
(673, 1989, 'perspiciatis quis voluptate', 4, 17, 2),
(674, 2011, 'quia distinctio quibusdam', 4, 18, 8),
(675, 2014, 'earum tempore eveniet', 4, 17, 6),
(676, 2003, 'quaerat ipsum dolores', 4, 19, 4),
(677, 2022, 'aperiam ab fuga', 4, 17, 7),
(678, 2017, 'tempore quos nemo', 4, 17, 8),
(679, 2018, 'autem nulla aperiam', 4, 18, 8),
(680, 1991, 'et exercitationem perspiciatis', 4, 17, 6),
(681, 2004, 'odio ducimus sunt', 4, 17, 8),
(682, 2001, 'ratione perspiciatis suscipit', 4, 18, 7),
(683, 2017, 'repudiandae reprehenderit impedit', 4, 19, 6),
(684, 2009, 'ipsam iste laborum', 4, 19, 6),
(685, 1976, 'natus velit numquam', 4, 19, 2),
(686, 1999, 'ut id quo', 4, 18, 2),
(687, 2002, 'esse fuga dolore', 4, 18, 2),
(688, 1993, 'recusandae explicabo non', 4, 18, 6),
(689, 2009, 'dolore laudantium alias', 4, 17, 6),
(690, 2009, 'voluptate repellendus dolores', 4, 17, 8),
(691, 1997, 'sequi iusto ullam', 4, 19, 6),
(692, 2024, 'quod iusto aliquid', 4, 17, 4),
(693, 1992, 'magnam sapiente amet', 4, 17, 3),
(694, 2006, 'molestiae eos delectus', 4, 18, 7),
(695, 1998, 'sequi dolor veritatis', 4, 17, 3),
(696, 1983, 'ipsum dolores dolor', 4, 18, 5),
(697, 1976, 'beatae reiciendis rem', 4, 17, 1),
(698, 2010, 'at occaecati accusantium', 4, 17, 5),
(699, 1980, 'nostrum suscipit illum', 4, 17, 7),
(700, 2003, 'velit repellendus quis', 4, 17, 8),
(701, 2016, 'labore nulla quis', 4, 18, 1),
(702, 1977, 'consequatur dolorum ipsa', 4, 18, 8),
(703, 2012, 'rem harum nihil', 4, 17, 1),
(704, 1982, 'illum sunt repudiandae', 4, 17, 4),
(2702, 2012, 'animi atque quaerat', 4, 4, 2),
(2703, 2021, 'mollitia dicta distinctio', 6, 8, 1),
(2704, 2009, 'veniam porro accusamus', 1, 15, 7),
(2705, 2001, 'doloribus error eum', 3, 16, 5),
(2706, 2004, 'consequatur porro inventore', 1, 4, 6),
(2707, 1979, 'quod nulla consequuntur', 6, 9, 5),
(2708, 2023, 'earum velit officia', 4, 16, 5),
(2709, 2003, 'officiis fuga eaque', 2, 19, 1),
(2710, 1995, 'eaque possimus assumenda', 6, 10, 4),
(2711, 1996, 'minus voluptas accusantium', 6, 16, 7),
(2712, 2017, 'adipisci tempora doloribus', 5, 7, 2),
(2713, 2008, 'rem accusantium natus', 2, 17, 1),
(2714, 2016, 'totam repellendus harum', 2, 12, 5),
(2715, 2014, 'veritatis rerum repudiandae', 2, 6, 6),
(2716, 2004, 'aliquam sunt cum', 5, 2, 8),
(2717, 2024, 'iure natus consequuntur', 5, 7, 8),
(2718, 1978, 'maiores consequatur sunt', 2, 8, 3),
(2719, 1992, 'accusantium perspiciatis aliquam', 3, 16, 1),
(2720, 2006, 'neque aspernatur iste', 3, 2, 5),
(2721, 2000, 'dicta dolor beatae', 5, 19, 1),
(2722, 2016, 'voluptate dolorum molestiae', 5, 8, 2),
(2723, 1991, 'sed eum et', 3, 3, 8),
(2724, 2007, 'cumque odit corporis', 2, 2, 1),
(2725, 1983, 'illum exercitationem repellat', 6, 9, 4),
(2726, 1995, 'debitis consectetur inventore', 1, 12, 6),
(2727, 2019, 'omnis ex a', 1, 6, 7),
(2728, 2000, 'maiores accusamus delectus', 1, 2, 4),
(2729, 2011, 'tenetur excepturi inventore', 4, 9, 7),
(2730, 2016, 'labore quasi ullam', 4, 7, 4),
(2731, 2000, 'ullam unde totam', 1, 14, 4),
(2732, 1982, 'repudiandae aperiam dolores', 4, 8, 2),
(2733, 1999, 'sapiente sint delectus', 5, 2, 6),
(2734, 1991, 'dolorem iusto magnam', 6, 3, 2),
(2735, 1997, 'odit ipsa ex', 2, 6, 2),
(2736, 2023, 'corporis dicta tempora', 5, 16, 1),
(2737, 2023, 'ipsa facere illum', 2, 1, 1),
(2738, 1986, 'rem recusandae rerum', 3, 6, 1),
(2739, 2019, 'quam libero nihil', 2, 3, 6),
(2740, 2022, 'explicabo recusandae dignissimos', 5, 5, 4),
(2741, 2021, 'incidunt quaerat architecto', 4, 15, 6),
(2742, 2016, 'dolores facilis perspiciatis', 6, 18, 2),
(2743, 1990, 'culpa neque maiores', 3, 9, 3),
(2744, 1992, 'possimus repellendus architecto', 2, 19, 5),
(2745, 2007, 'ipsum sint amet', 4, 8, 4),
(2746, 2012, 'placeat et tempora', 2, 12, 3),
(2747, 1981, 'minus iusto quis', 3, 14, 8),
(2748, 1975, 'quo voluptates error', 3, 4, 1),
(2749, 1979, 'ipsa voluptates autem', 5, 16, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `regione`
--

CREATE TABLE `regione` (
  `Cod_Regione` int(11) NOT NULL,
  `Regione_Editore` varchar(50) NOT NULL,
  `Id_Stato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `regione`
--

INSERT INTO `regione` (`Cod_Regione`, `Regione_Editore`, `Id_Stato`) VALUES
(1, 'Abruzzo', 1),
(2, 'Provence-Alpes-Côte \'Azur', 2),
(3, 'Catalonia', 3),
(4, 'Bavaria', 4),
(5, 'England', 5),
(6, 'California', 6),
(7, 'Piemonte', 1),
(8, 'Piemonte', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `stato`
--

CREATE TABLE `stato` (
  `Cod_Stato` int(11) NOT NULL,
  `Stato_Editore` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `stato`
--

INSERT INTO `stato` (`Cod_Stato`, `Stato_Editore`) VALUES
(1, 'Italia'),
(2, 'Francia'),
(3, 'Spagna'),
(4, 'Germania'),
(5, 'Regno Unito'),
(6, 'Stati Uniti');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `autore`
--
ALTER TABLE `autore`
  ADD PRIMARY KEY (`CodAutore`),
  ADD KEY `Id_eta` (`Id_eta`);

--
-- Indici per le tabelle `editore`
--
ALTER TABLE `editore`
  ADD PRIMARY KEY (`Cod_Editore`),
  ADD KEY `Id_Provincia` (`Id_Provincia`);

--
-- Indici per le tabelle `eta`
--
ALTER TABLE `eta`
  ADD PRIMARY KEY (`Cod_eta`),
  ADD KEY `Id_fascia` (`Id_fascia`);

--
-- Indici per le tabelle `fascia`
--
ALTER TABLE `fascia`
  ADD PRIMARY KEY (`Cod_Fascia`);

--
-- Indici per le tabelle `genere`
--
ALTER TABLE `genere`
  ADD PRIMARY KEY (`Cod_Genere`);

--
-- Indici per le tabelle `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`Cod_Provincia`),
  ADD KEY `Id_Regione` (`Id_Regione`);

--
-- Indici per le tabelle `pubblicazione_libro`
--
ALTER TABLE `pubblicazione_libro`
  ADD PRIMARY KEY (`Id_Libro_Pub`),
  ADD KEY `Id_Genere` (`Id_Genere`),
  ADD KEY `Id_Autore` (`Id_Autore`),
  ADD KEY `Id_Editore` (`Id_Editore`);

--
-- Indici per le tabelle `regione`
--
ALTER TABLE `regione`
  ADD PRIMARY KEY (`Cod_Regione`),
  ADD KEY `Id_Stato` (`Id_Stato`);

--
-- Indici per le tabelle `stato`
--
ALTER TABLE `stato`
  ADD PRIMARY KEY (`Cod_Stato`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `autore`
--
ALTER TABLE `autore`
  ADD CONSTRAINT `autore_ibfk_1` FOREIGN KEY (`Id_eta`) REFERENCES `eta` (`Cod_eta`);

--
-- Limiti per la tabella `editore`
--
ALTER TABLE `editore`
  ADD CONSTRAINT `editore_ibfk_1` FOREIGN KEY (`Id_Provincia`) REFERENCES `provincia` (`Cod_Provincia`);

--
-- Limiti per la tabella `eta`
--
ALTER TABLE `eta`
  ADD CONSTRAINT `eta_ibfk_1` FOREIGN KEY (`Id_fascia`) REFERENCES `fascia` (`Cod_Fascia`);

--
-- Limiti per la tabella `provincia`
--
ALTER TABLE `provincia`
  ADD CONSTRAINT `provincia_ibfk_1` FOREIGN KEY (`Id_Regione`) REFERENCES `regione` (`Cod_Regione`);

--
-- Limiti per la tabella `pubblicazione_libro`
--
ALTER TABLE `pubblicazione_libro`
  ADD CONSTRAINT `pubblicazione_libro_ibfk_1` FOREIGN KEY (`Id_Genere`) REFERENCES `genere` (`Cod_Genere`),
  ADD CONSTRAINT `pubblicazione_libro_ibfk_2` FOREIGN KEY (`Id_Autore`) REFERENCES `autore` (`CodAutore`),
  ADD CONSTRAINT `pubblicazione_libro_ibfk_3` FOREIGN KEY (`Id_Editore`) REFERENCES `editore` (`Cod_Editore`);

--
-- Limiti per la tabella `regione`
--
ALTER TABLE `regione`
  ADD CONSTRAINT `regione_ibfk_1` FOREIGN KEY (`Id_Stato`) REFERENCES `stato` (`Cod_Stato`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
