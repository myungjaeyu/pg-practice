CREATE VIEW _hello AS SELECT 'Hello World';

SELECT * FROM _hello;

CREATE VIEW select_todo AS SELECT * FROM Todo;

SELECT * FROM select_todo;
SELECT * FROM select_todo WHERE flag = 1;

SELECT a.id, b.title FROM Todo AS a, select_todo AS b;