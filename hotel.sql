-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 07 nov. 2022 à 20:14
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `hotel`
--

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` text NOT NULL,
  `Message` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`ID`, `FirstName`, `LastName`, `Email`, `Message`) VALUES
(1, 'Ramesh', 'babu', 'ram@gmail.com', 'Well Organized Project .....Cool!'),
(2, 'ganapathy', 'subu', 'gana@gmail.com', 'Super buddy!');

-- --------------------------------------------------------

--
-- Structure de la table `event_booking`
--

DROP TABLE IF EXISTS `event_booking`;
CREATE TABLE IF NOT EXISTS `event_booking` (
  `BookingId` bigint(10) NOT NULL AUTO_INCREMENT,
  `EventId` bigint(10) NOT NULL,
  `User_id` bigint(10) NOT NULL,
  `Date` date NOT NULL,
  `Modified_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `Event_date` date NOT NULL,
  `NoOfGuest` varchar(50) NOT NULL,
  `EventTime` time NOT NULL,
  `Package` bigint(10) NOT NULL,
  `Amount` double NOT NULL,
  `Email` text NOT NULL,
  `Phone_number` bigint(10) NOT NULL,
  `Status` enum('Rejected','Cancelled','Paid','Booked','CheckedOut') NOT NULL DEFAULT 'Booked',
  PRIMARY KEY (`BookingId`),
  KEY `FK_User` (`User_id`),
  KEY `FK_RoomBooking` (`EventId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `event_booking`
--

INSERT INTO `event_booking` (`BookingId`, `EventId`, `User_id`, `Date`, `Modified_date`, `Event_date`, `NoOfGuest`, `EventTime`, `Package`, `Amount`, `Email`, `Phone_number`, `Status`) VALUES
(12, 18, 5, '2021-10-12', '2021-10-12 15:04:50', '2021-10-14', '200-250', '09:00:00', 8, 16000, 'rajesh@gmail.com', 8574526352, 'Rejected'),
(13, 22, 5, '2021-08-04', '2021-08-06 15:06:29', '2021-08-14', '250-300', '09:30:00', 8, 9600, 'rajesh@gmail.com', 8574859652, 'CheckedOut'),
(14, 19, 15, '2021-10-12', '2021-10-12 15:11:32', '2021-12-09', '100-200', '09:00:00', 8, 16000, 'rakesh@gmail.com', 8563526352, 'Paid'),
(15, 20, 15, '2021-10-12', '2021-10-12 15:12:02', '2021-11-20', '200-250', '10:00:00', 4, 8000, 'rakesh@gmail.com', 7545859652, 'Paid');

-- --------------------------------------------------------

--
-- Structure de la table `event_list`
--

DROP TABLE IF EXISTS `event_list`;
CREATE TABLE IF NOT EXISTS `event_list` (
  `EventId` bigint(10) NOT NULL AUTO_INCREMENT,
  `EventTypeId` bigint(10) NOT NULL,
  `HallNumber` bigint(10) NOT NULL,
  `Status` enum('active','in-active') NOT NULL,
  `Booking_status` enum('Booked','Available') NOT NULL DEFAULT 'Available',
  PRIMARY KEY (`EventId`),
  KEY `FK_EventType` (`EventTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `event_list`
--

INSERT INTO `event_list` (`EventId`, `EventTypeId`, `HallNumber`, `Status`, `Booking_status`) VALUES
(18, 11, 1, 'active', 'Available'),
(19, 11, 2, 'active', 'Booked'),
(20, 11, 3, 'active', 'Booked'),
(21, 11, 4, 'active', 'Available'),
(22, 12, 5, 'active', 'Available'),
(23, 12, 6, 'active', 'Available'),
(24, 11, 7, 'active', 'Available'),
(25, 12, 8, 'active', 'Available'),
(26, 11, 9, 'active', 'Available');

-- --------------------------------------------------------

--
-- Structure de la table `event_payment`
--

DROP TABLE IF EXISTS `event_payment`;
CREATE TABLE IF NOT EXISTS `event_payment` (
  `PaymentId` bigint(10) NOT NULL AUTO_INCREMENT,
  `BookingId` bigint(10) NOT NULL,
  `PaymentType` enum('Cash','Net Banking','Credit Card','Debit Card') NOT NULL,
  `PaymentDate` date NOT NULL DEFAULT current_timestamp(),
  `Amount` int(50) NOT NULL,
  `Status` enum('Paid') NOT NULL DEFAULT 'Paid',
  PRIMARY KEY (`PaymentId`),
  KEY `Fk_Booking` (`BookingId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `event_payment`
--

INSERT INTO `event_payment` (`PaymentId`, `BookingId`, `PaymentType`, `PaymentDate`, `Amount`, `Status`) VALUES
(1, 13, 'Cash', '2021-08-13', 9600, 'Paid'),
(2, 15, 'Net Banking', '2021-10-12', 8000, 'Paid'),
(3, 14, 'Debit Card', '2021-10-12', 16000, 'Paid');

-- --------------------------------------------------------

--
-- Structure de la table `event_type`
--

DROP TABLE IF EXISTS `event_type`;
CREATE TABLE IF NOT EXISTS `event_type` (
  `EventTypeId` bigint(10) NOT NULL AUTO_INCREMENT,
  `EventType` varchar(15) NOT NULL,
  `EventImage` text NOT NULL,
  `Description` text NOT NULL,
  `Cost` double NOT NULL,
  `Status` enum('active','in-active') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`EventTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `event_type`
--

INSERT INTO `event_type` (`EventTypeId`, `EventType`, `EventImage`, `Description`, `Cost`, `Status`) VALUES
(11, 'Mariage', 'w4000h2646x0y0-099a17f7.webp', 'This hall is a space offered mainly for weddings, birthdays, bridal showers and other personal events. They could be separate or part of a hotel or restaurant.', 2000, 'active'),
(12, ' RÃ©union', '79bb466b.webp', 'The Killi, Kaveri and Tanjore meeting rooms are the perfect combination of space and ideal ambiance with state of the art amenities and audio visual equipments', 1200, 'active'),
(13, 'Conference', 'caf93383.jpg', 'Ten distinct dining destinations featuring Indian & international cuisine along with some of the .....', 1700, 'active');

-- --------------------------------------------------------

--
-- Structure de la table `general_settings`
--

DROP TABLE IF EXISTS `general_settings`;
CREATE TABLE IF NOT EXISTS `general_settings` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `Name` text NOT NULL,
  `Address_line1` text NOT NULL,
  `Address_line2` text NOT NULL,
  `City` varchar(10) NOT NULL,
  `State` varchar(10) NOT NULL,
  `Country` varchar(10) NOT NULL,
  `Zip_code` bigint(10) NOT NULL,
  `Email` text NOT NULL,
  `Phone_number` bigint(10) NOT NULL,
  `Telephone_number` bigint(10) NOT NULL,
  `Description` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `general_settings`
--

INSERT INTO `general_settings` (`ID`, `Name`, `Address_line1`, `Address_line2`, `City`, `State`, `Country`, `Zip_code`, `Email`, `Phone_number`, `Telephone_number`, `Description`) VALUES
(1, 'Hotel MÃ©ridien', ' Les Genets Chemin De Wilaya, Route 75, 31000', 'Akid lotfi', 'oran', 'oran', 'AlgÃ©rie', 600015, 'meridienoran@gmail.com', 9658968555, 123456789, ' Le MÃ©ridien Oran Hotel & Convention Centre est une ode Ã  la dÃ©couverte. DotÃ© dâ€™un centre de confÃ©rence de pointe et dâ€™un total de 296 chambres et suites, notre hÃ´tel compte Ã©galement 28 salles de rÃ©union et un auditorium pouvant accueillir 3 000 personnes. ');

-- --------------------------------------------------------

--
-- Structure de la table `room_booking`
--

DROP TABLE IF EXISTS `room_booking`;
CREATE TABLE IF NOT EXISTS `room_booking` (
  `BookingId` bigint(10) NOT NULL AUTO_INCREMENT,
  `RoomId` bigint(10) NOT NULL,
  `User_id` bigint(10) NOT NULL,
  `Date` date NOT NULL,
  `Modified_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `CheckIn` date NOT NULL,
  `CheckOut` date NOT NULL,
  `NoOfGuest` varchar(50) NOT NULL,
  `Amount` double NOT NULL,
  `Email` text NOT NULL,
  `Phone_number` bigint(10) NOT NULL,
  `Status` enum('Rejected','Cancelled','Paid','Booked','CheckedOut') NOT NULL DEFAULT 'Booked',
  PRIMARY KEY (`BookingId`),
  KEY `FK_User` (`User_id`),
  KEY `FK_RoomBooking` (`RoomId`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `room_booking`
--

INSERT INTO `room_booking` (`BookingId`, `RoomId`, `User_id`, `Date`, `Modified_date`, `CheckIn`, `CheckOut`, `NoOfGuest`, `Amount`, `Email`, `Phone_number`, `Status`) VALUES
(27, 20, 5, '2021-10-12', '2021-10-12 15:01:44', '2021-10-13', '2021-10-15', '2', 4000, 'rajesh@gmail.com', 8596526352, 'Paid'),
(28, 13, 5, '2021-10-12', '2021-10-12 15:02:20', '2021-10-20', '2021-10-22', '1', 2400, 'rajesh@gmail.com', 8542526352, 'Cancelled'),
(29, 21, 5, '2021-10-12', '2021-10-12 15:05:32', '2021-11-03', '2021-11-05', '1', 4000, 'rajesh@gmail.com', 8596857452, 'Rejected'),
(30, 22, 15, '2021-10-12', '2021-10-12 15:08:36', '2021-12-02', '2021-12-03', '1', 1750, 'rakesh@gmail.com', 9685745241, 'Paid'),
(31, 13, 15, '2021-10-12', '2021-10-12 15:09:00', '2021-11-11', '2021-11-13', '2', 2400, 'rakesh@gmail.com', 7485965263, 'Cancelled'),
(32, 16, 15, '2021-10-12', '2021-10-12 15:09:31', '2021-11-18', '2021-11-20', '2', 3600, 'rakesh@gmail.com', 9652635241, 'Paid'),
(33, 29, 15, '2021-10-12', '2021-10-12 15:10:07', '2021-10-14', '2021-10-23', '1', 31500, 'rakesh@gmail.com', 8541526352, 'Paid'),
(34, 18, 15, '2021-10-12', '2021-10-12 15:10:42', '2021-11-11', '2021-11-13', '2', 3600, 'rakesh@gmail.com', 8585968563, 'Booked');

-- --------------------------------------------------------

--
-- Structure de la table `room_list`
--

DROP TABLE IF EXISTS `room_list`;
CREATE TABLE IF NOT EXISTS `room_list` (
  `RoomId` bigint(10) NOT NULL AUTO_INCREMENT,
  `RoomTypeId` bigint(10) NOT NULL,
  `RoomNumber` bigint(10) NOT NULL,
  `Status` enum('active','in-active') NOT NULL,
  `Booking_status` enum('Booked','Available') NOT NULL DEFAULT 'Available',
  PRIMARY KEY (`RoomId`),
  KEY `FK_RoomType` (`RoomTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `room_list`
--

INSERT INTO `room_list` (`RoomId`, `RoomTypeId`, `RoomNumber`, `Status`, `Booking_status`) VALUES
(13, 11, 1, 'active', 'Available'),
(14, 11, 2, 'active', 'Available'),
(15, 11, 3, 'active', 'Available'),
(16, 12, 4, 'active', 'Booked'),
(17, 11, 5, 'active', 'Available'),
(18, 12, 6, 'active', 'Booked'),
(19, 12, 7, 'active', 'Available'),
(20, 13, 8, 'active', 'Booked'),
(21, 13, 9, 'active', 'Available'),
(22, 14, 10, 'active', 'Booked'),
(23, 14, 11, 'active', 'Available'),
(24, 14, 12, 'active', 'Available'),
(25, 15, 13, 'active', 'Available'),
(26, 15, 14, 'active', 'Available'),
(27, 16, 15, 'active', 'Available'),
(28, 18, 16, 'active', 'Available'),
(29, 17, 17, 'active', 'Booked'),
(30, 16, 18, 'active', 'Available'),
(31, 17, 19, 'active', 'Available'),
(32, 15, 20, 'active', 'Available');

-- --------------------------------------------------------

--
-- Structure de la table `room_payment`
--

DROP TABLE IF EXISTS `room_payment`;
CREATE TABLE IF NOT EXISTS `room_payment` (
  `PaymentId` bigint(10) NOT NULL AUTO_INCREMENT,
  `BookingId` bigint(10) NOT NULL,
  `PaymentType` enum('Cash','Net Banking','Credit Card','Debit Card') NOT NULL,
  `PaymentDate` date NOT NULL DEFAULT current_timestamp(),
  `Amount` int(50) NOT NULL,
  `Status` enum('Paid') NOT NULL DEFAULT 'Paid',
  PRIMARY KEY (`PaymentId`),
  KEY `Fk_Booking` (`BookingId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `room_payment`
--

INSERT INTO `room_payment` (`PaymentId`, `BookingId`, `PaymentType`, `PaymentDate`, `Amount`, `Status`) VALUES
(1, 27, 'Net Banking', '2021-10-12', 4000, 'Paid'),
(2, 32, 'Net Banking', '2021-10-12', 3600, 'Paid'),
(3, 30, 'Net Banking', '2021-10-12', 1750, 'Paid'),
(4, 33, 'Debit Card', '2021-10-12', 31500, 'Paid');

-- --------------------------------------------------------

--
-- Structure de la table `room_type`
--

DROP TABLE IF EXISTS `room_type`;
CREATE TABLE IF NOT EXISTS `room_type` (
  `RoomTypeId` bigint(10) NOT NULL AUTO_INCREMENT,
  `RoomType` varchar(30) NOT NULL,
  `RoomImage` text NOT NULL,
  `Description` text NOT NULL,
  `Cost` double NOT NULL,
  `Status` enum('active','in-active') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`RoomTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `room_type`
--

INSERT INTO `room_type` (`RoomTypeId`, `RoomType`, `RoomImage`, `Description`, `Cost`, `Status`) VALUES
(11, 'Chambre Deluxe avec lit ', 'ornmd-guestroom-5286-hor-clsc.webp', ' Chambre, 1 lit(s) queen, vue ville, Balcon', 1200, 'active'),
(12, 'Chambre Deluxe ', 'ornmd-deluxe-twinbed-1781-hor-clsc.webp', '   Chambre, 2 lit(s) simple(s), vue ville, Balcon', 1800, 'active'),
(13, 'Chambre Premium ', 'ornmd-guestroom-5286-hor-clsc.webp', ' Chambre, 1 lit(s) queen', 2000, 'active'),
(14, 'Chambre Premium Ã  deux lits', 'ornmd-guestroom-5285-hor-clsc.webp', 'Chambre, 2 lit(s) simple(s)\r\n\r\n', 1750, 'active'),
(15, 'Chambre Club avec lit queen', 'ornmd-guestroom-5286-hor-clsc.webp', ' Ã‰tage du salon Club, Chambre, 1 lit(s) queen', 1680, 'active'),
(16, 'Chambre Club avec lits simples', '2 lit(s) simple(s).webp', 'Ã‰tage du salon Club, Chambre, 2 lit(s) simple(s)', 1900, 'active'),
(17, 'Suite Deluxe', 'suite.webp', 'Suite Junior, 1 lit king, Balcon', 3500, 'active'),
(18, 'Suite Premium', 'ornmd-suite-5284-hor-clsc.webp', 'Ã‰tage du salon Executive, Suite Executive, 1 lit king, Balcon', 3500, 'active'),
(19, 'Suite du club', 'ornmd-suite-5284-hor-clsc.webp', 'Ã‰tage du salon Club, Suite plus spacieuse, 1 lit king', 3400, 'active'),
(20, 'Ã‰tage du salon Club', 'ornmd-suite-5284-hor-clsc.webp', 'Suite PrÃ©sidentielle, 2 lit king', 3600, 'active');

-- --------------------------------------------------------

--
-- Structure de la table `users_details`
--

DROP TABLE IF EXISTS `users_details`;
CREATE TABLE IF NOT EXISTS `users_details` (
  `UserId` bigint(10) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` text NOT NULL,
  `Password` varchar(64) NOT NULL,
  `ContactNo` varchar(50) NOT NULL,
  `Gender` varchar(50) NOT NULL,
  `ProfileImage` text NOT NULL DEFAULT 'user.png',
  `Status` enum('active','in-active') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users_details`
--

INSERT INTO `users_details` (`UserId`, `FirstName`, `LastName`, `Email`, `Password`, `ContactNo`, `Gender`, `ProfileImage`, `Status`) VALUES
(2, 'admin', 'kumar', 'admin@gmail.com', '123', '9656859685', 'male', '1.jpg', 'in-active'),
(5, 'Rajesh', 'K S', 'raju@gmail.com', '123', '9636636363', 'male', '2.jpeg', 'active'),
(9, 'guvi', 'wew', 'guvi@gmail.com', '123', '9636636363', 'female', '2.jpeg', 'in-active'),
(11, 'kamesh', 'K S', 'kamesh@gmail.com', '123', '9636636363', 'male', 'images.jpg', 'active'),
(15, 'Rakesh', 'Balu', 'rakesh@gmail.com', '1234', '8563526352', 'female', '4.jpg', 'active'),
(16, 'jihene', 'ben', 'jihaneben345@gmail.com', '123', '9658968555', 'female', 'sheraton.png', 'active');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `event_booking`
--
ALTER TABLE `event_booking`
  ADD CONSTRAINT `FK_EventBooking` FOREIGN KEY (`EventId`) REFERENCES `event_list` (`EventId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_UserBooking` FOREIGN KEY (`User_id`) REFERENCES `users_details` (`UserId`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `event_list`
--
ALTER TABLE `event_list`
  ADD CONSTRAINT `FK_EventType` FOREIGN KEY (`EventTypeId`) REFERENCES `event_type` (`EventTypeId`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `event_payment`
--
ALTER TABLE `event_payment`
  ADD CONSTRAINT `FK_EventPayment` FOREIGN KEY (`BookingId`) REFERENCES `event_booking` (`BookingId`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `room_booking`
--
ALTER TABLE `room_booking`
  ADD CONSTRAINT `FK_RoomBooking` FOREIGN KEY (`RoomId`) REFERENCES `room_list` (`RoomId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_User` FOREIGN KEY (`User_id`) REFERENCES `users_details` (`UserId`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `room_list`
--
ALTER TABLE `room_list`
  ADD CONSTRAINT `FK_RoomType` FOREIGN KEY (`RoomTypeId`) REFERENCES `room_type` (`RoomTypeId`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `room_payment`
--
ALTER TABLE `room_payment`
  ADD CONSTRAINT `Fk_Booking` FOREIGN KEY (`BookingId`) REFERENCES `room_booking` (`BookingId`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
