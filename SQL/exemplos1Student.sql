-- https://youtu.be/HXV3zeQKqGY?t=7716 #FreeCodeCamp Database course
USE girafa;

CREATE TABLE student (
		student_id INT AUTO_INCREMENT,
        name VARCHAR(32) NOT NULL,
        major VARCHAR(32) DEFAULT 'undecided',
        PRIMARY KEY(student_id)
);

#SELECT * FROM student;

#DESCRIBE student; #Mostra todas as informações sobre as colunas da tabela

INSERT INTO student (name, major) VALUES('Jack', 'Biology');
INSERT INTO student (name, major) VALUES('Kate', 'Sociology');
INSERT INTO student(name) VALUES('Claire');
INSERT INTO student (name, major) VALUES('Jack', 'Biology');
INSERT INTO student (name, major) VALUES('Mike', 'Computer Science');
#INSERT INTO student VALUES(6, 'Daniel', 'Computer Science');

UPDATE student SET major = 'Bio' WHERE major = 'Biology';
UPDATE student SET major = 'Computer Science' WHERE major = 'Comp Sci';

#DELETE FROM student WHERE student_id < 3;

#ALTER TABLE student ADD gpa DECIMAL(3,2); #Adiciona coluna na tabela

#DROP TABLE student;
#ALTER TABLE student DROP gpa;