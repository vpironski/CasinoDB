INSERT INTO databet.users (username, email, pass, balance, egn) VALUES
('john_doe', 'john@example.com', 'password123', 1000.00, '1234567890'),
('alice_smith', 'alice@example.com', 'alicepass', 500.00, '0987654321'),
('bob_jones', 'bob@example.com', 'bobpass', 750.00, '5432167890'),
('emma_davis', 'emma@example.com', 'emmapass', 1200.00, '9876543210'),
('mike_wilson', 'mike@example.com', 'mikepass', 850.00, '5678901234');

INSERT INTO databet.bank_accounts (user_id, account_number, bank_name) VALUES
(1, '123456789', 'Bank of America'),
(2, '987654321', 'Chase Bank'),
(3, '543216789', 'Wells Fargo'),
(4, '111222333', 'Citibank'),
(5, '444555666', 'US Bank');

INSERT INTO databet.banlist (user_id, reason) VALUES
(1, 'Fraudulent Activity'),
(2, 'Violation of Terms'),
(3, 'Suspicious Account Activity'),
(4, 'Repeated Login Attempts'),
(5, 'Unauthorized Access');

INSERT INTO databet.game_winners (game_id, user_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 4),
(3, 5);

INSERT INTO databet.games (name, kind, chance, jackpot_chance, bonus, jackpot, date_added) VALUES
('Slot Machine', 'Slots', 0.05, 0.01, 0.2, 1000.00, '2024-05-12'),
('Blackjack', 'Card Game', 0.10, 0.02, 0.5, 5000.00, '2024-05-12'),
('Roulette', 'Table Game', 0.08, 0.015, 0.3, 3000.00, '2024-05-12'),
('Poker', 'Card Game', 0.12, 0.025, 0.6, 6000.00, '2024-05-12'),
('Bingo', 'Numbers Game', 0.07, 0.015, 0.25, 2500.00, '2024-05-12');

INSERT INTO databet.most_played (game_id, traffic) VALUES
(1, 100),
(2, 75),
(3, 50),
(4, 90),
(5, 60);

INSERT INTO databet.transaction (size, date, user_id) VALUES
(50.00, '2024-05-10', 1),
(25.00, '2024-05-11', 2),
(100.00, '2024-05-12', 3),
(75.00, '2024-05-10', 4),
(150.00, '2024-05-12', 5);

INSERT INTO databet.user_games (user_id, game_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


