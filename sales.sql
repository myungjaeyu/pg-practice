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


CREATE TABLE IF NOT EXISTS Category ( id SERIAL NOT NULL PRIMARY KEY,
       name VARCHAR(50) NOT NULL );

CREATE TABLE IF NOT EXISTS Product ( id SERIAL NOT NULL PRIMARY KEY,
       name VARCHAR(50) NOT NULL,
       description VARCHAR(100) NOT NULL,
       price INTEGER NOT NULL DEFAULT 0,
       quantity INTEGER NOT NULL DEFAULT 0,
       vendor_id INTEGER NOT NULL REFERENCES Vendor (id) DEFAULT 0,
       category_id INTEGER NOT NULL REFERENCES Category (id) DEFAULT 0 );


-- \d Category
-- \d Product