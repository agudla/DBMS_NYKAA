-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2022 at 08:29 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nykaa`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `p_id` varchar(11) NOT NULL,
  `c_quantity` varchar(11) DEFAULT NULL,
  `cust_id` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `courier`
--

CREATE TABLE `courier` (
  `cou_id` int(11) NOT NULL,
  `d_date` date DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `cust_id` int(11) NOT NULL,
  `firstname` char(20) DEFAULT NULL,
  `phone_no` varchar(11) DEFAULT NULL,
  `email_id` varchar(20) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `lastname` char(15) DEFAULT NULL,
  `pswd` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`cust_id`, `firstname`, `phone_no`, `email_id`, `address`, `lastname`, `pswd`) VALUES
(112, 'prajith', '8567', 'test@gmail.com', 'fwjn    ', 'k', '123'),
(113, 'ani', '789', 'anirudh@gmail.com', 'mig a    ', 'gudla', '1234'),
(114, 'Gudla', '7891451979', 'test2@gmail.com', 'MIG    ', 'Ani', 'pswd');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `pay_id` int(11) NOT NULL,
  `pay_type` char(20) DEFAULT NULL,
  `time_stamp` datetime DEFAULT current_timestamp(),
  `amount` int(11) DEFAULT NULL,
  `card_no` varchar(12) DEFAULT NULL,
  `cvv` int(4) DEFAULT NULL,
  `expiry` char(10) DEFAULT NULL,
  `cust_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`pay_id`, `pay_type`, `time_stamp`, `amount`, `card_no`, `cvv`, `expiry`, `cust_id`) VALUES
(195423, 'Debit', '2022-10-20 11:22:40', 2499, '1234567890', 558, 'December 2', '112');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `p_id` int(11) NOT NULL,
  `p_name` char(50) DEFAULT NULL,
  `p_quantity` int(11) DEFAULT NULL,
  `brand` char(20) DEFAULT NULL,
  `p_cost` int(11) DEFAULT NULL,
  `color` char(20) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `category` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`p_id`, `p_name`, `p_quantity`, `brand`, `p_cost`, `color`, `discount`, `category`) VALUES
(2319, 'Just Herbs Ayurvedic Matte Lipstick Micro-Mini Tri', 20, 'Ayurvedic', 599, 'Red', 10, 'Make up'),
(2320, 'Just Herbs Vegan Matte Liquid Lipstick', 20, 'Ayurvedic', 450, 'Green', 10, 'Make up'),
(2321, 'NYX professional Makeup Can\'t Won\'t stop', 2, 'ayurvedic', 1450, 'cream', 15, 'Makeup'),
(2322, 'May belline New York Fit Me Matte+Poreless Liquid', 3, 'paris', 906, 'pink', 18, 'Makeup'),
(2323, 'Just Herbs Vegan Matte Liquid Lipstick', 1, 'london', 440, 'red', 20, 'Skin'),
(2324, 'Quench Botanics Mama Cica Rejuvanating Face Mist w', 2, 'ayurvedic', 998, 'black', 30, 'Skin'),
(2325, 'Quench Botanics Mon Cherry Overnight Peeling Mask', 3, 'dazler', 900, 'blue', 30, 'Skin'),
(2326, 'Mamaearth Skin Illuminate Face Serum with Vitamin', 2, 'Mamaearth', 998, 'orange', 10, 'Skin'),
(2327, 'Matrix Biolage Smoothproof Smoothing Shampoo', 2, 'loreal', 2500, 'white', 17, 'Hair'),
(2328, 'Matrix Opti Care Smooth Straight Professional Cond', 3, 'Aveda', 420, 'black', 14, 'Hair'),
(2329, 'Matrix Biolage Smoothproof Smoothing Professional', 4, 'Garnier', 784, 'green', 25, 'Hair'),
(2330, 'Matrix Repairinside Shampoo 200ML+Conditioner 98Gm', 2, 'Dove', 818, 'purple', 10, 'Hair'),
(2331, 'Philips Selfie Straighetner (HP8302/06)', 1, 'philips', 1099, 'black', 20, 'Appliances'),
(2332, 'Nykaa Face Massage Rollers', 1, 'novell', 2624, 'white', 10, 'Appliances'),
(2333, 'Protouch LED Hair Growth Therapy Comb', 2, 'lifelong', 4998, 'violet', 12, 'Appliances'),
(2334, 'Le Marbelle Jade Gua Sha Stone Face Massager', 3, 'maria', 2247, 'green', 10, 'Appliances'),
(2335, 'VEGA VHSCC-01 3  in 1 Hair Styler', 1, 'philips', 1999, 'black', 10, 'Appliances');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `courier`
--
ALTER TABLE `courier`
  ADD PRIMARY KEY (`cou_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`pay_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`p_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=746401;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `cust_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `pay_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195424;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2336;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
