-- ===============================
-- Insert Sample Data for Hospital Management System
-- ===============================

-- ===============================
-- Patient Data
-- ===============================
INSERT INTO Patient (Name, DOB, Gender, Contact, Insurance_Info) VALUES
('Aarav Kulkarni', '1990-05-12', 'M', '9876543210', 'HDFC Life, Policy#12345'),
('Neha Deshmukh', '1985-08-23', 'F', '9123456780', 'ICICI Lombard, Policy#54321'),
('Rohan Patil', '2000-02-15', 'M', '9988776655', 'Tata AIG, Policy#11223');

-- ===============================
-- Doctor Data
-- ===============================
INSERT INTO Doctor (Name, Specialisation, Contact, Email) VALUES
('Dr. Neha Kulkarni', 'Cardiology', '9876501234', 'neha.kulkarni@hospital.com'),
('Dr. Rajesh Sharma', 'Orthopaedics', '9123409876', 'rajesh.sharma@hospital.com'),
('Dr. Anjali Mehta', 'Neurology', '9988701234', 'anjali.mehta@hospital.com');

-- ===============================
-- Encounters Data
-- ===============================
INSERT INTO Encounters (P_ID, Doctor_ID, Appointment_Type, Admission_Date, Discharge_Date) VALUES
(1, 1, 'Routine', '2025-09-01', '2025-09-03'),
(2, 2, 'Emergency', '2025-09-05', '2025-09-06'),
(3, 3, 'Surgery', '2025-09-07', '2025-09-10');

-- ===============================
-- Medical_History Data
-- ===============================
INSERT INTO Medical_History (P_ID, Past_Treatment, Diagnosis, Allergies, Addictions, Medications) VALUES
(1, 'Appendectomy in 2010', 'Hypertension', 'Penicillin', 'None', 'Amlodipine'),
(2, 'Fracture treatment in 2018', 'Diabetes', 'None', 'None', 'Metformin'),
(3, 'Migraine treatment in 2022', 'Migraine', 'Pollen', 'Smoking', 'Sumatriptan');

-- ===============================
-- Diagnostic_Test Data
-- ===============================
INSERT INTO Diagnostic_Test (Encounter_ID, Test_Type, Test_Date, Result) VALUES
(1, 'Blood Test', '2025-09-01', 'Normal'),
(2, 'X-Ray', '2025-09-05', 'Fracture detected'),
(3, 'MRI', '2025-09-08', 'Minor lesion detected');

-- ===============================
-- Procedures Data
-- ===============================
INSERT INTO Procedures (Encounter_ID, Doctor_ID, Procedure_Type, Procedure_Date, Notes) VALUES
(1, 1, 'ECG', '2025-09-02', 'Normal ECG'),
(2, 2, 'Bone Setting', '2025-09-05', 'Successful alignment'),
(3, 3, 'Brain Surgery', '2025-09-09', 'Surgery successful');

-- ===============================
-- Prescriptions Data
-- ===============================
INSERT INTO Prescriptions (Encounter_ID, Doctor_ID, Medicine_Name, Dosage, Frequency, Duration, Instructions, Dispensing_Details) VALUES
(1, 1, 'Amlodipine', '5mg', '1 tablet/day', '30 days', 'Take after breakfast', 'Dispensed at Hospital Pharmacy'),
(2, 2, 'Paracetamol', '500mg', '2 tablets/day', '5 days', 'Take after food', 'Dispensed at City Pharmacy'),
(3, 3, 'Sumatriptan', '50mg', '1 tablet/day', '10 days', 'Take at onset of migraine', 'Dispensed at Hospital Pharmacy');

-- ===============================
-- Bill Data
-- ===============================
INSERT INTO Bill (Encounter_ID, Bill_Date, Total_Amt, Payment_Status, Payment_Method) VALUES
(1, '2025-09-03', 5000.00, 'Paid', 'Card'),
(2, '2025-09-06', 12000.00, 'Pending', 'Insurance'),
(3, '2025-09-10', 75000.00, 'Paid', 'UPI');
