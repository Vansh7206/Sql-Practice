-- ============================================================
-- Practice 3 — Football Analytics
-- Tables: clubs, players, matches, player_stats
-- ============================================================

CREATE TABLE clubs (
    club_id   INT PRIMARY KEY,
    club_name VARCHAR(50),
    city      VARCHAR(50),
    country   VARCHAR(50)
);

CREATE TABLE players (
    player_id    INT PRIMARY KEY,
    player_name  VARCHAR(50),
    club_id      INT,
    position     VARCHAR(20),
    nationality  VARCHAR(50),
    market_value BIGINT          -- in USD
);

CREATE TABLE matches (
    match_id      INT PRIMARY KEY,
    home_club_id  INT,
    away_club_id  INT,
    home_goals    INT,
    away_goals    INT,
    match_date    DATE
);

CREATE TABLE player_stats (
    stat_id     INT PRIMARY KEY,
    player_id   INT,
    match_id    INT,
    goals       INT,
    assists     INT,
    appearances INT
);

-- ============================================================
-- Seed data
-- ============================================================

INSERT INTO clubs VALUES
(1, 'Manchester City',   'Manchester', 'England'),
(2, 'Arsenal',           'London',     'England'),
(3, 'Real Madrid',       'Madrid',     'Spain'),
(4, 'Bayern Munich',     'Munich',     'Germany'),
(5, 'PSG',               'Paris',      'France'),
(6, 'Liverpool',         'Liverpool',  'England');

INSERT INTO players VALUES
(1,  'Erling Haaland',  1, 'Forward',    'Norwegian',  180000000),
(2,  'Kevin De Bruyne', 1, 'Midfielder', 'Belgian',    100000000),
(3,  'Bukayo Saka',     2, 'Midfielder', 'English',     90000000),
(4,  'Martin Odegaard', 2, 'Midfielder', 'Norwegian',   85000000),
(5,  'Vinicius Jr',     3, 'Forward',    'Brazilian',  150000000),
(6,  'Jude Bellingham', 3, 'Midfielder', 'English',    180000000),
(7,  'Harry Kane',      4, 'Forward',    'English',    100000000),
(8,  'Jamal Musiala',   4, 'Midfielder', 'German',     100000000),
(9,  'Kylian Mbappe',   5, 'Forward',    'French',     180000000),
(10, 'Marquinhos',      5, 'Defender',   'Brazilian',   60000000),
(11, 'Mohamed Salah',   6, 'Forward',    'Egyptian',    60000000),
(12, 'Alisson',         6, 'Goalkeeper', 'Brazilian',   40000000),
(13, 'Ben White',       2, 'Defender',   'English',     50000000),
(14, 'Manuel Neuer',    4, 'Goalkeeper', 'German',      15000000),
(15, 'Trent Alexander', 6, 'Defender',   'English',     70000000);

INSERT INTO matches VALUES
(1,  1, 2, 3, 1, '2024-01-10'),
(2,  3, 4, 2, 2, '2024-01-22'),
(3,  5, 6, 1, 2, '2024-02-05'),
(4,  2, 3, 0, 1, '2024-02-18'),
(5,  4, 1, 2, 3, '2024-03-03'),
(6,  6, 2, 2, 2, '2024-03-12'),
(7,  1, 5, 4, 1, '2024-03-20'),
(8,  3, 6, 1, 0, '2024-04-02'),
(9,  2, 4, 1, 1, '2024-04-15'),
(10, 5, 1, 2, 2, '2024-04-28'),
(11, 6, 3, 3, 0, '2024-05-06'),
(12, 4, 2, 1, 2, '2024-05-19');

INSERT INTO player_stats VALUES
(1,  1,  1, 2, 0, 1),
(2,  2,  1, 1, 1, 1),
(3,  3,  1, 1, 0, 1),
(4,  5,  2, 1, 1, 1),
(5,  7,  2, 1, 0, 1),
(6,  9,  3, 1, 0, 1),
(7,  11, 3, 2, 0, 1),
(8,  5,  4, 1, 0, 1),
(9,  1,  5, 1, 0, 1),
(10, 2,  5, 0, 2, 1),
(11, 7,  5, 1, 0, 1),
(12, 11, 6, 1, 1, 1),
(13, 3,  6, 1, 1, 1),
(14, 1,  7, 3, 0, 1),
(15, 9,  7, 1, 0, 1),
(16, 6,  8, 0, 1, 1),
(17, 3,  9, 1, 0, 1),
(18, 7,  9, 0, 1, 1),
(19, 9,  10, 2, 0, 1),
(20, 1,  10, 1, 0, 1),
(21, 11, 11, 2, 1, 1),
(22, 6,  11, 0, 0, 1),
(23, 3,  12, 1, 0, 1),
(24, 7,  12, 0, 1, 1);