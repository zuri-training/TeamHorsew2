-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2022 at 07:52 AM
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
-- Database: `teamhorsew2_donate`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblalumni`
--

CREATE TABLE `tblalumni` (
  `Alunmni_ID` int(11) NOT NULL,
  `Mat_No` varchar(30) DEFAULT NULL,
  `Surname` varchar(50) DEFAULT NULL,
  `OtherNames` varchar(50) DEFAULT NULL,
  `Sex` varchar(10) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Address` varchar(600) DEFAULT NULL,
  `ProgrammeOfStudy` varchar(60) DEFAULT NULL,
  `GraduationYear` int(11) DEFAULT NULL,
  `ProfilePicture` varchar(300) DEFAULT NULL,
  `Pin` varchar(200) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `ValidationStatus_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblalumni`
--

INSERT INTO `tblalumni` (`Alunmni_ID`, `Mat_No`, `Surname`, `OtherNames`, `Sex`, `Email`, `Phone`, `DateOfBirth`, `Address`, `ProgrammeOfStudy`, `GraduationYear`, `ProfilePicture`, `Pin`, `Password`, `ValidationStatus_ID`) VALUES
(1, NULL, 'ONUOHA', 'IKECH OBASI', 'MALE', 'ikechi.obasi@gmail.com', '08052777157', NULL, 'flat 2, Nwachukwu Estate, Nkpolu, Rumuigbo.', NULL, 2010, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbldonation`
--

CREATE TABLE `tbldonation` (
  `Donation_ID` int(11) NOT NULL,
  `Alumni_ID` int(11) DEFAULT NULL,
  `DonationDate` date DEFAULT NULL,
  `DonationStatus_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbldonors`
--

CREATE TABLE `tbldonors` (
  `Donor_ID` int(11) NOT NULL,
  `Donation_ID` int(11) DEFAULT NULL,
  `Alumni_ID` int(11) DEFAULT NULL,
  `DonationAmount` double DEFAULT NULL,
  `RedemptionStatus_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblevents`
--

CREATE TABLE `tblevents` (
  `Event_ID` int(11) NOT NULL,
  `EventTitle` varchar(500) DEFAULT NULL,
  `EventDate` date DEFAULT NULL,
  `EventCaption` text DEFAULT NULL,
  `EventImage` varchar(800) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblprogrammeofstudy`
--

CREATE TABLE `tblprogrammeofstudy` (
  `Law` varchar(30) DEFAULT NULL,
  `Physiotherapy` varchar(30) DEFAULT NULL,
  `Accounting` varchar(30) DEFAULT NULL,
  `SoftwareEngineering` varchar(30) DEFAULT NULL,
  `ProductDesign` varchar(30) DEFAULT NULL,
  `ArtAndCulture` varchar(30) DEFAULT NULL,
  `Architecture` varchar(30) DEFAULT NULL,
  `InternationalRelation` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw1_alumni`
-- (See below for the actual view)
--
CREATE TABLE `vw1_alumni` (
`Alunmni_ID` int(11)
,`Mat_No` varchar(30)
,`Surname` varchar(50)
,`OtherNames` varchar(50)
,`Sex` varchar(10)
,`Email` varchar(50)
,`Phone` varchar(20)
,`DateOfBirth` date
,`Address` varchar(600)
,`ProgrammeOfStudy` varchar(60)
,`GraduationYear` int(11)
,`ProfilePicture` varchar(300)
,`Pin` varchar(200)
,`Password` varchar(200)
,`ValidationStatus_ID` int(11)
,`ValidationStatus` varchar(13)
,`UserPIN` varchar(38)
);

-- --------------------------------------------------------

--
-- Structure for view `vw1_alumni`
--
DROP TABLE IF EXISTS `vw1_alumni`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw1_alumni`  AS SELECT `tblalumni`.`Alunmni_ID` AS `Alunmni_ID`, `tblalumni`.`Mat_No` AS `Mat_No`, `tblalumni`.`Surname` AS `Surname`, `tblalumni`.`OtherNames` AS `OtherNames`, `tblalumni`.`Sex` AS `Sex`, `tblalumni`.`Email` AS `Email`, `tblalumni`.`Phone` AS `Phone`, `tblalumni`.`DateOfBirth` AS `DateOfBirth`, `tblalumni`.`Address` AS `Address`, `tblalumni`.`ProgrammeOfStudy` AS `ProgrammeOfStudy`, `tblalumni`.`GraduationYear` AS `GraduationYear`, `tblalumni`.`ProfilePicture` AS `ProfilePicture`, `tblalumni`.`Pin` AS `Pin`, `tblalumni`.`Password` AS `Password`, `tblalumni`.`ValidationStatus_ID` AS `ValidationStatus_ID`, if(`tblalumni`.`ValidationStatus_ID` = 1,'VALIDATED','NOT VALIDATED') AS `ValidationStatus`, concat(`tblalumni`.`GraduationYear`,convert(if(octet_length(`tblalumni`.`Alunmni_ID`) = 1,concat('000',hex(`tblalumni`.`Alunmni_ID`)),if(octet_length(`tblalumni`.`Alunmni_ID`) = 2,concat('00',hex(`tblalumni`.`Alunmni_ID`)),if(octet_length(`tblalumni`.`Alunmni_ID`) = 3,concat('0',hex(`tblalumni`.`Alunmni_ID`)),hex(`tblalumni`.`Alunmni_ID`)))) using latin1),left(`tblalumni`.`Surname`,1),left(`tblalumni`.`OtherNames`,1)) AS `UserPIN` FROM `tblalumni``tblalumni`  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblalumni`
--
ALTER TABLE `tblalumni`
  ADD PRIMARY KEY (`Alunmni_ID`);

--
-- Indexes for table `tbldonation`
--
ALTER TABLE `tbldonation`
  ADD PRIMARY KEY (`Donation_ID`);

--
-- Indexes for table `tbldonors`
--
ALTER TABLE `tbldonors`
  ADD PRIMARY KEY (`Donor_ID`),
  ADD KEY `Donation_ID` (`Donation_ID`),
  ADD KEY `Alumni_ID` (`Alumni_ID`),
  ADD KEY `RedemptionStatus_ID` (`RedemptionStatus_ID`);

--
-- Indexes for table `tblevents`
--
ALTER TABLE `tblevents`
  ADD PRIMARY KEY (`Event_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblalumni`
--
ALTER TABLE `tblalumni`
  MODIFY `Alunmni_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbldonation`
--
ALTER TABLE `tbldonation`
  MODIFY `Donation_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbldonors`
--
ALTER TABLE `tbldonors`
  MODIFY `Donor_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblevents`
--
ALTER TABLE `tblevents`
  MODIFY `Event_ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
