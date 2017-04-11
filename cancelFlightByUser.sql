DELIMITER ;
DELIMITER $$

CREATE PROCEDURE cancelFlightbyPassenger(customerNoEntered VARCHAR(11), flightNumEntered CHAR(7))
BEGIN

DELETE FROM flies WHERE customer_no = customerNoEntered AND flight_number = flightNumEntered;

COMMIT;

DELETE FROM passengers
WHERE passengers.customer_no NOT IN (SELECT customer_no FROM flies);

END $$
