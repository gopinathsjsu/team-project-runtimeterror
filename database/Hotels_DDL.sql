-- Database export via SQLPro (https://www.sqlprostudio.com/allapps.html)
-- Exported by rajat at 09-04-2022 13:49.
-- WARNING: This file may contain descructive statements such as DROPs.
-- Please ensure that you are running the script at the proper location.


-- BEGIN TABLE amenities
DROP TABLE IF EXISTS amenities;
CREATE TABLE `amenities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amenity_name` varchar(45) DEFAULT NULL,
  `amenity_code` varchar(5) DEFAULT NULL,
  `cost_multiplier` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Table amenities contains no data. No inserts have been genrated.
-- Inserting 0 rows into amenities


-- END TABLE amenities

-- BEGIN TABLE hotel_amenities_map
DROP TABLE IF EXISTS hotel_amenities_map;
CREATE TABLE `hotel_amenities_map` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotel_id` int DEFAULT NULL,
  `amenities_id` int DEFAULT NULL,
  `cost_multiplier` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Hotel_Id_FK_idx` (`hotel_id`),
  KEY `Amenities_Id_FK_idx` (`amenities_id`),
  CONSTRAINT `Hotel_Amenities_Map_Amenities_Id_FK` FOREIGN KEY (`amenities_id`) REFERENCES `amenities` (`id`),
  CONSTRAINT `Hotel_Amenities_Map_Hotel_Id_FK` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Table hotel_amenities_map contains no data. No inserts have been genrated.
-- Inserting 0 rows into hotel_amenities_map


-- END TABLE hotel_amenities_map

-- BEGIN TABLE hotels
DROP TABLE IF EXISTS hotels;
CREATE TABLE `hotels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotelName` varchar(100) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `stars` int DEFAULT NULL,
  `price` decimal(9,2) DEFAULT NULL,
  `cityName` varchar(45) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `countryCode` varchar(3) DEFAULT NULL,
  `countryName` varchar(45) DEFAULT NULL,
  `address` varchar(150) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `City` (`cityName`,`countryName`),
  KEY `Name` (`hotelName`)
) ENGINE=InnoDB AUTO_INCREMENT=277759 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Inserting 10 rows into hotels
-- Insert batch #1
INSERT INTO hotels (id, hotelName, stars, price, cityName, countryCode, countryName, address, location, url, latitude, longitude) VALUES
(231466, 'Kona Village Resort Kailua Kona', 4, 321, 'Kailua Kona', 'US', 'United States', 'Queen Kaahumanu Highway', 'Kailua Kona Hawaii United States', 'http://konavillage.com/', '19.7426', '-156.01'),
(231467, 'Aarons Cottage', 2, 112, 'Hilo', 'US', 'United States', '54 Keokea Loop Road', 'Hilo Hawaii United States', '', '19.7351', '-155.042'),
(231468, 'Aloha Crater Lodge', 3, 294, 'Volcano', 'US', 'United States', '11-3966 Lanihuli Rd P.O.Box 92', 'Volcano Hawaii United States', '', '19.4301', '-155.227'),
(231469, 'Aloha Place', 3, 153, 'Volcano', 'US', 'United States', '19-3820 Old Volcano Road', 'Volcano Hawaii United States', 'http://www.alohaplace.com/whyvisit.htm', '19.4363', '-155.224'),
(231470, 'Artist Cottage at Volcano Garden Arts', 4, 154, 'Volcano', 'US', 'United States', '19-3834 Old Volcano Road', 'Volcano Hawaii United States', 'http://www.vacationhomerentals.com/vacation-rentals/Volcano-Hawaii-vacation-rental-cottage-proID-36949.html', '19.436', '-155.224'),
(231471, 'Aston Kona by the Sea', 4, 135, 'Kailua Kona', 'US', 'United States', '75-6106 Alii Drive', 'Kailua Kona Hawaii United States', 'http://www.kona-by-the-sea.com/', '19.6148', '-155.983'),
(231472, 'Aston Shores at Waikoloa', 4, 309, 'Puako', 'US', 'United States', '69-1035 Keana Place', 'Puako Hawaii United States', '', '19.9228', '-155.884'),
(231473, 'Aston Waikoloa Colony Villas', 5, 95, 'Waikoloa Village', 'US', 'United States', '69-555 Waikoloa Beach Drive', 'Waikoloa Village Hawaii United States', '', '19.9224', '-155.876'),
(231474, 'At the Craters Edge', 4, 258, 'Volcano', 'US', 'United States', '11-3802 12th Street', 'Volcano Hawaii United States', '', '19.4249', '-155.214'),
(231475, 'At the End of the Road Bed & Breakfast', 2, 270, 'Volcano', 'US', 'United States', '19-4364 Haunani P.O. Box 995', 'Volcano Hawaii United States', 'http://www.houseattheendoftheroad.com/html/home.php', '19.4506', '-155.247');

-- END TABLE hotels

-- BEGIN TABLE room_type
DROP TABLE IF EXISTS room_type;
CREATE TABLE `room_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `short_code` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Inserting 4 rows into room_type
-- Insert batch #1
INSERT INTO room_type (id, name, short_code) VALUES
(1, 'Double', 'DBL'),
(2, 'Single Room', 'SIG'),
(3, 'King Room', 'KNG'),
(4, 'Queen', 'QN');

-- END TABLE room_type

-- BEGIN TABLE rooms
DROP TABLE IF EXISTS rooms;
CREATE TABLE `rooms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `room_type_id` int NOT NULL,
  `hotel_id` int NOT NULL,
  `price` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_room_type_id` (`room_type_id`),
  KEY `fk_hotel_id` (`hotel_id`),
  CONSTRAINT `fk_hotel_id` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`),
  CONSTRAINT `fk_room_type_id` FOREIGN KEY (`room_type_id`) REFERENCES `room_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Inserting 36 rows into rooms
-- Insert batch #1
INSERT INTO rooms (id, room_type_id, hotel_id, price) VALUES
(6, 4, 231466, 130),
(7, 3, 231466, 120),
(8, 2, 231466, 110),
(9, 1, 231466, 100),
(10, 4, 231467, 130),
(11, 3, 231467, 120),
(12, 2, 231467, 110),
(34, 4, 231469, 130),
(35, 3, 231469, 120),
(36, 2, 231469, 110),
(37, 1, 231469, 100),
(38, 4, 231470, 130),
(39, 3, 231470, 120),
(40, 2, 231470, 110),
(41, 1, 231470, 100),
(42, 4, 231471, 130),
(43, 3, 231471, 120),
(44, 2, 231471, 110),
(45, 1, 231471, 100),
(46, 4, 231472, 130),
(47, 3, 231472, 120),
(48, 2, 231472, 110),
(49, 1, 231472, 100),
(50, 4, 231473, 130),
(51, 3, 231473, 120),
(52, 2, 231473, 110),
(53, 1, 231473, 100),
(54, 4, 231474, 130),
(55, 3, 231474, 120),
(56, 2, 231474, 110),
(57, 1, 231474, 100),
(58, 4, 231475, 130),
(59, 3, 231475, 120),
(60, 2, 231475, 110),
(61, 1, 231475, 100),
(62, 1, 231467, 100);

-- END TABLE rooms
