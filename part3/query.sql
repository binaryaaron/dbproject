use nialzcom_school_drive_control;



select * from `ping_results` 
WHERE `account_id` = 11;


SELECT `user_id`, COUNT(*) AS num_resets FROM password_reset 
GROUP BY `user_id` HAVING COUNT(*) > 1;



SELECT `user_id`, COUNT(*) AS num_drives FROM driving_record 
GROUP BY `user_id` HAVING COUNT(*) > 1;


SELECT `users`.`name`, `users`.`phone`, `driving_record`.`id`, `driving_schools`.`name`  from `users` 
LEFT JOIN `driving_record` ON `users`.`id` = `driving_record`.`user_id` 
LEFT JOIN `driving_schools` ON `users`.`ds_id` = `driving_schools`.`id` 
where `users`.`id`=612;



SELECT DISTINCT(`email`) FROM `alpha_signup` 
WHERE NOT EXISTS (SELECT * FROM `users`  
    WHERE `users`.`email` = `alpha_signup`.`email`
    );



SELECT `id`, `name` from `driving_schools` 
UNION 
SELECT `id`,`company_name` FROM `vendors`;




SELECT * FROM `users` GROUP BY `birthdate`;


SELECT COUNT(`user_type`), `user_type` FROM `users` 
GROUP BY `user_type`;



SELECT DISTINCT `start_lat`,`start_long`,`end_lat`,`end_long` from `driving_record`;


SELECT `id`, AVG(`hours_recorded`) from `drivers_log` 
GROUP BY `id`;
