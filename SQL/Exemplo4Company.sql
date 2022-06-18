#https://www.mikedane.com/databases/sql/creating-company-database/
-- https://youtu.be/HXV3zeQKqGY?t=14157 #FreeCodeCamp Database course

#Triggers
#Tabela onde será gravada as mensagens
CREATE TABLE company.trigger_test (
     message VARCHAR(100)
);

DELIMITER $$
CREATE
    TRIGGER company.my_trigger BEFORE INSERT
    ON company.employee
    FOR EACH ROW BEGIN
        INSERT INTO company.trigger_test VALUES('added new employee');
    END$$
DELIMITER ;

INSERT INTO company.employee
VALUES(110, 'Thomas', 'Turbando', '1969-02-19', 'M', 69000, 106, 3);
-- ============================================
DELIMITER $$
CREATE
    TRIGGER company.name_trigger BEFORE INSERT
    ON company.employee
    FOR EACH ROW BEGIN
        INSERT INTO company.trigger_test VALUES(NEW.first_name);
    END$$
DELIMITER ;

INSERT INTO company.employee
VALUES(111, 'Kevin', 'Malone', '1978-02-19', 'M', 69000, 106, 3);
-- ============================================
DELIMITER $$
CREATE
    TRIGGER company.sex_trigger BEFORE INSERT
    ON company.employee
    FOR EACH ROW BEGIN
         IF NEW.sex = 'M' THEN
               INSERT INTO company.trigger_test VALUES('added male employee');
         ELSEIF NEW.sex = 'F' THEN
               INSERT INTO company.trigger_test VALUES('added female');
         ELSE
               INSERT INTO company.trigger_test VALUES('added other employee');
         END IF;
    END$$
DELIMITER ;

INSERT INTO company.employee
VALUES(112, 'Pam', 'Beesly', '1988-02-19', 'F', 69000, 106, 3);

DROP TRIGGER company.my_trigger;
DROP TRIGGER company.name_trigger;
DROP TRIGGER company.sex_trigger;
-- =========================================================================
