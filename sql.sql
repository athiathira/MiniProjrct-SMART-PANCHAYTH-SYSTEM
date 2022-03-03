/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.9 : Database - sps
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sps` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `sps`;

/*Table structure for table `certidetails` */

DROP TABLE IF EXISTS `certidetails`;

CREATE TABLE `certidetails` (
  `cdetails_id` int(11) NOT NULL AUTO_INCREMENT,
  `certificate` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cdetails_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `certidetails` */

insert  into `certidetails`(`cdetails_id`,`certificate`,`description`) values (4,'mnmn,mnb ','bmb'),(3,'deathcertificate','fdgfg');

/*Table structure for table `certirequest` */

DROP TABLE IF EXISTS `certirequest`;

CREATE TABLE `certirequest` (
  `crequest_id` int(11) NOT NULL AUTO_INCREMENT,
  `cdetails_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `files` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`crequest_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `certirequest` */

insert  into `certirequest`(`crequest_id`,`cdetails_id`,`user_id`,`status`,`files`) values (1,2,1,'sanction','static/0c6c5fd0-9ae2-4492-9900-857338167e1aATHIRA BRITH.jpeg'),(2,3,1,'reject',''),(3,3,1,'sanction','static/2e65ce51-c89e-45fb-b550-6efe056efb41_DSC3844.jpg'),(4,3,1,'sanction','static/b57cdfe8-9282-40a3-9eca-31dbadbe2133ATHIRA BRITH.jpeg'),(5,3,1,'sanction','static/d18e4a5d-dc11-4033-8259-11a4525fee65_DSC3844.jpg'),(6,3,1,'sanction','static/73d978f1-94a3-43d5-8690-62886c06b671ATHIRA BRITH.jpeg'),(7,4,1,'sanction','static/03cd9291-d268-4bbb-9321-15f3f7d3132aATHIRA BRITH.jpeg');

/*Table structure for table `cimages` */

DROP TABLE IF EXISTS `cimages`;

CREATE TABLE `cimages` (
  `cimages_id` int(11) NOT NULL AUTO_INCREMENT,
  `crequest_id` int(11) DEFAULT NULL,
  `files` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`cimages_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `cimages` */

insert  into `cimages`(`cimages_id`,`crequest_id`,`files`) values (1,1,'static/033caa13-3e1d-455c-8edc-46abd7f24861ATHIRA BRITH.jpeg'),(2,1,'static/f77d084f-ae20-4fce-b81b-87de8383b7b2ATHIRA BRITH.jpeg'),(3,1,'static/c9382715-03d6-4952-9ced-978c7ded15b2ATHIRA BRITH.jpeg'),(4,1,'static/6aa2166e-32c5-4b3e-9605-9d56076ec819athirasig.jpg'),(5,3,'static/3164560a-3c1a-47b5-8807-234e32ec25d4athira birth.pdf'),(6,5,'static/0fbe909f-09cf-4752-afa5-89fbc28cd140athira birth.pdf'),(7,4,'static/77572d69-f171-4abc-9188-9c7bb6216ff2ATHIRA BRITH.jpeg');

/*Table structure for table `complaint` */

DROP TABLE IF EXISTS `complaint`;

CREATE TABLE `complaint` (
  `complaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `complaint` varchar(50) DEFAULT NULL,
  `reply` varchar(50) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`complaint_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `complaint` */

insert  into `complaint`(`complaint_id`,`user_id`,`complaint`,`reply`,`date`) values (1,1,'namechange','ok','2022-01-21');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `user_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`user_type`) values (1,'admin','admin','admin'),(2,'Athiparu','paruathi','user'),(3,'appu1','paruappu','user'),(4,'Athiparu','paruathi','user'),(5,'achu1','achus@123','user'),(6,'Athiparu','paruathi','user'),(7,'Athiparu','paruathi','user'),(8,'annuz','anuappus','user'),(9,'Athiparu','ammuaanu','user'),(10,'Athiparu','paruathi1','user'),(11,'ann456kj','abcdefghi','user'),(12,'Athiparu','','user'),(13,'Athiparu','789456123','user'),(14,'jarsha','arsha123j','user'),(15,'arsha','jarsha12','user');

/*Table structure for table `tax` */

DROP TABLE IF EXISTS `tax`;

CREATE TABLE `tax` (
  `tax_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `amount` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tax_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tax` */

insert  into `tax`(`tax_id`,`user_id`,`type`,`amount`,`status`) values (1,1,'House','500','pending'),(2,1,'House','','pending');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `place` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `pincode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`user_id`,`login_id`,`firstname`,`lastname`,`place`,`phone`,`email`,`gender`,`address`,`state`,`district`,`pincode`) values (1,2,'ATHIRA','KJ','kottayam','7894561238','kjathira@gmail.com',NULL,NULL,NULL,NULL,NULL),(2,3,'ARAVIND','J','kottayam','9746242025','kjamoozhoor1844@gmail.com',NULL,NULL,NULL,NULL,NULL),(3,4,'ARAVIND','J','kottayam','9746242025','kjamoozhoor1844@gmail.com',NULL,NULL,NULL,NULL,NULL),(4,5,'Aswathy','Kumar','Ettumanoor','9745603216','aswathykumar123@gmail.com',NULL,NULL,NULL,NULL,NULL),(5,6,'ARAVIND','J','kottayam','9746242025','kjamoozhoor1844@gmail.com',NULL,NULL,NULL,NULL,NULL),(6,7,'ARAVIND','J','kottayam','9746242025','kjamoozhoor1844@gmail.com',NULL,NULL,NULL,NULL,NULL),(7,8,'ARAVIND','J','kottayam','9746242025','kjamoozhoor1844@gmail.com',NULL,NULL,NULL,NULL,NULL),(8,9,'ARAVIND','J','kottayam','9746242025','kjamoozhoor1844@gmail.com',NULL,NULL,NULL,NULL,NULL),(9,10,'ARAVIND','J','kottayam','9746242025','kjamoozhoor1844@gmail.com',NULL,NULL,NULL,NULL,NULL),(10,11,'Athira','J',' mnvn','9746242025','kjamoozhoor1844@gmail.com',NULL,NULL,NULL,NULL,NULL),(11,12,'Athira','J','Ettumanoor','9876543218','asdsf@vhg.com',NULL,NULL,NULL,NULL,NULL),(12,13,'Athira','J','kottayam','7894561238','kjathira8774@gmail.com',NULL,NULL,NULL,NULL,NULL),(13,15,'ARSHA','J','kollam','7894561237','arshaj@gmail.com','female','arshabhavan,kottarakkara p.o,kollam','Kerala','Kollam','691506');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
