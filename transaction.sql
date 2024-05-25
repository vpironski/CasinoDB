START TRANSACTION;

BEGIN
  INSERT INTO game_winners (game_id, user_id)
  VALUES (1001, 5001);

  UPDATE users
  SET balance = balance + (SELECT jackpot FROM games WHERE game_id = 1001)
  WHERE user_id = 5001;

  INSERT INTO transaction (size, date, user_id)
  VALUES ((SELECT jackpot FROM games WHERE game_id = 1001), CURDATE(), 5001);

  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
END;

-- SECOND TRANSACTION 
 START TRANSACTION;
BEGIN
INSERT INTO games (name, kind, chance, jackpot_chance, bonus, jackpot, date_added)
VALUES ('New Game', 'Casino game', 0.5, 0.01, 10.0, 5000.0, CURDATE());

UPDATE most_played
SET game_id = (SELECT MAX(game_id) FROM games), traffic = traffic + 1
WHERE most_played_id = 1;

COMMIT;

--THIRD TRANSACTION
START TRANSACTION;
BEGIN
INSERT INTO users (username, email, pass, balance, egn)
VALUES ('newuser', 'someone@gmail.com', 'pw12345', 0.0, '06xxxxxxxxx');

INSERT INTO bank_accounts (user_id, account_number, bank_name)
VALUES ((SELECT MAX(user_id) FROM users), '92362829191777', 'UBB');

COMMIT;
