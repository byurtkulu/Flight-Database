CREATE DATABASE IF NOT EXISTS flight_cs306;
USE flight_cs306;

--
-- MARK: CREATE ENTITY SETS
--

CREATE TABLE IF NOT EXISTS `flights` (
	`flight_ID`CHAR(4),
	`plane_model` CHAR(20),
	`departure_time` TIMESTAMP,
	`isDomestic` BOOLEAN,
	PRIMARY KEY (`flight_ID`)
);

CREATE TABLE IF NOT EXISTS `airway` (
	`airway_ID` CHAR(4), -- IATA states that airway ID's consist of 4 chars
	`airway_name` CHAR(20),
	PRIMARY KEY (`airway_ID`)
);

CREATE TABLE IF NOT EXISTS `employee` (
	`ssn` INTEGER,
	`name` CHAR(20),
	`service_type` CHAR(20),
	PRIMARY KEY (`ssn`)
);

CREATE TABLE IF NOT EXISTS `passenger` (
	`class` CHAR(11), -- since max length is 11 with "first class"
	`name` CHAR(20),
	`customer_no` INTEGER,
	PRIMARY KEY (`customer_no`)
);

--
-- MARK: CREATE RELATIONSHIPS
--

CREATE TABLE IF NOT EXISTS `belongs` (
	`airway_ID` CHAR(4),
	`flight_ID` CHAR(4),
	FOREIGN KEY (`airway_ID`) REFERENCES `airway`(`airway_ID`),
	FOREIGN KEY (`flight_ID`) REFERENCES `flights`(`flight_ID`),
	PRIMARY KEY (`airway_ID`, `flight_ID`)
);

CREATE TABLE IF NOT EXISTS `works_in` (
	`since` DATETIME,
	`airway_ID` CHAR(4),
	`ssn` INTEGER,
	FOREIGN KEY (`airway_ID`) REFERENCES `airway`(`airway_ID`),
	FOREIGN KEY (`ssn`) REFERENCES `employee`(`ssn`),
	PRIMARY KEY (`ssn`, `airway_ID`)
);

CREATE TABLE IF NOT EXISTS `flies` (
	`cost` INTEGER,
	`customer_no` INTEGER,
	`flight_ID` CHAR(4),
	FOREIGN KEY (`flight_ID`) REFERENCES flights(`flight_ID`),
	FOREIGN KEY (`customer_no`) REFERENCES `passenger`(`customer_no`),
	PRIMARY KEY (`flight_ID`, `customer_no`)
);

--
-- MARK: CREATE CHILD CLASSES
--

CREATE TABLE IF NOT EXISTS `contracted` (
	`contract_ID` INTEGER,  /*INTEGER???*/
	`employee_ssn` INTEGER,
	FOREIGN KEY (`employee_ssn`) REFERENCES `employee`(`ssn`),
	PRIMARY KEY (`employee_ssn`)
);

CREATE TABLE IF NOT EXISTS `hourly` (
	`hourly_wages` INTEGER,
	`hours_worked` INTEGER,
	`employee_ssn` INTEGER,
	FOREIGN KEY (`employee_ssn`) REFERENCES `employee`(`ssn`),
	PRIMARY KEY (`employee_ssn`)
);

CREATE TABLE IF NOT EXISTS `passaport_entry` (
	`passaport_ID` INTEGER,
	`customer_no` INTEGER,
	FOREIGN KEY (`customer_no`) REFERENCES `passenger`(`customer_no`),
	PRIMARY KEY (`customer_no`)
);

CREATE TABLE IF NOT EXISTS `turkish_entry` (
	`turkish_ID` INTEGER,
	`customer_no` INTEGER,
	FOREIGN KEY (`customer_no`) REFERENCES `passenger`(`customer_no`),
	PRIMARY KEY (`customer_no`)
);
