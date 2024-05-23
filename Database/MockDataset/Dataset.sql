INSERT INTO Ambulance (LicensePlate, VehicleModel, Status) VALUES
('ABC123', 'Ford Transit 350', 'Available'),
('XYZ456', 'Mercedes Sprinter', 'In Service'),
('QRS789', 'Dodge Ram Promaster', 'In Service'),
('DEF321', 'Chevrolet Express', 'Available'),
('GHI654', 'Nissan NV3500', 'In Service'),
('JKL987', 'Ram 2500', 'Maintaining'),
('MNO321', 'Ford Transit 150', 'Available'),
('PQR654', 'Mercedes Sprinter', 'In Service'),
('STU987', 'Dodge Ram Promaster', 'Maintaining');

INSERT INTO MedicalEquipment (EquipmentID, Name, QuantityInStorage) VALUES
(1, 'First Aid Kit', 10),
(2, 'Oxygen Tank', 5),
(3, 'Defibrillator', 3),
(4, 'Splint', 8),
(5, 'Bandages', 20),
(6, 'IV Kit', 15),
(7, 'Suction Device', 5),
(8, 'Stethoscope', 12),
(9, 'BP Monitor', 7);

INSERT INTO Ambulance_MedicalEquipment (LicensePlate, EquipmentID, Quantity) VALUES
('ABC123', 1, 2),
('XYZ456', 2, 3),
('QRS789', 3, 1),
('QRS789', 1, 1),
('DEF321', 4, 3),
('GHI654', 5, 10),
('JKL987', 6, 4),
('MNO321', 7, 2),
('PQR654', 8, 5),
('STU987', 9, 3),
('MNO321', 1, 2),
('PQR654', 2, 3),
('STU987', 3, 1),
('DEF321', 1, 1);

INSERT INTO Driver (DriverID, DriverName, LicenseNumber, Certification, Salary, Benefit, PaymentMethod, PaymentDetail) VALUES
(101, 'John Smith', 'DL123456', 'EMT', 3000.00, 'Health Insurance', 'Direct Deposit', 'Bank: ABC, Account: 12345'),
(102, 'Emily Johnson', 'DL654321', 'Paramedic', 3500.00, 'Dental Coverage', 'Check', 'Mailed to Address: 123 Main St'),
(103, 'Michael Brown', 'DL789012', 'EMT', 3200.00, 'Health Insurance', 'Direct Deposit', 'Bank: DEF, Account: 67890'),
(104, 'Sarah Davis', 'DL890123', 'Paramedic', 3600.00, 'Dental Coverage', 'Check', 'Mailed to Address: 456 Elm St'),
(105, 'Robert Miller', 'DL901234', 'First Responder', 3100.00, 'Vision Insurance', 'Direct Deposit', 'Bank: GHI, Account: 34567'),
(106, 'Laura Wilson', 'DL012345', 'EMT', 3300.00, 'Health Insurance', 'Direct Deposit', 'Bank: JKL, Account: 89012');

INSERT INTO Dayoff (DriverID, DayoffDate, NumberOfDaysOff) VALUES
(101, '2024-05-10', 1),
(102, '2024-05-15', 3),
(103, '2024-05-11', 2),
(104, '2024-05-16', 1),
(105, '2024-05-18', 3),
(106, '2024-05-20', 1);

INSERT INTO Schedule (ScheduleID, DriverID, Shifts, LicensePlate) VALUES
(201, 101, 'Day', 'ABC123'),
(202, 102, 'Night', 'XYZ456'),
(203, 103, 'Day', 'DEF321'),
(204, 104, 'Night', 'GHI654'),
(205, 105, 'Evening', 'JKL987'),
(206, 106, 'Day', 'MNO321');

INSERT INTO Rental (RentalID, PickupLocation, Destination, ScheduleID) VALUES
(301, 'Hospital A', 'Clinic B', 201),
(302, 'Clinic C', 'Hospital D', 202),
(303, 'Hospital E', 'Clinic F', 203),
(304, 'Clinic G', 'Hospital H', 204),
(305, 'Hospital I', 'Clinic J', 205),
(306, 'Clinic K', 'Hospital L', 206);

INSERT INTO Invoice (InvoiceID, RentalID, InvoiceDate, PaymentMethod, Price) VALUES
(401, 301, '2024-05-07', 'Credit Card', 500.00),
(402, 302, '2024-05-08', 'Cash', 600.00),
(403, 303, '2024-05-09', 'Credit Card', 700.00),
(404, 304, '2024-05-10', 'Cash', 800.00),
(405, 305, '2024-05-11', 'Credit Card', 750.00),
(406, 306, '2024-05-12', 'Cash', 850.00);

INSERT INTO Transactions (TxID, Type, Amount, LicensePlate, DriverID, InvoiceID) VALUES
(501, 'Payment', 500.00, 'ABC123', 101, 401),
(502, 'Payment', 600.00, 'XYZ456', 102, 402),
(503, 'Payment', 700.00, 'DEF321', 103, 403),
(504, 'Payment', 800.00, 'GHI654', 104, 404),
(505, 'Payment', 750.00, 'JKL987', 105, 405),
(506, 'Payment', 850.00, 'MNO321', 106, 406);

INSERT INTO Price (InvoiceID, Total, DriverFee, EquipmentFee, RentalCost, GasFee) VALUES
(401, 500.00, 100.00, 50.00, 300.00, 50.00),
(402, 600.00, 120.00, 60.00, 360.00, 60.00),
(403, 700.00, 140.00, 70.00, 420.00, 70.00),
(404, 800.00, 160.00, 80.00, 480.00, 80.00),
(405, 750.00, 150.00, 75.00, 450.00, 75.00),
(406, 850.00, 170.00, 85.00, 510.00, 85.00);

INSERT INTO TX_Invoice (TxID, InvoiceID, PaymentStatus) VALUES
(501, 401, 'Paid'),
(502, 402, 'Paid'),
(503, 403, 'Pending'),
(504, 404, 'Paid'),
(505, 405, 'Pending'),
(506, 406, 'Paid');

INSERT INTO Detail (RentalID, Time, Distance, Purpose) VALUES
(301, '2024-05-07 10:00:00', 15.3, 'Patient Transfer'),
(302, '2024-05-08 20:00:00', 25.7, 'Emergency Response'),
(303, '2024-05-09 12:00:00', 18.2, 'Patient Transfer'),
(304, '2024-05-10 15:00:00', 22.5, 'Emergency Response'),
(305, '2024-05-11 08:00:00', 20.1, 'Routine Checkup'),
(306, '2024-05-12 17:00:00', 27.3, 'Medical Consultation');

INSERT INTO Customer (CustomerID, CustomerName, ContactInfo, BillingInfo, InvoiceID, RentalID) VALUES
(601, 'XYZ Hospital', 'xyz@hospital.com', 'XYZ Hospital, VN', 401, 301),
(602, 'ABC Clinic', 'abc@clinic.com', 'ABC Clinic, VN', 402, 302),
(603, 'DEF Hospital', 'def@hospital.com', 'DEF Hospital, VN', 403, 303),
(604, 'GHI Clinic', 'ghi@clinic.com', 'GHI Clinic, VN', 404, 304),
(605, 'JKL Hospital', 'jkl@hospital.com', 'JKL Hospital, VN', 405, 305),
(606, 'MNO Clinic', 'mno@clinic.com', 'MNO Clinic, VN', 406, 306);
