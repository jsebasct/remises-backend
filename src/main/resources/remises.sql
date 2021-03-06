DROP SCHEMA REMISES;

CREATE DATABASE REMISES;

USE REMISES;

CREATE TABLE ESTADO (
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NOMBRE VARCHAR(50) NOT NULL
) ENGINE = INNODB;

CREATE TABLE PROVINCIA (
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NOMBRE VARCHAR(50) NOT NULL
) ENGINE = INNODB;

CREATE TABLE CIUDAD (
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ID_PROVINCIA INT,
    NOMBRE VARCHAR(50) NOT NULL,
    INDEX INDEX_PROVINCIA (ID_PROVINCIA),
    FOREIGN KEY (ID_PROVINCIA) 
		REFERENCES PROVINCIA (ID)
			ON DELETE CASCADE
) ENGINE = INNODB;

CREATE TABLE USUARIO (
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    USUARIO VARCHAR(50) NOT NULL,
    CLAVE VARCHAR(20) NOT NULL,
    ROL INT NOT NULL
) ENGINE = INNODB;

CREATE TABLE CHOFER (
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ID_AUTOMOVIL INT,
    NOMBRE VARCHAR(50),
    APELLIDO VARCHAR(50),
    DNI INT(8),
    TELEFONO VARCHAR(20),
    EMAIL VARCHAR(50),
    DIRECCION VARCHAR(50),
    CODIGO_POSTAL INT(6),
    PROVINCIA INT(2),
	CIUDAD INT(9),
	LATITUD VARCHAR(20),
	LONGITUD VARCHAR(20),
    INDEX INDEX_AUTOMOVIL (ID_AUTOMOVIL)
) ENGINE = INNODB;

CREATE TABLE AUTOMOVIL (
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ID_CHOFER INT,
    MARCA VARCHAR(50),
    MODELO VARCHAR(50),
    PATENTE VARCHAR(20),
    ANIO INT(4),
    INDEX INDEX_CHOFER (ID_CHOFER),
    FOREIGN KEY (ID_CHOFER)
		REFERENCES CHOFER (ID)
			ON DELETE CASCADE
) ENGINE = INNODB;

ALTER TABLE CHOFER 
	ADD FOREIGN KEY (ID_AUTOMOVIL) 
		REFERENCES AUTOMOVIL (ID) 
			ON DELETE CASCADE;

CREATE TABLE CLIENTE (
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NOMBRE VARCHAR(50),
    APELLIDO VARCHAR(50),
    DNI INT(8),
    TELEFONO VARCHAR(20),
    EMAIL VARCHAR(50),
    DIRECCION VARCHAR(50),
    CODIGO_POSTAL INT(6),
    PROVINCIA INT(2),
	CIUDAD INT(9),
	LATITUD VARCHAR(20),
	LONGITUD VARCHAR(20)
) ENGINE = INNODB;

CREATE TABLE VIAJE (
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ID_CHOFER INT,
    ID_CLIENTE INT,
    PRECIO DECIMAL(14,2),
    ORIGEN VARCHAR(50),
    LATITUD_OR VARCHAR(20),
    LONGITUD_OR VARCHAR(20),
    DESTINO VARCHAR(50),
    LATITUD_DE VARCHAR(20),
    LONGITUD_DE VARCHAR(20),
    FECHA DATE,
    HORA TIME,
    INDEX INDEX_CHOFER (ID_CHOFER),
    INDEX INDEX_CLIENTE (ID_CLIENTE),
    
    FOREIGN KEY (ID_CHOFER)
		REFERENCES CHOFER (ID)
			ON DELETE CASCADE,
	
    FOREIGN KEY (ID_CLIENTE)
		REFERENCES CLIENTE (ID)
			ON DELETE CASCADE
) ENGINE = INNODB;
