-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
-- Name : Prajal Mishra , ID - 1001434611
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2016 at 00:00 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cheapbooks`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `ssn` varchar(10) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`ssn`, `name`, `address`, `phone`) VALUES
('100-12-3456', 'J K Rowling', '557 Broadway, New York', '(812) 496 9346'),
('100-23-1111', 'Stephen King', '1380 Hammond Street', '(800) 123 1234'),
('200-42-2476', 'Terry Pratchett', '38 Mill Lane, Bucks', '(456) 746 8246'),
('200-85-5163', 'Neil Gaiman', '4470 Sunset Blvd. LA, California', '(842) 444 2465'),
('300-04-1291', 'Nora Roberts', '74 Lewiston, New York', '(741) 951 0000'),
('300-67-0015', 'William Golding', 'Henley Street, Warwickshire, England', '(200) 989 5454'),
('400-91-2022', 'Agatha Christie', '313 Torquay, Devon', '(353) 673 8672'),
('400-24-4444', 'Charles Dickens', '48 Doughty Street', '(895) 011 6935'),
('500-50-5100', 'Mark Twain', '351 Farmington Avenue', '(754) 648 1047'),
('500-00-8901', 'Jees Augustine', '1 Palo Alto, California', '(002) 010 1024'),
('407-04-1995', 'Prajal Mishra', 'Centennial Court, Arlington, Texas', '(682) 456 1234'),
('123-45-6789', 'Balan', '01 Richmond Street, California', '(800) 716 9346');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `ISBN` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `year` year(4) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  `publisher` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`ISBN`, `title`, `year`, `price`, `publisher`) VALUES
('378-1-00-875880-4', 'Harry Potter and the Philosopher Stone', 1997, 44, 'Arthur A. Levine Books'),
('123-5-12-123830-1', 'Harry Potter and the Chamber of Secrets', 1998, 28, 'Arthur A. Levine Books'),
('456-6-21-614230-6', 'Harry Potter and the Half-Blood Prince', 2005, 15, 'Arthur A. Levine Books'),
('789-7-87-723123-4', 'Harry Potter and the Prisoner of Azkaban', 1999, 24, 'Arthur A. Levine Books'),
('012-8-58-476322-4', 'Harry Potter and the Order of the Phoenix', 2003, 7, 'Arthur A. Levine Books'),
('345-9-09-112345-3', 'Harry Potter and the Goblet of Fire', 2000, 36, 'Arthur A. Levine Books'),
('678-0-10-812381-4', 'Harry Potter and the Deathly Hallows', 2007, 20, 'Arthur A. Levine Books'),
('901-1-70-511674-2', 'The Stand', 1990, 15, 'Doubleday'),
('234-2-18-132123-0', 'The Gunslinger', 2002, 4, 'Doubleday'),
('567-3-93-264312-4', 'The Shining', 1999, 12, 'Doubleday'),
('890-4-97-312377-7', 'On Writing', 2003, 19, 'Doubleday'),
('123-5-29-822234-7', 'Mort', 2005, 10, 'Victor Gollancz'),
('456-6-49-876134-5', 'The Light Fantastic', 2001, 5, 'Victor Gollancz'),
('789-7-65-789034-1', 'The Sandman: Preludes and Nocturnes', 1997, 50, 'DC Comics'),
('012-8-34-875234-4', 'Smokes and Mirrors', 1996, 20, 'DC Comics'),
('345-9-00-523880-2', 'Fragile Things: Short Fictions and Wonders', 2006, 19, 'DC Comics'),
('678-0-12-873460-4', 'Lord of the Flies', 1990, 25, 'Faber and Faber'),
('901-1-91-123880-2', 'The Princess Bride', 1994, 40, 'Faber and Faber'),
('234-2-65-872220-4', '1336 CC', 2016, 99, 'Self Published');


-- --------------------------------------------------------

--
-- Table structure for table `contains`
--

CREATE TABLE `contains` (
  `ISBN` varchar(20) DEFAULT NULL,
  `basketId` varchar(13) DEFAULT NULL,
  `number` int(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `username` varchar(10) NOT NULL,
  `password` varchar(32) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`username`, `password`, `address`, `phone`, `email`) VALUES
('admin', 'a41acc7effe601de1dc2099a4e2fdd7c', 'unknown', '(999) 999 9999', 'admin@myworld.com');

-- --------------------------------------------------------

--
-- Table structure for table `shippingorder`
--

CREATE TABLE `shippingorder` (
  `ISBN` varchar(20) DEFAULT NULL,
  `warehousecode` varchar(40) DEFAULT NULL,
  `username` varchar(10) DEFAULT NULL,
  `number` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shoppingbasket`
--

CREATE TABLE `shoppingbasket` (
  `basketId` varchar(13) NOT NULL,
  `username` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `ISBN` varchar(20) NOT NULL,
  `warehousecode` varchar(40) NOT NULL,
  `number` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`ISBN`, `warehousecode`, `number`) VALUES
