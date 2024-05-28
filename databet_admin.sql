DROP ROLE IF EXISTS databetAdmin;
CREATE ROLE databetAdmin;
GRANT ALL PRIVILEGES ON databet.*  TO databetAdmin;

drop user if exists databet_admin;
create user databet_admin;
grant databetAdmin to databet_admin;

-- set default role databetAdmin to databet_admin; --

