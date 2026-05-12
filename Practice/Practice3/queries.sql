-- QUESTIONS
-- 1. Show all players with market value greater than 50,000,000.
SELECT * FROM PLAYERS
WHERE MARKET_VALUE > 50000000
ORDER BY MARKET_VALUE DESC;

-- 2. Show all players from the club 'Arsenal'.
SELECT * FROM PLAYERS
WHERE CLUB_ID = 2;

-- 3. Show player name and position of all Forwards, sorted by market value descending.
SELECT PLAYER_NAME,POSITION FROM PLAYERS
WHERE POSITION = 'Forward'
ORDER BY MARKET_VALUE DESC;

--  4. Show all matches played in March 2024.
SELECT * FROM MATCHES
WHERE MATCH_DATE BETWEEN '2024-03-01' AND '2024-03-31';

-- 5. Show all players where appearances are less than 5.
SELECT P.PLAYER_NAME
FROM PLAYERS P
JOIN PLAYER_STATS PS
ON P.PLAYER_ID = PS.PLAYER_ID
WHERE PS.APPEARANCES < 5;

-- 6. Show player names and nationalities, sorted alphabetically by player name.
SELECT PLAYER_NAME,NATIONALITY
FROM PLAYERS 
ORDER BY PLAYER_NAME;

-- 7. Show all players whose name starts with the letter 'M'.
SELECT * FROM PLAYERS
WHERE PLAYER_NAME LIKE 'M%';

-- 8. Show all matches where goals scored (home + away) are between 3 and 6.
SELECT * FROM MATCHES
WHERE (HOME_GOALS + AWAY_GOALS) BETWEEN 3 AND 6;

-- 9. Show unique positions that players play in.
SELECT DISTINCT(POSITION)
FROM PLAYERS;

-- 10. Show all players where position is either 'Goalkeeper' or 'Defender'.
SELECT * FROM PLAYERS
WHERE POSITION IN ('Goalkeeper','Defender');