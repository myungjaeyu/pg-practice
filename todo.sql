CREATE TABLE Todo ( id SERIAL PRIMARY KEY,
       title VARCHAR(255) NOT NULL,
       flag INTEGER DEFAULT 0); 

INSERT INTO Todo (title, flag) VALUES ('todo item 1', 1);
INSERT INTO Todo (title VALUES ('todo item 2');
INSERT INTO Todo (title) VALUES ('todo item 3');
INSERT INTO Todo (title) VALUES ('todo item 4');
INSERT INTO Todo (title) VALUES ('todo item 5');

SELECT * FROM Todo;

SELECT * FROM Todo WHERE flag = 1;

UPDATE Todo 
   SET title = "updated todo item 3" 
 WHERE id = 3; 

DELETE 
  FROM Todo 
 WHERE id = 3;