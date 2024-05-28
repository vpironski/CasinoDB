CREATE INDEX idx_username ON users (username);

CREATE INDEX idx_email ON users (email);

CREATE INDEX idx_email_password ON users (email, password);

CREATE INDEX idx_traffic_prefix ON most_played (traffic(5));
