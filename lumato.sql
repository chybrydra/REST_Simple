-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: gondor-mysql
-- Czas generowania: 13 Kwi 2019, 12:47
-- Wersja serwera: 8.0.15
-- Wersja PHP: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `lumato`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `model` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `brand` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `production_year` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `fuel_type` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `reg_plate` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `cars`
--

INSERT INTO `cars` (`id`, `model`, `brand`, `production_year`, `user_id`, `fuel_type`, `reg_plate`) VALUES
(35, 'SIWIK', 'CHONDA', 2000, 75, 'Petrol', 'LU666'),
(36, 'KAJEN', 'PORSZE', 2002, 75, 'Diesel', 'DW2001'),
(37, 'RĘCZNA', 'DREZYNA', 1950, 75, 'P+LPG', 'XXXDDD'),
(38, 'SIWIK', 'CHONDA', 2000, 77, 'Diesel', 'LU666A'),
(39, 'KAJEN', 'PORSZE', 2005, 77, 'Petrol', 'GD2132B');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `extracosts`
--

CREATE TABLE `extracosts` (
  `idextracosts` int(11) NOT NULL,
  `cost` decimal(7,2) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `idcars` int(11) NOT NULL,
  `costdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `extracosts`
--

INSERT INTO `extracosts` (`idextracosts`, `cost`, `description`, `idcars`, `costdate`) VALUES
(9, '300.00', 'Dźwignia', 37, '1955-03-20 00:00:00'),
(12, '7102.00', 'napęd ludzki jednoramienny', 37, '1965-03-12 00:00:00'),
(13, '30.00', 'Naklejka Motor Lublin', 36, '2003-05-12 00:00:00'),
(14, '120.55', 'kierownica', 35, '2018-05-17 00:00:00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `fuelcosts`
--

CREATE TABLE `fuelcosts` (
  `idfuelcost` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `priceperliter` decimal(4,2) DEFAULT NULL,
  `amountoffuel` decimal(4,1) DEFAULT NULL,
  `currentmileage` int(11) DEFAULT NULL,
  `typeoffuel` varchar(45) DEFAULT NULL,
  `idcar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `fuelcosts`
--

INSERT INTO `fuelcosts` (`idfuelcost`, `date`, `priceperliter`, `amountoffuel`, `currentmileage`, `typeoffuel`, `idcar`) VALUES
(17, '2017-03-05 00:00:00', '12.70', '3.0', 19993, 'Petrol', 35),
(18, '2017-03-07 00:00:00', '12.90', '3.5', 20302, 'Petrol', 35),
(19, '2017-03-08 00:00:00', '12.80', '3.3', 20553, 'Petrol', 35),
(20, '2017-03-17 00:00:00', '13.00', '2.2', 20666, 'Petrol', 35),
(21, '2017-03-20 00:00:00', '12.90', '2.1', 20974, 'Petrol', 35),
(22, '2003-03-17 00:00:00', '9.88', '1.9', 101, 'Diesel', 36),
(25, '2003-03-22 00:00:00', '9.97', '2.7', 567, 'Diesel', 36),
(26, '2003-03-28 00:00:00', '9.97', '2.7', 931, 'Diesel', 36),
(27, '1988-08-12 00:00:00', '14.00', '6.0', 203929, 'P+LPG', 37);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(170) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `firstname` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `lastname` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `firstname`, `lastname`) VALUES
(77, 'jul@wp.pl', 'aaa', 'Juliusz', 'Cezar');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cars_users_idx` (`user_id`);

--
-- Indeksy dla tabeli `extracosts`
--
ALTER TABLE `extracosts`
  ADD PRIMARY KEY (`idextracosts`,`idcars`),
  ADD KEY `fk_extraCosts_cars1_idx` (`idcars`);

--
-- Indeksy dla tabeli `fuelcosts`
--
ALTER TABLE `fuelcosts`
  ADD PRIMARY KEY (`idfuelcost`),
  ADD KEY `fk_fuelCosts_cars1_idx` (`idcar`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT dla tabeli `extracosts`
--
ALTER TABLE `extracosts`
  MODIFY `idextracosts` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT dla tabeli `fuelcosts`
--
ALTER TABLE `fuelcosts`
  MODIFY `idfuelcost` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `fk_cars_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ograniczenia dla tabeli `extracosts`
--
ALTER TABLE `extracosts`
  ADD CONSTRAINT `fk_extraCosts_cars1` FOREIGN KEY (`idcars`) REFERENCES `cars` (`id`);

--
-- Ograniczenia dla tabeli `fuelcosts`
--
ALTER TABLE `fuelcosts`
  ADD CONSTRAINT `fk_fuelCosts_cars1` FOREIGN KEY (`idcar`) REFERENCES `cars` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
