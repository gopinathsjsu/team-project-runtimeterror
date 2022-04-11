-- Database export via SQLPro (https://www.sqlprostudio.com/allapps.html)
-- Exported by rajat at 10-04-2022 21:31.
-- WARNING: This file may contain descructive statements such as DROPs.
-- Please ensure that you are running the script at the proper location.


-- BEGIN TABLE amenities
DROP TABLE IF EXISTS amenities;
CREATE TABLE `amenities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amenity_name` varchar(45) DEFAULT NULL,
  `amenity_code` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Inserting 5 rows into amenities
-- Insert batch #1
INSERT INTO amenities (id, amenity_name, amenity_code) VALUES
(6, 'Breafast', 'CB'),
(7, 'Parking', 'PR'),
(8, 'Fitness Room', 'FR'),
(9, 'All Meals Included', 'AM'),
(10, 'Swimming Pool', 'SW');

-- END TABLE amenities

-- BEGIN TABLE booking
DROP TABLE IF EXISTS booking;
CREATE TABLE `booking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bookingDate` datetime DEFAULT NULL,
  `checkInDate` datetime DEFAULT NULL,
  `checkOutDate` datetime DEFAULT NULL,
  `guestCount` int DEFAULT NULL,
  `hotelId` int DEFAULT NULL,
  `roomId` int DEFAULT NULL,
  `roomTypeCode` varchar(255) DEFAULT NULL,
  `totalPrice` int DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_room_id` (`roomId`),
  KEY `fk_user_id` (`userId`),
  KEY `fk_hotel_id_booking` (`hotelId`),
  CONSTRAINT `fk_hotel_id_booking` FOREIGN KEY (`hotelId`) REFERENCES `hotels` (`id`),
  CONSTRAINT `fk_room_id` FOREIGN KEY (`roomId`) REFERENCES `rooms` (`id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`userId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Inserting 22 rows into booking
-- Insert batch #1
INSERT INTO booking (id, bookingDate, checkInDate, checkOutDate, guestCount, hotelId, roomId, roomTypeCode, totalPrice, userId) VALUES
(1, '2022-04-10 15:49:34', '2022-04-10 15:49:34', '2022-04-10 15:49:34', 6, 231466, 6, 'QN', 100, 1),
(2, '2022-04-10 15:49:34', '2022-04-10 15:49:34', '2022-04-10 15:49:34', 6, 231466, 6, 'QN', 100, 1),
(3, '2022-04-10 15:49:34', '2022-04-10 15:49:34', '2022-04-10 15:49:34', 6, 231466, 6, 'QN', 100, 1),
(4, '2022-04-10 15:49:34', '2022-04-10 15:49:34', '2022-04-10 15:49:34', 6, 231466, 6, 'QN', NULL, 1),
(5, '2022-04-10 15:49:34', '2022-04-10 15:49:34', '2022-04-10 15:49:34', 6, 231466, 7, 'QN', 100, 1),
(6, NULL, '2022-04-09 17:00:00', '2022-04-12 17:00:00', 6, 231466, 7, 'QN', NULL, 1),
(7, NULL, '2022-04-09 17:00:00', '2022-04-12 17:00:00', 6, 231466, 7, 'QN', NULL, 1),
(8, NULL, '2022-04-09 17:00:00', '2022-04-12 17:00:00', 6, 231466, 7, 'QN', NULL, 1),
(9, NULL, '2022-04-09 17:00:00', '2022-04-12 17:00:00', 6, 231466, 7, 'QN', NULL, 1),
(18, NULL, '2022-04-09 17:00:00', '2022-04-12 17:00:00', 6, 231466, 7, 'QN', NULL, 1),
(19, NULL, '2022-04-09 17:00:00', '2022-04-12 17:00:00', 6, 231466, 7, 'QN', NULL, 1),
(20, NULL, '2022-04-09 17:00:00', '2022-04-12 17:00:00', 6, 231466, 7, 'QN', NULL, 1),
(21, NULL, '2022-04-09 17:00:00', '2022-04-12 17:00:00', 6, 231466, 7, 'QN', NULL, 1),
(22, NULL, '2022-04-09 17:00:00', '2022-04-12 17:00:00', 6, 231466, 7, 'QN', NULL, 1),
(23, NULL, '2022-04-09 17:00:00', '2022-04-12 17:00:00', 6, 231466, 7, 'QN', NULL, 1),
(24, NULL, '2022-04-09 17:00:00', '2022-04-12 17:00:00', 6, 231466, 7, 'QN', NULL, 1),
(25, NULL, '2022-04-09 17:00:00', '2022-04-12 17:00:00', 6, 231466, 7, 'QN', NULL, 1),
(26, NULL, '2022-04-09 17:00:00', '2022-04-12 17:00:00', 6, 231466, 7, 'QN', NULL, 1),
(27, NULL, '2022-04-09 17:00:00', '2022-04-12 17:00:00', 6, 231466, 7, 'QN', NULL, 1),
(31, NULL, '2022-04-09 17:00:00', '2022-04-12 17:00:00', 6, 231466, 7, 'QN', NULL, 1),
(32, NULL, '2022-04-09 17:00:00', '2022-04-12 17:00:00', 6, 231466, 7, 'QN', NULL, 1),
(33, NULL, '2022-04-09 17:00:00', '2022-04-12 17:00:00', 6, 231466, 7, 'QN', NULL, 1);

-- END TABLE booking

-- BEGIN TABLE booking_hotel_amenities_map
DROP TABLE IF EXISTS booking_hotel_amenities_map;
CREATE TABLE `booking_hotel_amenities_map` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `booking_id` bigint DEFAULT NULL,
  `hotel_amenities_id` int DEFAULT NULL,
  `count` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_booking_amenities_booking_id` (`booking_id`),
  KEY `fk_hotel_amenities_id` (`hotel_amenities_id`),
  CONSTRAINT `fk_booking_amenities_booking_id` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`),
  CONSTRAINT `fk_hotel_amenities_id` FOREIGN KEY (`hotel_amenities_id`) REFERENCES `hotel_amenities_map` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Inserting 10 rows into booking_hotel_amenities_map
-- Insert batch #1
INSERT INTO booking_hotel_amenities_map (id, booking_id, hotel_amenities_id, count) VALUES
(9, NULL, 2, 1),
(10, NULL, 3, 2),
(11, NULL, 2, 1),
(12, NULL, 3, 2),
(13, 27, 2, 1),
(14, 27, 3, 2),
(15, NULL, 2, 1),
(16, NULL, 3, 2),
(17, 33, 2, 1),
(18, 33, 3, 2);

-- END TABLE booking_hotel_amenities_map

-- BEGIN TABLE hibernate_sequence
DROP TABLE IF EXISTS hibernate_sequence;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Inserting 1 row into hibernate_sequence
-- Insert batch #1
INSERT INTO hibernate_sequence (next_val) VALUES
(2);

-- END TABLE hibernate_sequence

-- BEGIN TABLE hotel_amenities_map
DROP TABLE IF EXISTS hotel_amenities_map;
CREATE TABLE `hotel_amenities_map` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotel_id` int DEFAULT NULL,
  `amenities_id` int DEFAULT NULL,
  `cost` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Hotel_Id_FK_idx` (`hotel_id`),
  KEY `Amenities_Id_FK_idx` (`amenities_id`),
  CONSTRAINT `Hotel_Amenities_Map_Amenities_Id_FK` FOREIGN KEY (`amenities_id`) REFERENCES `amenities` (`id`),
  CONSTRAINT `Hotel_Amenities_Map_Hotel_Id_FK` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Inserting 50 rows into hotel_amenities_map
-- Insert batch #1
INSERT INTO hotel_amenities_map (id, hotel_id, amenities_id, cost) VALUES
(1, 231466, 6, 20),
(2, 231466, 7, 25),
(3, 231466, 8, 28),
(4, 231466, 9, 23),
(5, 231466, 10, 10),
(6, 231467, 6, 20),
(7, 231467, 7, 25),
(8, 231467, 8, 28),
(9, 231467, 9, 23),
(10, 231467, 10, 10),
(11, 231468, 6, 20),
(12, 231468, 7, 25),
(13, 231468, 8, 28),
(14, 231468, 9, 23),
(15, 231468, 10, 10),
(16, 231469, 6, 20),
(17, 231469, 7, 25),
(18, 231469, 8, 28),
(19, 231469, 9, 23),
(20, 231469, 10, 10),
(21, 231470, 6, 20),
(22, 231470, 7, 25),
(23, 231470, 8, 28),
(24, 231470, 9, 23),
(25, 231470, 10, 10),
(26, 231471, 6, 20),
(27, 231471, 7, 25),
(28, 231471, 8, 28),
(29, 231471, 9, 23),
(30, 231471, 10, 10),
(31, 231472, 6, 20),
(32, 231472, 7, 25),
(33, 231472, 8, 28),
(34, 231472, 9, 23),
(35, 231472, 10, 10),
(36, 231473, 6, 20),
(37, 231473, 7, 25),
(38, 231473, 8, 28),
(39, 231473, 9, 23),
(40, 231473, 10, 10),
(41, 231474, 6, 20),
(42, 231474, 7, 25),
(43, 231474, 8, 28),
(44, 231474, 9, 23),
(45, 231474, 10, 10),
(46, 231475, 6, 20),
(47, 231475, 7, 25),
(48, 231475, 8, 28),
(49, 231475, 9, 23),
(50, 231475, 10, 10);

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

-- BEGIN TABLE roles
DROP TABLE IF EXISTS roles;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Inserting 3 rows into roles
-- Insert batch #1
INSERT INTO roles (id, name) VALUES
(1, 'ROLE_CUSTOMER'),
(2, 'ROLE_EMPLOYEE'),
(3, 'ROLE_ADMIN');

-- END TABLE roles

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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Inserting 40 rows into rooms
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
(62, 1, 231467, 100),
(63, 1, 231468, 190),
(64, 2, 231468, 190),
(65, 3, 231468, 190),
(66, 4, 231468, 190);

-- END TABLE rooms

-- BEGIN TABLE user_roles
DROP TABLE IF EXISTS user_roles;
CREATE TABLE `user_roles` (
  `user_id` bigint NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKh8ciramu9cc9q3qcqiv4ue8a6` (`role_id`),
  CONSTRAINT `FKh8ciramu9cc9q3qcqiv4ue8a6` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FKhfh9dx7w3ubf1co1vdev94g3f` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Inserting 1 row into user_roles
-- Insert batch #1
INSERT INTO user_roles (user_id, role_id) VALUES
(1, 1);

-- END TABLE user_roles

-- BEGIN TABLE users
DROP TABLE IF EXISTS users;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Inserting 1 row into users
-- Insert batch #1
INSERT INTO users (id, email, password, username) VALUES
(1, 'asd@mail.com', '$2a$10$m.ESegBCErlfQ9ZHnm/bHOgYZdcpnBVWbSOIaP2JjMw3RqYB2aQwu', 'qeqwe');

-- END TABLE users