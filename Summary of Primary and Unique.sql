CREATE TABLE people(
	first_name CHAR(2),
    last_name CHAR(3),
    nickname VARCHAR(10),
    PRIMARY KEY (first_name)
);

ALTER TABLE people DROP PRIMARY KEY;

ALTER TABLE people ADD PRIMARY KEY(last_name);

CREATE TABLE people(
	person_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name CHAR(2) UNIQUE,
    last_name CHAR(3),
    UNIQUE(first_name, last_name)
);
