
CREATE TABLE audit_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    message TEXT
);

DELIMITER //

CREATE TRIGGER after_patient_insert
AFTER INSERT ON patients
FOR EACH ROW
BEGIN
    INSERT INTO audit_log(message)
    VALUES (CONCAT('New patient added: ', NEW.name));
END //

DELIMITER ;
