
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
) ENGINE=InnoDB AUTO_INCREMENT=2437 DEFAULT CHARSET=latin1;


CREATE TABLE `users` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `name` varchar(255) DEFAULT NULL,
 `gender` varchar(255) DEFAULT NULL,
 `email` varchar(255) DEFAULT NULL,
 `phone` varchar(255) DEFAULT NULL,
 `password` varchar(255) DEFAULT NULL,
 `birthdate` varchar(255) DEFAULT NULL,
 `key` varchar(255) DEFAULT NULL,
 `logged_in` int(11) DEFAULT NULL,
 `account_id` int(11) DEFAULT '1',
 `phone_type` varchar(255) DEFAULT '',
 `phone_id` text,
 `white_list` text,
 `user_type` varchar(255) DEFAULT NULL,
 `is_driving` int(11) DEFAULT '-1',
 `active` int(11) DEFAULT NULL,
 `tester` int(11) DEFAULT '1',
 `last_logged_in` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 `settings` text,
 `terms_accepted` int(11) DEFAULT '0',
 `terms_accepted_date` varchar(255) DEFAULT NULL,
 `plan` varchar(255) DEFAULT NULL,
 `setup_complete` int(11) DEFAULT '0',
 `admin` int(11) DEFAULT NULL,
 `ds_id` varchar(255) DEFAULT NULL,
 `drivers_log_user` int(11) DEFAULT '0',
 `twitter_id` bigint(32) DEFAULT NULL,
 `facebook_id` bigint(32) DEFAULT NULL,
 `_deleted` int(11) DEFAULT '0',
 PRIMARY KEY (`id`),
 KEY `email` (`email`),
 KEY `phone` (`phone`),
 KEY `key` (`key`),
 KEY `account_id` (`account_id`),
 KEY `ds_id` (`ds_id`),
 KEY `twitter_id` (`twitter_id`),
 KEY `facebook_id` (`facebook_id`)
) ENGINE=InnoDB AUTO_INCREMENT=613 DEFAULT CHARSET=latin1;





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


