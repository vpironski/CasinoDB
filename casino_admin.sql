DROP ROLE IF EXISTS casinoAdmin;
CREATE ROLE casinoAdmin;
GRANT ALL PRIVILEGES ON kenefbet.*  TO casinoAdmin;

drop user if exists casino_admin;
create user casino_admin;
grant casinoAdmin to casino_admin;



