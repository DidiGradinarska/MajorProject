-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 08, 2016 at 05:14 AM
-- Server version: 5.5.45-cll-lve
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bghotels`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE IF NOT EXISTS `booking` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_ref` varchar(100) NOT NULL COMMENT 'hashed reference number given to client',
  `hotel_name` varchar(100) NOT NULL COMMENT 'fk hotel',
  `username` varchar(50) NOT NULL COMMENT 'fk user',
  `date_in` date NOT NULL,
  `date_out` date NOT NULL,
  `number_room` int(11) NOT NULL,
  `booking_date` varchar(10) NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `booking_ibfk_1` (`hotel_name`),
  KEY `booking_ibfk_2` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=77 ;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `booking_ref`, `hotel_name`, `username`, `date_in`, `date_out`, `number_room`, `booking_date`) VALUES
(3, '', 'Hilton Sofia', 'dave', '2016-03-24', '2016-03-26', 2, '03/24/16'),
(39, '', 'Hotel Casa del Mare', 'didi', '2016-03-27', '2016-03-27', 7, '03/27/16'),
(40, '', 'Hilton Sofia', 'maria', '2016-03-14', '2016-03-21', 2, '03/28/16'),
(75, '28deb9f203e2cf66766fb2069c951e2e0680d63d', 'The Stream Resort', '', '2016-04-04', '2016-04-12', 3, '04/04/16'),
(76, 'dc9bcbf237c9ccded72d7c3d8da15f7bb32ac157', 'Lavanda Bed & Breakfast', '', '2016-04-06', '2016-04-08', 2, '04/06/16');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `message` varchar(1000) NOT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contact_id`, `name`, `email`, `phone_number`, `message`) VALUES
(1, 'Didi Gradinarska', 'didi_gradinarska@abv.bg', '078888898898', 'Can I enter my hotel?'),
(2, 'Test', 'test@gmail.com', '08882217463', 'I want to enter my shop'),
(3, 'didigradinarska', 'dtg1@aber.ac.uk', '0937376422', 'Testing the contact form'),
(4, 'didigradinarska', 'dtg1@aber.ac.uk', '0937376422', 'Test 2 db'),
(5, 'didigradinarska', 'dtg1@aber.ac.uk', '0937376422', 'Hi'),
(6, 'didigradinarska', 'dtg1@aber.ac.uk', '0937376422', 'Final test'),
(7, 'testa', 'dtg1@aber.ac.uk', '0937376422', 'WORKKKK');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT 'fk user',
  `hotel_name` varchar(100) NOT NULL COMMENT 'fk hotel',
  `feedback` varchar(1000) NOT NULL,
  `date` text NOT NULL,
  `booking_id` int(11) NOT NULL COMMENT 'fk booking',
  PRIMARY KEY (`feedback_id`),
  KEY `feedback` (`feedback`(767)),
  KEY `feedback_ibfk_1` (`username`),
  KEY `feedback_ibfk_2` (`hotel_name`),
  KEY `booking_id` (`booking_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `username`, `hotel_name`, `feedback`, `date`, `booking_id`) VALUES
