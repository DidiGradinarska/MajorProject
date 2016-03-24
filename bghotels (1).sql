-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 24, 2016 at 06:41 AM
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
  `hotel_name` varchar(100) NOT NULL COMMENT 'fk hotel',
  `username` varchar(50) NOT NULL COMMENT 'fk user',
  `date_in` date NOT NULL,
  `date_out` date NOT NULL,
  `number_room` int(11) NOT NULL,
  `booking_date` date NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `booking_ibfk_1` (`hotel_name`),
  KEY `booking_ibfk_2` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `hotel_name`, `username`, `date_in`, `date_out`, `number_room`, `booking_date`) VALUES
(3, 'Hilton Sofia', 'dave', '2016-03-24', '2016-03-26', 2, '2016-03-23'),
(4, 'fictional hotel', '', '2016-03-24', '2016-03-26', 1, '2016-03-24');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT 'fk user',
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `message` varchar(1000) NOT NULL,
  PRIMARY KEY (`contact_id`),
  KEY `contact_ibfk_1` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contact_id`, `username`, `name`, `email`, `phone_number`, `message`) VALUES
(1, 'dtg1', 'Didi Gradinarska', 'didi_gradinarska@abv.bg', '078888898898', 'Can I enter my hotel?'),
(2, '', 'Test', 'test@gmail.com', '08882217463', 'I want to enter my shop');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT 'fk user',
  `hotel_name` varchar(100) NOT NULL COMMENT 'fk hotel',
  `feedback` varchar(1000) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `feedback` (`feedback`(767)),
  KEY `feedback_ibfk_1` (`username`),
  KEY `feedback_ibfk_2` (`hotel_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `username`, `hotel_name`, `feedback`, `date`) VALUES
