
-- Изглед за списък с всички потребители и техните баланс и банкови данни:


CREATE VIEW `databet`.`user_account_details` AS
SELECT 
  u.user_id,
  u.username,
  u.email,
  u.balance,
  b.account_number,
  b.bank_name
FROM 
  `databet`.`users` u
LEFT JOIN 
  `databet`.`bank_accounts` b ON u.user_id = b.user_id;


-- Изглед за списък с всички транзакции заедно с детайли за потребители и игри:

CREATE VIEW `databet`.`transaction_details` AS
SELECT 
  t.transaction_id,
  t.size AS transaction_size,
  t.date AS transaction_date,
  u.username,
  g.name AS game_name
FROM 
  `databet`.`transaction` t
JOIN 
  `databet`.`users` u ON t.user_id = u.user_id
LEFT JOIN 
  `databet`.`user_games` ug ON u.user_id = ug.user_id
LEFT JOIN 
  `databet`.`games` g ON ug.game_id = g.game_id;


-- Изглед за списък с всички забранени потребители и причините за тяхната забрана:

CREATE VIEW `databet`.`banned_users` AS
SELECT 
  b.banlist_id,
  u.user_id,
  u.username,
  u.email,
  b.reason
FROM 
  `databet`.`banlist` b
JOIN 
  `databet`.`users` u ON b.user_id = u.user_id;




