CREATE TABLE people(
person_id INT,
person_name VARCHAR(10),
age TINYINT,
birthday DATE
);

ALTER TABLE people RENAME TO friends,
CHANGE COLUMN person_id person_id tinyint,
CHANGE column person_name person_nickname varchar(10),
DROP COLUMN birthday,
ADD COLUMN is_married TINYINT AFTER age;

INSERT INTO people
	(person_id, person_name, age, birthday)
    VALUES (1, 'KIM', 21, '1996-11-04');

INSERT INTO people
	(person_id, person_name, age, birthday)
	VALUES
		(4, 'D', 1,'2000-01-01'),
        (5, 'E', 2,'2000-01-02'),
        (6, 'F', 3,'2001-01-02');

INSERT INTO people
	(person_id, person_name, age, birthday)
	VALUES
		(4, 'D', 1,'2000-01-01'),
        (5, 'E', 2,'2000-01-02'),
        (6, 'F', 3,'2001-01-02');

CREATE TABLE sections(
	section_id INT AUTO_INCREMENT PRIMARY KEY,
    section_name VARCHAR(10) NOT NULL,
    floor TINYINT NOT NULL
    );
    
INSERT INTO sections (section_name, floor)
VALUES ( 'A Food', 2),
	   ( 'B Food', 2),
       ( 'C Food', 3),
       ( 'D Food', 3),
       ( 'E Food', 3),
       ( 'F Food', 1),
       ( 'G Food', 1);
