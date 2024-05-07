CREATE TABLE IF NOT EXISTS `kenefbet`.`game_winners` (
`idgame_winners` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `idgames` INT UNSIGNED NOT NULL,
  `idusers` INT UNSIGNED NOT NULL,
  FOREIGN KEY (`idgames`) REFERENCES `games`(`idgames`),
  FOREIGN KEY (`idusers`) REFERENCES `users`(`idusers`),
  PRIMARY KEY (`idgame_winners`)
) ENGINE = InnoDB;