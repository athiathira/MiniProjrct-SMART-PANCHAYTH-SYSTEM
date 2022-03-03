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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `certidetails` */

insert  into `certidetails`(`cdetails_id`,`certificate`,`description`) values (1,'birthcertificate','bbnmnn'),(2,'deathcertificate','gjhmn,m,m,'),(3,'birthcertificate','bbnmnn');

/*Table structure for table `certirequest` */

DROP TABLE IF EXISTS `certirequest`;

CREATE TABLE `certirequest` (
  `crequest_id` int(11) NOT NULL AUTO_INCREMENT,
  `cdetails_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `files` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`crequest_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `certirequest` */

insert  into `certirequest`(`crequest_id`,`cdetails_id`,`user_id`,`status`,`files`) values (1,1,1,'sanction','static/8326bd0f-83c8-4c9c-a020-824af7df736dATHIRA BRITH.jpeg'),(2,2,2,'sanction','static/7c6fa0a1-4f61-4b7a-96df-45a9668c4533ATHIRA BRITH.jpeg'),(3,1,3,'pending',''),(4,1,1,'pending',''),(5,3,3,'pending','');

/*Table structure for table `cimages` */

DROP TABLE IF EXISTS `cimages`;

CREATE TABLE `cimages` (
  `cimages_id` int(11) NOT NULL AUTO_INCREMENT,
  `crequest_id` int(11) DEFAULT NULL,
  `files` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`cimages_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `cimages` */

insert  into `cimages`(`cimages_id`,`crequest_id`,`files`) values (1,1,'static/37ca4f46-b2a8-449f-a163-780dae4a9f74ATHIRA BRITH.jpeg'),(2,2,'static/c4388a99-73da-4340-be51-3f1cd53e2225ATHIRA BRITH.jpeg'),(3,1,'static/6eda8547-59ca-4dfe-93a8-23e19c56d243_DSC3844.jpg');

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

insert  into `complaint`(`complaint_id`,`user_id`,`complaint`,`reply`,`date`) values (1,1,'incorrect name','correct','2022-02-04');

/*Table structure for table `loan` */

DROP TABLE IF EXISTS `loan`;

CREATE TABLE `loan` (
  `loan_id` int(11) NOT NULL AUTO_INCREMENT,
  `loan` varchar(100) DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`loan_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `loan` */

insert  into `loan`(`loan_id`,`loan`,`amount`) values (1,'houseloan','250000'),(2,'houseloan','250000'),(3,'houseloan','400000'),(4,'houseloan','300000');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `user_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`user_type`) values (1,'admin','admin','admin'),(2,'ANNUZZ','annuzz12','user'),(3,'asdfg','qwertyuio','user'),(4,'athiathi','athi1234','user');

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_id` int(11) DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `payment` */

insert  into `payment`(`payment_id`,`tax_id`,`amount`,`date`) values (1,1,'2000','2022-02-09'),(2,1,'2000','2022-02-09'),(3,5,'1000','2022-02-09'),(4,6,'2000','2022-02-11');

/*Table structure for table `request` */

DROP TABLE IF EXISTS `request`;

CREATE TABLE `request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `loan_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `request` */

insert  into `request`(`request_id`,`loan_id`,`user_id`,`status`) values (1,1,1,'accept'),(2,2,1,'reject'),(3,1,3,'accept'),(4,4,3,'pending'),(5,1,3,'pending'),(6,2,3,'pending');

/*Table structure for table `tax` */

DROP TABLE IF EXISTS `tax`;

CREATE TABLE `tax` (
  `tax_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `amount` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tax_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `tax` */

insert  into `tax`(`tax_id`,`user_id`,`type`,`amount`,`status`) values (1,1,'Building','2000','paid'),(2,2,'Building','1000','pending'),(3,2,'Building','1000','pending'),(4,2,'House','1000','pending'),(5,3,'House','1000','paid'),(6,3,'House','2000','paid');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`user_id`,`login_id`,`firstname`,`lastname`,`place`,`phone`,`email`,`gender`,`address`,`state`,`district`,`pincode`) values (1,2,'ANNUZZ','J','KOTTAYAM','7894561239','ANNUZZ@GMAIL.COM','female','ADFKNYHVNMNMHGFFNB','Kerala','Kottayam','654987'),(2,3,'dgghmnjn','kj','KOTTAYAM','7894561239','ANNUZZ@GMAIL.COM','male','ADFKNYHVNMNMHGFFNB','Kerala','Alappuzha','654987'),(3,4,'dgghmnjn','kj','KOTTAYAM','7894561239','ANNUZZ@GMAIL.COM','female','ADFKNYHVNMNMHGFFNB','Kerala','Alappuzha','654987');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
