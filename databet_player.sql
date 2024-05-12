DROP ROLE IF EXISTS datebetPlayer;
CREATE ROLE datebetPlayer;
GRANT select ON databet.games  TO datebetPlayer;
GRANT select ON databet.game_winners  TO datebetPlayer;
GRANT select ON databet.most_played  TO datebetPlayer;


drop user if exists datebet_player;
create user datebet_player;
grant datebetPlayer to datebet_player;

-- set default role casinoUsers to casino_player; --