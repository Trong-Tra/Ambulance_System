INSERT INTO Ambulance (LicensePlate, VehicleModel, Status) VALUES
('ABC123', 'Ford Transit 350', 'Available'),
('XYZ456', 'Mercedes Sprinter', 'In Service'),
('QRS789', 'Dodge Ram Promaster', 'In Service');

INSERT INTO MedicalEquipment (EquipmentID, Name, QuantityInStorage) VALUES
(1, 'First Aid Kit', 10),
(2, 'Oxygen Tank', 5),
(3, 'Defibrillator', 3);

INSERT INTO Ambulance_MedicalEquipment (LicensePlate, EquipmentID, Quantity) VALUES
('ABC123', 1, 2),
('XYZ456', 2, 3),
('QRS789', 3, 1),
('QRS789', 1, 1);

INSERT INTO Driver (DriverID, DriverName, LicenseNumber, Certification, Salary, Benefit, PaymentMethod, PaymentDetail) VALUES
(101, 'John Smith', 'DL123456', 'EMT', 3000.00, 'Health Insurance', 'Direct Deposit', 'Bank: ABC, Account: 12345'),
(102, 'Emily Johnson', 'DL654321', 'Paramedic', 3500.00, 'Dental Coverage', 'Check', 'Mailed to Address: 123 Main St');

INSERT INTO Dayoff (DriverID, DayoffDate, NumberOfDaysOff) VALUES
(101, '2024-05-10', 1),
(102, '2024-05-15', 3);

INSERT INTO Schedule (ScheduleID, DriverID, Shifts, LicensePlate) VALUES
(201, 101, 'Day', 'ABC123'),
(202, 102, 'Night', 'XYZ456');

INSERT INTO Rental (RentalID, PickupLocation, Destination, ScheduleID) VALUES
(301, 'Hospital A', 'Clinic B', 201),
(302, 'Clinic C', 'Hospital D', 202);

INSERT INTO Invoice (InvoiceID, RentalID, InvoiceDate, PaymentMethod, Price) VALUES
(401, 301, '2024-05-07', 'Credit Card', 500.00),
(402, 302, '2024-05-08', 'Cash', 600.00);

INSERT INTO Transactions (TxID, Type, Amount, LicensePlate, DriverID, InvoiceID) VALUES
(501, 'Payment', 500.00, 'ABC123', 101, 401),
(502, 'Payment', 600.00, 'XYZ456', 102, 402);

INSERT INTO Price (InvoiceID, Total, DriverFee, EquipmentFee, RentalCost, GasFee) VALUES
(401, 500.00, 100.00, 50.00, 300.00, 50.00),
(402, 600.00, 120.00, 60.00, 360.00, 60.00);

INSERT INTO TX_Invoice (TxID, InvoiceID, PaymentStatus) VALUES
(501, 401, 'Paid'),
(502, 402, 'Paid');

INSERT INTO Detail (RentalID, Time, Distance, Purpose) VALUES
(301, '2024-05-07 10:00:00', 15.3, 'Patient Transfer'),
(302, '2024-05-08 20:00:00', 25.7, 'Emergency Response');

INSERT INTO Customer (CustomerID, CustomerName, ContactInfo, BillingInfo, InvoiceID, RentalID) VALUES
(601, 'XYZ Hospital', 'xyz@hospital.com', 'XYZ Hospital, USA', 401, 301),
(602, 'ABC Clinic', 'abc@clinic.com', 'ABC Clinic, USA', 402, 302);
