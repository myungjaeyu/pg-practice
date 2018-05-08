CREATE TABLE IF NOT EXISTS Cafe( id SERIAL PRIMARY KEY,
       name VARCHAR(32),
       address VARCHAR(255) );

CREATE TABLE IF NOT EXISTS Reviewer( id SERIAL PRIMARY KEY,
       name VARCHAR(32),
       email VARCHAR(50) );

CREATE TABLE IF NOT EXISTS CafeReview( id SERIAL PRIMARY KEY,
       cafe_id INTEGER REFERENCES Cafe (id),
       reviewer_id INTEGER REFERENCES Reviewer (id),
       stars INTEGER,
       title VARCHAR(50),
       review VARCHAR(255),
       CHECK (stars >= 0 AND stars <= 5) );


-- \d Cafe
-- \d Reviewer
-- \d CafeReview


INSERT 
  INTO Cafe
VALUES (default, 'A 카페', '거리'),
       (default, 'B 카페', '거리'),
       (default, 'C 카페', '거리');

INSERT 
  INTO Reviewer
VALUES (default, '김 MH', 'mh@gmail.com'),
       (default, '강 ND', 'nd@gmail.com'),
       (default, '박 KA', 'ka@gmail.com'),
       (default, '이 BW', 'bw@gmail.com');

INSERT 
  INTO CafeReview
VALUES (default, 1, 1, 5, '리뷰 제목', '리뷰 내용'),
       (default, 1, 2, 5, '리뷰 제목', '리뷰 내용'),
       (default, 2, 3, 5, '리뷰 제목', '리뷰 내용'),
       (default, 2, 4, 3, '리뷰 제목', '리뷰 내용'),
       (default, 3, 4, 3, '리뷰 제목', '리뷰 내용');