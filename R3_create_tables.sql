/*
 * R3 Implementation of the Schema in MySQL
 * By Angel Zaykov, Inna Vasileva and Margi Tran
 */


/*
 * Dropping foreign keys in order to delete tables 
 */

ALTER TABLE A1Department
	DROP FOREIGN KEY A1Department_fk1;
		
ALTER TABLE A1Shift
	DROP FOREIGN KEY A1Shift_fk1;
	
ALTER TABLE A1TourTicket
	DROP FOREIGN KEY A1TourTicket_fk1, DROP FOREIGN KEY A1TourTicket_fk2;
	
ALTER TABLE A1Manager
	DROP FOREIGN KEY A1Manager_fk1;

ALTER TABLE A1Employee
	DROP FOREIGN KEY A1Employee_fk1, DROP FOREIGN KEY A1Employee_fk2;
	
ALTER TABLE A1CanDoTour
	DROP FOREIGN KEY A1Tour_fk1, DROP FOREIGN KEY A1Tour_fk2;
	

ALTER TABLE A1ActualTour
	DROP FOREIGN KEY A1ActualTour_fk1, DROP FOREIGN KEY A1ActualTour_fk2, DROP FOREIGN KEY A1ActualTour_fk3;
	
ALTER TABLE A1Guide
	DROP FOREIGN KEY A1Guide_fk1;

DROP TABLE IF EXISTS A1Guide;
DROP TABLE IF EXISTS A1Department;
DROP TABLE IF EXISTS A1Shift;
DROP TABLE IF EXISTS A1ActualTour;
DROP TABLE IF EXISTS A1TourTicket;
DROP TABLE IF EXISTS A1Ticket;
DROP TABLE IF EXISTS A1CanDoTour;
DROP TABLE IF EXISTS A1Manager;
DROP TABLE IF EXISTS A1Employee;
DROP TABLE IF EXISTS A1GeneralTour;
DROP TABLE IF EXISTS A1Transport;


/* 
 * All tables are first created with primary keys only
 */

-- Table for A1Employee 
CREATE TABLE IF NOT EXISTS A1Employee (
	empID int(8) NOT NULL,
	firstName VARCHAR(20) NOT NULL,
	lastName VARCHAR(20) NOT NULL,
	gender CHAR(1) NOT NULL,
	dateOfBirth date NOT NULL,
	empDeptNo VARCHAR(4),
	supEmpID INT(8),
	PRIMARY KEY (empID)
) ENGINE=INNODB;

-- Table for A1Manager 
CREATE TABLE IF NOT EXISTS A1Manager (
	mEmpID int(8) NOT NULL,
	officeNo VARCHAR(4),
	phoneNo VARCHAR(11),
	PRIMARY KEY (mEmpID)
) ENGINE=INNODB;

-- Table for A1Guide 
CREATE TABLE IF NOT EXISTS A1Guide (
	gEmpID int(8) NOT NULL,
	guideCredits INT DEFAULT 0,  # All new guides will start off with 0 credits
	PRIMARY KEY (gEmpID)
) ENGINE=INNODB;

-- Table for A1Department 
CREATE TABLE IF NOT EXISTS A1Department (
	deptNo VARCHAR(4) NOT NULL,
	deptName VARCHAR(20) NOT NULL,
	dMEmpID INT(8) NOT NULL,
	PRIMARY KEY (deptNo)
) ENGINE=INNODB;

-- Table for A1Ticket 
DROP TABLE IF EXISTS A1Ticket;
CREATE TABLE IF NOT EXISTS A1Ticket (
	type VARCHAR(20) NOT NULL,
	price DECIMAL(4,2) NOT NULL,
	PRIMARY KEY (type)
) ENGINE=INNODB;

-- Table for A1TourTicket 
CREATE TABLE IF NOT EXISTS A1TourTicket (
	ttTourID VARCHAR(5) NOT NULL,
	ttType VARCHAR(20) NOT NULL,
	noOfTicketsSold INT DEFAULT 0,
	PRIMARY KEY (ttTourID, ttType)
) ENGINE=INNODB;

-- Table for A1GeneralTour
CREATE TABLE IF NOT EXISTS A1GeneralTour (
	tourCode VARCHAR(4) NOT NULL,
	tourName VARCHAR(20) NULL NULL,
	departure VARCHAR(20) NOT NULL,
	destination VARCHAR(20) NOT NULL,
	distance INT NOT NULL,
	PRIMARY KEY (tourCode)
) ENGINE=INNODB;

