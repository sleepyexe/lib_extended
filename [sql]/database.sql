-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for lib_extended
CREATE DATABASE IF NOT EXISTS `lib_extended` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `lib_extended`;

-- Dumping structure for table lib_extended.addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lib_extended.addon_account: ~8 rows (approximately)
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('bank_savings', 'Savings account', 0);
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('caution', 'caution', 0);
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_ambulance', 'EMS', 1);
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_banker', 'Bank', 1);
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_cardealer', 'Cardealer', 1);
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_mechanic', 'Mechanic', 1);
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_police', 'Police', 1);
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_taxi', 'Taxi', 1);

-- Dumping structure for table lib_extended.addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lib_extended.addon_account_data: ~8 rows (approximately)
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(1, 'society_cardealer', 0, NULL);
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(2, 'society_police', 0, NULL);
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(3, 'society_ambulance', 0, NULL);
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(4, 'society_mechanic', 0, NULL);
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(5, 'society_taxi', 0, NULL);
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(9, 'society_banker', 0, NULL);
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(10, 'caution', 0, 'char1:576e9f3b72dd45da2502ddf4c2c0ae25faec3cc6');
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(11, 'bank_savings', 0, 'char1:576e9f3b72dd45da2502ddf4c2c0ae25faec3cc6');

-- Dumping structure for table lib_extended.addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lib_extended.addon_inventory: ~5 rows (approximately)
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_ambulance', 'EMS', 1);
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_cardealer', 'Cardealer', 1);
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_mechanic', 'Mechanic', 1);
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_police', 'Police', 1);
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_taxi', 'Taxi', 1);

-- Dumping structure for table lib_extended.addon_inventory_items
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lib_extended.addon_inventory_items: ~0 rows (approximately)

