create database imdb;
use imdb;

CREATE TABLE `Actors`
(
 `Id`         integer(10) NOT NULL ,
 `First Name` varchar(255) NOT NULL ,
 `LastName`   varchar(255) NULL ,
 `Rating`     decimal(4,2) NOT NULL ,
 `Gender`     enum("male","female") NOT NULL ,
 `Country`    varchar(255) NOT NULL ,

PRIMARY KEY (`Id`)
);

CREATE TABLE `Movies`
(
 `ID`         integer(10) NOT NULL ,
 `Name`       varchar(255) NOT NULL ,
 `Actor_Id`   integer(10) NOT NULL ,
 `Title`      varchar(255) NOT NULL ,
 `Year`       date NOT NULL ,
 `Producer`   varchar(255) NOT NULL ,
 `Movie_Type` varchar(255) NOT NULL ,
 `Country`    varchar(255) NOT NULL ,
 `Rating`     decimal(4,2) NOT NULL ,

PRIMARY KEY (`ID`),
KEY `FK_575` (`Actor_Id`),
CONSTRAINT `FK_573` FOREIGN KEY `FK_575` (`Actor_Id`) REFERENCES `Actors` (`Id`)
);



CREATE TABLE `TV Series`
(
 `Id`          integer(10) NOT NULL ,
 `Name`        varchar(255) NOT NULL ,
 `Actor_ID`    integer(10) NOT NULL ,
 `Title`       varchar(255) NOT NULL ,
 `year`        date NOT NULL ,
 `Rating`      decimal(4,2) NOT NULL ,
 `Producer`    varchar(255) NOT NULL ,
 `Series_Type` varchar(255) NOT NULL ,
 `Country`     varchar(255) NOT NULL ,

PRIMARY KEY (`Id`),
KEY `FK_578` (`Actor_ID`),
CONSTRAINT `FK_576` FOREIGN KEY `FK_578` (`Actor_ID`) REFERENCES `Actors` (`Id`)
);


