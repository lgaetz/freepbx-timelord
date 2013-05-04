-- phpMyAdmin SQL Dump
-- version 2.11.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 28, 2008 at 02:17 PM
-- Server version: 5.0.56
-- PHP Version: 5.2.6RC4-pl0-gentoo

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `timeclock`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit`
--

DROP TABLE IF EXISTS `audit`;
CREATE TABLE IF NOT EXISTS `audit` (
  `modified_by_ip` varchar(39) NOT NULL default '',
  `modified_by_user` varchar(50) NOT NULL default '',
  `modified_when` bigint(14) NOT NULL,
  `modified_from` bigint(14) NOT NULL,
  `modified_to` bigint(14) NOT NULL,
  `modified_why` varchar(250) NOT NULL default '',
  `user_modified` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`modified_when`),
  UNIQUE KEY `modified_when` (`modified_when`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `audit`
--


-- --------------------------------------------------------

--
-- Table structure for table `dbversion`
--

DROP TABLE IF EXISTS `dbversion`;
CREATE TABLE IF NOT EXISTS `dbversion` (
  `dbversion` decimal(5,1) NOT NULL default '0.0',
  PRIMARY KEY  (`dbversion`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dbversion`
--

INSERT INTO `dbversion` (`dbversion`) VALUES
(1.4);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `empfullname` varchar(50) NOT NULL default '',
  `tstamp` bigint(14) default NULL,
  `employee_passwd` varchar(25) NOT NULL default '',
  `displayname` varchar(50) NOT NULL default '',
  `email` varchar(75) NOT NULL default '',
  `groups` varchar(50) NOT NULL default '',
  `office` varchar(50) NOT NULL default '',
  `admin` tinyint(1) NOT NULL default '0',
  `reports` tinyint(1) NOT NULL default '0',
  `time_admin` tinyint(1) NOT NULL default '0',
  `disabled` tinyint(1) NOT NULL default '0',
  `employid` int(8) NOT NULL,
  PRIMARY KEY  (`empfullname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`empfullname`, `tstamp`, `employee_passwd`, `displayname`, `email`, `groups`, `office`, `admin`, `reports`, `time_admin`, `disabled`, `employid`) VALUES
('admin', NULL, 'xy.RY2HT1QTc2', 'administrator', 'your@email.com', 'Workers', 'Office', 1, 1, 1, 0, 9999);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `groupname` varchar(50) NOT NULL default '',
  `groupid` int(10) NOT NULL auto_increment,
  `officeid` int(10) NOT NULL default '0',
  PRIMARY KEY  (`groupid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`groupname`, `groupid`, `officeid`) VALUES
('Workers', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
CREATE TABLE IF NOT EXISTS `info` (
  `fullname` varchar(50) NOT NULL default '',
  `inout` varchar(50) NOT NULL default '',
  `timestamp` bigint(14) default NULL,
  `notes` varchar(250) default NULL,
  `ipaddress` varchar(39) NOT NULL default '',
  KEY `fullname` (`fullname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `info`
--


-- --------------------------------------------------------

--
-- Table structure for table `metars`
--

DROP TABLE IF EXISTS `metars`;
CREATE TABLE IF NOT EXISTS `metars` (
  `metar` varchar(255) NOT NULL default '',
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `station` varchar(4) NOT NULL default '',
  PRIMARY KEY  (`station`),
  UNIQUE KEY `station` (`station`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `metars`
--


-- --------------------------------------------------------

--
-- Table structure for table `offices`
--

DROP TABLE IF EXISTS `offices`;
CREATE TABLE IF NOT EXISTS `offices` (
  `officename` varchar(50) NOT NULL default '',
  `officeid` int(10) NOT NULL auto_increment,
  PRIMARY KEY  (`officeid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `offices`
--

INSERT INTO `offices` (`officename`, `officeid`) VALUES
('Office', 1);

-- --------------------------------------------------------

--
-- Table structure for table `punchlist`
--

DROP TABLE IF EXISTS `punchlist`;
CREATE TABLE IF NOT EXISTS `punchlist` (
  `punchitems` varchar(50) NOT NULL default '',
  `color` varchar(7) NOT NULL default '',
  `in_or_out` tinyint(1) default NULL,
  PRIMARY KEY  (`punchitems`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `punchlist`
--

INSERT INTO `punchlist` (`punchitems`, `color`, `in_or_out`) VALUES
('in', '#009900', 1),
('out', '#FF0000', 0),
('break', '#FF9900', 0),
('lunch', '#0000FF', 0);

