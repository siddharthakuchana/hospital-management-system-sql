INSERT INTO patients (name, age, gender)
VALUES ('Ravi', 30, 'Male');

INSERT INTO doctors (name, specialization) VALUES
('Dr. Sharma', 'Cardiology'),
('Dr. Mehta', 'Neurology');

INSERT INTO patients (name, age, gender) VALUES
('Ravi Kumar', 30, 'Male'),
('Sita Verma', 25, 'Female');

INSERT INTO appointments (patient_id, doctor_id, appointment_date, status) VALUES
(1, 1, '2026-03-28', 'Scheduled'),
(2, 1, '2026-03-29', 'Completed'),
(1, 2, '2026-03-30', 'Scheduled');
