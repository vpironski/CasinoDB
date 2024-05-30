DELIMITER $$

CREATE PROCEDURE select_games_by_kind (
    in kind VARCHAR(45), 
	in chance FLOAT,
    in bonus FLOAT,
    in jackpot FLOAT
)
BEGIN
    SELECT * 
    FROM databet.games 
    WHERE games.kind = kind 
        AND games.chance = chance 
        AND games.bonus = bonus 
        AND games.jackpot = jackpot
END $$

DELIMITER //


DELIMITER $$
CREATE PROCEDURE select_users_from_banlist(
in reason VARCHAR(255)
)
BEGIN
SELECT * FROM databet.banlist WHERE 
banlist.reason = reason
END $$
DELIMITER //