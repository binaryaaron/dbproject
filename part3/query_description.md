# query descriptions -- Aaron Gonzales and Nialls Chavez


This file contains the description and code for various queries in our database.


# SQL commands:

## Ten data retrieval commands

### general query 1
This retrieves the location of a child driving, in this case, for account id 11.
```{.sql}
select * from `ping_results` 
WHERE `account_id` = '11
```

### general query 2
Selects the users who have had password resets and the number of times they have attempted to reset the password.
```{.sql}
SELECT `user_id`, COUNT(*) AS num_resets FROM password_reset 
GROUP BY `user_id` HAVING COUNT(*) > 1
```


### general query 3
Selects users who have gone for a drive and the number of drives 
```{.sql}
SELECT `user_id`, COUNT(*) AS num_drives FROM driving_record 
GROUP BY `user_id` HAVING COUNT(*) > 1
```

### join queries (3 tables)

####  Join 1

Gets the users name, contact information, drive id, and driving school name.
```{.sql}
SELECT `user`.`name`, `user`.`phone`, `driving_record`.`id`, `driving_school`.`name`  from `user` 
LEFT JOIN `driving_record` ON `user`.`id` = `driving_record`.`user_id` 
LEFT JOIN `driving_school` ON `user`.`ds_id` = `driving_school`.`id` 
where `user`.`id`=612 

```

#### join 2
This finds user emails who started signing up for the alpha demo but never finished signing up.
```{.sql}
SELECT DISTINCT(`email`) FROM `alpha_signup` 
WHERE NOT EXISTS (SELECT * FROM `users`  
    WHERE `users`.`email` = `alpha_signup`.`email`
    )
```


### union query
Get all driving schools and vendor ids and names.

```{.sql}
SELECT `id`, `name` from `driving_schools` 
UNION 
SELECT `id`,`company_name` FROM `vendors`
```

### group by query

Group by without aggregates is valid in mysql, but tends to be non-useful in most cases. There are cases in which it can be used similarly to `DISTINCT` but this is not useful. We will include the below query, despite the presence of aggregate queries in other sections.

```{.sql}
SELECT * FROM `users` GROUP BY `birthdate`
```


### order by query
Gets the number of users of each type.
```{.sql}
SELECT `user_type`, COUNT(`user_type`) FROM `users` 
GROUP BY `user_type`;
```


### distinct query
Gets the distinct starting and stopping endpoints in the drives database. Note that this syntax implicitly groups by the four columns after the distinct query and is valid MySQL.
```{.sql}
SELECT DISTINCT `start_lat`,`start_long`,`end_lat`,`end_long` from `driving_record`;
```


### aggregate query
Gets the average number of hours driven by a user.

```{.sql}
SELECT `id`, AVG(`hours_recorded`) from `drivers_log` 
GROUP BY `id`
```


## Six Data modification queries

### Updates

#### Update 1
Update phone id based on logins, as a user can have multiple phones tied to their account. A valid phone ID is required to send and intercept messages to and from a user.
```{.sql}
UPDATE `users` SET `phone_id` = 'APA91bGOpvpQzkx9LSyqxJBSqM67ybGfx9c3jWvrQatOLcrW-UnP1PPh1vunNLDMS-Rgnb_DonMFtTLVFF8KHZgp-M_0QD5Mtl-98bj9mNb69yGWcijPhMxfPVEgWijEv2YmaTN5WNsu',
`phone_type` = 'android'
WHERE `id` = '612'
-- don't do updates without a limit one for saftey purposes
LIMIT 1
```

#### Update 2
Update a user's whitelisted phone number e.g. the number from which they can receive calls during a drive.
```{.sql}
UPDATE `users` SET `white_list` ='["5059999236"]' WHERE `id`=612 limit 1
```

### Delete
```{.sql}
```

#### Delete 1
Deleting a user when they delete their account -- mostly for testing purposes.
```{.sql}
DELETE FROM `users` WHERE `id`= '612' LIMIT 1
```

#### Delete 2
Deleting users from the alpha signup group.
```{.sql}
DELETE FROM `alpha_signup` WHERE `phone`= '5059999236' LIMIT 1
```

### Insert

#### Insert 1
Adds a JSON blob to the database after a drive completes their drive.
```{.sql}
INSERT INTO `driving_record` (`id`, `start_lat`, `start_long`, `end_lat`, `end_long`, `account_id`, `user_id`, `left_app`, `timestamp`, `offline_drive`, `start_addr`, `end_addr`)
  VALUES
  (2435, '35.0821364', '-106.6253542', '35.0821364', '-106.6253542', 143, 613, NULL, '2016-03-30 10:02:45', 0, '{\"premise\":\"Farris Engineering Center\",\"neighborhood\":\"Central Campus\",\"locality\":\"Albuquerque\",\"administrative_area_level_2\":\"Bernalillo County\",\"administrative_area_level_1\":\"NM\",\"country\":\"US\",\"postal_code\":\"87106\"}', '{\"premise\":\"Farris Engineering Center\",\"neighborhood\":\"Central Campus\",\"locality\":\"Albuquerque\",\"administrative_area_level_2\":\"Bernalillo County\",\"administrative_area_level_1\":\"NM\",\"country\":\"US\",\"postal_code\":\"87106\"}');
```

#### Insert 1
Adding a new school to the driving_schools table.
```{.sql}
INSERT INTO `driving_schools` (`id`, `name`, `email`, `img_path`, `address`, `phone`, `city`, `state`, `guided_drive`, `standard_drive`, `_active`)
  VALUES
  (1, 'Nialls Driving School', 'niallsc@gmail.com', '/images/ds_imgs/initials2.png', '4509 magic sky ct', '5059999238', 'Albuquerque', 'New Mexico', 6, 60, 1);
```


## Indices

Our indices are created upon building the tables, but in our index.sql file you will see that they are dropped and added again for testing. We are including the create table statements here.


Creates the driving record table and places indices on both account_id and user_id, as they are important lookup operations.

```{.sql}
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
```

Creates the users table and places keys on commonly queried fields: email,
phone, key, (login key) account_id, ds_id, facebook_id, and twitter_id.

```{.sql}
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
```

Ping results is a commonly used table when users are moving. We index three
keys: requesting_guardian (the parent requesting their child's location)
driver_id, and account_id.

```{.sql}
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
```
