CREATE TABLE `amenities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amenity_name` varchar(45) DEFAULT NULL,
  `amenity_code` varchar(5) DEFAULT NULL,
  `cost_multiplier` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=231466 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `pricing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `strategy_name` varchar(45) NOT NULL,
  `strategy_code` varchar(3) NOT NULL,
  `cost_multiplier` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rooms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `room_name` varchar(45) DEFAULT NULL,
  `room_code` varchar(3) DEFAULT NULL,
  `price_multiplier` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
