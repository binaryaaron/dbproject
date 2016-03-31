
alter table driving_record drop index account_id;
alter table driving_record drop index user_id;

alter table users drop index email;
alter table users drop index phone;
alter table users drop index key;
alter table users drop index ds_id;
alter table users drop index twitter_id;
alter table users drop index facebook_id;


alter table ping_results drop index requesting_guardian;
alter table ping_results drop index driver_id;
alter table ping_results drop index account_id;


select id, count(*) as total_drives from driving_record group by id;

select id, email, phone from users order by email limit 10; 

select count(*) as number_of_pings from ping_results where account_id = 2;



create index account_id on driving_record(account_id);
create index user_id on driving_record(user_id);

create index email on users(email);
create index phone on users(phone);
create index key on users(key);
create index ds_id on users(ds_id);
create index twitter_id on users(twitter_id);
create index facebook_id on users(facebook_id);


create index requesting_guardian on users(ds_id);
create index driver_id on users(driver_id);
create index account_id on users(account_id);

-- re runs the statements

select id, count(*) as total_drives from driving_record group by id;

select id, email, phone from users order by email limit 10; 

select count(*) as number_of_pings from ping_results where account_id = 2;
