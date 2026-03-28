# 🏥 Hospital Information Management System (HIMS)

## 1. Project Overview
This is a **MySQL-based Hospital Information Management System (HIMS)**.  
It manages hospital operations such as:

- Patient registration and management  
- Doctor and staff information  
- Appointments and medical records  
- Billing management  
- Auditing actions via triggers and stored procedures  

This project demonstrates the use of **tables, relationships, triggers, and stored procedures** to efficiently manage hospital data.

---

## 2. Database Structure

### Tables

**patients**
- `patient_id` (INT, Primary Key, Auto Increment)  
- `name` (VARCHAR)  
- `dob` (DATE)  
- `gender` (VARCHAR)  
- `contact` (VARCHAR)  

**doctors**
- `doctor_id` (INT, Primary Key, Auto Increment)  
- `name` (VARCHAR)  
- `specialization` (VARCHAR)  
- `contact` (VARCHAR)  

**appointments**
- `appointment_id` (INT, Primary Key, Auto Increment)  
- `patient_id` (INT, Foreign Key → patients.patient_id)  
- `doctor_id` (INT, Foreign Key → doctors.doctor_id)  
- `appointment_date` (DATETIME)  
- `status` (VARCHAR)  

**medical_records**
- `record_id` (INT, Primary Key, Auto Increment)  
- `patient_id` (INT, Foreign Key → patients.patient_id)  
- `diagnosis` (TEXT)  
- `treatment` (TEXT)  
- `record_date` (DATETIME)  

**billing**
- `bill_id` (INT, Primary Key, Auto Increment)  
- `patient_id` (INT, Foreign Key → patients.patient_id)  
- `amount` (DECIMAL)  
- `bill_date` (DATETIME)  

**logs**
- `log_id` (INT, Primary Key, Auto Increment)  
- `action` (VARCHAR)  
- `log_time` (DATETIME)  

---

## 3. Relationships

- `appointments.patient_id → patients.patient_id` (Many-to-One)  
- `appointments.doctor_id → doctors.doctor_id` (Many-to-One)  
- `medical_records.patient_id → patients.patient_id` (Many-to-One)  
- `billing.patient_id → patients.patient_id` (Many-to-One)  

---

## 4. Stored Procedures

**Examples:**

- `GetPatientRecords(patient_id)` → Retrieve all medical records of a patient  
- `GetDoctorAppointments(doctor_id)` → List all upcoming appointments of a doctor  

```sql
CALL GetPatientRecords(101);
CALL GetDoctorAppointments(12);
```

## 5. Triggers

Examples:
- after_patient_insert → Logs every new patient added
- before_billing_insert → Validates billing amount and updates logs

--------------------------------------------------

## 6. Sample Queries

Insert a new patient:
```
INSERT INTO patients(name, dob, gender, contact)
VALUES('John Doe', '1990-05-12', 'Male', '1234567890');
```

Schedule an appointment:
```
INSERT INTO appointments(patient_id, doctor_id, appointment_date, status)
VALUES(1, 3, '2026-04-01 10:00:00', 'Scheduled');
```
Call stored procedure:
CALL GetPatientRecords(1);

--------------------------------------------------

## 7. Setup Instructions
```
- Install MySQL Server and Workbench
- Create a new schema hims_db
- Run SQL scripts to create tables, triggers, and procedures
- Test stored procedures and triggers in Workbench
```
--------------------------------------------------

## 8. Entity-Relationship Diagram
```
+----------------+        +----------------+
|   patients     |        |   doctors      |
|----------------|        |----------------|
| patient_id (PK)|        | doctor_id (PK) |
| name           |        | name           |
| dob            |        | specialization |
| gender         |        | contact        |
| contact        |        +----------------+
+----------------+
        |
        | 1
        |
        | M
        v

+----------------------+
|    appointments      |
|----------------------|
| appointment_id (PK)  |
| patient_id (FK)      |
| doctor_id (FK)       |
| appointment_date     |
| status               |
+----------------------+
        |
        v

+----------------------+
|   medical_records    |
|----------------------|
| record_id (PK)       |
| patient_id (FK)      |
| diagnosis            |
| treatment            |
| record_date          |
+----------------------+
        |
        v

+----------------------+
|       billing        |
|----------------------|
| bill_id (PK)         |
| patient_id (FK)      |
| amount               |
| bill_date            |
+----------------------+
        |
        v

+----------------------+
|        logs          |
|----------------------|
| log_id (PK)          |
| action               |
| log_time             |
+----------------------+

PK = Primary Key
FK = Foreign Key
Arrows show relationships
```
--------------------------------------------------

## 9. Notes

- Triggers automatically handle logging and auditing
- Stored procedures simplify querying hospital data
- Always backup your database before making structural changes
