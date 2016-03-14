CREATE TABLE `drivers_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `drive_type` varchar(255) DEFAULT NULL,
  `hours_recorded` varchar(255) DEFAULT NULL,
  `notes` text,
  `time_stamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `drive_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `driver_id` (`driver_id`),
  KEY `drive_id` (`drive_id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=latin1;