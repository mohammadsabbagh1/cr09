-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 05 فبراير 2018 الساعة 14:07
-- إصدار الخادم: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_mohammad_sabbagh_carrental`
--

-- --------------------------------------------------------

--
-- بنية الجدول `additional_charges`
--

CREATE TABLE `additional_charges` (
  `additional_charges_id` int(11) NOT NULL,
  `fk_car_id` int(55) DEFAULT NULL,
  `additional_charges_price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- إرجاع أو استيراد بيانات الجدول `additional_charges`
--

INSERT INTO `additional_charges` (`additional_charges_id`, `fk_car_id`, `additional_charges_price`) VALUES
(1, NULL, 100),
(2, NULL, 150),
(3, NULL, 111);

-- --------------------------------------------------------

--
-- بنية الجدول `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `car_num` int(11) DEFAULT NULL,
  `car_model` varchar(55) DEFAULT NULL,
  `color` varchar(55) DEFAULT NULL,
  `chare_num` int(11) DEFAULT NULL,
  `fk_category_id` int(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- إرجاع أو استيراد بيانات الجدول `car`
--

INSERT INTO `car` (`car_id`, `car_num`, `car_model`, `color`, `chare_num`, `fk_category_id`) VALUES
(1, 256476, 'bmw', 'red', 43322, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `type` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- إرجاع أو استيراد بيانات الجدول `category`
--

INSERT INTO `category` (`category_id`, `type`) VALUES
(4, '175');

-- --------------------------------------------------------

--
-- بنية الجدول `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(11) NOT NULL,
  `driver_name` varchar(55) DEFAULT NULL,
  `birth_day` date DEFAULT NULL,
  `license_num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- بنية الجدول `drop_off_location`
--

CREATE TABLE `drop_off_location` (
  `drop_off_location` int(11) NOT NULL,
  `street` varchar(55) DEFAULT NULL,
  `contry` varchar(55) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `zip` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- إرجاع أو استيراد بيانات الجدول `drop_off_location`
--

INSERT INTO `drop_off_location` (`drop_off_location`, `street`, `contry`, `city`, `zip`) VALUES
(5, 'landstrasse', 'austria', 'wien', '10');

-- --------------------------------------------------------

--
-- بنية الجدول `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `fk_reservation_id` int(11) DEFAULT NULL,
  `car_rent` float DEFAULT NULL,
  `Vat` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `discount_amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- بنية الجدول `pick_up_location`
--

CREATE TABLE `pick_up_location` (
  `pick_up_location_id` int(11) NOT NULL,
  `street` varchar(55) DEFAULT NULL,
  `contry` varchar(55) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `zip` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- إرجاع أو استيراد بيانات الجدول `pick_up_location`
--

INSERT INTO `pick_up_location` (`pick_up_location_id`, `street`, `contry`, `city`, `zip`) VALUES
(6, 'land', 'austria', NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `fk_driver_id` int(11) DEFAULT NULL,
  `fk_pick_up_location_id` int(11) DEFAULT NULL,
  `fk_drop_off_location_id` int(11) DEFAULT NULL,
  `sart_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- إرجاع أو استيراد بيانات الجدول `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `fk_car_id`, `fk_driver_id`, `fk_pick_up_location_id`, `fk_drop_off_location_id`, `sart_date`, `end_date`) VALUES
(7, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additional_charges`
--
ALTER TABLE `additional_charges`
  ADD PRIMARY KEY (`additional_charges_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `fk_category_id` (`fk_category_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indexes for table `drop_off_location`
--
ALTER TABLE `drop_off_location`
  ADD PRIMARY KEY (`drop_off_location`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `fk_reservation_id` (`fk_reservation_id`);

--
-- Indexes for table `pick_up_location`
--
ALTER TABLE `pick_up_location`
  ADD PRIMARY KEY (`pick_up_location_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `fk_driver_id` (`fk_driver_id`),
  ADD KEY `fk_car_id` (`fk_car_id`),
  ADD KEY `fk_pick_up_location_id` (`fk_pick_up_location_id`),
  ADD KEY `fk_drop_off_location_id` (`fk_drop_off_location_id`);

--
-- قيود الجداول المحفوظة
--

--
-- القيود للجدول `additional_charges`
--
ALTER TABLE `additional_charges`
  ADD CONSTRAINT `additional_charges_ibfk_1` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`);

--
-- القيود للجدول `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`fk_category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `car_ibfk_2` FOREIGN KEY (`fk_category_id`) REFERENCES `category` (`category_id`);

--
-- القيود للجدول `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservation` (`reservation_id`);

--
-- القيود للجدول `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fk_driver_id`) REFERENCES `driver` (`driver_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `reservation_ibfk_4` FOREIGN KEY (`fk_pick_up_location_id`) REFERENCES `pick_up_location` (`pick_up_location_id`),
  ADD CONSTRAINT `reservation_ibfk_5` FOREIGN KEY (`fk_drop_off_location_id`) REFERENCES `drop_off_location` (`drop_off_location`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
