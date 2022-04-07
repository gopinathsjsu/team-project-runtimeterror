-- Database export via SQLPro (https://www.sqlprostudio.com/allapps.html)
-- Exported by rajat at 07-04-2022 16:48.
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

-- BEGIN TABLE hotel_pricing_map
DROP TABLE IF EXISTS hotel_pricing_map;
CREATE TABLE `hotel_pricing_map` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotel_id` int DEFAULT NULL,
  `pricing_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Hotel_Id_FK_idx` (`hotel_id`),
  KEY `Pricing_Id_FK_idx` (`pricing_id`),
  CONSTRAINT `Hotel_Pricing_Map_Hotel_Id_FK` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`),
  CONSTRAINT `Hotel_Pricing_Map_Pricing_Id_FK` FOREIGN KEY (`pricing_id`) REFERENCES `pricing` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Table hotel_pricing_map contains no data. No inserts have been genrated.
-- Inserting 0 rows into hotel_pricing_map


-- END TABLE hotel_pricing_map

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
