UPDATE `users` SET `phone_id` = 'APA91bGOpvpQzkx9LSyqxJBSqM67ybGfx9c3jWvrQatOLcrW-UnP1PPh1vunNLDMS-Rgnb_DonMFtTLVFF8KHZgp-M_0QD5Mtl-98bj9mNb69yGWcijPhMxfPVEgWijEv2YmaTN5WNsu',
`phone_type` = 'android'
WHERE `id` = '612'
-- don't do updates without a limit one for saftey purposes
LIMIT 1;


UPDATE `users` SET `white_list` ='["5059999236"]' WHERE `id`=612 limit 1;

DELETE FROM `users` WHERE `id`= '612' LIMIT 1;

DELETE FROM `alpha_signup` WHERE `phone`= '5059999236' LIMIT 1;



INSERT INTO `driving_record` (`id`, `start_lat`, `start_long`, `end_lat`, `end_long`, `account_id`, `user_id`, `left_app`, `timestamp`, `offline_drive`, `start_addr`, `end_addr`)
  VALUES
  (2435, '35.0821364', '-106.6253542', '35.0821364', '-106.6253542', 143, 613, NULL, '2016-03-30 10:02:45', 0, '{\"premise\":\"Farris Engineering Center\",\"neighborhood\":\"Central Campus\",\"locality\":\"Albuquerque\",\"administrative_area_level_2\":\"Bernalillo County\",\"administrative_area_level_1\":\"NM\",\"country\":\"US\",\"postal_code\":\"87106\"}', '{\"premise\":\"Farris Engineering Center\",\"neighborhood\":\"Central Campus\",\"locality\":\"Albuquerque\",\"administrative_area_level_2\":\"Bernalillo County\",\"administrative_area_level_1\":\"NM\",\"country\":\"US\",\"postal_code\":\"87106\"}');




INSERT INTO `driving_schools` (`id`, `name`, `email`, `img_path`, `address`, `phone`, `city`, `state`, `guided_drive`, `standard_drive`, `_active`)
  VALUES
  (1, 'Nialls Driving School', 'niallsc@gmail.com', '/images/ds_imgs/initials2.png', '4509 magic sky ct', '5059999238', 'Albuquerque', 'New Mexico', 6, 60, 1);


