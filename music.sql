CREATE TABLE IF NOT EXISTS Peple ( id SERIAL PRIMARY KEY,
       name VARCHAR(50) NOT NULL);

CREATE TABLE IF NOT EXISTS Album ( id SERIAL PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        artist_id INTEGER REFERENCES Peple (id),
        production_year date );

CREATE TABLE IF NOT EXISTS Song ( id SERIAL PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        writer_id INTEGER REFERENCES Peple (id) ); 

CREATE TABLE IF NOT EXISTS Track ( id SERIAL PRIMARY KEY,
        album_id INTEGER REFERENCES Album (id),
        song_id INTEGER REFERENCES Song (id),
        replay_time numeric );


-- \d Peple
-- \d Album
-- \d Song
-- \d Track