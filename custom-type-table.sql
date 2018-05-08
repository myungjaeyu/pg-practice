CREATE TYPE Guest_Info AS ( name VARCHAR(32),
                           age INTEGER );

-- \d Guest_Info
-- 커스텀 타입 생성


CREATE TABLE Guest ( id SERIAL PRIMARY KEY,
       info Guest_Info );

-- \d Guest


INSERT 
  INTO Guest
VALUES (default, ('Myungjae Yu', 17));


SELECT *
  FROM Guest;

SELECT (info).name,
       (info).age
  FROM Guest;
-- 손님의 정보 내 이름과 나이 내역