(2, 'dave', 'Hilton Sofia', 'It was really nice.', '2016-03-25');

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE IF NOT EXISTS `hotel` (
  `hotel_name` varchar(100) NOT NULL,
  `location_name` varchar(60) NOT NULL COMMENT 'FK location',
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `address` varchar(200) NOT NULL,
  `hotel_type` enum('hotel','resort') NOT NULL,
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
('fictional hotel', 'Sozopol', 27.69, 42.42, 'please delete this it is just a test', 'hotel', '2', 'Budget', '20', '50.00', 'cake.png', 'dsjhdchjdchbddch', '', 3),
('gefefhbfv', 'Plovdiv', 27.69, 42.42, '', 'resort', '4', 'Midrange', '600', '60.00', 'safe.png', 'ygffvfgv', '', 2),
('Hilton Sofia', 'Sofia', 27.69, 42.42, 'Bulgaria Blvd., 1421 sofia, Bulgaria', 'hotel', '5', 'Luxury', '700', '100.00', 'hiltons.jpg', 'Looking on Vitosha mountain, this sophisticated business hotel is a 6-minute walk from a metro station and an 11-minute walk from the Natsionalniya dvorets na kulturata exhibition center.', 'http://www3.hilton.com/en/hotels/bulgaria/hilton-sofia-SOFHIHI/index.html?WT.mc_id=zELWAAA0EU1WW2PSH3Nano4DGBrandx&WT.srch=1&utm_source=AdWords&utm_medium=ppc&utm_campaign=paidsearch', 1);

-- --------------------------------------------------------

--
-- Table structure for table `interest`
--

CREATE TABLE IF NOT EXISTS `interest` (
  `interest_name` varchar(30) NOT NULL,
  `interest_description` varchar(1000) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`interest_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `interest`
--

INSERT INTO `interest` (`interest_name`, `interest_description`, `image`) VALUES
('Beaches', 'If you enjoy swimming and a lot of sun, beaches are your go to please. Select to explore your options!', 'beach.jpg'),
('Cities', 'If you enjoy big cities filled with museums and shops, cities are your go to please. Select to explore your options!', 'sofia.jpg'),
('Mountains', 'If you enjoy skiing, mountains are your go to please. Select to explore your options!', 'mountain.jpg'),
('Towns', 'If you enjoy small towns offering tradition and culture, towns are your go to please. Select to explore your options!', 'village.jpg');

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
  PRIMARY KEY (`location_name`),
  KEY `interest_name` (`interest_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_name`, `interest_name`, `location_description`, `location_type`, `loc_image`) VALUES
('Plovdiv', 'Cities', 'With its art galleries, winding cobbled streets and bohemian cafes, Plovdiv (Plov-div) equals Sofia in things cultural and is a determined rival in nightlife as well  it has a lively, exuberant spirit befitting its status as a major university town. Being a smaller and less stressful city than Sofia, Plovdiv is also great for walking.\r\n\r\nPlovdiv has an appeal derived from its lovely old town, largely restored to its mid-19th-century appearance. It is packed with atmospheric house museums and art galleries and  unlike many other cities with old towns  has eminent artists still living and working within its tranquil confines. The neighbourhood boasts Thracian, Roman, Byzantine and Bulgarian antiquities, the most impressive being the Roman amphitheatre  the best-preserved in the Balkans, it is still used for performances.\r\n\r\n\r\n', 'City', 'plovdiv.jpg'),
('Sofia', 'Cities', 'Bulgaria''s pleasingly laid-back capital, Sofia is often overlooked by tourists heading straight to the coast or the ski resorts, but they''re missing something special. It''s no grand metropolis, true, but it''s a largely modern, youthful city, while its old east-meets-west atmosphere is still very much evident a scattering of onion-domed churches, Ottoman mosques and stubborn Red Army monuments shares the skyline with vast shopping malls and glassy five-star hotels. Sofia''s grey, blocky civic architecture lends a lingering Soviet tinge to the place, but it''s also a surprisingly green city. Vast parks and manicured gardens offer welcome respite from the busy city streets, and the ski slopes and hiking trails of mighty Mt Vitosha are just a short bus ride from the city centre. Home to many of Bulgaria''s finest museums, galleries, restaurants and entertainment venues, Sofia may persuade you to stick around and explore further.\r\n\r\n\r\n', 'City', 'sofia.jpg'),
('Sozopol', 'Beaches', 'Ancient Sozopol, with its charming old town of meandering cobbled streets and pretty wooden houses, huddled together on a narrow peninsula, is one of the coast’s real highlights. With two superb beaches, a genial atmosphere, plentiful accommodation and good transport links, it has long been a popular seaside resort and makes an excellent base for exploring the area. Although not quite as crowded as Nesebar, it is becoming ever more popular with international visitors. There is a lively cultural scene, too, with plenty of free concerts and other events in summer.\r\n\r\n', 'Beach', 'sozopol.jpg');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `shop`
--

INSERT INTO `shop` (`shop_id`, `shop_name`, `location_name`, `shop_image`, `shop_desc`, `shop_link`, `shop_address`) VALUES
(2, 'Zografov and Co', 'Sofia', 'Zografov.png', 'Lovely shops offering souvenirs.', 'http://sourcing.bg/Companies/Bulgaria/Zografov-co/', 'Sofia, 428 Tsar Boris III Blvd.');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `shop_item`
--

INSERT INTO `shop_item` (`item_id`, `shop_id`, `item_image`, `item_desc`, `item_price`) VALUES
(2, 2, 'item1.png', 'Mask of King Teres lived fourth century BC ', '20.00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `name`, `password`, `email`, `phone`) VALUES
(1, 'dtg1', 'Didi Gradinarska', 'test', 'didi_gradinarska@abv.bg', '078888898898'),
(8, 'testinggggg', 'didi', '$2y$10$w5nO4LXwPix/9PcKeTGeFuod2NFYB/U5PvUS3xT4usLs.5DKMHHJ6', 'didi_gradinarska@abv.bg', '07888888888'),
(9, 'didi_g', 'Tom Brown', '$2y$10$4vdtoRSAqoUXfFUb6YWg2uFL37TOwziGNzFYRO2Hdp31sSskDX5Iu', 'tom_brown@aber.ac.uk', '0773221567'),
(10, 'maria', 'Maria ', '$2y$10$g2azsHs1oBlrshdvuQBTM.J8jCSi71DgOdxmGG9LJbOSdDqPNRfXC', 'maria@gmail.com', '0989456489'),
(11, 'pesho', 'Pesho', '$2y$10$LppaIpHQvItecE6d4sqJ1.HUT8IB8vIVWHQmcZYuY5a.msa/rBkzi', 'psho@abv.bg', '0787456765'),
(13, 'testlast', 'Richi', '$2y$10$2qjSOzkyhtaFAfcWvsH7POC.RtmKwNXA9ndLm5t//PwHygE9nILPa', 'lalalrgarska@gmail.com', '0787456765'),
(14, '', '', '$2y$10$IN5JTE5.BkvXNKITOsVDaeA6r0SQtSqHxhJ3FEKnKmQ2BkZ9Y23l2', '', ''),
(20, 'odie', 'odie', '$2y$10$DLPJBdz.4CrFxy4aitYq..ayNFu1.8QcljjbkinzoBCx34n9oJttq', 'odie@abv.bg', '0787456936'),
(23, 'random', 'didi', '$2y$10$xakzVkF06cgUqN7Bw078He46bPCXvJbP3PD00OpBEwsVeq9S1NwzG', 'lalalrgarska@gmail.com', '568568'),
(25, 'what', 'what', '$2y$10$iwxUQCTcy7VPIXAjeOERpeD0C52o9E7e65heaYLu3R5VhAOBefNv2', 'dtg1@aber.ac.ul', '0773221567'),
(27, 'testovo', 'testing', '$2y$10$ANuzHgUcA5qdKAGZz7TjYeQxa6gs0hSTUZqfGMkLZaU3kIq7yr1ii', 'maria@gmail.com', '0773221567'),
(28, 'didi', '', '$2y$10$rpc6TUQhmbqajOkWATT0euEqPfH.NzTdsEZQ8YLRhh7X.sh8r9fa6', '', ''),
(45, 'help', 'didi', '$2y$10$HJqTvM5pXkibcPx0nmOT4OZg3l5yluN0x0qstFP/pUQP7arblUqQi', 'help@me.com', '2423534543454'),
(46, 'opit', 'opit', '$2y$10$xB8P2FeTQJzJBR2HfpEwjetixtQLN7yJgyHbJtbTypiB6Tpgr8XOu', 'opit@work.com', '0787456765'),
(47, 'opit2', 'opiti', '$2y$10$0h4hV.N62myu7U.LHA.n2Ojhd1bnXZYnog0zr31.vjVEWHzazx6Na', 'dtg1@aber.ac.ul', '07888888888'),
(48, 'whynot', 'didi', '$2y$10$.EETaWw0q0veWjD2EH7G3usPmWExXFcIp7aEcLkvD39QgAMGR3rj6', 'why@not.com', '07888888888'),
(49, 'trytest', 'testtoss', '$2y$10$Y.aG1.gljHBdxMxYmbMaG.ZL7H71eXyfncKg9u7l5FtT5p6Gb8SpG', 'dtg1@aber.ac.ul', '07888888888'),
(50, 'benben', 'didi', '$2y$10$RapnAGN5B1HlTdh5JObMxe7UTVk36KRwzuTfwd8yGtjPcQ5Fvuyy2', 'bgc@aber.ac.uk', '01234567890'),
(51, 'SevRay', 'Sev Ray', '$2y$10$yghrpGW.sGbrbr2eprwHXepoqlwH38yFj9hZmnS5r2GKwQ7Hqt0Lq', 'hary99@abv.bg', '07745974355'),
(52, 'Raquel', 'x', '$2y$10$tGA4gowqIcNf6vhnrzGqheci3OMCjBW3lIJenP2ov2JbbHhXjahsC', 'rakel_girlz91@hotmail.com', '07888888888'),
(53, 'jovie12345', 'jovie', '$2y$10$PJyx5FIa4HNNvVMMTLBoAeDh0t5bvt4tVeiOBjPMJr28UR/ld/WUW', 'jol36@aber.ac.uk', '07787339248'),
(54, 'jovie', 'jo', '$2y$10$hGJr7Hg9BGIp5JogFkK68OL5BXhVUQqhkK9fVug9IOsX/zqvE83aS', 'jol36@aber.ac.uk', '0773221567'),
(55, 'dave', 'dave', '$2y$10$1V9PVvkc0eelofGiAzLELurah.cJfEpF9vt1z2Rqg9I7Lo97KCfTK', 'dave@dave.com', '07888888888');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`hotel_name`) REFERENCES `hotel` (`hotel_name`) ON UPDATE CASCADE;

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON UPDATE CASCADE;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`hotel_name`) REFERENCES `hotel` (`hotel_name`) ON UPDATE CASCADE,
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON UPDATE CASCADE;

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
