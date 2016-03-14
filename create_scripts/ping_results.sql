CREATE TABLE `ping_results` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lat` varchar(255) DEFAULT '',
  `long` varchar(255) DEFAULT NULL,
  `requesting_guardian` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `address` text,
  PRIMARY KEY (`id`),
  KEY `requesting_guardian` (`requesting_guardian`),
  KEY `driver_id` (`driver_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=403 DEFAULT CHARSET=latin1;