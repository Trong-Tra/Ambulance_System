-- Table for Ambulances
CREATE TABLE Ambulance (
    LicensePlate VARCHAR(20) PRIMARY KEY,
    VehicleModel VARCHAR(100) NOT NULL,
    Status VARCHAR(50) NOT NULL
);

-- Table for Medical Equipment
CREATE TABLE MedicalEquipment (
    EquipmentID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    QuantityInStorage INT NOT NULL
);

-- Middle table for Ambulance and Medical Equipment
CREATE TABLE Ambulance_MedicalEquipment (
    LicensePlate VARCHAR(20),
    EquipmentID INT,
    Quantity INT,
    PRIMARY KEY (LicensePlate, EquipmentID),
    FOREIGN KEY (LicensePlate) REFERENCES Ambulance(LicensePlate),
    FOREIGN KEY (EquipmentID) REFERENCES MedicalEquipment(EquipmentID)
);

-- Table for Drivers
CREATE TABLE Driver (
    DriverID INT PRIMARY KEY,
    DriverName VARCHAR(100) NOT NULL,
    LicenseNumber VARCHAR(20) NOT NULL,
    Certification VARCHAR(100), -- Assuming multi-value certification is stored as comma-separated values
    Salary DECIMAL(10, 2) NOT NULL,
    Benefit VARCHAR(100),
    PaymentMethod VARCHAR(100) NOT NULL,
    PaymentDetail VARCHAR(200) -- Assuming payment details for wired money
);

-- Table for Dayoffs
CREATE TABLE Dayoff (
    DriverID INT PRIMARY KEY,
    DayoffDate DATE,
    NumberOfDaysOff INT,
    FOREIGN KEY (DriverID) REFERENCES Driver(DriverID)
);

-- Table for Schedules
CREATE TABLE Schedule (
    ScheduleID INT PRIMARY KEY,
    DriverID INT,
    Shifts VARCHAR(50),
    LicensePlate VARCHAR(20),
    FOREIGN KEY (DriverID) REFERENCES Driver(DriverID),
    FOREIGN KEY (LicensePlate) REFERENCES Ambulance(LicensePlate)
);

-- Table for Rentals
CREATE TABLE Rental (
    RentalID INT PRIMARY KEY,
    PickupLocation VARCHAR(100),
    Destination VARCHAR(100),
    ScheduleID INT,
    FOREIGN KEY (ScheduleID) REFERENCES Schedule(ScheduleID)
);

-- Table for Invoices
CREATE TABLE Invoice (
    InvoiceID INT PRIMARY KEY,
    RentalID INT,
    InvoiceDate DATE,
    PaymentMethod VARCHAR(100), -- Assuming multi-value payment method is stored as comma-separated values
    Price DECIMAL(10, 2),
    FOREIGN KEY (RentalID) REFERENCES Rental(RentalID)
);

-- Table for Transactions
CREATE TABLE Transactions (
    TxID INT PRIMARY KEY,
    Type VARCHAR(100),
    Amount DECIMAL(10, 2),
    LicensePlate VARCHAR(20),
    DriverID INT,
    InvoiceID INT,
    FOREIGN KEY (LicensePlate) REFERENCES Ambulance(LicensePlate),
    FOREIGN KEY (DriverID) REFERENCES Driver(DriverID)
);


-- Table for Price details
CREATE TABLE Price (
    InvoiceID INT PRIMARY KEY,
    Total DECIMAL(10, 2),
    DriverFee DECIMAL(10, 2),
    EquipmentFee DECIMAL(10, 2),
    RentalCost DECIMAL(10, 2),
    GasFee DECIMAL(10, 2),
    FOREIGN KEY (InvoiceID) REFERENCES Invoice(InvoiceID)
);

-- Middle table for Transaction and Invoice
CREATE TABLE TX_Invoice (
    TxID INT,
    InvoiceID INT,
    PaymentStatus VARCHAR(50),
    PRIMARY KEY (TxID, InvoiceID),
    FOREIGN KEY (TxID) REFERENCES Transactions(TxID),
    FOREIGN KEY (InvoiceID) REFERENCES Invoice(InvoiceID)
);

-- Table for Rental Details
CREATE TABLE Detail (
    RentalID INT PRIMARY KEY,
    Time TIMESTAMP,
    Distance DECIMAL(10, 2),
    Purpose VARCHAR(200),
    FOREIGN KEY (RentalID) REFERENCES Rental(RentalID)
);

-- Table for Customers
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    ContactInfo VARCHAR(100) NOT NULL,
    BillingInfo VARCHAR(200) NOT NULL,
    InvoiceID INT,
    RentalID INT,
    FOREIGN KEY (InvoiceID) REFERENCES Invoice(InvoiceID),
    FOREIGN KEY (RentalID) REFERENCES Rental(RentalID)
);