-- Dumping structure for table lib_extended.banking
CREATE TABLE IF NOT EXISTS `banking` (
  `identifier` varchar(46) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `amount` int(64) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `balance` int(11) DEFAULT 0,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table lib_extended.banking: ~0 rows (approximately)

-- Dumping structure for table lib_extended.billing
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `sender` varchar(60) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(40) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lib_extended.billing: ~0 rows (approximately)

-- Dumping structure for table lib_extended.cardealer_vehicles
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lib_extended.cardealer_vehicles: ~0 rows (approximately)

-- Dumping structure for table lib_extended.datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lib_extended.datastore: ~9 rows (approximately)
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('property', 'Property', 0);
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('society_ambulance', 'EMS', 1);
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('society_mechanic', 'Mechanic', 1);
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('society_police', 'Police', 1);
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('society_taxi', 'Taxi', 1);
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('user_ears', 'Ears', 0);
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('user_glasses', 'Glasses', 0);
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('user_helmet', 'Helmet', 0);
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('user_mask', 'Mask', 0);

-- Dumping structure for table lib_extended.datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lib_extended.datastore_data: ~14 rows (approximately)
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(1, 'society_police', NULL, '{}');
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(2, 'society_ambulance', NULL, '{}');
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(3, 'society_mechanic', NULL, '{}');
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(4, 'society_taxi', NULL, '{}');
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(5, 'property', NULL, '{}');
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(6, 'property', NULL, '{}');
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(7, 'property', NULL, '{}');
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(8, 'property', NULL, '{}');
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(9, 'user_mask', 'char1:576e9f3b72dd45da2502ddf4c2c0ae25faec3cc6', '{}');
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(10, 'user_helmet', 'char1:576e9f3b72dd45da2502ddf4c2c0ae25faec3cc6', '{}');
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(11, 'user_glasses', 'char1:576e9f3b72dd45da2502ddf4c2c0ae25faec3cc6', '{}');
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(12, 'property', 'char1:576e9f3b72dd45da2502ddf4c2c0ae25faec3cc6', '{}');
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(13, 'user_ears', 'char1:576e9f3b72dd45da2502ddf4c2c0ae25faec3cc6', '{}');
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(14, 'property', NULL, '{}');

-- Dumping structure for table lib_extended.fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lib_extended.fine_types: ~52 rows (approximately)
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Misuse of a horn', 30, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(2, 'Illegally Crossing a continuous Line', 40, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(3, 'Driving on the wrong side of the road', 250, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(4, 'Illegal U-Turn', 250, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(5, 'Illegally Driving Off-road', 170, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(6, 'Refusing a Lawful Command', 30, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(7, 'Illegally Stopping a Vehicle', 150, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(8, 'Illegal Parking', 70, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(9, 'Failing to Yield to the right', 70, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(10, 'Failure to comply with Vehicle Information', 90, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(11, 'Failing to stop at a Stop Sign ', 105, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(12, 'Failing to stop at a Red Light', 130, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(13, 'Illegal Passing', 100, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(14, 'Driving an illegal Vehicle', 100, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(15, 'Driving without a License', 1500, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(16, 'Hit and Run', 800, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(17, 'Exceeding Speeds Over < 5 mph', 90, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(18, 'Exceeding Speeds Over 5-15 mph', 120, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(19, 'Exceeding Speeds Over 15-30 mph', 180, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(20, 'Exceeding Speeds Over > 30 mph', 300, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(21, 'Impeding traffic flow', 110, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(22, 'Public Intoxication', 90, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(23, 'Disorderly conduct', 90, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(24, 'Obstruction of Justice', 130, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(25, 'Insults towards Civilans', 75, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(26, 'Disrespecting of an LEO', 110, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(27, 'Verbal Threat towards a Civilan', 90, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(28, 'Verbal Threat towards an LEO', 150, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(29, 'Providing False Information', 250, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(30, 'Attempt of Corruption', 1500, 1);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(31, 'Brandishing a weapon in city Limits', 120, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(32, 'Brandishing a Lethal Weapon in city Limits', 300, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(33, 'No Firearms License', 600, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(34, 'Possession of an Illegal Weapon', 700, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(35, 'Possession of Burglary Tools', 300, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(36, 'Grand Theft Auto', 1800, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(37, 'Intent to Sell/Distrube of an illegal Substance', 1500, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(38, 'Frabrication of an Illegal Substance', 1500, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(39, 'Possession of an Illegal Substance ', 650, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(40, 'Kidnapping of a Civilan', 1500, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(41, 'Kidnapping of an LEO', 2000, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(42, 'Robbery', 650, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(43, 'Armed Robbery of a Store', 650, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(44, 'Armed Robbery of a Bank', 1500, 2);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(45, 'Assault on a Civilian', 2000, 3);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(46, 'Assault of an LEO', 2500, 3);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(47, 'Attempt of Murder of a Civilian', 3000, 3);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(48, 'Attempt of Murder of an LEO', 5000, 3);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(49, 'Murder of a Civilian', 10000, 3);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(50, 'Murder of an LEO', 30000, 3);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(51, 'Involuntary manslaughter', 1800, 3);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(52, 'Fraud', 2000, 2);

-- Dumping structure for table lib_extended.items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lib_extended.items: ~33 rows (approximately)
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('alive_chicken', 'Living chicken', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('bandage', 'Bandage', 2, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('blowpipe', 'Blowtorch', 2, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('bread', 'Bread', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('cannabis', 'Cannabis', 3, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('carokit', 'Body Kit', 3, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('carotool', 'Tools', 2, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('clothe', 'Cloth', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('copper', 'Copper', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('cutted_wood', 'Cut wood', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('diamond', 'Diamond', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('essence', 'Gas', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('fabric', 'Fabric', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('fish', 'Fish', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('fixkit', 'Repair Kit', 3, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('fixtool', 'Repair Tools', 2, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('gazbottle', 'Gas Bottle', 2, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('gold', 'Gold', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('iron', 'Iron', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('marijuana', 'Marijuana', 2, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('medikit', 'Medikit', 2, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('packaged_chicken', 'Chicken fillet', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('packaged_plank', 'Packaged wood', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('petrol', 'Oil', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('petrol_raffin', 'Processed oil', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('phone', 'Phone', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('radio', 'Radio', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('slaughtered_chicken', 'Slaughtered chicken', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('stone', 'Stone', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('washed_stone', 'Washed stone', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('water', 'Water', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('wood', 'Wood', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('wool', 'Wool', 1, 0, 1);

-- Dumping structure for table lib_extended.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lib_extended.jobs: ~14 rows (approximately)
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('ambulance', 'EMS', 0);
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('banker', 'Banker', 0);
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('cardealer', 'Cardealer', 0);
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('fisherman', 'Fisherman', 0);
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('fueler', 'Fueler', 0);
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('lumberjack', 'Lumberjack', 0);
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('mechanic', 'Mechanic', 0);
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('miner', 'Miner', 0);
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('police', 'LSPD', 0);
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('reporter', 'Reporter', 0);
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('slaughterer', 'Butcher', 0);
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('tailor', 'Tailor', 0);
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('taxi', 'Taxi', 0);
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('unemployed', 'Unemployed', 0);

-- Dumping structure for table lib_extended.job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lib_extended.job_grades: ~36 rows (approximately)
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'Unemployed', 200, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(2, 'police', 0, 'recruit', 'Recruit', 20, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(3, 'police', 1, 'officer', 'Officer', 40, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(4, 'police', 2, 'sergeant', 'Sergeant', 60, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(5, 'police', 3, 'lieutenant', 'Lieutenant', 85, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(6, 'police', 4, 'boss', 'Captain', 100, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(11, 'cardealer', 0, 'recruit', 'Recruit', 10, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(12, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(13, 'cardealer', 2, 'experienced', 'Experienced', 40, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(14, 'cardealer', 3, 'boss', 'Boss', 0, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(15, 'lumberjack', 0, 'employee', 'Employee', 0, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(16, 'fisherman', 0, 'employee', 'Employee', 0, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(17, 'fueler', 0, 'employee', 'Employee', 0, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(18, 'reporter', 0, 'employee', 'Employee', 0, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(19, 'tailor', 0, 'employee', 'Employee', 0, '{"mask_1":0,"arms":1,"glasses_1":0,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":0,"torso_1":24,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":0,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":36,"tshirt_2":0,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":48,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}', '{"mask_1":0,"arms":5,"glasses_1":5,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":1,"torso_1":52,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":1,"lipstick_2":0,"chain_1":0,"tshirt_1":23,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":42,"tshirt_2":4,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":36,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(20, 'miner', 0, 'employee', 'Employee', 0, '{"tshirt_2":1,"ears_1":8,"glasses_1":15,"torso_2":0,"ears_2":2,"glasses_2":3,"shoes_2":1,"pants_1":75,"shoes_1":51,"bags_1":0,"helmet_2":0,"pants_2":7,"torso_1":71,"tshirt_1":59,"arms":2,"bags_2":0,"helmet_1":0}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(21, 'slaughterer', 0, 'employee', 'Employee', 0, '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":67,"pants_1":36,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":0,"torso_1":56,"beard_2":6,"shoes_1":12,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":15,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":0,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}', '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":72,"pants_1":45,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":1,"torso_1":49,"beard_2":6,"shoes_1":24,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":9,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":5,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(22, 'ambulance', 0, 'ambulance', 'Jr. EMT', 20, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(23, 'ambulance', 1, 'doctor', 'EMT', 40, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(24, 'ambulance', 2, 'chief_doctor', 'Sr. EMT', 60, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(25, 'ambulance', 3, 'boss', 'EMT Supervisor', 80, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(26, 'mechanic', 0, 'recrue', 'Recruit', 12, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(27, 'mechanic', 1, 'novice', 'Novice', 24, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(28, 'mechanic', 2, 'experimente', 'Experienced', 36, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(29, 'mechanic', 3, 'chief', 'Leader', 48, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(30, 'mechanic', 4, 'boss', 'Boss', 0, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(31, 'taxi', 0, 'recrue', 'Recruit', 12, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(32, 'taxi', 1, 'novice', 'Cabby', 24, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(33, 'taxi', 2, 'experimente', 'Experienced', 36, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(34, 'taxi', 3, 'uber', 'Uber Cabby', 48, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(35, 'taxi', 4, 'boss', 'Lead Cabby', 0, '{"hair_2":0,"hair_color_2":0,"torso_1":29,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":1,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":4,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(36, 'banker', 0, 'advisor', 'Consultant', 10, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(37, 'banker', 1, 'banker', 'Banker', 20, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(38, 'banker', 2, 'business_banker', 'Investment banker', 30, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(39, 'banker', 3, 'trader', 'Broker', 40, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(40, 'banker', 4, 'boss', 'Boss', 0, '{}', '{}');

-- Dumping structure for table lib_extended.licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lib_extended.licenses: ~7 rows (approximately)
INSERT INTO `licenses` (`type`, `label`) VALUES
	('boat', 'Boat License');
INSERT INTO `licenses` (`type`, `label`) VALUES
	('dmv', 'Driving Permit');
INSERT INTO `licenses` (`type`, `label`) VALUES
	('drive', 'Drivers License');
INSERT INTO `licenses` (`type`, `label`) VALUES
	('drive_bike', 'Motorcycle License');
INSERT INTO `licenses` (`type`, `label`) VALUES
	('drive_truck', 'Commercial Drivers License');
INSERT INTO `licenses` (`type`, `label`) VALUES
	('weapon', 'Weapon License');
INSERT INTO `licenses` (`type`, `label`) VALUES
	('weed_processing', 'Weed Processing License');

-- Dumping structure for table lib_extended.multicharacter_slots
CREATE TABLE IF NOT EXISTS `multicharacter_slots` (
  `identifier` varchar(46) NOT NULL,
  `slots` int(11) NOT NULL,
  PRIMARY KEY (`identifier`) USING BTREE,
  KEY `slots` (`slots`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lib_extended.multicharacter_slots: ~0 rows (approximately)

-- Dumping structure for table lib_extended.owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(46) DEFAULT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) DEFAULT NULL,
  `stored` tinyint(4) NOT NULL DEFAULT 0,
  `parking` varchar(60) DEFAULT NULL,
  `pound` varchar(60) DEFAULT NULL,
  `mileage` float DEFAULT 0,
  `glovebox` longtext DEFAULT NULL,
  `trunk` longtext DEFAULT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lib_extended.owned_vehicles: ~0 rows (approximately)

-- Dumping structure for table lib_extended.ox_inventory
CREATE TABLE IF NOT EXISTS `ox_inventory` (
  `owner` varchar(46) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `data` longtext DEFAULT NULL,
  `lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `owner` (`owner`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lib_extended.ox_inventory: ~0 rows (approximately)

-- Dumping structure for table lib_extended.player_outfits
CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL DEFAULT '0',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid_outfitname_model` (`citizenid`,`outfitname`,`model`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table lib_extended.player_outfits: ~0 rows (approximately)

-- Dumping structure for table lib_extended.player_outfit_codes
CREATE TABLE IF NOT EXISTS `player_outfit_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `outfitid` int(11) NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK_player_outfit_codes_player_outfits` (`outfitid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table lib_extended.player_outfit_codes: ~0 rows (approximately)

-- Dumping structure for table lib_extended.rented_vehicles
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lib_extended.rented_vehicles: ~0 rows (approximately)

-- Dumping structure for table lib_extended.society_moneywash
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lib_extended.society_moneywash: ~0 rows (approximately)

-- Dumping structure for table lib_extended.users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(46) NOT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `metadata` longtext DEFAULT NULL,
  `position` longtext DEFAULT NULL,
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disabled` tinyint(1) DEFAULT 0,
  `last_property` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `last_seen` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `phone_number` varchar(20) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lib_extended.users: ~0 rows (approximately)

-- Dumping structure for table lib_extended.user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lib_extended.user_licenses: ~0 rows (approximately)

-- Dumping structure for table lib_extended.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lib_extended.vehicles: ~240 rows (approximately)
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Adder', 'adder', 900000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Akuma', 'AKUMA', 7500, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Alpha', 'alpha', 60000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Ardent', 'ardent', 1150000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Asea', 'asea', 5500, 'sedans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Autarch', 'autarch', 1955000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Avarus', 'avarus', 18000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Bagger', 'bagger', 13500, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Baller', 'baller2', 40000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Baller Sport', 'baller3', 60000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Banshee', 'banshee', 70000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Banshee 900R', 'banshee2', 255000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Bati 801', 'bati', 12000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Bati 801RR', 'bati2', 19000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Bestia GTS', 'bestiagts', 55000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('BF400', 'bf400', 6500, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Bf Injection', 'bfinjection', 16000, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Bifta', 'bifta', 12000, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Bison', 'bison', 45000, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Blade', 'blade', 15000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Blazer', 'blazer', 6500, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Blazer Sport', 'blazer4', 8500, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('blazer5', 'blazer5', 1755600, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Blista', 'blista', 8000, 'compacts');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('BMX (velo)', 'bmx', 160, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Bobcat XL', 'bobcatxl', 32000, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Brawler', 'brawler', 45000, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Brioso R/A', 'brioso', 18000, 'compacts');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Btype', 'btype', 62000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Btype Hotroad', 'btype2', 155000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Btype Luxe', 'btype3', 85000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Buccaneer', 'buccaneer', 18000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Buccaneer Rider', 'buccaneer2', 24000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Buffalo', 'buffalo', 12000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Buffalo S', 'buffalo2', 20000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Bullet', 'bullet', 90000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Burrito', 'burrito3', 19000, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Camper', 'camper', 42000, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Carbonizzare', 'carbonizzare', 75000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Carbon RS', 'carbonrs', 18000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Casco', 'casco', 30000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Cavalcade', 'cavalcade2', 55000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Cheetah', 'cheetah', 375000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Chimera', 'chimera', 38000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Chino', 'chino', 15000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Chino Luxe', 'chino2', 19000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Cliffhanger', 'cliffhanger', 9500, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Cognoscenti', 'cognoscenti', 55000, 'sedans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Comet', 'comet2', 65000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Comet 5', 'comet5', 1145000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Contender', 'contender', 70000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Coquette', 'coquette', 65000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Coquette Classic', 'coquette2', 40000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Coquette BlackFin', 'coquette3', 55000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Cruiser (velo)', 'cruiser', 510, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Cyclone', 'cyclone', 1890000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Daemon', 'daemon', 11500, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Daemon High', 'daemon2', 13500, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Defiler', 'defiler', 9800, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Deluxo', 'deluxo', 4721500, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Dominator', 'dominator', 35000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Double T', 'double', 28000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Dubsta', 'dubsta', 45000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Dubsta Luxuary', 'dubsta2', 60000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Bubsta 6x6', 'dubsta3', 120000, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Dukes', 'dukes', 28000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Dune Buggy', 'dune', 8000, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Elegy', 'elegy2', 38500, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Emperor', 'emperor', 8500, 'sedans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Enduro', 'enduro', 5500, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Entity XF', 'entityxf', 425000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Esskey', 'esskey', 4200, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Exemplar', 'exemplar', 32000, 'coupes');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('F620', 'f620', 40000, 'coupes');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Faction', 'faction', 20000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Faction Rider', 'faction2', 30000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Faction XL', 'faction3', 40000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Faggio', 'faggio', 1900, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Vespa', 'faggio2', 2800, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Felon', 'felon', 42000, 'coupes');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Felon GT', 'felon2', 55000, 'coupes');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Feltzer', 'feltzer2', 55000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Stirling GT', 'feltzer3', 65000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Fixter (velo)', 'fixter', 225, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('FMJ', 'fmj', 185000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Fhantom', 'fq2', 17000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Fugitive', 'fugitive', 12000, 'sedans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Furore GT', 'furoregt', 45000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Fusilade', 'fusilade', 40000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Gargoyle', 'gargoyle', 16500, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Gauntlet', 'gauntlet', 30000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Gang Burrito', 'gburrito', 45000, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Burrito', 'gburrito2', 29000, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Glendale', 'glendale', 6500, 'sedans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Grabger', 'granger', 50000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Gresley', 'gresley', 47500, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('GT 500', 'gt500', 785000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Guardian', 'guardian', 45000, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Hakuchou', 'hakuchou', 31000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Hermes', 'hermes', 535000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Hexer', 'hexer', 12000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Hotknife', 'hotknife', 125000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Huntley S', 'huntley', 40000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Hustler', 'hustler', 625000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Infernus', 'infernus', 180000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Innovation', 'innovation', 23500, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Intruder', 'intruder', 7500, 'sedans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Issi', 'issi2', 10000, 'compacts');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Jackal', 'jackal', 38000, 'coupes');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Jester', 'jester', 65000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Jester(Racecar)', 'jester2', 135000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Journey', 'journey', 6500, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Kamacho', 'kamacho', 345000, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Khamelion', 'khamelion', 38000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Kuruma', 'kuruma', 30000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Landstalker', 'landstalker', 35000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('RE-7B', 'le7b', 325000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Lynx', 'lynx', 40000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Mamba', 'mamba', 70000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Manana', 'manana', 12800, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Manchez', 'manchez', 5300, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Massacro', 'massacro', 65000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Massacro(Racecar)', 'massacro2', 130000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Mesa', 'mesa', 16000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Mesa Trail', 'mesa3', 40000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Minivan', 'minivan', 13000, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Monroe', 'monroe', 55000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('The Liberator', 'monster', 210000, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Moonbeam', 'moonbeam', 18000, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Moonbeam Rider', 'moonbeam2', 35000, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Nemesis', 'nemesis', 5800, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Neon', 'neon', 1500000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Nightblade', 'nightblade', 35000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Nightshade', 'nightshade', 65000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('9F', 'ninef', 65000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('9F Cabrio', 'ninef2', 80000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Omnis', 'omnis', 35000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Oppressor', 'oppressor', 3524500, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Oracle XS', 'oracle2', 35000, 'coupes');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Osiris', 'osiris', 160000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Panto', 'panto', 10000, 'compacts');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Paradise', 'paradise', 19000, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Pariah', 'pariah', 1420000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Patriot', 'patriot', 55000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('PCJ-600', 'pcj', 6200, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Penumbra', 'penumbra', 28000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Pfister', 'pfister811', 85000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Phoenix', 'phoenix', 12500, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Picador', 'picador', 18000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Pigalle', 'pigalle', 20000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Prairie', 'prairie', 12000, 'compacts');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Premier', 'premier', 8000, 'sedans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Primo Custom', 'primo2', 14000, 'sedans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('X80 Proto', 'prototipo', 2500000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Radius', 'radi', 29000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('raiden', 'raiden', 1375000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Rapid GT', 'rapidgt', 35000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Rapid GT Convertible', 'rapidgt2', 45000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Reaper', 'reaper', 150000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Rebel', 'rebel2', 35000, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Regina', 'regina', 5000, 'sedans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Retinue', 'retinue', 615000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Revolter', 'revolter', 1610000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('riata', 'riata', 380000, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Rocoto', 'rocoto', 45000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Ruffian', 'ruffian', 6800, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Ruiner 2', 'ruiner2', 5745600, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Rumpo', 'rumpo', 15000, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Rumpo Trail', 'rumpo3', 19500, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Sabre Turbo', 'sabregt', 20000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Sabre GT', 'sabregt2', 25000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Sanchez', 'sanchez', 5300, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Sanchez Sport', 'sanchez2', 5300, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Sanctus', 'sanctus', 25000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Sandking', 'sandking', 55000, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Savestra', 'savestra', 990000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('SC 1', 'sc1', 1603000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Schafter', 'schafter2', 25000, 'sedans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Schafter V12', 'schafter3', 50000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Scorcher (velo)', 'scorcher', 280, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Seminole', 'seminole', 25000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Sentinel', 'sentinel', 32000, 'coupes');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Sentinel XS', 'sentinel2', 40000, 'coupes');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Sentinel3', 'sentinel3', 650000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Seven 70', 'seven70', 39500, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('ETR1', 'sheava', 220000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Shotaro Concept', 'shotaro', 320000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Slam Van', 'slamvan3', 11500, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Sovereign', 'sovereign', 22000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Stinger', 'stinger', 80000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Stinger GT', 'stingergt', 75000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Streiter', 'streiter', 500000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Stretch', 'stretch', 90000, 'sedans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Stromberg', 'stromberg', 3185350, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Sultan', 'sultan', 15000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Sultan RS', 'sultanrs', 65000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Super Diamond', 'superd', 130000, 'sedans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Surano', 'surano', 50000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Surfer', 'surfer', 12000, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('T20', 't20', 300000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Tailgater', 'tailgater', 30000, 'sedans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Tampa', 'tampa', 16000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Drift Tampa', 'tampa2', 80000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Thrust', 'thrust', 24000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Tri bike (velo)', 'tribike3', 520, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Trophy Truck', 'trophytruck', 60000, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Tropos', 'tropos', 40000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Turismo R', 'turismor', 350000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Tyrus', 'tyrus', 600000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Vacca', 'vacca', 120000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Vader', 'vader', 7200, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Verlierer', 'verlierer2', 70000, 'sports');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Vigero', 'vigero', 12500, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Virgo', 'virgo', 14000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Viseris', 'viseris', 875000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Visione', 'visione', 2250000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Voltic', 'voltic', 90000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Voltic 2', 'voltic2', 3830400, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Voodoo', 'voodoo', 7200, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Vortex', 'vortex', 9800, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Warrener', 'warrener', 4000, 'sedans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Washington', 'washington', 9000, 'sedans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Windsor', 'windsor', 95000, 'coupes');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Windsor Drop', 'windsor2', 125000, 'coupes');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Woflsbane', 'wolfsbane', 9000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('XLS', 'xls', 32000, 'suvs');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Yosemite', 'yosemite', 485000, 'muscle');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Youga', 'youga', 10800, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Youga Luxuary', 'youga2', 14500, 'vans');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Z190', 'z190', 900000, 'sportsclassics');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Zentorno', 'zentorno', 1500000, 'super');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Zion', 'zion', 36000, 'coupes');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Zion Cabrio', 'zion2', 45000, 'coupes');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Zombie', 'zombiea', 9500, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Zombie Luxuary', 'zombieb', 12000, 'motorcycles');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Z-Type', 'ztype', 220000, 'sportsclassics');

-- Dumping structure for table lib_extended.vehicle_categories
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lib_extended.vehicle_categories: ~11 rows (approximately)
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('compacts', 'Compacts');
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('coupes', 'Coupés');
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('motorcycles', 'Motos');
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('muscle', 'Muscle');
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('offroad', 'Off Road');
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('sedans', 'Sedans');
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('sports', 'Sports');
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('sportsclassics', 'Sports Classics');
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('super', 'Super');
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('suvs', 'SUVs');
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('vans', 'Vans');

-- Dumping structure for table lib_extended.vehicle_sold
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lib_extended.vehicle_sold: ~0 rows (approximately)

-- Dumping structure for table lib_extended.whitelist
CREATE TABLE IF NOT EXISTS `whitelist` (
  `identifier` varchar(46) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lib_extended.whitelist: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
