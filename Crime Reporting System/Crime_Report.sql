/* By Tanaygeet Shrivastava */


/* Task -1 - Database Design */

-- 1
CREATE DATABASE Crime_Report;
USE Crime_Report;


-- 2(i) - Table for storing Incidents
CREATE TABLE Incidents (
    IncidentID INT PRIMARY KEY AUTO_INCREMENT,
    IncidentType VARCHAR(255) NOT NULL,
    IncidentDate DATE NOT NULL,
    Location VARCHAR(255) NOT NULL,
    Description TEXT,
    Status VARCHAR(50) NOT NULL,
    VictimID INT,
    SuspectID INT,
    FOREIGN KEY (VictimID) REFERENCES Victims(VictimID),
    FOREIGN KEY (SuspectID) REFERENCES Suspects(SuspectID));


-- 2(ii) - Table for storing Victims
CREATE TABLE Victims (
    VictimID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    DateOfBirth DATE,
    Gender VARCHAR(10),
    ContactInfo VARCHAR(255));


-- 2(iii) - Table for storing Suspects
CREATE TABLE Suspects (
    SuspectID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    DateOfBirth DATE,
    Gender VARCHAR(10),
    ContactInfo VARCHAR(255));


-- 2(iv) - Table for storing Law Enforcement Agencies
CREATE TABLE Agencies (
    AgencyID INT PRIMARY KEY AUTO_INCREMENT,
    AgencyName VARCHAR(255) NOT NULL,
    Jurisdiction VARCHAR(255),
    ContactInfo VARCHAR(255));


-- 2(v) - Table for storing Officers
CREATE TABLE Officers (
    OfficerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    BadgeNumber VARCHAR(50),
    Rank VARCHAR(50),
    ContactInfo VARCHAR(255),
    AgencyID INT,
    FOREIGN KEY (AgencyID) REFERENCES Agencies(AgencyID));


-- 2(vi) - Table for storing Evidence
CREATE TABLE Evidence (
    EvidenceID INT PRIMARY KEY AUTO_INCREMENT,
    Description TEXT,
    LocationFound VARCHAR(255),
    IncidentID INT,
    FOREIGN KEY (IncidentID) REFERENCES Incidents(IncidentID));


-- 2(vii) - Table for storing Reports
CREATE TABLE Reports (
    ReportID INT PRIMARY KEY AUTO_INCREMENT,
    IncidentID INT,
    ReportingOfficerID INT,
    ReportDate DATE,
    ReportDetails TEXT,
    Status VARCHAR(50),
    FOREIGN KEY (IncidentID) REFERENCES Incidents(IncidentID),
    FOREIGN KEY (ReportingOfficerID) REFERENCES Officers(OfficerID));


-- 2(viii) - Table for storing Cases
CREATE TABLE Cases (
    CaseID INT PRIMARY KEY AUTO_INCREMENT,
    CaseDescription TEXT,
    CaseStatus VARCHAR(50),
    IncidentID INT,
    FOREIGN KEY (IncidentID) REFERENCES Incidents(IncidentID));



/* Inserting Sample Data Into Tables */

-- 3(i) 
INSERT INTO Incidents (IncidentType, IncidentDate, Location, Description, Status, VictimID, SuspectID) VALUES
('Robbery', '2024-07-01', geography::STGeomFromText('POINT(28.6139 77.2090)', 4326), 'Street robbery involving two suspects in Delhi', 'Open', 1, 1),
('Homicide', '2024-06-15', geography::STGeomFromText('POINT(19.0760 72.8777)', 4326), 'Murder in a residential area in a apartment in Mumbai', 'Under Investigation', 2, 2),
('Theft', '2024-05-20', geography::STGeomFromText('POINT(13.0827 80.2707)', 4326), 'Car stolen from the parking lot in Chennai', 'Closed', 3, 3),
('Assault', '2024-07-10', geography::STGeomFromText('POINT(17.3850 78.4867)', 4326), 'Physical altercation between two individuals in Hyderabad', 'Open', 4, 4),
('Burglury', '2024-08-05', geography::STGeomFromText('POINT(22.5726 88.3639)', 4326), 'Bank robbery in Kolkata', 'Under Investigation', 5, 5),
('Fraud', '2024-09-01', geography::STGeomFromText('POINT(23.0225 72.5714)', 4326), 'Credit card fraud investigation in Ahmedabad', 'Closed', 6, 6),
('Vandalism', '2024-06-30', geography::STGeomFromText('POINT(12.9716 77.5946)', 4326), 'Graffiti on public property in Bengaluru', 'Open', 7, 7),
('Drug Possession', '2024-07-20', geography::STGeomFromText('POINT(18.5204 73.8567)', 4326), 'Possession of illegal substances in Pune', 'Open', 8, 8),
('Arson', '2024-08-15', geography::STGeomFromText('POINT(26.9124 75.7873)', 4326), 'Deliberate fire set to a building', 'Under Investigation', 9, 9),
('Kidnapping', '2024-09-12', geography::STGeomFromText('POINT(8.5241 76.9366)', 4326), 'Abduction of a minor from a playground in Thiruvananthapuram', 'Closed', 10, 10);


