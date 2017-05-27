/**
 * Copyright (c) 2017 Callan Peter Milne
 *
 * Permission to use, copy, modify, and/or distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
 * REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
 * INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
 * LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
 * OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
 * PERFORMANCE OF THIS SOFTWARE.
 */

CREATE DATABASE `entitysvc`
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `entitysvc`.`Entities` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AppID` int(11) DEFAULT NULL,
  `UserID` int(11) NOT NULL,
  `TypeID` int(11) NOT NULL,
  `Created` datetime NOT NULL,
  `Deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `AppUserTypeID` (`AppID`,`UserID`,`TypeID`),
  KEY `AppUserID` (`AppID`,`UserID`),
  KEY `AppTypeID` (`AppID`,`TypeID`),
  KEY `AppID` (`AppID`),
  KEY `TypeID` (`TypeID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=1118891 DEFAULT CHARSET=utf8;

CREATE TABLE `entitysvc`.`EntityAttributes` (
  `EntityID` int(11) NOT NULL,
  `AttributeKey` varchar(64) NOT NULL,
  `AttributeValue` varchar(255) DEFAULT NULL,
  `Created` datetime NOT NULL,
  `Modified` datetime DEFAULT NULL,
  `Deleted` datetime DEFAULT NULL,
  KEY `EntityID` (`EntityID`),
  KEY `AttributeID` (`EntityID`,`AttributeKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `entitysvc`.`EntityTypes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AppID` int(11) DEFAULT NULL,
  `UserID` int(11) NOT NULL,
  `ParentID` int(11) DEFAULT NULL,
  `ClassName` varchar(45) DEFAULT NULL,
  `Slug` varchar(45) DEFAULT NULL,
  `Label` varchar(50) NOT NULL,
  `Created` datetime NOT NULL,
  `Modified` datetime DEFAULT NULL,
  `Deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `AppID` (`AppID`),
  KEY `UserID` (`UserID`),
  KEY `ParentID` (`ParentID`),
  KEY `UserClassType` (`UserID`,`ClassName`),
  KEY `AppUserClassType` (`AppID`,`UserID`,`ClassName`)
) ENGINE=InnoDB AUTO_INCREMENT=1878803 DEFAULT CHARSET=utf8;

CREATE TABLE `entitysvc`.`TypeAttributes` (
  `TypeID` int(11) NOT NULL,
  `AttributeKey` varchar(64) NOT NULL,
  `Label` varchar(255) DEFAULT NULL,
  `Required` int(1) DEFAULT '0',
  `DefaultValue` varchar(255) DEFAULT NULL,
  `Created` datetime NOT NULL,
  `Modified` datetime DEFAULT NULL,
  `Deleted` datetime DEFAULT NULL,
  KEY `TypeID` (`TypeID`),
  KEY `AttributeID` (`TypeID`,`AttributeKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
