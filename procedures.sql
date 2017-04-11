-- ORAN CAN
DELIMITER ;
DELIMITER $$

CREATE PROCEDURE departureTimeUpdate(t TIMESTAMP, num CHAR(7))
BEGIN
 	UPDATE `flights` SET `departure_time` = t WHERE `flight_number` = num;
END $$

CREATE PROCEDURE buyTicket(class CHAR(11), name CHAR(20), customer_no VARCHAR(11), age INT, isFemale BOOLEAN, cost INT, flight_number CHAR(7))
BEGIN
	INSERT INTO `passengers`(`class`, `name`, `customer_no`, `age`, `isFemale`)
		VALUES (class, name, customer_no, age, isFemale, cost);
	INSERT INTO `flies`(`cost`, `customer_no`, `flight_number`)
		VALUES (cost, customer_no, flight_number);
END $$ 

CREATE PROCEDURE newAirline(airline_code CHAR(4), airline_name CHAR(20))
BEGIN
	INSERT INTO `airlines`(`airline_code`, `airline_name`)
		VALUES (airline_code, airline_name);
END $$
-- ORAN CAN END
