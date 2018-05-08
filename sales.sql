CREATE TABLE IF NOT EXISTS Customer ( id SERIAL NOT NULL PRIMARY KEY,
       first_name VARCHAR(25) NOT NULL,
       last_name VARCHAR(25) NOT NULL,
       address VARCHAR(50) NOT NULL,
       city VARCHAR(30) NOT NULL,
       zip_code VARCHAR(10) NOT NULL,
       phone_number VARCHAR(8) NOT NULL );

CREATE TABLE IF NOT EXISTS Staff ( id SERIAL NOT NULL PRIMARY KEY,
       first_name VARCHAR(25) NULL,
       last_name VARCHAR(25) NULL,
       address VARCHAR(50) NOT NULL,
       city VARCHAR(30) NOT NULL,
       zip_code VARCHAR(10) NOT NULL,
       phone_number VARCHAR(8) NOT NULL );

CREATE TABLE IF NOT EXISTS Vendor ( id SERIAL NOT NULL PRIMARY KEY,
       name VARCHAR(25) NOT NULL,
       address VARCHAR(50) NOT NULL,
       city VARCHAR(30) NOT NULL,
       zip_code VARCHAR(10) NOT NULL,
       phone_number VARCHAR(15) NOT NULL,
       webpage VARCHAR(255) NOT NULL,
       email VARCHAR(50) NOT NULL );


-- \d Customer
-- \d Staff
-- \d Vendor