-- 3(ii)
INSERT INTO Victims (FirstName, LastName, DateOfBirth, Gender, ContactInfo) VALUES
('Rajesh', 'Kumar', '1985-05-12', 'M', '123 North Street, Delhi, 9876543210'),
('Pooja', 'Sharma', '1990-03-15', 'F', '456 East Road, Delhi, 9876543211'),
('Arvind', 'Verma', '1978-11-22', 'M', '789 South Lane, Mumbai, 9876543212'),
('Lakshmi', 'Nair', '1992-04-19', 'F', '321 West Avenue, Chennai, 9876543213'),
('Neha', 'Gupta', '1989-09-30', 'F', '654 Park Street, Kolkata, 9876543214'),
('Suresh', 'Yadav', '1975-12-07', 'M', '987 Central Road, Lucknow, 9876543215'),
('Dinesh', 'Reddy', '1982-02-14', 'M', '147 Riverbank, Hyderabad, 9876543216'),
('Priya', 'Mehta', '1991-08-25', 'F', '321 Green Valley, Pune, 9876543217'),
('Venkatesh', 'Iyer', '1980-07-04', 'M', '789 Lakeview, Bengaluru, 9876543218'),
('Sunita', 'Chauhan', '1988-01-16', 'F', '135 Oak Street, Jaipur, 9876543219');


-- 3(iii)
INSERT INTO Suspects (FirstName, LastName, DateOfBirth, Gender, ContactInfo) VALUES
('Raghavendra', 'Rao', '1977-06-30', 'M', '9A Marina Street, Chennai, 8876543210'),
('Ankit', 'Verma', '1981-03-10', 'M', '12B Pearl Road, Jaipur, 8876543211'),
('Kavita', 'Sharma', '1993-07-18', 'F', '14C Lotus Avenue, Delhi, 8876543212'),
('Aravind', 'Swaminathan', '1984-10-02', 'M', '18D Jasmine Lane, Hyderabad, 8876543213'),
('Dinesh', 'Nair', '1986-05-28', 'M', '20E Palm Street, Kochi, 8876543214'),
('Priya', 'Reddy', '1990-11-15', 'F', '23F Cedar Road, Bengaluru, 8876543215'),
('Suresh', 'Patel', '1988-01-25', 'M', '25G Oak Lane, Ahmedabad, 8876543216'),
('Sunita', 'Yadav', '1992-02-07', 'F', '28H Maple Avenue, Bhopal, 8876543217'),
('Rajesh', 'Singh', '1979-09-09', 'M', '30I Birch Road, Delhi, 8876543218'),
('Lakshmi', 'Menon', '1985-03-12', 'F', '35J Banyan Lane, Thiruvananthapuram, 8876543219');


-- 3(iv)
INSERT INTO Officers (FirstName, LastName, BadgeNumber, Rank, ContactInfo, AgencyID) VALUES
('Tanaygeet', 'Shrivastava', 'B1234', 'Detective', '35 North Road, Delhi, 8876543220', 1),
('Anil', 'Kumar', 'B1235', 'Sergeant', '45 South Street, Mumbai, 8876543221', 2),
('Ravi', 'Iyer', 'B1236', 'Inspector', '55 East Avenue, Chennai, 8876543222', 3),
('Srinivas', 'Reddy', 'B1237', 'Constable', '65 West Lane, Hyderabad, 8876543223', 4),
('Arun', 'Nair', 'B1238', 'Sergeant', '75 Park Street, Kochi, 8876543224', 5),
('Kiran', 'Patel', 'B1239', 'Inspector', '85 River Road, Ahmedabad, 8876543225', 6),
('Meena', 'Verma', 'B1240', 'Constable', '95 Lakeview, Bengaluru, 8876543226', 7),
('Priyanka', 'Gupta', 'B1241', 'Inspector', '105 Mountain Street, Pune, 8876543227', 8),
('Manoj', 'Chauhan', 'B1242', 'Sergeant', '115 Valley Lane, Jaipur, 8876543228', 9),
('Sandeep', 'Swaminathan', 'B1243', 'Constable', '125 Oakwood, Thiruvananthapuram, 8876543229', 10);


