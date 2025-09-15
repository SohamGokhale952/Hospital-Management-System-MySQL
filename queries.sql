-- ===============================
-- Queries for Hospital Management System
-- ===============================

-- ===============================
-- 1. List all patients with their doctors and appointment type
-- ===============================
SELECT p.Name AS Patient, d.Name AS Doctor, e.Appointment_Type, e.Admission_Date, e.Discharge_Date
FROM Encounters e
JOIN Patient p ON e.P_ID = p.P_ID
JOIN Doctor d ON e.Doctor_ID = d.Doctor_ID;

-- ===============================
-- 2. Get total bill per patient
-- ===============================
SELECT p.Name AS Patient, SUM(b.Total_Amt) AS Total_Bill
FROM Bill b
JOIN Encounters e ON b.Encounter_ID = e.Encounter_ID
JOIN Patient p ON e.P_ID = p.P_ID
GROUP BY p.Name;

-- ===============================
-- 3. Show all diagnostic tests for a given patient
-- ===============================
SELECT p.Name AS Patient, dt.Test_Type, dt.Test_Date, dt.Result
FROM Diagnostic_Test dt
JOIN Encounters e ON dt.Encounter_ID = e.Encounter_ID
JOIN Patient p ON e.P_ID = p.P_ID
WHERE p.Name = 'Aarav Kulkarni';

-- ===============================
-- 4. List all procedures done by a doctor
-- ===============================
SELECT d.Name AS Doctor, p.Name AS Patient, pr.Procedure_Type, pr.Procedure_Date, pr.Notes
FROM Procedures pr
JOIN Doctor d ON pr.Doctor_ID = d.Doctor_ID
JOIN Encounters e ON pr.Encounter_ID = e.Encounter_ID
JOIN Patient p ON e.P_ID = p.P_ID
WHERE d.Name = 'Dr. Anjali Mehta';

-- ===============================
-- 5. List all prescriptions by a doctor
-- ===============================
SELECT d.Name AS Doctor, p.Name AS Patient, pr.Medicine_Name, pr.Dosage, pr.Frequency, pr.Duration
FROM Prescriptions pr
JOIN Doctor d ON pr.Doctor_ID = d.Doctor_ID
JOIN Encounters e ON pr.Encounter_ID = e.Encounter_ID
JOIN Patient p ON e.P_ID = p.P_ID
WHERE d.Name = 'Dr. Neha Kulkarni';

-- ===============================
-- 6. Show all encounters for a patient
-- ===============================
SELECT p.Name AS Patient, d.Name AS Doctor, e.Appointment_Type, e.Admission_Date, e.Discharge_Date
FROM Encounters e
JOIN Patient p ON e.P_ID = p.P_ID
JOIN Doctor d ON e.Doctor_ID = d.Doctor_ID
WHERE p.Name = 'Neha Deshmukh';

-- ===============================
-- 7. Get medical history of a patient
-- ===============================
SELECT p.Name AS Patient, mh.Past_Treatment, mh.Diagnosis, mh.Allergies, mh.Addictions, mh.Medications
FROM Medical_History mh
JOIN Patient p ON mh.P_ID = p.P_ID
WHERE p.Name = 'Rohan Patil';

-- ===============================
-- 8. Get all unpaid bills
-- ===============================
SELECT p.Name AS Patient, b.Bill_Date, b.Total_Amt, b.Payment_Status, b.Payment_Method
FROM Bill b
JOIN Encounters e ON b.Encounter_ID = e.Encounter_ID
JOIN Patient p ON e.P_ID = p.P_ID
WHERE b.Payment_Status = 'Pending';

-- ===============================
-- 9. Count number of encounters per doctor
-- ===============================
SELECT d.Name AS Doctor, COUNT(e.Encounter_ID) AS Encounter_Count
FROM Doctor d
JOIN Encounters e ON d.Doctor_ID = e.Doctor_ID
GROUP BY d.Name;

-- ===============================
-- 10. List all patients along with the number of diagnostic tests
-- ===============================
SELECT p.Name AS Patient, COUNT(dt.Test_ID) AS Test_Count
FROM Patient p
JOIN Encounters e ON p.P_ID = e.P_ID
JOIN Diagnostic_Test dt ON e.Encounter_ID = dt.Encounter_ID
GROUP BY p.Name;

-- ===============================
-- 11. List all patients along with the number of prescriptions
-- ===============================
SELECT p.Name AS Patient, COUNT(pr.Prescription_ID) AS Prescription_Count
FROM Patient p
JOIN Encounters e ON p.P_ID = e.P_ID
JOIN Prescriptions pr ON e.Encounter_ID = pr.Encounter_ID
GROUP BY p.Name;

-- ===============================
-- 12. List all patients with procedure details
-- ===============================
SELECT p.Name AS Patient, pr.Procedure_Type, pr.Procedure_Date, d.Name AS Doctor
FROM Procedures pr
JOIN Encounters e ON pr.Encounter_ID = e.Encounter_ID
JOIN Patient p ON e.P_ID = p.P_ID
JOIN Doctor d ON pr.Doctor_ID = d.Doctor_ID;
