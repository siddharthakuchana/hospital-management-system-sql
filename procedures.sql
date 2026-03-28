DELIMITER //

CREATE PROCEDURE AddPatient(
    IN p_name VARCHAR(100),
    IN p_age INT,
    IN p_gender VARCHAR(10)
)
BEGIN
    INSERT INTO patients(name, age, gender)
    VALUES (p_name, p_age, p_gender);
END //

DELIMITER ;