-- 3(v)
INSERT INTO Agencies (AgencyName, Jurisdiction, ContactInfo) VALUES
('Delhi Police', 'Delhi', 'HQ: North Block, Delhi, 7654345677'),
('Mumbai Police', 'Mumbai', 'HQ: Crawford Market, Mumbai, 6543567763'),
('Chennai Police', 'Chennai', 'HQ: Ezhilagam Building, Chennai, 7654567876'),
('Hyderabad Police', 'Hyderabad', 'HQ: Basheerbagh, Hyderabad, 9876567898'),
('Kochi Police', 'Kochi', 'HQ: Marine Drive, Kochi, 9876545678'),
('Ahmedabad Police', 'Ahmedabad', 'HQ: Shahibaug, Ahmedabad, 8765434567'),
('Bengaluru Police', 'Bengaluru', 'HQ: Infantry Road, Bengaluru, 8765434566'),
('Pune Police', 'Pune', 'HQ: Shivaji Nagar, Pune, 6543234567'),
('Jaipur Police', 'Jaipur', 'HQ: Lal Kothi, Jaipur, 9876545678'),
('Kerala Police', 'Thiruvananthapuram', 'HQ: Police Headquarters, Thiruvananthapuram, 7654345654');


-- 3(vi)
INSERT INTO Evidence (Description, LocationFound, IncidentID)
VALUES
('Fingerprint on weapon', 'Street corner', 1),
('Blood sample', 'Crime scene', 2),
('CCTV footage', 'Parking lot', 3),
('Weapon used in assault', 'Nearby park', 4),
('Tool used to break in', 'Storefront', 5),
('Fraudulent transaction receipt', 'Bank statement', 6),
('Spray paint can', 'Street wall', 7),
('Drugs found in the suspect’s car', 'Parking garage', 8),
('Charred remains of the building', 'Building exterior', 9),
('Suspect’s clothing', 'Park near playground', 10);


-- 3(vii)
INSERT INTO Reports (IncidentID, ReportingOfficerID, ReportDate, ReportDetails, Status)
VALUES
(1, 1, '2024-09-16', 'Initial investigation into street robbery', 'Draft'),
(2, 2, '2024-09-17', 'Homicide investigation report', 'Finalized'),
(3, 3, '2024-09-11', 'Theft investigation closed', 'Finalized'),
(4, 4, '2024-09-06', 'Assault investigation ongoing', 'Draft'),
(5, 5, '2024-09-21', 'Burglary case closed with suspect in custody', 'Finalized'),
(6, 6, '2024-09-26', 'Fraud investigation opened', 'Draft'),
(7, 7, '2024-09-13', 'Vandalism case resolved', 'Finalized'),
(8, 8, '2024-09-19', 'Drug possession case under investigation', 'Draft'),
(9, 9, '2024-09-22', 'Arson investigation started', 'Draft'),
(10, 10, '2024-09-23', 'Kidnapping investigation ongoing', 'Draft');


-- 3 (viii)
INSERT INTO Cases (CaseDescription, CaseStatus, IncidentID)
VALUES
('Robbery case involving multiple suspects', 'Open', 1),
('Homicide case under investigation', 'Under Investigation', 2),
('Theft case closed with a guilty verdict', 'Closed', 3),
('Assault case awaiting court proceedings', 'Open', 4),
('Burglary case resolved, awaiting trial', 'Closed', 5),
('Fraud case involving multiple transactions', 'Open', 6),
('Vandalism case resolved with community service sentence', 'Closed', 7),
('Drug possession case pending further investigation', 'Under Investigation', 8),
('Arson case involving property damage', 'Open', 9),
('Kidnapping case involving ransom demands', 'Under Investigation', 10);