-- Table for A1ActualTour
CREATE TABLE IF NOT EXISTS A1ActualTour (
	tourID VARCHAR(5) NULL NULL,
	atTourCode VARCHAR(4) NOT NULL,
	date DATE NOT NULL,
	atTransport VARCHAR(20) NOT NULL,
	duration INT NOT NULL,
	tourCredits INT NOT NULL,
	atEmpID INT(8),
	PRIMARY KEY (tourID)
) ENGINE=INNODB;

-- Table for A1Transport 
CREATE TABLE IF NOT EXISTS A1Transport (
	type VARCHAR(20) NOT NULL,
	noOfSeats INT NOT NULL,
	avgSpeed INT NOT NULL,
	PRIMARY KEY (type)
) ENGINE=INNODB;

-- Table for A1Shift
CREATE TABLE IF NOT EXISTS A1Shift (
	sEmpID INT(8) NOT NULL,
	day INT NOT NULL,
	PRIMARY KEY (sEmpID, day)
) ENGINE=INNODB;

-- Table for A1CanDoTour
CREATE TABLE IF NOT EXISTS A1CanDoTour (
	cTourID VARCHAR(5),
	cEmpID INT(8),
	PRIMARY KEY (cTourID, cEmpID)
) ENGINE=INNODB;


/*
 * Constraints are added 
 */
-- Constraints for A1Department
ALTER TABLE A1Department
	ADD CONSTRAINT A1Department_fk1 FOREIGN KEY (dMEmpID) REFERENCES A1Manager (mEmpID);
	
-- Constraints for A1Guide
ALTER TABLE A1Guide
	ADD CONSTRAINT A1Guide_fk1 FOREIGN KEY (gEmpID) REFERENCES A1Employee (empID) ON DELETE CASCADE;
	
-- Constraints for A1Shift
-- If a guide is deleted, then all their corresponding shifts should also be removed
ALTER TABLE A1Shift
	ADD CONSTRAINT A1Shift_fk1 FOREIGN KEY (sEmpID) REFERENCES A1Guide (gEmpID) ON DELETE CASCADE;
	
-- Constraints for A1TourTicket
-- If a tour is deleted (the reason could be that it is cancelled) then all the tickets for that tour and the tour itself should be removed
ALTER TABLE A1TourTicket
	ADD CONSTRAINT A1TourTicket_fk1 FOREIGN KEY (ttTourID) REFERENCES A1ActualTour (tourID) ON DELETE CASCADE,
	ADD CONSTRAINT A1TourTicket_fk2 FOREIGN KEY (ttType) REFERENCES A1Ticket (type);
	
-- Constraints for A1Manager
-- If a manager is deleted it should be known that a department is missing a manager so that a replacement can be found
ALTER TABLE A1Manager
	ADD CONSTRAINT A1Manager_fk1 FOREIGN KEY (mEmpID) REFERENCES A1Employee (empID);

-- Constraints for A1Employee
-- If an employee is deleted then employees supervised by that employee no longer have a supervisor
ALTER TABLE A1Employee
	ADD CONSTRAINT A1Employee_fk1 FOREIGN KEY (empDeptNo) REFERENCES A1Department (deptNo),
	ADD CONSTRAINT A1Employee_fk2 FOREIGN KEY (supEmpID) REFERENCES A1Employee (empID) ON DELETE SET NULL ON UPDATE CASCADE;
	
-- Constraints for A1ActualTour
ALTER TABLE A1ActualTour
	ADD CONSTRAINT A1ActualTour_fk1 FOREIGN KEY (atEmpID) REFERENCES A1Guide (gEmpID),
	ADD CONSTRAINT A1ActualTour_fk2 FOREIGN KEY (atTourCode) REFERENCES A1GeneralTour (tourCode),
	ADD CONSTRAINT A1ActualTour_fk3 FOREIGN KEY (atTransport) REFERENCES A1Transport (type);
	
-- Constraints for A1CanDoTour
ALTER TABLE A1CanDoTour
	ADD CONSTRAINT A1CanDoTour_fk1 FOREIGN KEY (cEmpID) REFERENCES A1Guide (gEmpID),
	ADD CONSTRAINT A1CanDoTour_fk2 FOREIGN KEY (cTourID) REFERENCES A1ActualTour (tourID);
