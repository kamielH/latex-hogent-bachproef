CREATE USER 'kamiel'@'localhost' IDENTIFIED BY 'kamiel';
GRANT ALL PRIVILEGES ON *.* TO 'kamiel'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

CREATE DATABASE db_arduino CHARACTER SET = 'utf8' COLLATE = 'utf8_general_ci';

USE db_arduino;
CREATE TABLE MQ135 (
	MQ135_ID    INT UNSIGNED NOT NULL AUTO_INCREMENT,
	CO FLOAT DEFAULT NULL,
    NH4 FLOAT DEFAULT NULL,
    CO2 FLOAT DEFAULT NULL,
    alcohol FLOAT DEFAULT NULL,
    tolueen FLOAT DEFAULT NULL,
    aceton FLOAT DEFAULT NULL,
    gelezen_op datetime default NULL,
	PRIMARY KEY (MQ135_ID)
);
CREATE TABLE MQ7 (
	MQ7_ID    INT UNSIGNED NOT NULL AUTO_INCREMENT,
	alcohol FLOAT DEFAULT NULL,
    CH4 FLOAT DEFAULT NULL,
    LPG FLOAT DEFAULT NULL,
    CO FLOAT DEFAULT NULL,
    H2 FLOAT DEFAULT NULL,
    gelezen_op datetime default NULL,
	PRIMARY KEY (MQ7_ID)
);
CREATE TABLE MQ4 (
	MQ4_ID    INT UNSIGNED NOT NULL AUTO_INCREMENT,
	CO FLOAT DEFAULT NULL,
    alcohol FLOAT DEFAULT NULL,
    rook FLOAT DEFAULT NULL,
    H2 FLOAT DEFAULT NULL,
    LPG FLOAT DEFAULT NULL,
    CH4 FLOAT DEFAULT NULL,
    gelezen_op datetime default NULL,
	PRIMARY KEY (MQ4_ID)
);

CREATE TABLE DHT22 (
	DHT22_ID    INT UNSIGNED NOT NULL AUTO_INCREMENT,
	vochtigheid FLOAT DEFAULT NULL,
    temperatuur FLOAT DEFAULT NULL,
    gelezen_op datetime default NULL,
	PRIMARY KEY (DHT22_ID)
);

CREATE TABLE MQ7_analoog (
	MQ7_analoog_ID    INT UNSIGNED NOT NULL AUTO_INCREMENT,
	voltage FLOAT DEFAULT NULL,
    analoge_waarde FLOAT DEFAULT NULL,
    gelezen_op datetime default NULL,
	PRIMARY KEY (MQ7_analoog_ID)
);

CREATE TABLE R0 (
	R0_ID    INT UNSIGNED NOT NULL AUTO_INCREMENT,
	R0_MQ4 FLOAT DEFAULT NULL,
    R0_MQ135 FLOAT DEFAULT NULL,
    R0_MQ7 FLOAT DEFAULT NULL,
    gelezen_op datetime default NULL,
	PRIMARY KEY (R0_ID)
);

INSERT INTO MQ4 (CO, alcohol, rook, H2, LPG, CH4, gelezen_op) VALUES (1.0, 2.0, 3.0, 4.0, 5.0, 6.0, NOW());


DELIMITER //
CREATE PROCEDURE InsertRecords()
BEGIN
    DECLARE currentDateTime DATETIME DEFAULT '2024-04-28 12:00:00';
    
    WHILE currentDateTime < DATE_ADD('2024-04-29', INTERVAL 1 DAY) DO
        INSERT INTO mq7_analoog(gelezen_op) VALUES (currentDateTime);
        SET currentDateTime = DATE_ADD(currentDateTime, INTERVAL 2 SECOND);
    END WHILE;
END//
DELIMITER ;
CALL InsertRecords();
INSERT INTO DHT22 (vochtigheid, temperatuur) VALUES (50.30, 22.00);
INSERT INTO MQ7_analoog (voltage, analoge_waarde) VALUES (5.00, 744);



