Hospital Management System (MySQL Project)

Project Overview

This project implements a Hospital Management System (HMS) using MySQL.
It manages patients, doctors, encounters, medical history, diagnostic tests, prescriptions, procedures, and billing.

The goal is to demonstrate practical database design, ER modeling, and SQL queries for real-world hospital workflows.

---

ER Diagram (Table Format)

Patient

| Column          | Type    | Key | Description                              |
| --------------- | ------- | --- | ---------------------------------------- |
| P\_ID           | INT     | PK  | Patient ID                               |
| Name            | VARCHAR |     | Patient name                             |
| DOB             | DATE    |     | Date of birth                            |
| Gender          | CHAR(1) |     | Gender (M/F)                             |
| Contact         | VARCHAR |     | Contact number                           |
| Insurance\_Info | VARCHAR |     | Insurance details (provider, policy no.) |

Doctor

| Column         | Type    | Key | Description            |
| -------------- | ------- | --- | ---------------------- |
| Doctor\_ID     | INT     | PK  | Doctor ID              |
| Name           | VARCHAR |     | Doctor name            |
| Specialisation | VARCHAR |     | Medical specialization |
| Contact        | VARCHAR |     | Contact number         |
| Email          | VARCHAR |     | Email address          |

Encounters

| Column            | Type    | Key | Description                   |
| ----------------- | ------- | --- | ----------------------------- |
| Encounter\_ID     | INT     | PK  | Encounter ID                  |
| P\_ID             | INT     | FK  | References Patient(P\_ID)     |
| Doctor\_ID        | INT     | FK  | References Doctor(Doctor\_ID) |
| Appointment\_Type | VARCHAR |     | Routine / Emergency / Surgery |
| Admission\_Date   | DATE    |     | Admission date                |
| Discharge\_Date   | DATE    |     | Discharge date                |

Medical\_History

| Column          | Type    | Key | Description               |
| --------------- | ------- | --- | ------------------------- |
| History\_ID     | INT     | PK  | Medical history ID        |
| P\_ID           | INT     | FK  | References Patient(P\_ID) |
| Past\_Treatment | TEXT    |     | Past treatments           |
| Diagnosis       | VARCHAR |     | Diagnosis details         |
| Allergies       | VARCHAR |     | Known allergies           |
| Addictions      | VARCHAR |     | Addictions (if any)       |
| Medications     | VARCHAR |     | Current medications       |

Diagnostic\_Test

| Column        | Type    | Key | Description                          |
| ------------- | ------- | --- | ------------------------------------ |
| Test\_ID      | INT     | PK  | Diagnostic test ID                   |
| Encounter\_ID | INT     | FK  | References Encounters(Encounter\_ID) |
| Test\_Type    | VARCHAR |     | Type of test (Blood, CT, MRI, etc.)  |
| Test\_Date    | DATE    |     | Date of test                         |
| Result        | TEXT    |     | Test result                          |

Procedures

| Column          | Type    | Key | Description                               |
| --------------- | ------- | --- | ----------------------------------------- |
| Procedure\_ID   | INT     | PK  | Procedure ID                              |
| Encounter\_ID   | INT     | FK  | References Encounters(Encounter\_ID)      |
| Doctor\_ID      | INT     | FK  | References Doctor(Doctor\_ID)             |
| Procedure\_Type | VARCHAR |     | Type of procedure (Surgery, Biopsy, etc.) |
| Procedure\_Date | DATE    |     | Date of procedure                         |
| Notes           | TEXT    |     | Notes / outcomes                          |

Prescriptions

| Column              | Type    | Key | Description                          |
| ------------------- | ------- | --- | ------------------------------------ |
| Prescription\_ID    | INT     | PK  | Prescription ID                      |
| Encounter\_ID       | INT     | FK  | References Encounters(Encounter\_ID) |
| Doctor\_ID          | INT     | FK  | References Doctor(Doctor\_ID)        |
| Medicine\_Name      | VARCHAR |     | Name of medicine                     |
| Dosage              | VARCHAR |     | Dosage (e.g., 1 tablet, 2 drops)     |
| Frequency           | VARCHAR |     | Frequency (e.g., 2 times/day)        |
| Duration            | VARCHAR |     | Duration (e.g., 7 days, 30 days)     |
| Instructions        | TEXT    |     | Special instructions                 |
| Dispensing\_Details | TEXT    |     | Pharmacy/dispensing details          |

Bill

| Column          | Type    | Key | Description                          |
| --------------- | ------- | --- | ------------------------------------ |
| Bill\_ID        | INT     | PK  | Bill ID                              |
| Encounter\_ID   | INT     | FK  | References Encounters(Encounter\_ID) |
| Bill\_Date      | DATE    |     | Date of bill                         |
| Total\_Amt      | DECIMAL |     | Total amount                         |
| Payment\_Status | VARCHAR |     | Paid / Pending                       |
| Payment\_Method | VARCHAR |     | Cash, Card, UPI, Insurance, etc.     |

---

Relationships

Patient – Encounters: 1 patient can have many encounters.
Doctor – Encounters / Procedures / Prescriptions: 1 doctor can have many encounters, perform procedures, and prescribe medicines.
Encounter – Bill / Tests / Procedures / Prescriptions: Each encounter may generate multiple linked records.
Medical History – Patient: 1 patient can have many medical history entries.

---

Features

Patient registration with insurance details.
Doctor details with specializations.
Appointment & encounter tracking (linked with doctor).
Medical history storage.
Diagnostic tests, procedures & prescriptions.
Billing with multiple payment methods.

---

Example Queries

```sql
-- List patients with their doctors for each encounter
SELECT p.Name AS Patient, d.Name AS Doctor, e.Appointment_Type
FROM Encounters e
JOIN Patient p ON e.P_ID = p.P_ID
JOIN Doctor d ON e.Doctor_ID = d.Doctor_ID;

-- Get total bill per patient
SELECT p.Name, SUM(b.Total_Amt) AS Total_Bill
FROM Bill b
JOIN Encounters e ON b.Encounter_ID = e.Encounter_ID
JOIN Patient p ON e.P_ID = p.P_ID
GROUP BY p.Name;

-- Show all diagnostic tests for a given patient
SELECT p.Name, dt.Test_Type, dt.Result
FROM Diagnostic_Test dt
JOIN Encounters e ON dt.Encounter_ID = e.Encounter_ID
JOIN Patient p ON e.P_ID = p.P_ID
WHERE p.Name = 'Aarav Kulkarni';
```

---

How to Run

1. Clone the repository or download the files.
2. Import `schema.sql` into MySQL Workbench.
3. Run `insert_data.sql` to populate sample data.
4. Use `queries.sql` to test queries and view results.

---

Tech Stack

Database: MySQL
Tools: MySQL Workbench, SQL CLI
Concepts: ER Modeling, SQL Queries, Joins, Aggregations
