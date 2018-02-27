-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.2.13-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table test.visitorpass
CREATE TABLE IF NOT EXISTS `visitorpass` (
  `VP_SLNO` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `VP_DATE` date NOT NULL,
  `VP_NAME` varchar(250) DEFAULT NULL,
  `VP_DESG` varchar(250) DEFAULT NULL,
  `VP_FROM` varchar(250) DEFAULT NULL,
  `VP_VTAR` varchar(250) DEFAULT NULL,
  `VP_MBMK` varchar(250) DEFAULT NULL,
  `VP_MBNO` varchar(250) DEFAULT NULL,
  `VP_MAIL` varchar(250) DEFAULT NULL,
  `VP_VHCL` varchar(250) DEFAULT NULL,
  `VP_LTMD` varchar(250) DEFAULT NULL,
  `VP_LTSN` varchar(250) DEFAULT NULL,
  `VP_VDFM` date DEFAULT NULL,
  `VP_VDTO` date DEFAULT NULL,
  `VP_TSTM` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `VP_PHTO` longtext DEFAULT NULL,
  PRIMARY KEY (`VP_DATE`,`VP_SLNO`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='VP1.1';

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
