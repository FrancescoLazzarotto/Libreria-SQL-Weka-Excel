-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Gen 31, 2024 alle 14:06
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
-- Database: `biblioteca_db`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `autore`
--

CREATE TABLE `autore` (
  `CodAutore` int(11) NOT NULL,
  `Nome_Autore` varchar(50) NOT NULL,
  `Cognome_Autore` varchar(50) NOT NULL,
  `Sesso_Autore` char(1) NOT NULL,
  `Anno_Nascita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `casa_editrice`
--

CREATE TABLE `casa_editrice` (
  `Id_Editore` int(11) NOT NULL,
  `Sede` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `categorizzato`
--

CREATE TABLE `categorizzato` (
  `ISBN` varchar(13) NOT NULL,
  `Genere` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `genere`
--

CREATE TABLE `genere` (
  `Categoria_Libro` varchar(50) NOT NULL,
  `Descrizione` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `libro`
--

CREATE TABLE `libro` (
  `ISBN` varchar(13) NOT NULL,
  `Titolo` varchar(100) NOT NULL,
  `Anno_Pubblicazione` int(11) NOT NULL,
  `Id_Casa_Editrice` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `membro_associato`
--

CREATE TABLE `membro_associato` (
  `Id_Membro` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Cognome` varchar(50) NOT NULL,
  `Indirizzo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `prestito`
--

CREATE TABLE `prestito` (
  `Id_Prestito` int(11) NOT NULL,
  `Id_Libro` varchar(13) NOT NULL,
  `Id_Membro_Prestito` int(11) NOT NULL,
  `Data_Prestito` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `scritto`
--

CREATE TABLE `scritto` (
  `ISBN` varchar(13) NOT NULL,
  `CodAutore` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `autore`
--
ALTER TABLE `autore`
  ADD PRIMARY KEY (`CodAutore`);

--
-- Indici per le tabelle `casa_editrice`
--
ALTER TABLE `casa_editrice`
  ADD PRIMARY KEY (`Id_Editore`);

--
-- Indici per le tabelle `categorizzato`
--
ALTER TABLE `categorizzato`
  ADD PRIMARY KEY (`ISBN`,`Genere`),
  ADD KEY `Genere` (`Genere`);

--
-- Indici per le tabelle `genere`
--
ALTER TABLE `genere`
  ADD PRIMARY KEY (`Categoria_Libro`);

--
-- Indici per le tabelle `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`ISBN`),
  ADD KEY `Id_Casa_Editrice` (`Id_Casa_Editrice`);

--
-- Indici per le tabelle `membro_associato`
--
ALTER TABLE `membro_associato`
  ADD PRIMARY KEY (`Id_Membro`);

--
-- Indici per le tabelle `prestito`
--
ALTER TABLE `prestito`
  ADD PRIMARY KEY (`Id_Prestito`),
  ADD KEY `Id_Libro` (`Id_Libro`),
  ADD KEY `Id_Membro_Prestito` (`Id_Membro_Prestito`);

--
-- Indici per le tabelle `scritto`
--
ALTER TABLE `scritto`
  ADD PRIMARY KEY (`ISBN`,`CodAutore`),
  ADD KEY `CodAutore` (`CodAutore`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `categorizzato`
--
ALTER TABLE `categorizzato`
  ADD CONSTRAINT `categorizzato_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `libro` (`ISBN`),
  ADD CONSTRAINT `categorizzato_ibfk_2` FOREIGN KEY (`Genere`) REFERENCES `genere` (`Categoria_Libro`);

--
-- Limiti per la tabella `libro`
--
ALTER TABLE `libro`
  ADD CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`Id_Casa_Editrice`) REFERENCES `casa_editrice` (`Id_Editore`);

--
-- Limiti per la tabella `prestito`
--
ALTER TABLE `prestito`
  ADD CONSTRAINT `prestito_ibfk_1` FOREIGN KEY (`Id_Libro`) REFERENCES `libro` (`ISBN`),
  ADD CONSTRAINT `prestito_ibfk_2` FOREIGN KEY (`Id_Membro_Prestito`) REFERENCES `membro_associato` (`Id_Membro`);

--
-- Limiti per la tabella `scritto`
--
ALTER TABLE `scritto`
  ADD CONSTRAINT `scritto_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `libro` (`ISBN`),
  ADD CONSTRAINT `scritto_ibfk_2` FOREIGN KEY (`CodAutore`) REFERENCES `autore` (`CodAutore`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
