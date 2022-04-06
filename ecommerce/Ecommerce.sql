
-- ************************************** `Customer`
create database ecommerce;
use  ecommerce;
CREATE TABLE `Customer`
(
 `CustID`     int NOT NULL ,
 `First_Name` varchar(45) NOT NULL ,
 `Last_Name`  varchar(45) NOT NULL ,
 `Address`    varchar(345) NOT NULL ,
 `Mobile1`    decimal(10) NOT NULL ,
 `Mobile2`    decimal(10) NULL ,
 `Email1`     varchar(45) NULL ,
 `Email2`     varchar(45) NULL ,

PRIMARY KEY (`CustID`)
);


-- ************************************** `Payment`

CREATE TABLE `Payment`
(
 `ID`     int NOT NULL ,
 `Amount` numeric NOT NULL ,
 `status` enum("pending","confirmed") NOT NULL ,

PRIMARY KEY (`ID`)
);


-- ************************************** `Order`

CREATE TABLE `Order`
(
 `ID`         int NOT NULL ,
 `CustID`     int NOT NULL ,
 `Payment_ID` int NOT NULL ,
 `Total`      int NOT NULL ,

PRIMARY KEY (`ID`),
KEY `FK_397` (`CustID`),
CONSTRAINT `FK_395` FOREIGN KEY `FK_397` (`CustID`) REFERENCES `Customer` (`CustID`),
KEY `FK_423` (`Payment_ID`),
CONSTRAINT `FK_421` FOREIGN KEY `FK_423` (`Payment_ID`) REFERENCES `Payment` (`ID`)
);






-- ************************************** `Supplier`

CREATE TABLE `Supplier`
(
 `ID`          int NOT NULL ,
 `Name`        varchar(45) NOT NULL ,
 `Mobile`      decimal(10) NOT NULL ,
 `Email`       varchar(45) NOT NULL ,
 `PAN_Card_No` varchar(12) NOT NULL ,

PRIMARY KEY (`ID`)
);






-- ************************************** `Item_Category`

CREATE TABLE `Item_Category`
(
 `ID`   int NOT NULL ,
 `name` varchar(45) NOT NULL ,

PRIMARY KEY (`ID`)
);





-- ************************************** `Items`

CREATE TABLE `Items`
(
 `ID`          int NOT NULL ,
 `Supplier_ID` int NOT NULL ,
 `Category_ID` int NOT NULL ,
 `price`       numeric NOT NULL ,
 `Name`        varchar(200) NOT NULL ,
 `Description` varchar(300) NOT NULL ,

PRIMARY KEY (`ID`),
KEY `FK_379` (`Category_ID`),
CONSTRAINT `FK_377` FOREIGN KEY `FK_379` (`Category_ID`) REFERENCES `Item_Category` (`ID`),
KEY `FK_388` (`Supplier_ID`),
CONSTRAINT `FK_386` FOREIGN KEY `FK_388` (`Supplier_ID`) REFERENCES `Supplier` (`ID`)
);






-- ************************************** `Order_Details`

CREATE TABLE `Order_Details`
(
 `ID`         int NOT NULL ,
 `Cust_ID`    int NOT NULL ,
 `Payment_ID` int NULL ,
 `Total`      int NULL ,

PRIMARY KEY (`ID`),
KEY `FK_479` (`Payment_ID`),
CONSTRAINT `FK_477` FOREIGN KEY `FK_479` (`Payment_ID`) REFERENCES `Payment` (`ID`)
);








-- ************************************** `Order_Items`

CREATE TABLE `Order_Items`
(
 `ID`       int NOT NULL ,
 `Item_ID`  int NOT NULL ,
 `Order_ID` int NOT NULL ,
 `Quantity` int NOT NULL ,

PRIMARY KEY (`ID`),
KEY `FK_464` (`Order_ID`),
CONSTRAINT `FK_462` FOREIGN KEY `FK_464` (`Order_ID`) REFERENCES `Order_Details` (`ID`),
KEY `FK_482` (`Item_ID`),
CONSTRAINT `FK_480` FOREIGN KEY `FK_482` (`Item_ID`) REFERENCES `Items` (`ID`)
);






-- ************************************** `Shopping_Session`

CREATE TABLE `Shopping_Session`
(
 `ID`     int NOT NULL ,
 `CustID` int NOT NULL ,
 `Total`  numeric NOT NULL ,

PRIMARY KEY (`ID`),
KEY `FK_516` (`CustID`),
CONSTRAINT `FK_514` FOREIGN KEY `FK_516` (`CustID`) REFERENCES `Customer` (`CustID`)
);






-- ************************************** `Cart_Item`

CREATE TABLE `Cart_Item`
(
 `ID`         int NOT NULL ,
 `Item_ID`    int NOT NULL ,
 `Seesion_ID` int NOT NULL ,
 `Total`      numeric NOT NULL ,
 `Quantity`   int NOT NULL ,

PRIMARY KEY (`ID`),
KEY `FK_491` (`Item_ID`),
CONSTRAINT `FK_489` FOREIGN KEY `FK_491` (`Item_ID`) REFERENCES `Items` (`ID`),
KEY `FK_501` (`Seesion_ID`),
CONSTRAINT `FK_499` FOREIGN KEY `FK_501` (`Seesion_ID`) REFERENCES `Shopping_Session` (`ID`)
);









