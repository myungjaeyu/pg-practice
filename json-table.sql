CREATE TABLE Survivor (id SERIAL PRIMARY KEY,
       info JSON NOT NULL,
       items_no INTEGER[]);


-- \d Survivor


INSERT
   INTO Survivor
VALUES (default, '{ "name": "강 KJ", "stats" : { "healing" : 1700, "hungry" : 530, "thirsty" : 950, "stuffed" : 900 }, "bio" : "undefined" }', ARRAY[1, 2, 5, 6, 7]),
       (default, '{ "name": "김 DW", "stats" : { "healing" : 500, "hungry" : 2000, "thirsty" : 1400, "stuffed" : 200 }, "bio" : "소개" }', ARRAY[1, 5, 2]),
       (default, '{ "name": "박 BR", "stats" : { "healing" : 1300, "hungry" : 2000, "thirsty" : 19000, "stuffed" : 200 }, "bio" : "소개" }', ARRAY[3, 7]);


SELECT * 
  FROM Survivor;
-- 모든 서바이버 내역

SELECT items_no[1:3]
  FROM Survivor;
-- 모든 서바이버의 배열 데이터 내 1~3번 원소 내역

SELECT info->'name' AS s_name,
       info->'stats' AS s_stat,
       info->'bio' AS s_bio
  FROM Survivor;
-- 모든 서바이버의 JSON 포멧으로 된 정보 내역

SELECT info->'name' AS s_name,
       info->'stats'->'healing' AS s_healing,
       info->'stats'->'hungry' AS s_hungry,
       info->'stats'->'thirsty' AS s_thirsty,
       info->'stats'->'stuffed' AS s_stuffed,
       info->'bio' AS s_bio
  FROM Survivor;
-- 모든 서바이버의 정보 내역

SELECT row_to_json(s) AS s_json
  FROM Survivor AS s;
-- 모든 데이터를 JSON 포맷으로 변환