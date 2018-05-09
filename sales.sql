CREATE TABLE IF NOT EXISTS Customer ( id SERIAL NOT NULL PRIMARY KEY,
       first_name VARCHAR(25) NOT NULL,
       last_name VARCHAR(25) NOT NULL,
       address VARCHAR(50) NOT NULL,
       city VARCHAR(30) NOT NULL,
       zip_code VARCHAR(10) NOT NULL,
       phone_number VARCHAR(12) NOT NULL );

CREATE TABLE IF NOT EXISTS Staff ( id SERIAL NOT NULL PRIMARY KEY,
       first_name VARCHAR(25) NULL,
       last_name VARCHAR(25) NULL,
       address VARCHAR(50) NOT NULL,
       city VARCHAR(30) NOT NULL,
       zip_code VARCHAR(10) NOT NULL,
       phone_number VARCHAR(12) NOT NULL );

CREATE TABLE IF NOT EXISTS Vendor ( id SERIAL NOT NULL PRIMARY KEY,
       name VARCHAR(25) NOT NULL,
       address VARCHAR(50) NOT NULL,
       city VARCHAR(30) NOT NULL,
       zip_code VARCHAR(10) NOT NULL,
       phone_number VARCHAR(12) NOT NULL,
       webpage VARCHAR(255) NOT NULL,
       email VARCHAR(50) NOT NULL );


-- \d Customer
-- \d Staff
-- \d Vendor


CREATE TABLE IF NOT EXISTS Category ( id SERIAL NOT NULL PRIMARY KEY,
       name VARCHAR(30) NOT NULL );

CREATE TABLE IF NOT EXISTS Product ( id SERIAL NOT NULL PRIMARY KEY,
       name VARCHAR(50) NOT NULL,
       description VARCHAR(100) NOT NULL,
       price INTEGER NOT NULL DEFAULT 0,
       quantity INTEGER NOT NULL DEFAULT 0,
       vendor_id INTEGER NOT NULL REFERENCES Vendor (id) DEFAULT 0,
       category_id INTEGER NOT NULL REFERENCES Category (id) DEFAULT 0 );


-- \d Category
-- \d Product


CREATE TABLE IF NOT EXISTS Purchase ( id SERIAL NOT NULL PRIMARY KEY,
       purchase_date timestamp NOT NULL,
       invoice_number VARCHAR(50) NOT NULL,
       customer_id INTEGER NOT NULL REFERENCES Customer (id) DEFAULT 0,
       total_price INTEGER NOT NULL DEFAULT 0 );

CREATE TABLE IF NOT EXISTS PurchaseDetail (
       purchase_id INTEGER NOT NULL REFERENCES Purchase (id) DEFAULT 0,
       product_id INTEGER NOT NULL REFERENCES Product (id) DEFAULT 0,
       total_price INTEGER NOT NULL DEFAULT 0,
       quantity INTEGER NOT NULL DEFAULT 0 );


-- \d Purchase
-- \d PurchaseDetail


INSERT 
  INTO Customer
VALUES (default, 'BK', '김', '주소지', '서울', '98023', '01042334322'),
       (default, 'TH', '강', '주소지', '서울', '98023', '01042334322'),
       (default, 'KS', '조', '주소지', '서울', '98023', '01042334322'),
       (default, 'GR', '박', '주소지', '부산', '98023', '01042334322'),
       (default, 'JY', '이', '주소지', '부산', '98023', '01042334322');

INSERT 
  INTO Staff
VALUES (default, 'JB', '김', '주소지', '서울', '98023', '01042334322'),
       (default, 'YM', '박', '주소지', '부산', '98023', '01042334322');

INSERT 
  INTO Vendor
VALUES (default, 'JD쇼핑', '주소지', '서울', '42010', '01022422242', '', 'jd@gmail.com'),
       (default, 'RA쇼핑', '주소지', '서울', '42010', '01022422242', '', 'ra@gmail.com'),
       (default, 'DF기업', '주소지', '부산', '42010', '01022422242', '', 'df@gmail.com');

INSERT 
  INTO Category
VALUES (default, '모자'),
       (default, '상의'),
       (default, '하의');

INSERT 
  INTO Product
VALUES (default, 'A모자', 'A 디자인', 9000, 100, 1, 1),
       (default, 'B 모자', 'B 디자인', 7000, 100, 1, 1),
       (default, 'C 모자', 'C 디자인', 11000, 100, 2, 1),
       (default, 'D 모자', 'D 디자인', 6000, 70, 2, 1),
       (default, 'E 모자', 'E 디자인', 7900, 100, 3, 1),
       (default, 'F 모자', 'F 디자인', 25000, 130, 3, 1),
       (default, 'G 모자', 'G 디자인', 14000, 100, 3, 1),

       (default, 'A 상의', 'A 디자인', 9000, 100, 1, 2),
       (default, 'B 상의', 'B 디자인', 7000, 100, 1, 2),
       (default, 'C 상의', 'C 디자인', 11000, 100, 2, 2),
       (default, 'D 상의', 'D 디자인', 6000, 70, 2, 2),
       (default, 'E 상의', 'E 디자인', 7900, 100, 3, 2),
       (default, 'F 상의', 'F 디자인', 25000, 130, 3, 2),
       (default, 'G 상의', 'G 디자인', 14000, 100, 3, 2),

       (default, 'A 하의', 'A 디자인', 9000, 100, 1, 3),
       (default, 'B 하의', 'B 디자인', 7000, 100, 1, 3),
       (default, 'C 하의', 'C 디자인', 11000, 100, 2, 3),
       (default, 'D 하의', 'D 디자인', 6000, 70, 2, 3),
       (default, 'E 하의', 'E 디자인', 7900, 100, 3, 3),
       (default, 'F 하의', 'F 디자인', 25000, 130, 3, 3),
       (default, 'G 하의', 'G 디자인', 14000, 100, 3, 3);

INSERT
  INTO Purchase
VALUES (default, '2018-05-02 16:00:00', '82323823238232323295', 1, 18000),
       (default, '2018-05-03 22:00:00', '82323823238232323295', 1, 18000),
       (default, '2018-05-04 07:00:00', '82323823238232323295', 2, 18000),
       (default, '2018-05-05 12:00:00', '82323823238232323295', 3, 18000),
       (default, '2018-05-06 01:00:00', '82323823238232323295', 4, 18000),
       (default, '2018-05-06 15:00:00', '82323823238232323295', 4, 18000),
       (default, '2018-05-07 02:00:00', '82323823238232323295', 5, 18000);

INSERT
  INTO PurchaseDetail
VALUES (1, 1, 9000, 1),
       (1, 8, 9000, 1),

       (2, 1, 9000, 1),
       (2, 8, 9000, 1),

       (3, 1, 9000, 1),
       (3, 8, 9000, 1),

       (4, 1, 9000, 1),
       (4, 8, 9000, 1),

       (5, 1, 9000, 1),
       (5, 8, 9000, 1),

       (6, 1, 9000, 1),
       (6, 8, 9000, 1),

       (7, 1, 9000, 1),
       (7, 8, 9000, 1);