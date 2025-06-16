-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Giu 11, 2025 alle 14:04
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `customer_purchases`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(11) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `customer`
--

INSERT INTO `customer` (`id_customer`, `name`) VALUES
(1, 'John Doe'),
(2, 'Jane Smith'),
(3, 'Mike Brown'),
(4, 'Samantha Lee'),
(5, 'James Bond');

-- --------------------------------------------------------

--
-- Struttura della tabella `product_category`
--

CREATE TABLE `product_category` (
  `id_product_category` int(11) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `product_category`
--

INSERT INTO `product_category` (`id_product_category`, `name`) VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Furniture'),
(4, 'Beauty'),
(5, 'Toys');

-- --------------------------------------------------------

--
-- Struttura della tabella `purchase`
--

CREATE TABLE `purchase` (
  `id_purchase` int(11) NOT NULL,
  `fk_id_customer` int(11) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `purchase_amount` float NOT NULL,
  `purchase_date` date NOT NULL,
  `fk_id_product_category` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `discount_applied` tinyint(1) NOT NULL,
  `fk_id_store_location` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `purchase`
--

INSERT INTO `purchase` (`id_purchase`, `fk_id_customer`, `email`, `purchase_amount`, `purchase_date`, `fk_id_product_category`, `quantity`, `discount_applied`, `fk_id_store_location`) VALUES
(1, 1, 'john.doe@email.com', 2000, '2024-01-01', 1, 2, 0, 1),
(2, 2, 'jane.smith@email.com', 100, '2024-01-02', 2, 2, 0, 2),
(3, 2, 'jane.smith@email.com', 10, '2024-01-03', 2, 2, 0, 2),
(4, 3, 'mikebrown@email.com', 50, '2024-01-04', 3, 2, 0, 3),
(5, 3, 'mikebrown@email.com', 2000, '2024-01-05', 3, 2, 0, 3),
(6, 4, 'samantha@email.com', 50, '2024-01-06', 4, 2, 0, 4),
(7, 4, 'sam.lee@email.com', 2000, '2024-01-07', 4, 2, 0, 4),
(8, 1, 'john.doe@email.com', 10, '2024-01-01', 1, 2, 0, 1),
(9, 2, 'jane.smith@email.com', 35, '2024-01-02', 2, 5, 0, 2),
(10, 2, 'jane.smith@email.com', 100, '2024-01-03', 2, 2, 0, 2),
(11, 3, 'mikebrown@email.com', 10, '2024-01-04', 3, 2, 0, 3),
(12, 3, 'mikebrown@email.com', 10, '2024-01-05', 3, 2, 0, 3),
(13, 4, 'samantha@email.com', 50, '2024-01-06', 4, 2, 0, 4),
(14, 4, 'sam.lee@email.com', 1000, '2024-01-07', 4, 2, 0, 4),
(15, 1, 'john.doe@email.com', 100, '2024-01-01', 1, 2, 0, 1),
(16, 2, 'jane.smith@email.com', 20, '2024-01-02', 2, 1, 0, 2),
(17, 2, 'jane.smith@email.com', 10, '2024-01-03', 2, 2, 0, 2),
(18, 3, 'mikebrown@email.com', 1000, '2024-01-04', 3, 2, 0, 3),
(19, 3, 'mikebrown@email.com', 20, '2024-01-05', 3, 1, 0, 3),
(20, 4, 'samantha@email.com', 75, '2024-01-06', 4, 1, 0, 4),
(21, 4, 'sam.lee@email.com', 10, '2024-01-07', 4, 2, 0, 4),
(22, 1, 'john.doe@email.com', 1000, '2024-01-01', 1, 5, 0, 1),
(23, 2, 'jane.smith@email.com', 35, '2024-01-02', 2, 5, 0, 2),
(24, 2, 'jane.smith@email.com', 10, '2024-01-03', 2, 2, 0, 2),
(25, 3, 'mikebrown@email.com', 50, '2024-01-04', 3, 5, 0, 3),
(26, 3, 'mikebrown@email.com', 2000, '2024-01-05', 3, 2, 0, 3),
(27, 4, 'samantha@email.com', 100, '2024-01-06', 4, 1, 0, 4),
(28, 4, 'sam.lee@email.com', 75, '2024-01-07', 4, 3, 0, 4),
(29, 1, 'john.doe@email.com', 50, '2024-01-01', 1, 3, 0, 1),
(30, 2, 'jane.smith@email.com', 35, '2024-01-02', 2, 5, 0, 2),
(31, 2, 'jane.smith@email.com', 50, '2024-01-03', 2, 5, 0, 2),
(32, 3, 'mikebrown@email.com', 2000, '2024-01-04', 3, 1, 0, 3),
(33, 3, 'mikebrown@email.com', 50, '2024-01-05', 3, 5, 0, 3),
(34, 4, 'samantha@email.com', 75, '2024-01-06', 4, 5, 0, 4),
(35, 4, 'sam.lee@email.com', 2000, '2024-01-07', 4, 1, 0, 4),
(36, 1, 'john.doe@email.com', 20, '2024-01-01', 1, 1, 0, 1),
(37, 2, 'jane.smith@email.com', 100, '2024-01-02', 2, 1, 0, 2),
(38, 2, 'jane.smith@email.com', 35, '2024-01-03', 2, 1, 0, 2),
(39, 3, 'mikebrown@email.com', 20, '2024-01-04', 3, 1, 0, 3),
(40, 3, 'mikebrown@email.com', 50, '2024-01-05', 3, 3, 0, 3),
(41, 4, 'samantha@email.com', 75, '2024-01-06', 4, 3, 0, 4),
(42, 4, 'sam.lee@email.com', 20, '2024-01-07', 4, 1, 0, 4),
(43, 1, 'john.doe@email.com', 100, '2024-01-01', 1, 3, 0, 1),
(44, 2, 'jane.smith@email.com', 2000, '2024-01-02', 2, 3, 0, 2),
(45, 2, 'jane.smith@email.com', 10, '2024-01-03', 2, 1, 0, 2),
(46, 3, 'mikebrown@email.com', 50, '2024-01-04', 3, 3, 0, 3),
(47, 3, 'mikebrown@email.com', 10, '2024-01-05', 3, 5, 0, 3),
(48, 4, 'samantha@email.com', 100, '2024-01-06', 4, 2, 0, 4),
(49, 4, 'sam.lee@email.com', 20, '2024-01-07', 4, 2, 0, 4),
(50, 5, '007@spy.agency', 10, '2024-01-15', 5, 1, 0, 5),
(51, 1, 'john.doe@email.com', 2000, '2024-01-01', 1, 2, 0, 1),
(52, 2, 'jane.smith@email.com', 100, '2024-01-02', 2, 2, 0, 2),
(53, 2, 'jane.smith@email.com', 10, '2024-01-03', 2, 2, 0, 2),
(54, 3, 'mikebrown@email.com', 50, '2024-01-04', 3, 2, 0, 3),
(55, 3, 'mikebrown@email.com', 2000, '2024-01-05', 3, 2, 0, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `store_location`
--

CREATE TABLE `store_location` (
  `id_store_location` int(11) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `store_location`
--

INSERT INTO `store_location` (`id_store_location`, `name`) VALUES
(1, 'New York'),
(2, 'Los Angeles'),
(3, 'Chicago'),
(4, 'Houston'),
(5, 'London');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indici per le tabelle `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id_product_category`);

--
-- Indici per le tabelle `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id_purchase`),
  ADD KEY `fk_id_customer` (`fk_id_customer`),
  ADD KEY `fk_id_product_category` (`fk_id_product_category`),
  ADD KEY `fk_id_store_location` (`fk_id_store_location`);

--
-- Indici per le tabelle `store_location`
--
ALTER TABLE `store_location`
  ADD PRIMARY KEY (`id_store_location`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `customer`
--
ALTER TABLE `customer`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id_product_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `purchase`
--
ALTER TABLE `purchase`
  MODIFY `id_purchase` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT per la tabella `store_location`
--
ALTER TABLE `store_location`
  MODIFY `id_store_location` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`fk_id_customer`) REFERENCES `customer` (`id_customer`),
  ADD CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`fk_id_product_category`) REFERENCES `product_category` (`id_product_category`),
  ADD CONSTRAINT `purchase_ibfk_3` FOREIGN KEY (`fk_id_store_location`) REFERENCES `store_location` (`id_store_location`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
