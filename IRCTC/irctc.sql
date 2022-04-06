create database IRCTC;
use IRCTC;
-- ************************************** `Customer`

CREATE TABLE `Customer`
(
 `CustID`   int NOT NULL ,
 `Name`     varchar(45) NOT NULL ,
 `Gender`   enum('male','female') NOT NULL ,
 `Age`      numeric NOT NULL ,
 `Phone_no` numeric NULL ,

PRIMARY KEY (`CustID`)
);


-- ************************************** `Reservation`

CREATE TABLE `Reservation`
(
 `Reservation_ID` numeric NOT NULL ,
 `Arrival`        timestamp NOT NULL ,
 `CustID`         int NOT NULL ,
 `Departure`      time NOT NULL ,
 `Price`          decimal(10,2) NOT NULL ,

PRIMARY KEY (`Reservation_ID`),
KEY `FK_340` (`CustID`),
CONSTRAINT `FK_338` FOREIGN KEY `FK_340` (`CustID`) REFERENCES `Customer` (`CustID`)
);






-- ************************************** `Train`

CREATE TABLE `Train`
(
 `TrainID`         numeric NOT NULL ,
 `TrainNo`         numeric NOT NULL ,
 `AvailablesSeats` numeric NOT NULL ,
 `Arrival Time`    timestamp NOT NULL ,
 `Departure Time`  timestamp NOT NULL ,

PRIMARY KEY (`TrainID`)
);






-- ************************************** `Ticket`

CREATE TABLE `Ticket`
(
 `TicketID`   numeric NOT NULL ,
 `TrainID`    numeric NOT NULL ,
 `IsReserved` bit NOT NULL ,
 `price`      decimal(10,2) NOT NULL ,

PRIMARY KEY (`TicketID`),
KEY `FK_20` (`TrainID`),
CONSTRAINT `FK_18` FOREIGN KEY `FK_20` (`TrainID`) REFERENCES `Train` (`TrainID`)
);

-- ************************************** `Ticket_Reserved`

CREATE TABLE `Ticket_Reserved`
(
 `ID`             int  NOT NULL ,
 `TicketID`       numeric NOT NULL ,
 `Reservation_ID` numeric NOT NULL ,
 `Price`          numeric NOT NULL ,
 `CustID`         int NOT NULL ,

PRIMARY KEY (`ID`),
KEY `FK_326` (`TicketID`),
CONSTRAINT `FK_324` FOREIGN KEY `FK_326` (`TicketID`) REFERENCES `Ticket` (`TicketID`),
KEY `FK_337` (`Reservation_ID`),
CONSTRAINT `FK_335` FOREIGN KEY `FK_337` (`Reservation_ID`) REFERENCES `Reservation` (`Reservation_ID`)
);









