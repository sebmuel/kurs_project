-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 27. Apr 2022 um 10:19
-- Server-Version: 8.0.27-0ubuntu0.20.04.1
-- PHP-Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `php_uebung`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Adressen`
--

CREATE TABLE `Adressen` (
  `a_id` int NOT NULL,
  `vorname` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `nachname` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `strasse` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ort` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `plz` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Kurse`
--

CREATE TABLE `Kurse` (
  `kurs_id` int NOT NULL,
  `kurs_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `kurs_start` date DEFAULT NULL,
  `kurs_ende` date DEFAULT NULL,
  `kurs_beschreibung` varchar(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Login`
--

CREATE TABLE `Login` (
  `user_id` int NOT NULL,
  `username` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `passwort` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `last_login` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Teilnehmer`
--

CREATE TABLE `Teilnehmer` (
  `t_id` int NOT NULL,
  `a_id` int DEFAULT NULL,
  `kurs_id` int DEFAULT NULL,
  `teilnehmernummer` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Test`
--

CREATE TABLE `Test` (
  `test_id` int NOT NULL,
  `kurs_id` int DEFAULT NULL,
  `dozent_id` int DEFAULT NULL,
  `test_template_id` int DEFAULT NULL,
  `datum` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Testergebnisse`
--

CREATE TABLE `Testergebnisse` (
  `te_id` int NOT NULL,
  `test_id` int DEFAULT NULL,
  `t_id` int DEFAULT NULL,
  `ergebnis` varchar(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Testtemplate`
--

CREATE TABLE `Testtemplate` (
  `test_template` int NOT NULL,
  `template` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `Adressen`
--
ALTER TABLE `Adressen`
  ADD PRIMARY KEY (`a_id`);

--
-- Indizes für die Tabelle `Kurse`
--
ALTER TABLE `Kurse`
  ADD PRIMARY KEY (`kurs_id`);

--
-- Indizes für die Tabelle `Login`
--
ALTER TABLE `Login`
  ADD PRIMARY KEY (`user_id`);

--
-- Indizes für die Tabelle `Teilnehmer`
--
ALTER TABLE `Teilnehmer`
  ADD PRIMARY KEY (`t_id`),
  ADD KEY `a_id` (`a_id`),
  ADD KEY `kurs_id` (`kurs_id`);

--
-- Indizes für die Tabelle `Test`
--
ALTER TABLE `Test`
  ADD PRIMARY KEY (`test_id`),
  ADD KEY `kurs_id` (`kurs_id`),
  ADD KEY `dozent_id` (`dozent_id`),
  ADD KEY `test_template_id` (`test_template_id`);

--
-- Indizes für die Tabelle `Testergebnisse`
--
ALTER TABLE `Testergebnisse`
  ADD PRIMARY KEY (`te_id`),
  ADD KEY `test_id` (`test_id`),
  ADD KEY `t_id` (`t_id`);

--
-- Indizes für die Tabelle `Testtemplate`
--
ALTER TABLE `Testtemplate`
  ADD PRIMARY KEY (`test_template`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `Adressen`
--
ALTER TABLE `Adressen`
  MODIFY `a_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Kurse`
--
ALTER TABLE `Kurse`
  MODIFY `kurs_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Login`
--
ALTER TABLE `Login`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Teilnehmer`
--
ALTER TABLE `Teilnehmer`
  MODIFY `t_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Test`
--
ALTER TABLE `Test`
  MODIFY `test_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Testergebnisse`
--
ALTER TABLE `Testergebnisse`
  MODIFY `te_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Testtemplate`
--
ALTER TABLE `Testtemplate`
  MODIFY `test_template` int NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `Teilnehmer`
--
ALTER TABLE `Teilnehmer`
  ADD CONSTRAINT `Teilnehmer_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `Adressen` (`a_id`),
  ADD CONSTRAINT `Teilnehmer_ibfk_2` FOREIGN KEY (`kurs_id`) REFERENCES `Kurse` (`kurs_id`);

--
-- Constraints der Tabelle `Test`
--
ALTER TABLE `Test`
  ADD CONSTRAINT `Test_ibfk_1` FOREIGN KEY (`kurs_id`) REFERENCES `Kurse` (`kurs_id`),
  ADD CONSTRAINT `Test_ibfk_2` FOREIGN KEY (`dozent_id`) REFERENCES `Adressen` (`a_id`),
  ADD CONSTRAINT `Test_ibfk_3` FOREIGN KEY (`test_template_id`) REFERENCES `Testtemplate` (`test_template`);

--
-- Constraints der Tabelle `Testergebnisse`
--
ALTER TABLE `Testergebnisse`
  ADD CONSTRAINT `Testergebnisse_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `Test` (`test_id`),
  ADD CONSTRAINT `Testergebnisse_ibfk_2` FOREIGN KEY (`t_id`) REFERENCES `Teilnehmer` (`t_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