('378-1-00-875880-4', 'W1', 20),
('123-5-12-123830-1', 'W1', 14),
('456-6-21-614230-6', 'W2', 4),
('789-7-87-723123-4', 'W2', 6),
('012-8-58-476322-4', 'W2', 0),
('345-9-09-112345-3', 'W1', 12),
('678-0-10-812381-4', 'W1', 0),
('901-1-70-511674-2', 'W3', 7),
('234-2-18-132123-0', 'W3', 1),
('567-3-93-264312-4', 'W1', 3),
('890-4-97-312377-7', 'W2', 5),
('123-5-29-822234-7', 'W1', 8),
('456-6-49-876134-5', 'W2', 16),
('789-7-65-789034-1', 'W1', 25),
('012-8-34-875234-4', 'W2', 24),
('345-9-00-523880-2', 'W3', 14),
('678-0-12-873460-4', 'W1', 0),
('901-1-91-123880-2', 'W1', 2),
('234-2-65-872220-4', 'W1', 99);
-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `warehousecode` varchar(40) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`warehousecode`, `name`, `address`, `phone`) VALUES
('W1', 'Warehouse1', '1, Palo Alto, California', '(456) 879 123'),
('W2', 'Warehouse2', 'Centennial Court, Texas', '(852) 202 347'),
('W3', 'Warehouse3', 'Russia', '(010) 101 010');

-- --------------------------------------------------------

--
-- Table structure for table `writtenby`
--

CREATE TABLE `writtenby` (
  `ssn` varchar(10) NOT NULL,
  `ISBN` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `writtenby`
--

INSERT INTO `writtenby` (`ssn`, `ISBN`) VALUES
('100-12-3456','378-1-00-875880-4'),
('100-12-3456','123-5-12-123830-1'),
('100-12-3456','456-6-21-614230-6'),
('100-12-3456','789-7-87-723123-4'),
('100-12-3456','012-8-58-476322-4'),
('100-12-3456','345-9-09-112345-3'),
('100-12-3456','678-0-10-812381-4'),
('100-23-1111','901-1-70-511674-2'),
('100-23-1111','234-2-18-132123-0'),
('100-23-1111','567-3-93-264312-4'),
('100-23-1111','890-4-97-312377-7'),
('200-42-2476','123-5-29-822234-7'),
('200-42-2476','456-6-49-876134-5'),
('200-85-5163','789-7-65-789034-1'),
('200-85-5163','012-8-34-875234-4'),
('200-85-5163','345-9-00-523880-2'),
('300-67-0015','678-0-12-873460-4'),
('300-67-0015','901-1-91-123880-2'),
('500-00-8901','234-2-65-872220-4'),
('407-04-1995','234-2-65-872220-4'),
('123-45-6789','234-2-65-872220-4');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`ssn`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indexes for table `contains`
--
ALTER TABLE `contains`
  ADD KEY `constraint_2` (`ISBN`),
  ADD KEY `constraint_3` (`basketId`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `shippingorder`
--
ALTER TABLE `shippingorder`
  ADD KEY `constraint_4` (`ISBN`),
  ADD KEY `constraint_5` (`warehousecode`),
  ADD KEY `constraint_6` (`username`);

--
-- Indexes for table `shoppingbasket`
--
ALTER TABLE `shoppingbasket`
  ADD PRIMARY KEY (`basketId`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`ISBN`,`warehousecode`),
  ADD KEY `warehousecode` (`warehousecode`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`warehousecode`);

--
-- Indexes for table `writtenby`
--
ALTER TABLE `writtenby`
  ADD PRIMARY KEY (`ssn`,`ISBN`),
  ADD KEY `isbn` (`ISBN`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contains`
--
ALTER TABLE `contains`
  ADD CONSTRAINT `constraint_2` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`),
  ADD CONSTRAINT `constraint_3` FOREIGN KEY (`basketId`) REFERENCES `shoppingbasket` (`basketId`);

--
-- Constraints for table `shippingorder`
--
ALTER TABLE `shippingorder`
  ADD CONSTRAINT `constraint_4` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`),
  ADD CONSTRAINT `constraint_5` FOREIGN KEY (`warehousecode`) REFERENCES `warehouse` (`warehousecode`),
  ADD CONSTRAINT `constraint_6` FOREIGN KEY (`username`) REFERENCES `customers` (`username`);

--
-- Constraints for table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `constraint_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`),
  ADD CONSTRAINT `warehousecode` FOREIGN KEY (`warehousecode`) REFERENCES `warehouse` (`warehousecode`);

--
-- Constraints for table `writtenby`
--
ALTER TABLE `writtenby`
  ADD CONSTRAINT `isbn` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`),
  ADD CONSTRAINT `ssn` FOREIGN KEY (`ssn`) REFERENCES `author` (`ssn`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
