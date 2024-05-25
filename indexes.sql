CREATE INDEX idx_email ON users (email);

CREATE INDEX idx_username_email ON users (username, email);

CREATE INDEX idx_account_number_prefix ON bank_accounts (account_number(10));