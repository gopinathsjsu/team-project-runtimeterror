-- Database export via SQLPro (https://www.sqlprostudio.com/allapps.html)
-- Exported by rajat at 07-04-2022 22:36.
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

-- BEGIN TABLE hotel
DROP TABLE IF EXISTS hotel;
CREATE TABLE `hotel` (
  `id` int NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city_name` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `country_name` varchar(255) DEFAULT NULL,
  `hotel_name` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `stars` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Table hotel contains no data. No inserts have been genrated.
-- Inserting 0 rows into hotel


-- END TABLE hotel

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
  `city_name` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `country_name` varchar(255) DEFAULT NULL,
  `hotel_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `City` (`cityName`,`countryName`),
  KEY `Name` (`hotelName`)
) ENGINE=InnoDB AUTO_INCREMENT=277759 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Inserting 46 rows into hotels
-- Insert batch #1
INSERT INTO hotels (id, hotelName, stars, price, cityName, countryCode, countryName, address, location, url, latitude, longitude, city_name, country_code, country_name, hotel_name) VALUES
(231466, 'Kona Village Resort Kailua Kona', 4, 321, 'Kailua Kona', 'US', 'United States', 'Queen Kaahumanu Highway', 'Kailua Kona Hawaii United States', 'http://konavillage.com/', '19.7426', '-156.01', NULL, NULL, NULL, NULL),
(231467, 'Aarons Cottage', 2, 112, 'Hilo', 'US', 'United States', '54 Keokea Loop Road', 'Hilo Hawaii United States', '', '19.7351', '-155.042', NULL, NULL, NULL, NULL),
(231468, 'Aloha Crater Lodge', 3, 294, 'Volcano', 'US', 'United States', '11-3966 Lanihuli Rd P.O.Box 92', 'Volcano Hawaii United States', '', '19.4301', '-155.227', NULL, NULL, NULL, NULL),
(231469, 'Aloha Place', 3, 153, 'Volcano', 'US', 'United States', '19-3820 Old Volcano Road', 'Volcano Hawaii United States', 'http://www.alohaplace.com/whyvisit.htm', '19.4363', '-155.224', NULL, NULL, NULL, NULL),
(231470, 'Artist Cottage at Volcano Garden Arts', 4, 154, 'Volcano', 'US', 'United States', '19-3834 Old Volcano Road', 'Volcano Hawaii United States', 'http://www.vacationhomerentals.com/vacation-rentals/Volcano-Hawaii-vacation-rental-cottage-proID-36949.html', '19.436', '-155.224', NULL, NULL, NULL, NULL),
(231471, 'Aston Kona by the Sea', 4, 135, 'Kailua Kona', 'US', 'United States', '75-6106 Alii Drive', 'Kailua Kona Hawaii United States', 'http://www.kona-by-the-sea.com/', '19.6148', '-155.983', NULL, NULL, NULL, NULL),
(231472, 'Aston Shores at Waikoloa', 4, 309, 'Puako', 'US', 'United States', '69-1035 Keana Place', 'Puako Hawaii United States', '', '19.9228', '-155.884', NULL, NULL, NULL, NULL),
(231473, 'Aston Waikoloa Colony Villas', 5, 95, 'Waikoloa Village', 'US', 'United States', '69-555 Waikoloa Beach Drive', 'Waikoloa Village Hawaii United States', '', '19.9224', '-155.876', NULL, NULL, NULL, NULL),
(231474, 'At the Craters Edge', 4, 258, 'Volcano', 'US', 'United States', '11-3802 12th Street', 'Volcano Hawaii United States', '', '19.4249', '-155.214', NULL, NULL, NULL, NULL),
(231475, 'At the End of the Road Bed & Breakfast', 2, 270, 'Volcano', 'US', 'United States', '19-4364 Haunani P.O. Box 995', 'Volcano Hawaii United States', 'http://www.houseattheendoftheroad.com/html/home.php', '19.4506', '-155.247', NULL, NULL, NULL, NULL),
(231476, 'Bamboo Orchid Cottage Bed & Breakfast', 3, 287, 'Volcano', 'US', 'United States', '11-3903 10th Street', 'Volcano Hawaii United States', 'http://bambooorchidcottage.com/', '19.4224', '-155.221', NULL, NULL, NULL, NULL),
(231477, 'Castle Kona Reef', 3, 239, 'Kailua Kona', 'US', 'United States', '75-5888 Alii Drive', 'Kailua Kona Hawaii United States', 'http://www.castleresorts.com/Home/accommodations/kona-reef', '19.6302', '-155.988', NULL, NULL, NULL, NULL),
(231478, 'Crater Rim Cabin', 3, 206, 'Volcano', 'US', 'United States', '23 Golf Links Road', 'Volcano Hawaii United States', '', '19.4431', '-155.233', NULL, NULL, NULL, NULL),
(231479, 'Fairmont Orchid Hotel Kamuela', 4, 366, 'Kamuela', 'US', 'United States', 'One North Kaniku Drive', 'Kamuela Hawaii United States', 'http://www.fairmont.com/Orchid/', '19.9511', '-155.859', NULL, NULL, NULL, NULL),
(231480, 'Fairways Mauna Lani Resort Kamuela', 4, 183, 'Kamuela', 'US', 'United States', '58-1125 North Kaniku Drive', 'Kamuela Hawaii United States', 'http://www.maunalani.com/', '19.9477', '-155.857', NULL, NULL, NULL, NULL),
(231481, 'Forest House Bed and Breakfast', 2, 229, 'Mountain View (Hawaii)', 'US', 'United States', '18-1983 Rd 15', 'Mountain View (Hawaii) Hawaii United States', '', '19.5172', '-155.148', NULL, NULL, NULL, NULL),
(231482, 'Four Seasons Resort Hualalai at Historic Kaupulehu', 5, 339, 'Kailua Kona', 'US', 'United States', '72-100 Kaupulehu Drive', 'Kailua Kona Hawaii United States', 'http://www.fourseasons.com/hualalai/', '19.8281', '-155.992', NULL, NULL, NULL, NULL),
(231483, 'Halana Lodge', 3, 79, 'Volcano', 'US', 'United States', '19-4789 Amaumau Road', 'Volcano Hawaii United States', '', '19.478', '-155.269', NULL, NULL, NULL, NULL),
(231484, 'Hale Hoola B&B', 3, 371, 'Captain Cook', 'US', 'United States', '85-4577 Mamalahoa Hwy', 'Captain Cook Hawaii United States', 'http://www.hale-hoola.com/', '19.4002', '-155.881', NULL, NULL, NULL, NULL),
(231485, 'Halii Kai Resort Waikoloa', 4, 210, 'Waikoloa Village', 'US', 'United States', '69 1029 Nawahine Place', 'Waikoloa Village Hawaii United States', '', '19.931', '-155.887', NULL, NULL, NULL, NULL),
(231486, 'Hapuna Beach Prince Hotel', 4, 247, 'Kamuela', 'US', 'United States', '62-100 Kaunaoa Drive Kohala Coast Hi 96743', 'Kamuela Hawaii United States', '', '19.9973', '-155.814', NULL, NULL, NULL, NULL),
(231487, 'Haunani House', 4, 395, 'Volcano', 'US', 'United States', '8 Hale Ohia Road', 'Volcano Hawaii United States', '', '19.4271', '-155.234', NULL, NULL, NULL, NULL),
(231488, 'Hawaiian Oasis B&B', 2, 379, 'Kailua Kona', 'US', 'United States', '74-4958 Kiwi St', 'Kailua Kona Hawaii United States', 'http://www.hawaiianoasis.com/', '19.6774', '-155.984', NULL, NULL, NULL, NULL),
(231489, 'Hilltop Legacy', 3, 269, 'Hilo', 'US', 'United States', '57 Hina St.', 'Hilo Hawaii United States', '', '19.7178', '-155.097', NULL, NULL, NULL, NULL),
(231490, 'Hilo Hawaiian Hotel', 3, 158, 'Hilo', 'US', 'United States', '71 Banyan Drive', 'Hilo Hawaii United States', 'http://www.hilohawaiihotels.net/', '19.7283', '-155.067', NULL, NULL, NULL, NULL),
(231491, 'Hilo Seaside Hotel', 2, 122, 'Hilo', 'US', 'United States', '126 Banyan Drive', 'Hilo Hawaii United States', 'http://www.hilohawaiihotels.net/', '19.7238', '-155.063', NULL, NULL, NULL, NULL),
(231492, 'Hilton Grand Vacations Club at Waikoloa Beach Resort', 4, 348, 'Waikoloa Village', 'US', 'United States', '69-550 Waikoloa Beach Drive', 'Waikoloa Village Hawaii United States', 'http://www1.hilton.com/en_US/hi/index.do', '19.9224', '-155.876', NULL, NULL, NULL, NULL),
(231493, 'Hilton Waikoloa Village', 4, 262, 'Waikoloa Village', 'US', 'United States', '69-425 Waikoloa Beach Dr', 'Waikoloa Village Hawaii United States', 'http://www.hilton.co.uk/waikoloa', '19.9229', '-155.887', NULL, NULL, NULL, NULL),
(231494, 'Holua Resort at The Mauna Loa Village', 3, 168, 'Kahaluu-Keauhou', 'US', 'United States', '78-7190 Kaleiopapa Street', 'Kahaluu-Keauhou Hawaii United States', 'http://www.keauhouvillageshops.com/village-merchants/', '19.5584', '-155.961', NULL, NULL, NULL, NULL),
(231495, 'Honu Kai Bed & Breakfast Kailua Kona', 4, 170, 'Kailua Kona', 'US', 'United States', '74-1529 Hao Kuni Street', 'Kailua Kona Hawaii United States', 'http://honukai.com/', '19.6808', '-155.978', NULL, NULL, NULL, NULL),
(231496, 'Inn at Volcano', 2, 226, 'Volcano', 'US', 'United States', '19-4178 Wright Road', 'Volcano Hawaii United States', 'http://www.greatbedandbreakfast.com/breakfast/bnb-sale.php/id/193', '19.442', '-155.235', NULL, NULL, NULL, NULL),
(231497, 'Kaawa Loa Plantation Guesthouse and Retreat Captain Cook', 4, 254, 'Captain Cook', 'US', 'United States', '82-5990 Napoopoo Road PO Box 1280', 'Captain Cook Hawaii United States', 'http://www.kaawaloaplantation.com/', '19.4816', '-155.907', NULL, NULL, NULL, NULL),
(231498, 'Kapehu Retreat House', 5, 297, 'Pepeekeo', 'US', 'United States', '28-696 Kaupakuea Homestead Rd', 'Pepeekeo Hawaii United States', 'http://www.retreatfinder.com/Directory/United_States/HI_Hawaii.aspx', '19.8445', '-155.117', NULL, NULL, NULL, NULL),
(231499, 'Keaau Vacation Rental', 4, 143, 'Kurtistown', 'US', 'United States', '17-794 Ala loop', 'Kurtistown Hawaii United States', 'http://www.ownersrentals.com/search/NorthAmerica/United_States/Hawaii.html', '19.5728', '-155.073', NULL, NULL, NULL, NULL),
(231500, 'Keauhou Beach Resort', 3, 66, 'Kahaluu-Keauhou', 'US', 'United States', '78-6740 Alii Drive', 'Kahaluu-Keauhou Hawaii United States', '', '19.5777', '-155.968', NULL, NULL, NULL, NULL),
(231501, 'Kilauea Cottages Volcano', 2, 205, 'Volcano', 'US', 'United States', '11-3980 Lanihuli Rd.', 'Volcano Hawaii United States', 'http://volcano.oregonstate.edu/oldroot/volcanoes/kilauea/kilauea.html', '19.4291', '-155.22', NULL, NULL, NULL, NULL),
(231502, 'King Kamehamehas Kona Beach Hotel', 2, 394, 'Kailua Kona', 'US', 'United States', '75-5660 Palani Road', 'Kailua Kona Hawaii United States', 'http://www.konabeachhotel.com/', '19.6408', '-155.998', NULL, NULL, NULL, NULL),
(231503, 'Kings Land by Hilton Grand Vacations Club', 3, 108, 'Waikoloa Village', 'US', 'United States', '69-699 Waikoloa Beach Drive', 'Waikoloa Village Hawaii United States', 'http://www3.hilton.com/en/hotels/hawaii/kings-land-by-hilton-grand-vacations-club-KOAKLGV/maps-directions/index.html', '19.9103', '-155.883', NULL, NULL, NULL, NULL),
(231504, 'Kolea at Waikoloa Beach Resort', 5, 187, 'Waikoloa Village', 'US', 'United States', '69-1000 Waikoloa Beach Drive', 'Waikoloa Village Hawaii United States', 'http://www.classicvacations.com/hotels/hawaii/big-island/kohala-coast/kolea-waikoloa-beach-resort', '19.919', '-155.888', NULL, NULL, NULL, NULL),
(231505, 'Kona Bali Kai', 3, 84, 'Kailua Kona', 'US', 'United States', '76-6246 Alii Drive', 'Kailua Kona Hawaii United States', 'http://www.kailua-kona-rentals.com/oceanfront-at-kona-bali-kai-oceanfront-condo.php', '19.6077', '-155.976', NULL, NULL, NULL, NULL),
(231506, 'Kona Coast Resort', 4, 140, 'Kahaluu-Keauhou', 'US', 'United States', '78 6842 Alii Dr', 'Kahaluu-Keauhou Hawaii United States', '', '19.5709', '-155.964', NULL, NULL, NULL, NULL),
(231507, 'Kona Islander Inn', 2, 288, 'Kailua Kona', 'US', 'United States', '75-5776 Kuakini', 'Kailua Kona Hawaii United States', 'http://kailuakona.olx.com/kona-islander-inn-furnished-ocean-view-studio-only-100-fee-from-sandy-beach-iid-35672080', '19.6373', '-155.99', NULL, NULL, NULL, NULL),
(231508, 'Kona Magic Sands Resort Kailua Kona', 3, 221, 'Kailua Kona', 'US', 'United States', '77-6452 Alii Dr', 'Kailua Kona Hawaii United States', '', '19.595', '-155.972', NULL, NULL, NULL, NULL),
(231509, 'Kona Seaside Hotel', 2, 228, 'Kailua Kona', 'US', 'United States', '75-5646 Palani Road', 'Kailua Kona Hawaii United States', 'http://www.konabeachhotel.com/', '19.6446', '-155.995', NULL, NULL, NULL, NULL),
(231510, 'Lai Nani Resort', 5, 62, 'Hakalau', 'US', 'United States', '31-212 Hawaii Belt Road', 'Hakalau Hawaii United States', '', '19.9057', '-155.134', NULL, NULL, NULL, NULL),
(231511, 'Lilikoi Inn', 4, 112, 'Kailua Kona', 'US', 'United States', '755339 Mamalahoa Highway', 'Kailua Kona Hawaii United States', '', '19.6592', '-155.955', NULL, NULL, NULL, NULL);

-- END TABLE hotels

-- BEGIN TABLE pricing
DROP TABLE IF EXISTS pricing;
CREATE TABLE `pricing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `strategy_name` varchar(45) NOT NULL,
  `strategy_code` varchar(3) NOT NULL,
  `cost_multiplier` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Table pricing contains no data. No inserts have been genrated.
-- Inserting 0 rows into pricing


-- END TABLE pricing

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Inserting 4 rows into rooms
-- Insert batch #1
INSERT INTO rooms (id, room_type_id, hotel_id, price) VALUES
(6, 4, 231466, 130),
(7, 3, 231466, 120),
(8, 2, 231466, 110),
(9, 1, 231466, 100);

-- END TABLE rooms