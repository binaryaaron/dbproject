INSERT INTO `users` (`id`, `name`, `gender`, `email`, `phone`, `password`, `birthdate`, `key`, `logged_in`, `account_id`, `phone_type`, `phone_id`, `white_list`, `user_type`, `is_driving`, `active`, `tester`, `last_logged_in`, `settings`, `terms_accepted`, `terms_accepted_date`, `plan`, `setup_complete`, `admin`, `ds_id`, `drivers_log_user`, `twitter_id`, `facebook_id`, `_deleted`)
VALUES
(999, 'Nialls Chavez', 'male', 'niallsc@gmail.com', '5059999238', '*1D822736AF59F970B64E130FC36DCD7372194778', '07/29/1990', 'CAAGLAyV7BuEBAKbYDY8Qv1Fd2NpmjtZCsko7W9VMPwdwFWSiDXfuoVSCMLlg4VUhWcV7mFbSMBOBIxxDw5rZC3GkwGmZCLpZBMxuKZAumNyrFBH4kyU6gjUppahn8OOOHanZCdqS1zp5ZBPYbaQF5f1BPmlyhF5ZCVcmNQcdyfxk4KCVWMmfZCTRiIPGLSfy0o1MJEq9LRSjBZBzRUZC2a2nZAVXfhU0ET4nrA0ZD', 1, 143, 'android', 'APA91bGOpvpQzkx9LSyqxJBSqM67ybGfx9c3jWvrQatOLcrW-UnP1PPh1vunNLDMS-Rgnb_DonMFtTLVFF8KHZgp-M_0QD5Mtl-98bj9mNb69yGWcijPhMxfPVEgWijEv2YmaTN5WNsu', '[\"5059999236\"]', 'account_holder', -1, 1, 1, '2016-03-30 10:02:29', '{\"notify_when_left\":\"0\",\"auto_start\":\"0\",\"auto_start_for_driver\":\"0\",\"co_guardian_access\":\"0\",\"speed_notification\":\"0\",\"auto_reply_to_text\":\"0\",\"drivers_log\":\"1\",\"send_tweet\":\"0\",\"update_status\":\"0\"}', 0, NULL, 'family_plan', 1, NULL, '1', 0, NULL, 10201259105757734, 0);

INSERT INTO `alpha_signup` (`id`, `name`, `email`, `phone`, `registration_code`, `used`, `account_id`, `type`, `phone_type`, `signup_date`, `plan`, `bad_request`, `resend_attempts`, `referral_code`, `ds_id`, `_deleted`)
VALUES
(9999, 'lil jimmy', 'qwertyu@gmail.com', '5059999238', 'spv0hlp', 1, 143, 'driver', 'Android', '2016-03-24 19:45:01', NULL, 0, 0, NULL, NULL, NULL);


UPDATE `users` SET `phone_id` = 'APA91bGOpvpQzkx9LSyqxJBSqM67ybGfx9c3jWvrQatOLcrW-UnP1PPh1vunNLDMS-Rgnb_DonMFtTLVFF8KHZgp-M_0QD5Mtl-98bj9mNb69yGWcijPhMxfPVEgWijEv2YmaTN5WNsu',
`phone_type` = 'android'
WHERE `id` = '999'
-- don't do updates without a limit one for saftey purposes
LIMIT 1;


UPDATE `users` SET `white_list` ='["5057502121"]' WHERE `id`=999 limit 1;

DELETE FROM `users` WHERE `id`= '999' LIMIT 1;

DELETE FROM `alpha_signup` WHERE `id`= '9999' LIMIT 1;



INSERT INTO `driving_record` (`id`, `start_lat`, `start_long`, `end_lat`, `end_long`, `account_id`, `user_id`, `left_app`, `timestamp`, `offline_drive`, `start_addr`, `end_addr`)
  VALUES
  (2435, '35.0821364', '-106.6253542', '35.0821364', '-106.6253542', 143, 613, NULL, '2016-03-30 10:02:45', 0, '{\"premise\":\"Farris Engineering Center\",\"neighborhood\":\"Central Campus\",\"locality\":\"Albuquerque\",\"administrative_area_level_2\":\"Bernalillo County\",\"administrative_area_level_1\":\"NM\",\"country\":\"US\",\"postal_code\":\"87106\"}', '{\"premise\":\"Farris Engineering Center\",\"neighborhood\":\"Central Campus\",\"locality\":\"Albuquerque\",\"administrative_area_level_2\":\"Bernalillo County\",\"administrative_area_level_1\":\"NM\",\"country\":\"US\",\"postal_code\":\"87106\"}');




INSERT INTO `driving_schools` (`id`, `name`, `email`, `img_path`, `address`, `phone`, `city`, `state`, `guided_drive`, `standard_drive`, `_active`)
  VALUES
  (1, 'Nialls Driving School', 'niallsc@gmail.com', '/images/ds_imgs/initials2.png', '4509 magic sky ct', '5059999238', 'Albuquerque', 'New Mexico', 6, 60, 1);