(22, 'dave', 'Hilton Sofia', 'I did not like it', '03/28/16', 3),
(23, 'maria ', 'Hilton Sofia', 'I liked it so much I booked it 10 more times lol!', '03/28/16', 40),
(27, 'Didi', 'Hotel Casa del Mare', 'Iii liked it', '03/28/16', 39);

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE IF NOT EXISTS `hotel` (
  `hotel_name` varchar(100) NOT NULL,
  `location_name` varchar(60) NOT NULL COMMENT 'FK location',
  `latitude` varchar(50) NOT NULL,
  `longitude` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `hotel_type` enum('hotel','resort','b&b','guest house') NOT NULL,
  `stars` enum('1','2','3','4','5') NOT NULL,
  `price_range` enum('Budget','Midrange','Luxury') NOT NULL,
  `rooms` varchar(200) NOT NULL,
  `price` decimal(10,2) NOT NULL COMMENT 'currency',
  `hotel_image` varchar(100) NOT NULL,
  `hotel_description` varchar(2000) NOT NULL,
  `hotel_link` varchar(200) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  PRIMARY KEY (`hotel_name`),
  KEY `hotel_ibfk_1` (`location_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`hotel_name`, `location_name`, `latitude`, `longitude`, `address`, `hotel_type`, `stars`, `price_range`, `rooms`, `price`, `hotel_image`, `hotel_description`, `hotel_link`, `hotel_id`) VALUES
('Art Plaza Hotel', 'Sofia', '42.689416', '23.320439', 'ul. "Hristo Belchev" 46, 1000 Sofia, Bulgaria', 'hotel', '4', 'Midrange', '33', '40.00', 'artplaza.jpg', 'Overlooking the park of the Natsionalen dvorets na kulturata exhibition center, this posh hotel is a 2-minute walk from Bulevard Vitosha pedestrian street and a 13-minute walk from the Natsionalna Khudozhestvena Galeriya art museum.\r\n\r\nRefined rooms, suites and 1-bedroom apartments come with free Wi-Fi and flat-screen TVs. The rooms and suites have minibars. The apartments offer kitchens and park views. Some quarters feature terraces. Room service is available.\r\n\r\nBreakfast is complimentary. Other amenities include an upmarket restaurant, a hip lobby bar and a fitness center.', 'http://www.artplazahotel.bg/en/', 18),
('Boutique Hotel Tsarevets', 'Veliko Tarnovo', '43.080953', '25.6452958', 'ul. "Chitalishtna" 23, 5000 Veliko Tarnovo, Bulgaria', 'hotel', '3', 'Budget', '10', '28.00', 'tsarevets.jpg', 'In a building dating from 1891, this unfussy hotel with views of Sveta Gora park is an 8-minute walk from Sv 40 muchenitsi church and a 13-minute walk from Tsarevets fortress. \n\nRelaxed, traditionally decorated rooms come with complimentary Wi-Fi, flat-screen TVs, DVD players and minibars. Some offer park views. A suite has a whirlpool tub and a sitting area with leather sofas. Kids age 6 and under stay free.\n\nBuffet-style breakfast is offered in a down-to-earth dining area with wood floors. Laundry facilities are available for guest use.', 'http://www.hoteltsarevets.com/', 16),
('City Hotel Veliko Tarnovo', 'Veliko Tarnovo', '43.0809', '25.633409', 'ul. "Hristo Botev" 15, 5000 Veliko Tarnovo, Bulgaria', 'hotel', '2', 'Budget', '22', '24.00', 'cityhotel.jpg', 'Located in the centre of Veliko Turnovo and next to the University of Veliko Turnovo, City Hotel offers a restaurant, air-conditioned units and free WiFi in all areas.\n\nOffering views of the city, each stylishly decorated and with natural oak furniture unit features a flat-screen TV with cable channels, air conditioning and an electric kettle. Some units also have a minibar and other offer views of the Old Town.\n\nBreakfast is served in the restaurant on the first floor of City Hotel every morning. A vending machine is also at guests` disposal, as well as packed lunches. Special diet menus are at guests disposal upon request.\n\nA grocery store is situated at a distance of 100 yards from the property. Private parking is available at a location nearby at a surcharge. The Town Hall of Veliko Turnovo is next to the property', 'http://cityhotelvt.com/', 17),
('Festa Sofia Hotel', 'Sofia', '42.6598834', '23.2864784', 'bulevard "Bulgaria" 83, 1404 Sofia, Bulgaria', 'hotel', '4', 'Midrange', '120', '49.00', 'festa.jpg', 'Overlooking the Vitosha Mountains, this modern hotel is 4 km from the National Palace of Culture and 7 km from the Bulgarian National Bank. \r\n\r\nThe warm rooms feature complimentary Wi-Fi, minibars and flat-screen TVs, plus mountain or city views. Upgraded quarters add living rooms and dining areas. Kids 12 and under stay free.\r\n\r\nBreakfast is free. Amenities include 2 restaurants, a seasonal terrace and a chic bar. There''s also a gym, as well as a spa with a sauna, a steam bath and a Jacuzzi.', 'http://www.festa.bg/index.php?pid=29&lng=en', 19),
('Golden Tulip Varna', 'Varna', '43.2037848', '27.9052436', 'bul. Hristo Botev, 9000 Varna, Bulgaria', 'hotel', '4', 'Midrange', '90', '45.00', 'tulip.jpg', 'This modern, functional hotel is 14 minutes'' walk from both Varna train station and Varna Archaeological Museum, and 1.6 km from the nearest beach on Varna Bay. \r\n\r\nRelaxed rooms with streamlined decor offer free Wi-Fi and flat-screen TVs. Upgraded rooms add sitting areas and desks. Suites come with living rooms.\r\n\r\nAmenities include an airy, polished restaurant and a lively bar, plus a sauna and a fitness room. There''s a 5th-century Christian tomb in the lobby.', 'http://www.goldentulip.com/en/?utm_source=google&utm_medium=cpc&utm_campaign=Cadastra_BR&gclid=CL3p0IyO_csCFQ0SGwodS3YN8g', 21),
('Graffit Gallery Hotel', 'Varna', '43.2075746', '27.921841', 'Bul Knyaz Boris I 65, 9000 Varna, Bulgaria', 'hotel', '5', 'Luxury', '55', '45.00', 'graffit.jpg', 'This modern, upscale hotel is a 9-minute walk from Varna Archaeological Museum, a 12-minute walk from the Seaside Garden and 1.6 km from Central Railway Station Varna. \r\n\r\nThe polished rooms offer free Wi-Fi, smart TVs and minibars, as well as coffeemakers and designer toiletries. Upgraded rooms add panoramic views and balconies.\r\n\r\nParking is complimentary, as is breakfast, which is served in an elegant restaurant. Other amenities include a rooftop terrace and a trendy cafe, plus a spa, a fitness center and an indoor pool.', 'http://www.graffithotel.com/en', 11),
('Hilton Sofia', 'Sofia', '42.6831444', '23.3177813', 'Bulgaria Blvd., 1421 sofia, Bulgaria', 'hotel', '5', 'Luxury', '245', '85.00', 'hiltons.jpg', 'Looking on Vitosha mountain, this sophisticated business hotel is a 6-minute walk from a metro station and an 11-minute walk from the Natsionalniya dvorets na kulturata exhibition center.', 'http://www3.hilton.com/en/hotels/bulgaria/hilton-sofia-SOFHIHI/index.html?WT.mc_id=zELWAAA0EU1WW2PSH3Nano4DGBrandx&WT.srch=1&utm_source=AdWords&utm_medium=ppc&utm_campaign=paidsearch', 1),
('Hotel Acropolis', 'Varna', '43.199023', '27.9195646', 'ul. "Tsar Ivan Shishman" 13, 9000 Varna, Bulgaria', 'hotel', '2', 'Budget', '10', '27.00', 'acropolis.jpg', 'Only 50 yards from the sandy beach in Varna, this hotel offers air-conditioned accommodation and free Wi-Fi. Surrounded by a garden, it is minutes from the centre.\r\n\r\nFlat-screen TVs with cable channels are featured in all Acropolis rooms. Decorated in neutral tones, each is equipped with a seating area with a sofa and a modern bathroom with toiletries.\r\n\r\nGuests can enjoy a drink at the lobby bar or relax on the terrace. There are several restaurants close to Hotel Acropolis, offering a choice of Bulgarian, Turkish and Chinese cuisine.\r\n\r\nThe Acropolis Hotel is located 30 yards from the Roman Terms and 50 yards from the Varna Train Station. The Primorski Complex, only 10 yards away, offers an outdoor pool, sauna and hot tub.', 'http://www.hotelacropolis.net/?lang=en', 20),
('Hotel Casa del Mare', 'Sozopol', '42.424125', '27.6959635', ' ul. "Kiril i Metodiy" 36, 8130 Sozopol, Bulgaria', 'hotel', '3', 'Budget', '23', '23.00', 'casahotel.png', 'Hotel Casa del mare is the newest pearl in the crown of Ancient Sozopol. Situated right above shore, the complex carries the exclusive combination of descreet luxury and warm cosy comfort. Casa Del Mare is built on a unique place in the Ancient Town.  On one side is the vast sea and on the other side are the original cobblestone lanes of the town. Adjacent to the hotel are the ruins of the Southern castle wall towering over the shore to envelop it in the mystic of long gone ages.', 'http://hotelcasadelmare.com/web/about-the-hotel.php?lang=EN', 3),
('Hotel Dafi', 'Plovdiv', '42.1496242', '24.7491866', 'ul. "Georgi Benkovski" 23, 4000 Plovdiv, Bulgaria', 'hotel', '3', 'Budget', '22', '34.00', 'dafi.jpg', 'The rooms are soundproofed and offer cable TV.\r\n\r\nBulgarian dishes are served at the restaurant. At the Salad Bar, you can choose from a wide range of traditional and original salads.\r\n\r\nHotel Dafi is only a 5-minute walk from Mosque Jumaya and the Roman Stadium. \r\n\r\nPlovdiv Center is a great choice for travellers interested in architecture, roman ruins and sightseeing.\r\n\r\nThis is our guests'' favourite part of Plovdiv, according to independent reviews. They gave the location an excellent score of 9.3!', 'http://www.hoteldafi.com/', 14),
('Hotel Elena', 'Arbanasi', '43.0971371', '25.6626447', 'Arbenasi, st. Sveti Nikola 24, Bulgaria', 'hotel', '3', 'Budget', ' 8', '21.00', 'elena.png', 'Hotel Elena is situated at the highest point in the Arbanasi`s plateau and right next to the monastery Saint Nikolay Chudotvoretc and the Nativity Church\n.\n\nFor the hot summer months our restaurant has panoramic terrace and a garden,where we offer you peace, relax and coolness.', 'http://www.hotelelena.info/en/index.html', 5),
('Imperial Plovdiv Hotel&SPA', 'Plovdiv', '42.1446726', '24.7680622', 'Lev Tolstoy str., 4017 Plovdiv, Bulgaria', 'hotel', '4', 'Midrange', '190', '50.00', 'imphotel.png', 'Surrounded by genteel gardens, this upscale hotel is 2 km from the ruins of the Plovdiv Roman theater, and 3 km from the Dzhumaya Mosque. \n\nSophisticated rooms with vibrant tones and warm wood decor feature free Wi-Fi, flat-screen TVs, minibars and designer toiletries. Upgraded rooms add sitting areas and tea and coffeemakers; suites with living rooms have whirlpool tubs. Room service is available.', 'http://hotelimperial.bg/', 2),
('Landmark Creek Hotel & Spa', 'Plovdiv', '42.136923', '24.696088', 'st. Saint Valentin 1 4002 Plovdiv, Bulgaria', 'hotel', '4', 'Midrange', '54', '32.00', 'landmark.jpg', 'Located in the Park of the Rowing Channel in Plovdiv, Landmark Creek Hotel & Spa features a free outdoor pool, a free fitness centre, as well as a spa and wellness centre, including a sauna, for a surcharge. All of the rooms are air conditioned and feature free WiFi.\r\n\r\nA flat-screen TV with cable channels and a minibar are offered in each of the rooms. There is also a seating area. A balcony is available as well. The en-suite bathroom comes with a shower, free toiletries and a hairdryer. The rooms open to mountain or creek views.', 'http://www.landmarkhotel.bg/', 13),
('Lavanda Bed & Breakfast', 'Kovachevitsa', '41.685764', '23.825182', 'Kovachevitsa, 2969 Kovachevitsa, Bulgaria', 'b&b', '1', 'Budget', '4', '25.00', 'lavanda.png', 'Lavanda is a classic Bed & Breakfast hidden in the serene Rhodope mountains of Southern Bulgaria. It is a place where time stops and the spirit rejuvenates through the simple joys of the crisp air, the peaceful pace of village life, the hearty local food and the warmth of smiling people and homey surroundings. Situated in the architecturally significant village of Kovatchevitsa, Lavanda is a perfect escape only a couple of hours from major cities yet millennia away from the fast pace of urban life. Come join us for a few days and we guarantee you will leave in heightened spirits and wider smile!', 'http://www.lavanda.bg/', 10),
('Lion Hotel Borovets ', 'Borovets', '42.2738813', '23.6006337', '2010 Borovets, Bulgaria', 'hotel', '4', 'Midrange', '157', '22.00', 'lion.png', 'Set a 4-minute walk from the nearest gondola and 1 km from ski resort Yastrebets, this secluded, country-style hotel is 10 km from the 19th-century Bayrakli Mosque. \r\n\r\nModest rooms with simple wooden decor offer free Wi-Fi, satellite TV and minibars. Upgraded rooms add pull-out sofas. Suites come with living areas and kitchenettes, and upgraded suites have separate living rooms and extra beds.', 'http://www.lionhotelborovets.com/', 7),
('Maria-Antoaneta Residence', 'Bansko', '41.8264531', '23.4736844', 'Stragite area, 2770 Bansko, Bulgaria', 'hotel', '3', 'Budget', '100', '32.00', 'mariaantoaneta.png', 'Apart hotel Maria-antoaneta Residence is a magnificent three-star hotel in a privileged location at the hearth of the picturesque mountain village Bansko, skiing and leisure resort.\r\nThe hotel is a perfect setting for a fun-packed family holiday, a ski holiday, a romantic getaway, a sports break or training camo at any time of year.', 'http://www.maria-antoaneta.com/', 6),
('Primoretz Grand Hotel & Spa', 'Burgas', '42.490925', '27.4797251', 'ul. "Knyaz Alexander Batenberg" 2, 8000 Burgas, Bulgaria', 'hotel', '5', 'Luxury', '105', '72.00', 'primoretz.png', 'Grand Hotel & SPA Primoretz combines discreet luxury, high level of service, unique location, nature, sea, beach, SPA and Wellness, treatment and prophylactics of various medical conditions, body revitalization, modern weight- loss facilities (Non-Invasive Body Liposuction) and rejuvenation (Needle Free Mesotherapy), using the healing effect of the Bulgarian healing clay and lye.\r\nThe hotel is located in the Sea Garden of Burgas, in close proximity to the beach, in the bay between Pomorie and Chernomorets and is a Hotel Complex, with Balneo/SPA/Wellness and Beauty Centers, combined with a Seaside Park. ', 'http://www.hotelprimoretz.bg/en/', 9),
('Real Hotel', 'Veliko Tarnovo', '43.0847917', '25.6353816', ' ul. "Kolyu Gaytandzhiyata" 2, 5000 Veliko Tarnovo, Bulgari', 'hotel', '1', 'Budget', '21', '25.00', 'real.jpg', 'Offering free Wi-Fi, spacious rooms, and a 24-hour reception, this modern hotel in Veliko Turnovo is just a 5-minute walk from the historic Tsarevets Fortress. It was opened in April 2011.\r\n\r\nThe Real hotel provides air-conditioned rooms and suites with flat-screen TV, minibar, and seating area. The bathroom includes a hairdryer and cosy bathrobe with slippers.\r\n\r\nGuests can unwind in the lobby bar and park for free. A continental breakfast is served each morning.\r\n\r\nDifferent shops, restaurants, and nightlife venues are less than a 5-minute walk away. Veliko Turnovo Train Station is 0.9 miles away from the Real. ', 'http://en.hotelreal.eu/', 15),
('Stefanina Guesthouse', 'Bozhentsi', '42.8726545', '25.4246078', ' Bozhentsi, 5349 Bojentsi, Bulgaria', 'guest house', '4', 'Midrange', '5', '40.00', 'stefguest.png', '\r\nFor travelers who want to take in the sights and sounds of Bozhentsi, Stefanina Guesthouse is the perfect choice. From here, guests can enjoy easy access to all that the lively city has to offer. With its convenient location, the hotel offers easy access to the city''s must-see destinations.\r\n', '', 8),
('The Stream Resort', 'Pamporovo', '41.6568916', '24.6861617', 'Dunevski Livadi Area, 4870 Pamporovo, Bulgaria', 'resort', '3', 'Budget', '38', '21.00', 'streamresort.png', 'The Stream Resort is one of the best Bulgarian holiday spots that offers skiing and Spa in a single, idyllic setting. The resort is perfectly placed in Pamporovo, in the heart of the Rhodopi Mountain range of southeastern Bulgaria. The Resort offers the highest standard in ski resort accommodation with a wealth of facilities including wellness center & spa plus a restaurant and bar. ', 'http://www.thestreamresort.com/', 4),
('Zlatna Oresha Guest House', 'Zheravna', '42.8346947', '26.4564942', '8988 Zheravna, Bulgaria', 'guest house', '3', 'Budget', '23', '15.00', 'oresha.jpg', 'The renovated hotel complex of Zlatna Oresha is located at the very center of Zheravna. It consists of 5 houses, each of them having its own history and charm. The Old bakery and the Church cafe are fully renovated. All the houses are built in pre-Renaissance architectural style - monuments of culture - an architectural picture with unique artistic shape of stone and oak material.\n\nThe complex has 17 guest rooms - 7 single, 9 double (in 4 of which an extra bed can be added), 5 triple rooms and 2 apartments with three beds. Each room is comfortably furnished with new equipment, satellite TV, a mini bar and a separate bathroom. There are the typical for their time mensofi and inner wood-carved columns, bringing a unique authentic atmosphere and spirit.\n\nThe yard is a splendid flower garden, offering the guests the peace and the comfort of home. There is a BBQ and a small parking. The guests can use the two fully equipped taverns, each of them with a capacity up to 10-15 people. The taverns have a BBQ and a kitchenette. The cafe has a bar, a fireplace and a kitchenette with two premises (a washing room and a store) with a capacity up to 30 seats.', 'http://www.zlatnaoresha.com/about-en.html', 12);

-- --------------------------------------------------------

--
-- Table structure for table `interest`
--

CREATE TABLE IF NOT EXISTS `interest` (
  `interest_name` varchar(30) NOT NULL,
  `interest_description` varchar(1000) NOT NULL,
  `image` varchar(100) NOT NULL,
  `image_c` varchar(50) NOT NULL COMMENT 'circle image',
  PRIMARY KEY (`interest_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `interest`
--

INSERT INTO `interest` (`interest_name`, `interest_description`, `image`, `image_c`) VALUES
('Beaches', 'If you enjoy swimming and a lot of sun, beaches are your go to please. Select to explore your options!', 'beach.jpg', 'beachc.png'),
('Cities', 'If you enjoy big cities filled with museums and shops, cities are your go to please. Select to explore your options!', 'city.jpg', 'cityc.png'),
('Mountains', 'If you enjoy skiing, mountains are your go to please. Select to explore your options!', 'mountain.jpg', 'mountainc.png'),
('Towns', 'If you enjoy small towns offering tradition and culture, towns are your go to please. Select to explore your options!', 'village.jpg', 'villagec.png');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `location_name` varchar(60) NOT NULL,
  `interest_name` varchar(30) NOT NULL COMMENT 'fk interest',
  `location_description` varchar(2000) NOT NULL,
  `location_type` enum('City','Town','Beach','Mountain') NOT NULL,
  `loc_image` varchar(100) NOT NULL,
  `loc_image_c` varchar(50) NOT NULL COMMENT 'circle image',
  PRIMARY KEY (`location_name`),
  KEY `interest_name` (`interest_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_name`, `interest_name`, `location_description`, `location_type`, `loc_image`, `loc_image_c`) VALUES
('Arbanasi', 'Towns', 'Reportedly established in the Middle Ages by settlers from what is today Albania, Arbanasi  is located just 5 kilometres from the charming former Bulgarian capital Veliko Tarnovo. In the early Ottoman times, it was a Greek-speaking island populated by rich merchants and craftsmen trading throughout Europe. Its wealthy residents built as many as 5 Orthodox churches, famous for their detailed interior murals. Some of the most eminent families of Wallachia (Romania) also had houses in Arbanasi.\n\nMost of Arbanasis cultural heritage from the 16th-18th century is well preserved. The cobblestone streets of the ancient village are a great place for a spring walk and a memorable trip into the past. Make sure you visit the enormous Kostantsaliev House and the oldest church, that of the Nativity of Christ with unique frescoes from 1597.\n', 'Town', 'arbanasi.png', 'arbanasic.png'),
('Bansko', 'Mountains', 'There are several legends about who founded Bansko. According to one, Bansko was founded by people who lived in Dobarsko, a village in Rila, itself, according to a legend, founded by the blinded army of Tsar Samuil. Another legend claims that Bansko was founded by an Italian painter by the name of Ciociolino, hence the existence of the name Chucholin in Bansko.\r\n\r\nStill according to another version it was a Slavic tribe called the Peruns, who lived in Pirin and worshiped Perun, that founded the village later to become a town. There are a number of ethnographic texts, legends, prayers and oratories, which lend credence to this legend\r\n', 'Mountain', 'bansko.png', 'banskoc.png'),
('Borovets', 'Mountains', 'Borovets, known as Chamkoria until the middle of the 20th century, is a popular Bulgarian mountain resort situated in Sofia Province, on the northern slopes of Rila, at an altitude of 1350 m. Borovets is 10 km from Samokov, 73 km from Sofia and 125 km from Plovdiv. Borovets is the oldest Bulgarian winter resort with a history that dates back to 1896. Borovets was originally established at the end of the 19th Century as a hunting place for the Bulgarian Kings. Borovets gradually developed into a modern ski resort with hotels, restaurants, bars and a network of ski runs and lifts along the slopes of the Rila Mountains, providing for a whole range of winter sports. The resort has twice hosted World Cup Alpine Skiing rounds(1981 and 1984), while the Biathlon track is one of the best in the world', 'Mountain', 'borovets.png', 'borovetsc.png'),
('Bozhentsi', 'Towns', 'Just north of the historic Shipka Pass you will find the quiet and peaceful village of Bozhentsi.  Bozhentsi was once an important centre of craftsmanship which exported leather and wool products as well as honey and wax. In modern times, it has almost no permanent population, but its architectural heritage of gorgeous Ottoman-era houses, painted in white and with slated roofs on top has made it a great tourist destination.\n\nSome of the antique workshops are open for visits and the few but quality traditional restaurants will lure you with classic Bulgarian cuisine.\n', 'Town', 'bozhentsi.png', 'bozhentsic.png'),
('Brashlyan', 'Towns', 'Remotely located in the sparsely inhabited Strandzha Mountains on the border with Turkey, Brashlyan  is a beautiful architectural ensemble and an important historic site to boot. The village played an important role in the Transfiguration Uprising against Ottoman rule in 1908, for which it was praised in the folk song The Clear Moon is Already Rising.\r\n\r\nTranquil and sleepy Brashlyan will strike you with its rural wooden architecture from the 17th-19th century, which is very typical for this region where Bulgarians, Greeks and Turks coexisted for centuries. In the local church of Saint Demetrius, check out the Ancient Greek sacrificial altar immured into the pulpit!\r\n', 'Town', 'brashlyan.png', 'brashlyanc.png'),
('Burgas', 'Beaches', 'Burgas is the second largest city on the Bulgarian Black Sea Coast and the fourth-largest in Bulgaria after Sofia, Plovdiv, and Varna, with a population of 200,271 inhabitants, according to the 2011 census. It is the capital of Burgas Province and an important industrial, transport, cultural and tourist centre.\r\n\r\nThe city is surrounded by the Burgas Lakes and located at the westernmost point of the Black Sea, at the large Burgas Bay. The LUKOIL Neftochim Burgas is the largest oil refinery in southeastern Europe and the largest industrial enterprise. The Port of Burgas is the largest port in Bulgaria, and Burgas Airport is the second most important in the country. Burgas is the center of the Bulgarian fishing and fish processing industry.\r\n', 'Beach', 'burgas.png', 'burgasc.png'),
('Kovachevitsa', 'Towns', 'Hidden at 1000 metres above sea level in the westernmost part of the mystic Rhodopes, Kovachevitsa is traditionally a village of skilful masons and builders who were in demand even outside the Bulgarian lands. As customary for this high-altitude area of the Bulgarian southwest, the local houses are built mainly of stone, with some wooden elements (especially in the higher stories).', 'Town', 'kovachevitsa.png', 'kovachevitsac.png'),
('Pamporovo', 'Mountains', 'Pamporovo is a popular ski resort in Smolyan Province, southern Bulgaria, one of the best-known in Southeastern Europe. It is set amongst pine forests and is primarily visited during the winter for skiing and snowboarding.', 'Mountain', 'pamporovo.png', 'pamporovoc.png'),
('Plovdiv', 'Cities', 'With its art galleries, winding cobbled streets and bohemian cafes, Plovdiv (Plov-div) equals Sofia in things cultural and is a determined rival in nightlife as well  it has a lively, exuberant spirit befitting its status as a major university town. Being a smaller and less stressful city than Sofia, Plovdiv is also great for walking.\r\n\r\nPlovdiv has an appeal derived from its lovely old town, largely restored to its mid-19th-century appearance. It is packed with atmospheric house museums and art galleries and  unlike many other cities with old towns  has eminent artists still living and working within its tranquil confines. The neighbourhood boasts Thracian, Roman, Byzantine and Bulgarian antiquities, the most impressive being the Roman amphitheatre  the best-preserved in the Balkans, it is still used for performances.\r\n\r\n\r\n', 'City', 'plovdiv.jpg', 'plovdivc.png'),
('Sofia', 'Cities', 'Bulgaria''s pleasingly laid-back capital, Sofia is often overlooked by tourists heading straight to the coast or the ski resorts, but they''re missing something special. It''s no grand metropolis, true, but it''s a largely modern, youthful city, while its old east-meets-west atmosphere is still very much evident a scattering of onion-domed churches, Ottoman mosques and stubborn Red Army monuments shares the skyline with vast shopping malls and glassy five-star hotels. Sofia''s grey, blocky civic architecture lends a lingering Soviet tinge to the place, but it''s also a surprisingly green city. Vast parks and manicured gardens offer welcome respite from the busy city streets, and the ski slopes and hiking trails of mighty Mt Vitosha are just a short bus ride from the city centre. Home to many of Bulgaria''s finest museums, galleries, restaurants and entertainment venues, Sofia may persuade you to stick around and explore further.\r\n\r\n\r\n', 'City', 'sofia.png', 'sofiac.png'),
('Sozopol', 'Beaches', 'Ancient Sozopol, with its charming old town of meandering cobbled streets and pretty wooden houses, huddled together on a narrow peninsula, is one of the coast’s real highlights. With two superb beaches, a genial atmosphere, plentiful accommodation and good transport links, it has long been a popular seaside resort and makes an excellent base for exploring the area. Although not quite as crowded as Nesebar, it is becoming ever more popular with international visitors. There is a lively cultural scene, too, with plenty of free concerts and other events in summer.\r\n\r\n', 'Beach', 'sozopol.jpg', 'sozopolc.png'),
('Staro Stefanovo', 'Towns', 'A small village in a forested area of north central Bulgaria, Stefanovo is remarkable for the Staro Stefanovo (Old Stefanovo) architectural reserve of over 100 buildings from the early and mid-19th century. Besides the multitude of charming houses, other highlights include the Priests Bridge from 1824 and the village church built in a style very typical for the north side of the Balkan Mountains.\n\nOne of Staro Stefanovos most curious attractions, however, may be the Orthodox chapel fit inside the trunk of a dead 1300-year-old Turkey oak tree. The chapel is even complete with a cross-shaped incision on the back side of the tree trunk serving as a window!', 'Town', 'starostefanovo.png', 'starostefanovoc.png'),
('Varna', 'Beaches', 'Varna is the largest city and seaside resort on the Bulgarian Black Sea Coast and the third largest city in Bulgaria with a population of 335,949. It is also the fourth largest city on the Black Sea.\r\n\r\nOften referred to as the marine (or summer) capital of Bulgaria, Varna is a major tourist destination, a starting point for all the resorts in the northern Bulgarian Black Sea Coast, a business and university centre, seaport, and headquarters of the Bulgarian Navy and merchant marine. In April 2008, Varna was designated seat of the Black Sea Euro-Region (a new regional organization, not identical to the Black Sea Euroregion) by the Council of Europe.\r\n', 'Beach', 'varna.png', 'varnac.png'),
('Veliko Tarnovo', 'Cities', 'Veliko Tarnovo is a city in north central Bulgaria and the administrative centre of Veliko Tarnovo Province.\r\n\r\nOften referred to as the "City of the Tsars", Veliko Tarnovo is located on the Yantra River and is famously known as the historical capital of the Second Bulgarian Empire, attracting many tourists with its unique architecture. The old part of the city is situated on the three hills Tsarevets, Trapezitsa, and Sveta Gora, rising amidst the meanders of the Yantra. On Tsarevets are the palaces of the Bulgarian emperors and the Patriarchate, the Patriarchal Cathedral, and also a number of administrative and residential edifices surrounded by thick walls.\r\n', 'City', 'velikotarnovo.png', 'velikotarnovoc.png'),
('Zheravna', 'Towns', 'Zheravna lies scenically in the lower eastern part of the Balkan Mountains, at a place where they are gradually descending as they approach the Black Sea. Zheravna rose to affluence and importance in the 17th century due to its key position on a trading route. The residents built imposing houses of wood decorated with elaborate woodcarvings and traditional local carpets.\n\nToday, there are around 200 historic houses in Zheravna, some up to 300 years old. Each August, Zheravna is the site of the International Festival of Folk Costume, which gathers tens of thousands of people. Participants are required to wear an authentic folk costume and refrain from using modern technology for the duration of the event.', 'Town', 'zheravna.png', 'zheravnac.png');

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

CREATE TABLE IF NOT EXISTS `shop` (
  `shop_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(100) NOT NULL,
  `location_name` varchar(60) NOT NULL COMMENT 'FK location',
  `shop_image` varchar(100) NOT NULL,
  `shop_desc` varchar(2000) NOT NULL,
  `shop_link` varchar(200) NOT NULL,
  `shop_address` varchar(200) NOT NULL,
  PRIMARY KEY (`shop_id`),
  KEY `shop_ibfk_1` (`location_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `shop`
--

INSERT INTO `shop` (`shop_id`, `shop_name`, `location_name`, `shop_image`, `shop_desc`, `shop_link`, `shop_address`) VALUES
(2, 'Zografov and Co', 'Sofia', 'zografov.png', 'Lovely shops offering souvenirs.', 'http://sourcing.bg/Companies/Bulgaria/Zografov-co/', 'Sofia, 428 Tsar Boris III Blvd.'),
(8, 'Center of folk arts and crafts', 'Sofia', 'sofiashop.jpg', 'The Center of Folk Arts and Crafts was created in 1993 and is composed of more than 300 prominent Bulgarian master craftsmen. The Center organizes the production, advertising, exhibition and trade activity of national arts and crafts.', 'http://www.craftshop-bg.com/', ' Sofia 1000, st. "Paris" number 4');

-- --------------------------------------------------------

--
-- Table structure for table `shop_item`
--

CREATE TABLE IF NOT EXISTS `shop_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT 'FK shop',
  `item_image` varchar(100) NOT NULL,
  `item_desc` varchar(2000) NOT NULL,
  `item_price` decimal(10,2) NOT NULL COMMENT 'currency',
  PRIMARY KEY (`item_id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `shop_item`
--

INSERT INTO `shop_item` (`item_id`, `shop_id`, `item_image`, `item_desc`, `item_price`) VALUES
(2, 2, 'mask.jpg', 'Mask of King Teres lived fourth century BC ', '20.00'),
(3, 2, 'cups.jpg', 'Tea cup, made of copper with silver and gold plated', '15.00'),
(4, 2, 'vessel.jpg', 'This is a replica of an ancient golden vessel discovered by Arch. G. Kitov in Mound Kosmatka. This court dates from the fourth century. ', '50.00'),
(5, 2, 'wreath.jpg', 'A replica of an ancient gold wreath of 4v.pr.Hr. found by Arch. G. Kitov in mound "Kosmatka, belonged to a Thracian king Sevt', '30.00'),
(6, 2, 'fiala.jpg', 'Replica of antique silver gilt vessel belonging to the partial Rogozen treasure.', '45.00'),
(7, 2, 'cup.jpg', 'Author`s article, made of copper with silver plated 999.9 and 24 k gold plated. Can be made of solid silver. ', '12.00'),
(8, 8, 'plates.jpg', 'Pottery sgrafito ', '15.00'),
(9, 8, 'shirt.jpg', 'Embroidery shirt', '30.00'),
(10, 8, 'pitcher.jpg', 'Pitcher', '20.00'),
(11, 8, 'candle.jpg', 'Candle Holder', '5.00'),
(12, 8, 'woodcraft.jpg', 'Handmade wooden decorative panel', '20.00'),
(13, 8, 'pots.jpg', 'Handmade pottery sets', '10.00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(256) NOT NULL,
  `email` varchar(320) NOT NULL,
  `phone` varchar(30) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=66 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `name`, `password`, `email`, `phone`) VALUES
(1, 'dtg1', 'Didi Gradinarska', 'test', 'didi_gradinarska@abv.bg', '078888898898'),
(10, 'maria', 'Maria  Koseva Qneva', '$2y$10$g2azsHs1oBlrshdvuQBTM.J8jCSi71DgOdxmGG9LJbOSdDqPNRfXC', 'maria@gmail.com', '07871171359'),
(14, '', '', '$2y$10$IN5JTE5.BkvXNKITOsVDaeA6r0SQtSqHxhJ3FEKnKmQ2BkZ9Y23l2', '', ''),
(51, 'SevRay', 'Sev Ray', '$2y$10$yghrpGW.sGbrbr2eprwHXepoqlwH38yFj9hZmnS5r2GKwQ7Hqt0Lq', 'hary99@abv.bg', '07745974355'),
(52, 'Raquel', 'x', '$2y$10$tGA4gowqIcNf6vhnrzGqheci3OMCjBW3lIJenP2ov2JbbHhXjahsC', 'rakel_girlz91@hotmail.com', '07888888888'),
(53, 'jovie12345', 'jovie', '$2y$10$PJyx5FIa4HNNvVMMTLBoAeDh0t5bvt4tVeiOBjPMJr28UR/ld/WUW', 'jol36@aber.ac.uk', '07787339248'),
(54, 'jovie', 'jo', '$2y$10$hGJr7Hg9BGIp5JogFkK68OL5BXhVUQqhkK9fVug9IOsX/zqvE83aS', 'jol36@aber.ac.uk', '0773221567'),
(55, 'dave', 'dave11tets', '$2y$10$1V9PVvkc0eelofGiAzLELurah.cJfEpF9vt1z2Rqg9I7Lo97KCfTK', 'dave@dave.com', '09373764822'),
(56, 'Donalddonaldson', 'Donald', '$2y$10$0STtKcnED7WAcVc10ga4v.mHZdSbPBIg4HmltxaoaA9RyCqPJUV2S', 'peteefinance@gmail.com', '07572219280'),
(57, 'testtttttttttttttttttttttttttt', 'testthetest', '$2y$10$sBhyVu3ej3AINKBGhzVFxumitdEMG/qlWR2OWhb0oCqueoMZ5X3ym', 'test@ab.bg', '0937376422'),
(58, 'didi', 'Didi', '$2y$10$rwQVOS4xxEVHTy4BNB3sJO7iWkuuNWAsD5oxCRN0Cn/3DMY7uD/LO', 'didigradinarska@gmail.com', '07572219280'),
(60, 'testrepass', 'test', '$2y$10$KKt/NJbBI/t4m7j90eUgg.wNb7M5bAM9uQ.o68Ps7OPDl5dBSoQEi', 'dtg1@aber.ac.uk', '07888888888'),
(61, 'testmatchpass', 'didi', '$2y$10$/nh0xq3QyoAFbpWC86AXguE/eQUwKDcYbj9tVHlmsDV.ilqrdirkm', 'lalalrgarska@gmail.com', '07888888888'),
(63, 'testhp', 'hp', '$2y$10$XXczrRNbQkpfczk4ihpGWeCLteUgBRLIK/lxTzmXtDRx9GxbWhNRe', 'dtg1@aber.ac.ul', '07888888888'),
(65, 'hptake1', 'didi', '$2y$10$2BhK7xeTS7TbkMy5oZO0pOj/jf0lsgkVOvBune7rop7kTR1KDmgfm', 'dtg1@aber.ac.ul', '07888888888');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`hotel_name`) REFERENCES `hotel` (`hotel_name`) ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON UPDATE CASCADE;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON UPDATE CASCADE,
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`hotel_name`) REFERENCES `hotel` (`hotel_name`) ON UPDATE CASCADE,
  ADD CONSTRAINT `feedback_ibfk_3` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`);

--
-- Constraints for table `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`location_name`) REFERENCES `location` (`location_name`) ON UPDATE CASCADE;

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`interest_name`) REFERENCES `interest` (`interest_name`) ON UPDATE CASCADE;

--
-- Constraints for table `shop`
--
ALTER TABLE `shop`
  ADD CONSTRAINT `shop_ibfk_1` FOREIGN KEY (`location_name`) REFERENCES `location` (`location_name`) ON UPDATE CASCADE;

--
-- Constraints for table `shop_item`
--
ALTER TABLE `shop_item`
  ADD CONSTRAINT `shop_item_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
