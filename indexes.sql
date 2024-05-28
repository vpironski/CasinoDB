CREATE INDEX idx_username ON users (username);

CREATE INDEX idx_email ON users (email);

CREATE INDEX idx_email_password ON users (email, password);

-- Statistics --
CREATE INDEX idx_reason_to_be_banned ON banlist (reason(30));
