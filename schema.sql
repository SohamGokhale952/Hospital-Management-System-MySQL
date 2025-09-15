-- ===============================
-- Hospital Management System Schema
-- ===============================

-- Drop tables if they exist
DROP TABLE IF EXISTS Bill;
DROP TABLE IF EXISTS Prescriptions;
DROP TABLE IF EXISTS Procedures;
DROP TABLE IF EXISTS Diagnostic_Test;
DROP TABLE IF EXISTS Medical_History;
DROP TABLE IF EXISTS Encounters;
DROP TABLE IF EXISTS Doctor;
DROP TABLE IF EXISTS Patient;

-- ===============================
-- Patient Table
-- ===============================
CREATE TABLE Patient (
    P_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    DOB DATE,
    Gender CHAR(1),
    Contact VARCHAR(15),
    Insurance_Info VARCHAR(255)
);

-- ===============================
-- Doctor Table
-- ===============================
CREATE TABLE Doctor (
    Doctor_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Specialisation VARCHAR(100),
    Contact VARCHAR(15),
    Email VARCHAR(100)
);

-- ===============================
-- Encounters Table
-- ===============================
CREATE TABLE Encounters (
    Encounter_ID INT PRIMARY KEY AUTO_INCREMENT,
    P_ID INT NOT NULL,
    Doctor_ID INT NOT NULL,
    Appointment_Type VARCHAR(50),
    Admission_Date DATE,
    Discharge_Date DATE,
    FOREIGN KEY (P_ID) REFERENCES Patient(P_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID)
);

-- ===============================
-- Medical_History Table
-- ===============================
CREATE TABLE Medical_History (
    History_ID INT PRIMARY KEY AUTO_INCREMENT,
    P_ID INT NOT NULL,
    Past_Treatment TEXT,
    Diagnosis VARCHAR(255),
    Allergies VARCHAR(255),
    Addictions VARCHAR(255),
    Medications VARCHAR(255),
    FOREIGN KEY (P_ID) REFERENCES Patient(P_ID)
);

-- ===============================
-- Diagnostic_Test Table
-- ===============================
CREATE TABLE Diagnostic_Test (
    Test_ID INT PRIMARY KEY AUTO_INCREMENT,
    Encounter_ID INT NOT NULL,
    Test_Type VARCHAR(100),
    Test_Date DATE,
    Result TEXT,
    FOREIGN KEY (Encounter_ID) REFERENCES Encounters(Encounter_ID)
);

-- ===============================
-- Procedures Table
-- ===============================
CREATE TABLE Procedures (
    Procedure_ID INT PRIMARY KEY AUTO_INCREMENT,
    Encounter_ID INT NOT NULL,
    Doctor_ID INT NOT NULL,
    Procedure_Type VARCHAR(100),
    Procedure_Date DATE,
    Notes TEXT,
    FOREIGN KEY (Encounter_ID) REFERENCES Encounters(Encounter_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID)
);

-- ===============================
-- Prescriptions Table
-- ===============================
CREATE TABLE Prescriptions (
    Prescription_ID INT PRIMARY KEY AUTO_INCREMENT,
    Encounter_ID INT NOT NULL,
    Doctor_ID INT NOT NULL,
    Medicine_Name VARCHAR(100),
    Dosage VARCHAR(50),
    Frequency VARCHAR(50),
    Duration VARCHAR(50),
    Instructions TEXT,
    Dispensing_Details TEXT,
    FOREIGN KEY (Encounter_ID) REFERENCES Encounters(Encounter_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID)
);

-- ===============================
-- Bill Table
-- ===============================
CREATE TABLE Bill (
    Bill_ID INT PRIMARY KEY AUTO_INCREMENT,
    Encounter_ID INT NOT NULL,
    Bill_Date DATE,
    Total_Amt DECIMAL(10,2),
    Payment_Status VARCHAR(50),
    Payment_Method VARCHAR(50),
    FOREIGN KEY (Encounter_ID) REFERENCES Encounters(Encounter_ID)
);
