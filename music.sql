CREATE TABLE IF NOT EXISTS People ( id SERIAL PRIMARY KEY,
       name VARCHAR(50) NOT NULL);

CREATE TABLE IF NOT EXISTS Album ( id SERIAL PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        artist_id INTEGER REFERENCES People (id),
        production_year date );

CREATE TABLE IF NOT EXISTS Song ( id SERIAL PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        writer_id INTEGER REFERENCES People (id) ); 

CREATE TABLE IF NOT EXISTS Track ( id SERIAL PRIMARY KEY,
        album_id INTEGER REFERENCES Album (id),
        song_id INTEGER REFERENCES Song (id),
        replay_time numeric );


-- \d People
-- \d Album
-- \d Song
-- \d Track


INSERT 
  INTO People
VALUES (default, '김 가수'), -- artists
       (default, '강 가수'),
       (default, '박 가수'),
       (default, '이 가수'),
       (default, '유 가수'),
       (default, '김 작곡'), -- writers
       (default, '강 작곡'),
       (default, '박 작곡'),
       (default, '이 작곡'),
       (default, '유 작곡');
 
INSERT 
  INTO Album 
VALUES (default, 'A 앨범', 1, '1960-12-21'),
       (default, 'B 앨범', 1, '1965-7-14'),
       (default, 'C 앨범', 2, '1970-4-18'),
       (default, 'D 앨범', 3, '1975-10-16'),
       (default, 'E 앨범', 4, '1980-10-2'),
       (default, 'F 앨범', 5, '1985-8-4'),
       (default, 'G 앨범', 1, '1990-6-3'),
       (default, 'H 앨범', 2, '1995-3-5'),
       (default, 'I 앨범', 3, '1972-12-1'),
       (default, 'J 앨범', 4, '1962-9-3');
 
INSERT 
  INTO Song 
VALUES (default, 'A-A 노래', 6),
       (default, 'A-B 노래', 6),
       (default, 'A-C 노래', 6),
       (default, 'A-D 노래', 6),
       (default, 'A-E 노래', 6),
       (default, 'A-F 노래', 6),
       (default, 'A-G 노래', 7),
       (default, 'A-H 노래', 7),
       (default, 'B-A 노래', 7),
       (default, 'B-B 노래', 7),
       (default, 'B-C 노래', 9),
       (default, 'B-D 노래', 9),
       (default, 'B-E 노래', 9),
       (default, 'B-F 노래', 9),
       (default, 'B-G 노래', 9),
       (default, 'B-H 노래', 9),
       (default, 'C-A 노래', 9),
       (default, 'C-B 노래', 9),
       (default, 'C-C 노래', 9),
       (default, 'C-D 노래', 9),
       (default, 'C-E 노래', 9),
       (default, 'C-F 노래', 10),
       (default, 'C-G 노래', 10),
       (default, 'C-H 노래', 10),
       (default, 'D-A 노래', 10),
       (default, 'D-B 노래', 10),
       (default, 'D-C 노래', 10);

INSERT
  INTO Track
VALUES (default, 1, 1, 2.34),
       (default, 1, 2, 2.15),
       (default, 1, 3, 2.20),
       (default, 1, 4, 2.58),
       (default, 2, 5, 2.39),
       (default, 2, 6, 3.18),
       (default, 2, 7, 3.56),
       (default, 2, 8, 3.00),
       (default, 3, 9, 3.50),
       (default, 3, 10, 3.40),
       (default, 3, 11, 4.28),
       (default, 3, 12, 4.08),
       (default, 4, 13, 4.52),
       (default, 4, 14, 4.30),
       (default, 4, 15, 4.53),
       (default, 5, 16, 4.30),
       (default, 5, 17, 5.16),
       (default, 6, 18, 5.38),
       (default, 6, 19, 5.42),
       (default, 7, 20, 5.43),
       (default, 7, 21, 5.34),
       (default, 8, 22, 1.32),
       (default, 8, 23, 1.52),
       (default, 9, 24, 1.56),
       (default, 9, 25, 6.22),
       (default, 10, 26, 6.04),
       (default, 10, 27, 6.08);


SELECT *
  FROM Track
 WHERE album_id = 1;
-- 1번 앨범 내역

SELECT * 
  FROM Album
 WHERE artist_id = 1;
 -- 1번 아티스트 내역

SELECT id,
       replay_time
  FROM Track 
ORDER BY replay_time DESC
LIMIT 1;
-- 가장 긴 재생 시간을 가진 음원 내역

SELECT name,
       replay_time
  FROM Song,
       Track
WHERE Song.id = Track.song_id
ORDER BY Track.replay_time DESC
LIMIT 1;
-- 가장 긴 재생 시간을 가진 음원의 명

SELECT *
  FROM Album
 WHERE production_year BETWEEN '1960-1-1' AND '1969-12-31';
 -- 60년대 앨범 내역

SELECT COUNT(a)
  FROM (SELECT Album.id
          FROM Album
         WHERE production_year BETWEEN '1960-1-1' 
           AND '1969-12-31') AS a;
 -- 60년대 앨범 수
 
SELECT *
  FROM Album
 WHERE production_year IN (SELECT DISTINCT MAX(production_year)
                             FROM Album
                           GROUP BY artist_id)
ORDER BY artist_id ASC;
-- 아티스트의 최신 앨범 내역

SELECT *
  FROM Album
 WHERE production_year IN (SELECT DISTINCT MIN(production_year)
                             FROM Album
                           GROUP BY artist_id)
ORDER BY artist_id ASC;
-- 아티스트의 데뷔 앨범 내역

SELECT Album.id,
       Album.name,
       SUM(Track.replay_time) AS a_sum
  FROM Track,
       Album
 WHERE Album.id = Track.album_id
 GROUP BY Album.id
 ORDER BY a_sum;
-- 앨범내 트랙의 재생 시간 합계 내역

SELECT Album.id,
       Album.name,
       SUM(Track.replay_time) AS a_sum
  FROM Track,
       Album
 WHERE Album.id = Track.album_id
 GROUP BY Album.id
 ORDER BY a_sum DESC 
 LIMIT 1;
-- 앨범내 트랙의 재생시간을 합했을 때 가장긴 

SELECT People.name,
       COUNT(Album.id) as album_count
FROM Album,
     People
WHERE Album.artist_id = People.id
GROUP BY People.name
ORDER BY album_count DESC;
-- 다수의 앨범을 가진 사람들의 정렬 내역

SELECT People.name,
       COUNT(Album.id) as album_count
FROM Album,
     People
WHERE Album.artist_id = People.id
GROUP BY People.name
ORDER BY album_count DESC 
LIMIT 3;
-- 다수의 앨범을 가진 3인의 정렬 내역

SELECT People.name,
       COUNT(Song.id) as song_count
  FROM Song,
       People
 WHERE Song.writer_id = People.id
GROUP BY People.name
ORDER BY song_count DESC;
-- 다수의 곡을 가진 사람들의 정렬 내역

SELECT People.name,
       COUNT(Song.id) as song_count
  FROM Song,
       People
 WHERE Song.writer_id = People.id
GROUP BY People.name
ORDER BY song_count DESC
LIMIT 1;
-- 가장 많은 곡을 가진 사람 내역