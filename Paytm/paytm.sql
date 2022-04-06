create database paytm;
use paytm;

CREATE TABLE `Branches`
(
 `ID`               integer(10) NOT NULL ,
 `Name`             varchar(255) NOT NULL ,
 `NumberOfAccounts` integer(10) NOT NULL ,
 `BranchCode`       integer(20) NOT NULL ,
 `Address`          varchar(300) NOT NULL ,

PRIMARY KEY (`ID`)
);


CREATE TABLE `Customers`
(
 `ID`        integer(10) NOT NULL ,
 `FirstName` varchar(200) NOT NULL ,
 `LastName`  varchar(200) NULL ,
 `Mobile`    integer(10) NOT NULL ,
 `DOB`       date NOT NULL ,

PRIMARY KEY (`ID`)
);


CREATE TABLE `Accounts`
(
 `AccountNumber` integer(10) NOT NULL ,
 `AccountType`   integer(10) NOT NULL ,
 `Branch_ID`     integer(10) NOT NULL ,
 `Balance`       integer NOT NULL ,

PRIMARY KEY (`AccountNumber`),
KEY `FK_601` (`Branch_ID`),
CONSTRAINT `FK_599` FOREIGN KEY `FK_601` (`Branch_ID`) REFERENCES `Branches` (`ID`)
);


CREATE TABLE `CustAccounts`
(
 `Id`            integer(10) NOT NULL ,
 `CustID`        integer(10) NOT NULL ,
 `AccountNumber` integer(10) NOT NULL ,
 `BranchID`      integer(10) NOT NULL ,

PRIMARY KEY (`Id`),
KEY `FK_745` (`CustID`),
CONSTRAINT `FK_743` FOREIGN KEY `FK_745` (`CustID`) REFERENCES `Customers` (`ID`),
KEY `FK_755` (`AccountNumber`),
CONSTRAINT `FK_753` FOREIGN KEY `FK_755` (`AccountNumber`) REFERENCES `Accounts` (`AccountNumber`)
);

