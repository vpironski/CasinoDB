CREATE INDEX idx_username ON user (username);

CREATE INDEX idx_email ON users (email);

CREATE INDEX idx_username_email ON users (username, email);

CREATE INDEX idx_traffic_prefix ON most_played (traffic(5));
