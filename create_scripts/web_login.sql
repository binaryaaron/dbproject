CREATE TABLE `web_login` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) DEFAULT NULL,
  `cookie_id` varchar(255) DEFAULT NULL,
  `valid` int(11) DEFAULT NULL,
  `last_active` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `notifications` text,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `cookie_id` (`cookie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=latin1;