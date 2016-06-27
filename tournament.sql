-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.


CREATE TABLE Players (
    id   serial primary key,
    name text
);


CREATE TABLE Matches (
    id          serial PRIMARY KEY,
    player_id   serial NOT NULL,
    opponent_id serial NOT NULL,
    winner_id   serial NOT NULL,
    FOREIGN KEY (player_id)   REFERENCES Players(id),
    FOREIGN KEY (opponent_id) REFERENCES Players(id),
    FOREIGN KEY (winner_id)   REFERENCES Players(id)
);
