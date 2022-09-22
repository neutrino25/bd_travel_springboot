create database bdtravel;
use bdtravel;

create table `scenic`(
`id` int not null auto_increment,
`name` varchar(200) default null,
`theme` varchar(200) default null,
`addr` varchar(200) default null,
`feature` varchar(500) default null,
`pic` varchar(200) default null,
`sales` int default 0,
primary key (`id`)
);

create table `tastyfood`(
`id` int not null auto_increment,
`name` varchar(200) default null,
`describe` varchar(200) default null,
`commend` varchar(200) default null,
`pic` varchar(200) default null,
primary key (`id`)
);

create table `ticket`(
`id` int not null auto_increment,
`fid` int not null,
`name` varchar(200) default null,
`explain` varchar(500) default null,
`dprice` double default null,
`mprice` double default null,
primary key (`id`)
);

CREATE TABLE `user` (
  `userid` varchar(50) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,/*是否激活*/
  `code` varchar(64) DEFAULT NULL,/*激活码*/
  PRIMARY KEY (`userid`)
);

create table `manager` (
  `managerid` varchar(50) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `flag` int DEFAULT 0,/*这是标志位，0为admin，1为root*/
  PRIMARY KEY (`managerid`)
);

CREATE TABLE `order` (
  `id` int NOT NULL auto_increment,
  `tid` int NOT NULL,
  `uid` varchar(50) not null,
  `paid` double DEFAULT NULL,
  `num` int DEFAULT NULL,
  `no` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `state` int DEFAULT 0,
  PRIMARY KEY (`id`)
);

select * from `ticket`;
select * from `tastyfood`;
select * from `scenic`;  