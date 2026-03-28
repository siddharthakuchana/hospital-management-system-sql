
SELECT * FROM patients;

SELECT d.name, COUNT(a.appointment_id) AS total_appointments
FROM doctors d
LEFT JOIN appointments a
ON d.doctor_id = a.doctor_id
GROUP BY d.name;
