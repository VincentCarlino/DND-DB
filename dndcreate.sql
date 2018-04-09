DROP DATABASE IF EXISTS dnd;
CREATE DATABASE dnd;

USE dnd;

CREATE TABLE class
(
	class_name	VARCHAR(50)	PRIMARY KEY,
	class_desc	VARCHAR(8000)
);

CREATE TABLE class_level
(
	class_name	VARCHAR(50),
    class_level INT,
    PRIMARY KEY (class_name, class_level),
    class_abilities VARCHAR(8000),
    
    CONSTRAINT class_name_fk
		FOREIGN KEY (class_name)
		REFERENCES class (class_name)
);

CREATE TABLE race
(
	race_name	VARCHAR(50)	PRIMARY KEY,
	race_desc	VARCHAR(8000),
    race_abilities VARCHAR(8000)
);

CREATE TABLE player_character
(
	character_id	INT PRIMARY KEY AUTO_INCREMENT,
	character_name	VARCHAR(50),
    character_age	INT,
    strength	INT,
    dexterity	INT,
    constitution	INT,
    wisdom	INT,
    intelligence	INT,
    charisma	INT,
    character_race	VARCHAR(50),
    
    CONSTRAINT character_race_fk
		FOREIGN KEY (character_race)
		REFERENCES race (race_name)
);

CREATE TABLE specializes
(
	character_id	INT,
    class_name	VARCHAR(50),
    PRIMARY KEY (character_id, class_name),
    class_level INT,
    
    CONSTRAINT character_id_fk
		FOREIGN KEY (character_id)
		REFERENCES player_character (character_id),
	CONSTRAINT class_type_fk
		FOREIGN KEY (class_name)
		REFERENCES class (class_name)
    
);

CREATE TABLE users
(
	user_id		INT PRIMARY KEY AUTO_INCREMENT,
	username	VARCHAR(50),
    email		VARCHAR(255),
    password	VARCHAR(255)    
);

DELIMITER $$
CREATE PROCEDURE `createUser`(
    IN p_username VARCHAR(20),
    IN p_email VARCHAR(20),
    IN p_password VARCHAR(20)
)
BEGIN
    if ( select exists (select 1 from users where username = p_username) ) THEN
     
        select 'Username Exists !!';
	elseif (select exists (select 1 from users where email = p_email) ) THEN
		select 'Email is currently used for another account.';
	
    ELSE
     
        insert into users
        (
            username,
            email,
            password
        )
        values
        (
            p_username,
            p_email,
            p_password
        );
     
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `validateLogin`(
IN p_username VARCHAR(50)
)
BEGIN
    select * from users where username = p_username;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `selectCharacters`(
IN p_username VARCHAR(50)
)
BEGIN
	DECLARE p_user INT;
    SELECT users.user_id INTO p_user FROM users WHERE users.username = p_username;

	IF p_username = 'admin' 
		THEN SELECT * FROM player_character;
    ELSE 
		SELECT * FROM player_character WHERE player_character.user_id = p_user OR player_character.user_id = 1;
	END IF;
END$$
DELIMITER ;



DELIMITER $$
CREATE PROCEDURE `selectRaces`(
IN p_username VARCHAR(50)
)
BEGIN
	DECLARE p_user INT;
    SELECT users.user_id INTO p_user FROM users WHERE users.username = p_username;

	IF p_username = 'admin' 
		THEN SELECT * FROM race;
    ELSE 
		SELECT * FROM race WHERE race.user_id = p_user OR race.user_id = 1;
	END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `selectClasses`(
IN p_username VARCHAR(50)
)
BEGIN
	DECLARE p_user INT;
    SELECT users.user_id INTO p_user FROM users WHERE users.username = p_username;

	IF p_username = 'admin' 
		THEN SELECT * FROM class;
    ELSE 
		SELECT * FROM class WHERE class.user_id = p_user OR class.user_id = 1;
	END IF;
END$$
DELIMITER ;

CALL selectCharacters('RobB0SS');

SELECT * FROM race;
SELECT * FROM player_character;
SELECT * FROM class;
SELECT * FROM users;

INSERT INTO player_character (character_name, character_age, strength, dexterity, constitution, wisdom, intelligence, charisma, character_race, user_id)
VALUES ('Patrick Shepar', 20, 20, 20, 20, 20, 20, 20, 'Human', 3);


DELETE FROM users
WHERE user_id > 3;
