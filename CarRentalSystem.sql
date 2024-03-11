-- SQL Schema
CREATE TABLE VehicleTable (
    vehicleID INT IDENTITY(1,1) PRIMARY KEY,
    make VARCHAR(255),
    model VARCHAR(255),
    year INT,
    dailyRate DECIMAL(8, 2),
    status VARCHAR(20),
    passengerCapacity INT,
    engineCapacity INT
);

CREATE TABLE CustomersTable (
    customerID INT IDENTITY(1,1) PRIMARY KEY,
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    email VARCHAR(255),
    phoneNumber VARCHAR(20)
);

CREATE TABLE LeaseTable (
    leaseID INT IDENTITY(1,1) PRIMARY KEY,
    vehicleID INT,
    customerID INT,
    startDate DATE,
    endDate DATE,
    type VARCHAR(20),
    FOREIGN KEY (vehicleID) REFERENCES VehicleTable(vehicleID),
    FOREIGN KEY (customerID) REFERENCES CustomersTable(customerID)
);

CREATE TABLE PaymentTable (
    paymentID INT IDENTITY(1,1) PRIMARY KEY,
    leaseID INT,
    paymentDate DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (leaseID) REFERENCES LeaseTable(leaseID)
);

-- Insert queries for Vehicle table
SET IDENTITY_INSERT VehicleTable ON;
INSERT INTO VehicleTable(vehicleID, make, model, year, dailyRate, status, passengerCapacity, engineCapacity)
VALUES 
(1, 'Toyota', 'Camry', 2022, 50.00, 'available', 5, 2000),
(2, 'Honda', 'Accord', 2021, 45.00, 'available', 5, 1800),
(3, 'Ford', 'Fusion', 2020, 40.00, 'available', 5, 2200);
SET IDENTITY_INSERT VehicleTable OFF;

-- Insert queries for Customer table
SET IDENTITY_INSERT CustomersTable ON;
INSERT INTO CustomersTable(customerID, firstName, lastName, email, phoneNumber)
VALUES 
(1, 'John', 'Doe', 'john@example.com', '12345'),
(2, 'Jane', 'Smith', 'jane@example.com', '98765'),
(3, 'Alice', 'Johnson', 'alice@example.com', '55512');
SET IDENTITY_INSERT CustomersTable OFF;

-- Insert queries for Lease table
SET IDENTITY_INSERT LeaseTable ON;
INSERT INTO LeaseTable(leaseID, vehicleID, customerID, startDate, endDate, type)
VALUES 
(1, 1, 1, '2024-01-01', '2024-01-07', 'DailyLease'),
(2, 2, 2, '2024-01-10', '2024-02-10', 'MonthlyLease'),
(3, 3, 3, '2024-02-15', '2024-02-20', 'DailyLease');
SET IDENTITY_INSERT LeaseTable OFF;

-- Insert queries for Payment table
SET IDENTITY_INSERT PaymentTable ON;
INSERT INTO PaymentTable (paymentID, leaseID, paymentDate, amount)
VALUES 
(1, 1, '2024-01-07', 350.00),
(2, 2, '2024-02-10', 1350.00),
(3, 3, '2024-02-20', 200.00);
SET IDENTITY_INSERT PaymentTable OFF;



