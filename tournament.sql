-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

DROP VIEW standings;

DROP TABLE matches;

DROP TABLE players;

CREATE TABLE players
  (
     id   SERIAL PRIMARY KEY,
     NAME TEXT
  );

CREATE TABLE matches
  (
     id          SERIAL  PRIMARY KEY,
     player_id   SERIAL  NOT NULL,
     opponent_id SERIAL  NOT NULL,
     win         BOOLEAN NOT NULL,
     FOREIGN KEY (player_id)   REFERENCES players(id),
     FOREIGN KEY (opponent_id) REFERENCES players(id)
  );

CREATE VIEW standings
AS
  SELECT players.id                 AS id,
         players.name               AS name,
         Count(Nullif(win, FALSE))  AS wins,
         Count(matches.opponent_id) AS matches
  FROM   players
         left join matches
                ON players.id = matches.player_id
  GROUP  BY players.id
  ORDER  BY wins DESC;
