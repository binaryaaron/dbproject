CREATE TABLE `driving_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `start_lat` varchar(255) DEFAULT NULL,
  `start_long` varchar(255) DEFAULT NULL,
  `end_lat` varchar(255) DEFAULT NULL,
  `end_long` varchar(255) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `left_app` int(11) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `offline_drive` int(11) DEFAULT '0',
  `start_addr` text,
  `end_addr` text,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2322 DEFAULT CHARSET=latin1;