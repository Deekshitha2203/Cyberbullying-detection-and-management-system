-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 03, 2024 at 01:09 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `abusers`
-- (See below for the actual view)
--
CREATE TABLE `abusers` (
`fname` varchar(225)
,`lname` varchar(225)
,`outgoing_msg_id` int(225)
,`email` varchar(225)
,`status` varchar(225)
,`msg` varchar(500)
);

-- --------------------------------------------------------

--
-- Table structure for table `faulty`
--

CREATE TABLE `faulty` (
  `sn_id` int(225) NOT NULL,
  `msg_id` int(225) NOT NULL,
  `keyword_id` int(225) NOT NULL,
  `log_id` int(225) NOT NULL,
  `datetime` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faulty`
--

INSERT INTO `faulty` (`sn_id`, `msg_id`, `keyword_id`, `log_id`, `datetime`) VALUES
(1, 59, 7, 18, '2024-02-22 18:03:28.000000'),
(2, 60, 7, 19, '2024-02-22 18:03:59.000000'),
(3, 60, 10, 19, '2024-02-22 18:03:59.000000'),
(4, 61, 4, 20, '2024-02-22 18:17:25.000000'),
(5, 61, 10, 20, '2024-02-22 18:17:25.000000'),
(6, 64, 10, 19, '2024-02-23 05:51:52.000000'),
(7, 64, 7, 19, '2024-02-23 05:51:52.000000'),
(8, 65, 10, 3, '2024-02-23 05:58:21.000000'),
(9, 65, 7, 3, '2024-02-23 05:58:21.000000'),
(10, 66, 10, 4, '2024-02-23 05:59:36.000000'),
(11, 67, 10, 5, '2024-02-23 06:42:15.000000'),
(12, 67, 7, 5, '2024-02-23 06:42:15.000000'),
(13, 68, 4, 2, '2024-02-23 06:44:29.000000'),
(14, 68, 10, 2, '2024-02-23 06:44:29.000000'),
(15, 69, 10, 2, '2024-02-23 06:45:42.000000'),
(16, 69, 4, 2, '2024-02-23 06:45:42.000000'),
(17, 70, 10, 2, '2024-02-23 08:00:38.000000'),
(18, 71, 6, 3, '2024-02-23 08:01:05.000000'),
(19, 72, 4, 3, '2024-02-27 19:51:40.000000'),
(20, 73, 10, 3, '2024-02-27 19:52:38.000000'),
(21, 74, 10, 4, '2024-02-27 20:19:44.000000'),
(22, 75, 4, 5, '2024-02-27 20:20:11.000000'),
(23, 76, 6, 5, '2024-02-27 20:25:25.000000'),
(24, 77, 4, 6, '2024-02-27 20:25:55.000000'),
(25, 78, 1, 6, '2024-02-27 20:31:09.000000'),
(26, 79, 3, 7, '2024-02-27 20:31:53.000000'),
(27, 80, 10, 7, '2024-02-27 21:08:57.000000'),
(28, 81, 10, 8, '2024-02-27 21:34:52.000000'),
(29, 82, 4, 8, '2024-02-27 21:37:09.000000'),
(30, 83, 6, 8, '2024-02-27 21:37:53.000000'),
(31, 84, 3, 8, '2024-02-27 21:41:18.000000'),
(32, 85, 5, 9, '2024-02-27 21:42:23.000000'),
(33, 86, 7, 10, '2024-02-27 21:42:40.000000'),
(34, 87, 9, 9, '2024-02-27 21:48:06.000000'),
(35, 88, 10, 10, '2024-02-27 21:48:22.000000'),
(36, 91, 10, 10, '2024-02-28 05:36:42.000000'),
(37, 92, 4, 11, '2024-02-28 05:37:18.000000'),
(38, 93, 6, 10, '2024-02-28 05:54:09.000000'),
(39, 94, 10, 10, '2024-02-28 06:48:07.000000'),
(40, 95, 6, 10, '2024-02-28 14:20:06.000000');

-- --------------------------------------------------------

--
-- Table structure for table `keywords`
--

CREATE TABLE `keywords` (
  `keyword_id` int(225) NOT NULL,
  `keyword_text` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `keywords`
--

INSERT INTO `keywords` (`keyword_id`, `keyword_text`) VALUES
(1, 'Stop'),
(2, 'deadhead'),
(3, 'ugly'),
(4, 'old'),
(5, 'gross'),
(6, 'idiot'),
(7, 'jerk'),
(8, 'lame'),
(9, 'dumb'),
(10, 'nerd');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `msg_id` int(225) NOT NULL,
  `incoming_msg_id` int(225) NOT NULL,
  `outgoing_msg_id` int(225) NOT NULL,
  `msg` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`msg_id`, `incoming_msg_id`, `outgoing_msg_id`, `msg`) VALUES
(1, 1616241701, 330631378, 'hey'),
(2, 1616241701, 330631378, 'Hi'),
(3, 1616241701, 330631378, 'HI'),
(4, 1616241701, 330631378, 'Hello'),
(5, 1616241701, 330631378, 'oo'),
(6, 1616241701, 330631378, 'Hey'),
(7, 1616241701, 330631378, 'Hey'),
(8, 1616241701, 330631378, 'Hi'),
(9, 1616241701, 330631378, 'Hi'),
(10, 1616241701, 330631378, 'Hi'),
(11, 1616241701, 330631378, 'Hello'),
(12, 1616241701, 330631378, 'Hi'),
(13, 1616241701, 330631378, 'Hi'),
(14, 1616241701, 330631378, 'Hey'),
(15, 1616241701, 330631378, 'Hey'),
(16, 1616241701, 330631378, 'Hey'),
(17, 1616241701, 330631378, 'Hi'),
(18, 1616241701, 330631378, 'Hi'),
(19, 1616241701, 330631378, 'Hi'),
(20, 1616241701, 330631378, 'Hi'),
(21, 1616241701, 330631378, 'Hello'),
(22, 1616241701, 330631378, 'Hey'),
(23, 1616241701, 330631378, 'Yoyo'),
(24, 1616241701, 330631378, 'Hi'),
(25, 1616241701, 330631378, 'Hi how are you?'),
(26, 308103746, 1616241701, 'Hey what are you doing?'),
(27, 308103746, 1616241701, 'Hey'),
(28, 308103746, 1616241701, 'Hi'),
(29, 308103746, 1616241701, 'Hey'),
(30, 308103746, 1616241701, 'Hello'),
(31, 308103746, 1616241701, 'Hi'),
(32, 308103746, 1616241701, 'What a jerk'),
(33, 1616241701, 308103746, 'Such a nerd'),
(34, 308103746, 1616241701, 'ugly'),
(35, 308103746, 1616241701, 'u r an idiot'),
(36, 1616241701, 308103746, 'gross'),
(37, 1616241701, 308103746, 'u r soooo dumb'),
(38, 1616241701, 308103746, 'and lame'),
(39, 308103746, 1616241701, 'u deadhead'),
(40, 1330659398, 308103746, 'Hi'),
(41, 308103746, 1330659398, 'Hello'),
(42, 308103746, 1330659398, 'nerd'),
(43, 1330659398, 599125910, 'hi'),
(44, 1330659398, 599125910, 'nerd'),
(45, 308103746, 822600610, 'Hi'),
(46, 330631378, 308103746, 'Hello'),
(47, 330631378, 308103746, 'u r a nerd'),
(48, 330631378, 308103746, 'hi how are u doing nerd'),
(49, 330631378, 308103746, 'Stop'),
(50, 1616241701, 1588046140, 'Hey?'),
(51, 1588046140, 1616241701, 'hii'),
(52, 1588046140, 1616241701, 'nerd'),
(53, 1588046140, 1616241701, 'old'),
(54, 1616241701, 1588046140, 'You are such a jerk and a nerd'),
(55, 1616241701, 1588046140, 'jerk'),
(56, 1616241701, 1588046140, 'nerd'),
(57, 1616241701, 1588046140, 'You are such a jerk and a nerd'),
(58, 1616241701, 1588046140, 'nerd and jerk'),
(59, 1616241701, 1588046140, 'jerk'),
(60, 1616241701, 1588046140, 'jerk and nerd'),
(61, 1616241701, 1588046140, 'old and nerd'),
(62, 822600610, 1588046140, 'Hi'),
(63, 1330659398, 1588046140, 'Hello'),
(64, 330631378, 1588046140, 'nerd and jerk'),
(65, 330631378, 1588046140, 'nerd and jerk'),
(66, 330631378, 1588046140, 'nerd'),
(67, 330631378, 1588046140, 'nerd and jerk'),
(68, 330631378, 1588046140, 'old and nerd'),
(69, 330631378, 1588046140, 'nerd and old'),
(70, 330631378, 1588046140, 'nerd'),
(71, 330631378, 1588046140, 'idiot'),
(72, 330631378, 1616241701, 'old'),
(73, 330631378, 1616241701, 'nerd'),
(74, 330631378, 1330659398, 'hey nerd'),
(75, 330631378, 1330659398, 'old'),
(76, 330631378, 1330659398, 'idiot'),
(77, 330631378, 1330659398, 'old'),
(78, 330631378, 1330659398, 'Stop'),
(79, 330631378, 1330659398, 'ugly'),
(80, 330631378, 1330659398, 'nerd'),
(81, 330631378, 1330659398, 'NERD'),
(82, 330631378, 1330659398, 'OLD'),
(83, 330631378, 1330659398, 'Idiot'),
(84, 330631378, 1330659398, 'Ugly'),
(85, 330631378, 1330659398, 'Gross'),
(86, 330631378, 1330659398, 'Jerk'),
(87, 330631378, 1330659398, 'dumb'),
(88, 330631378, 1330659398, 'nerd'),
(89, 330631378, 1616241701, 'Hi how are you?'),
(90, 1616241701, 330631378, 'Im fine'),
(91, 330631378, 1616241701, 'nerd'),
(92, 330631378, 1616241701, 'old'),
(93, 330631378, 1616241701, 'Idiot'),
(94, 308103746, 1616241701, 'nerd'),
(95, 1616241701, 1330659398, 'IDiot'),
(96, 1616241701, 1330659398, 'Hey!');

-- --------------------------------------------------------

--
-- Table structure for table `moderation`
--

CREATE TABLE `moderation` (
  `log_id` int(225) NOT NULL,
  `moder_id` int(225) DEFAULT NULL,
  `msg_id` int(225) NOT NULL,
  `action` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `moderation`
--

INSERT INTO `moderation` (`log_id`, `moder_id`, `msg_id`, `action`) VALUES
(23, 1, 70, 'Yes'),
(26, 2, 73, 'Yes'),
(27, 2, 74, 'Yes'),
(29, 1, 76, 'Yes'),
(31, 1, 78, 'Yes'),
(33, 1, 80, 'Yes'),
(37, 1, 84, 'Yes'),
(40, 2, 87, 'Yes'),
(42, 1, 91, 'Yes');

--
-- Triggers `moderation`
--
DELIMITER $$
CREATE TRIGGER `backup_deleted_rows` AFTER DELETE ON `moderation` FOR EACH ROW BEGIN
        INSERT INTO moderation_backup (log_id, moder_id, msg_id, action, deleted_at)
        VALUES (OLD.log_id, OLD.moder_id, OLD.msg_id, OLD.action, NOW());
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `moderation_backup`
--

CREATE TABLE `moderation_backup` (
  `log_id` int(11) NOT NULL,
  `moder_id` int(11) DEFAULT NULL,
  `msg_id` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `moderation_backup`
--

INSERT INTO `moderation_backup` (`log_id`, `moder_id`, `msg_id`, `action`, `deleted_at`) VALUES
(1, 1, 22, 'No', '2024-02-28 10:11:34'),
(21, 1, 68, 'No', '2024-02-23 11:14:45'),
(22, 1, 69, 'No', '2024-02-23 11:15:58'),
(24, 1, 71, 'No', '2024-02-23 12:31:25'),
(25, 2, 72, 'No', '2024-02-28 00:22:02'),
(28, 1, 75, 'No', '2024-02-28 00:50:35'),
(30, 2, 77, 'No', '2024-02-28 00:56:11'),
(32, 2, 79, 'No', '2024-02-28 01:02:07'),
(34, 2, 81, 'No', '2024-02-28 02:05:27'),
(35, 2, 82, 'No', '2024-02-28 02:07:27'),
(36, 2, 83, 'No', '2024-02-28 02:08:04'),
(38, 2, 85, 'No', '2024-02-28 02:13:50'),
(39, 2, 86, 'No', '2024-02-28 02:14:01'),
(41, 1, 88, 'No', '2024-02-28 02:29:54'),
(43, 1, 92, 'No', '2024-02-28 10:07:33'),
(44, 2, 93, 'No', '2024-02-28 10:24:32'),
(45, 1, 94, 'No', '2024-02-28 11:18:23'),
(46, 1, 95, 'No', '2024-02-28 18:50:30');

-- --------------------------------------------------------

--
-- Table structure for table `moderators`
--

CREATE TABLE `moderators` (
  `mod_id` int(225) NOT NULL,
  `mod_unique_id` int(225) NOT NULL,
  `mod_fname` varchar(225) NOT NULL,
  `mod_lname` varchar(225) NOT NULL,
  `mod_email` varchar(225) NOT NULL,
  `mod_password` varchar(225) NOT NULL,
  `mod_img` varchar(10000) NOT NULL,
  `mod_status` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `moderators`
--

INSERT INTO `moderators` (`mod_id`, `mod_unique_id`, `mod_fname`, `mod_lname`, `mod_email`, `mod_password`, `mod_img`, `mod_status`) VALUES
(1, 1642007818, 'Sam', 'S', 'sam@gmail.com', '$2y$10$BUQVExfNF20xqUC8GOWKhe3MivKrk6vMSgemvbfhdSnxJZX.rV1CO', '1708518014Mickey_Mouse_Disney_1.jpg', 'Active now'),
(2, 602041979, 'Steve', 'A', 'steve@gmail.com', '$2y$10$.g75bd/kUkXgieCeNmO7Vef.b5RTYid7Cf/sa8Ww3toNUrHFSTb1u', '1708548755img.jpg', 'Active now');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(225) NOT NULL,
  `unique_id` int(225) NOT NULL,
  `fname` varchar(225) NOT NULL,
  `lname` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `img` varchar(400) NOT NULL,
  `status` varchar(225) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `unique_id`, `fname`, `lname`, `email`, `password`, `img`, `status`, `date`) VALUES
(3, 308103746, 'Ariel', 'S', 'ariel@gmail.com', '123456', '1708448365130c7814c81047b5ea0dbf2f833d755f.jpg', 'Active now', '2024-02-20'),
(4, 330631378, 'Belle', 'I', 'belle@gmail.com', '123456', '1708448403cute-girl-pic-cartoon.jpg', 'Active now', '2024-02-20'),
(5, 599125910, 'Sam', 'A', 'sam@gmail.com', '123456', '1708574630dwi.jpeg', 'offline now', '2024-02-22'),
(6, 822600610, 'Divya', 'S', 'divya@gmail.com', '123456', '1708578567dwi.jpeg', 'offline now', '2024-02-22'),
(2, 1330659398, 'Anna', 'L', 'anna@gmail.com', '123456', '1708448316Mickey_Mouse_Disney_1.jpg', 'Active now', '2024-02-20'),
(7, 1588046140, 'Veena', 'R', 'veena@gmail.com', '123456', '1708588592Mickey_Mouse_Disney_1.jpg', 'offline now', '2024-02-22'),
(1, 1616241701, 'Elsa', 'D', 'elsa@gmail.com', '123456', '1708448059dwi.jpeg', 'Active now', '2024-02-20');

-- --------------------------------------------------------

--
-- Structure for view `abusers`
--
DROP TABLE IF EXISTS `abusers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `abusers`  AS SELECT `u`.`fname` AS `fname`, `u`.`lname` AS `lname`, `m`.`outgoing_msg_id` AS `outgoing_msg_id`, `u`.`email` AS `email`, `u`.`status` AS `status`, `m`.`msg` AS `msg` FROM ((`users` `u` join `messages` `m` on(`m`.`outgoing_msg_id` = `u`.`unique_id`)) join `moderation` `md` on(`md`.`msg_id` = `m`.`msg_id`)) WHERE `md`.`action` = 'Yes' ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `faulty`
--
ALTER TABLE `faulty`
  ADD PRIMARY KEY (`sn_id`);

--
-- Indexes for table `keywords`
--
ALTER TABLE `keywords`
  ADD PRIMARY KEY (`keyword_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`msg_id`);

--
-- Indexes for table `moderation`
--
ALTER TABLE `moderation`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `moder_id_fk` (`moder_id`),
  ADD KEY `msg_id_fk` (`msg_id`);

--
-- Indexes for table `moderation_backup`
--
ALTER TABLE `moderation_backup`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `moderators`
--
ALTER TABLE `moderators`
  ADD PRIMARY KEY (`mod_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`unique_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `moderation`
--
ALTER TABLE `moderation`
  MODIFY `log_id` int(225) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `moderation`
--
ALTER TABLE `moderation`
  ADD CONSTRAINT `moder_id_fk` FOREIGN KEY (`moder_id`) REFERENCES `moderators` (`mod_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `msg_id_fk` FOREIGN KEY (`msg_id`) REFERENCES `messages` (`msg_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
