-- Database: thingsboard

-- DROP DATABASE IF EXISTS thingsboard;

-- CREATE DATABASE thingsboard
--     WITH
--     OWNER = postgres
--     ENCODING = 'UTF8'
--     LC_COLLATE = 'Dutch_Netherlands.1252'
--     LC_CTYPE = 'Dutch_Netherlands.1252'
--     LOCALE_PROVIDER = 'libc'
--     TABLESPACE = pg_default
--     CONNECTION LIMIT = -1
--     IS_TEMPLATE = False;

CREATE TABLE gassen (
	MQ4_CO_ppm float,
	MQ4_alcohol_ppm float,
	MQ4_rook_ppm float,
	MQ4_H2_ppm float,
	MQ4_LPG_ppm float,
	MQ4_CH4_ppm float,
	MQ135_CO_ppm float,
	MQ135_NH4_ppm float,
	MQ135_CO2_ppm float,
	MQ135_alcohol_ppm float,
	MQ135_tolueen_ppm float,
	MQ135_aceton_ppm float,
	MQ7_alcohol_ppm float,
	MQ7_CH4_ppm float,
	MQ7_LPG_ppm float,
	MQ7_CO_ppm float,
	MQ7_H2_ppm float
);