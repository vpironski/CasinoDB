DROP ROLE IF EXISTS casinoUsers;
CREATE ROLE casinoUsers;
GRANT select ON kenefbet.games  TO casinoUsers;
GRANT select ON kenefbet.game_winners  TO casinoUsers;
GRANT select ON kenefbet.most_played  TO casinoUsers;

drop user if exists casino_player;
create user casino_player;
grant casinoUsers to casino_player;

set default role casinoUsers to casino_player;