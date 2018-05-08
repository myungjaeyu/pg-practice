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