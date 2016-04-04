-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2016 at 02:39 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `exam`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE IF NOT EXISTS `answer` (
  `answer` varchar(255) NOT NULL,
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`answer`, `question_id`) VALUES
('Two states', 1),
('Three mistakes of my life', 1),
('Five point someone', 1),
('One night at call center', 1),
('Badminton', 2),
('Squash', 2),
('Table tennis', 2),
('Polo', 2),
('Park Guen-Hye', 3),
('Chandrika Kumartunga', 3),
('Dilma roseph', 2),
('Magawato Sukarnoputro', 3),
('Sikkim', 4),
('Mizoram', 4),
('Arunachal Pradesh', 4),
('Nagaland', 4);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_name` varchar(255) NOT NULL,
  `difficulty` varchar(100) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`question_id`, `question_name`, `difficulty`) VALUES
(1, 'On which book is the film ''Kai Po Che'' based on?', 'Beginner'),
(2, 'Thailand''s Ratchanok Intanon became the youngest women''s singles winner in the world Championship of which sports in August 2013?', 'Beginner'),
(3, 'The parents of which of these presidents were former prime minsters of the same country?', 'Beginner'),
(4, 'According to 2011 census, which state in India has the lowest population density?', 'Beginner'),
(5, 'Who served as the backup cosmonaut for Rakesh Sharma on the Soyuz T-11 mission, which launched the first Indian into space?', 'Beginner'),
(6, 'To do which of these activities is a ''bawarchi'' employed at a house ?', 'Beginner'),
(7, 'In India, on the back of which of these cards would you find a magnetic strip ?', 'Beginner'),
(8, 'Which search engine has a button that says ''I''m feeling Lucky ?', 'Beginner'),
(9, 'Which Pakistani team played in the 2013 Champions League T20?', 'Beginner'),
(10, 'The shell of a hen''s egg is mainly made of which of these substances?', 'Beginner');

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE IF NOT EXISTS `result` (
  `question_id` int(11) NOT NULL,
  `correct_ans` varchar(255) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `test_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`test_id`, `score`) VALUES
(1, 15),
(2, 25);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_details`
--

CREATE TABLE IF NOT EXISTS `users_details` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `qs_result_fk` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
