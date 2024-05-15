DELIMITER //

CREATE TRIGGER before_insert_users
BEFORE INSERT ON `databet`.`users`
FOR EACH ROW
BEGIN
  -- Check for unique email
  IF EXISTS (SELECT 1 FROM `databet`.`users` WHERE email = NEW.email) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email already exists.';
  END IF;

  -- Hash the password
  SET NEW.pass = SHA2(NEW.pass, 256);
END;
//

CREATE TRIGGER before_update_users
BEFORE UPDATE ON `databet`.`users`
FOR EACH ROW
BEGIN
  -- Check for unique email if email is being changed
  IF NEW.email <> OLD.email THEN
    IF EXISTS (SELECT 1 FROM `databet`.`users` WHERE email = NEW.email) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email already exists.';
    END IF;
  END IF;

  -- Check for unique username if username is being changed
  IF NEW.username <> OLD.username THEN
    IF EXISTS (SELECT 1 FROM `databet`.`users` WHERE username = NEW.username) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Username already exists.';
    END IF;
  END IF;

  -- Hash the password if it is being changed (check the hashes)
  IF NEW.pass <> OLD.pass THEN
    SET NEW.pass = SHA2(NEW.pass, 256);
  END IF;
END;
//


-- After Insert Trigger for Updating User Balance
CREATE TRIGGER after_insert_transaction
AFTER INSERT ON databet.transaction
FOR EACH ROW
BEGIN
    -- Update the user's balance by deducting the transaction size
    UPDATE databet.users
    SET balance = balance - NEW.size
    WHERE user_id = NEW.user_id;
END;
//

-- After Insert Trigger for Tracking Most Played Games
CREATE TRIGGER after_insert_user_games
AFTER INSERT ON databet.user_games
FOR EACH ROW
BEGIN
    -- Check if the game already exists in the most_played table
    IF EXISTS (SELECT 1 FROM databet.most_played WHERE game_id = NEW.game_id) THEN
        -- Update the traffic count for the existing game
        UPDATE databet.most_played
        SET traffic = traffic + 1
        WHERE game_id = NEW.game_id;
    ELSE
        -- Insert a new record for the game with traffic count 1
        INSERT INTO databet.most_played (game_id, traffic)
        VALUES (NEW.game_id, 1);
    END IF;
END;
//

-- After Update Trigger for Updating User Balance
CREATE TRIGGER after_update_transaction
AFTER UPDATE ON databet.transaction
FOR EACH ROW
BEGIN
    -- Update the user's balance by adjusting for the difference in transaction size
    UPDATE databet.users
    SET balance = balance - (NEW.size - OLD.size)
    WHERE user_id = NEW.user_id;
END;
\\
DELIMITER ;
