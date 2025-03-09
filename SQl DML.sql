-- SQL DML Commands 

-- Insert

create table users(
    user_id int auto_increment primary key,
    name varchar(255) not null,
    email varchar(255) not null unique,
    password varchar(255) not null
    );
    
insert into practice.users(user_id, name, email, password)
values (null, "sheetal", "sheetal@gmail.com", 1234);

insert into practice.users(password, name, email)
values (58697, "rani", "rani@gmail.com");

insert into practice.users
values (null, "pratibha", "pratibha@gmail.com", 2345),
       (null, "rajesh", "rajesh@gmail.com", 2345),
       (null, "harsh", "harsh@gmail.com", 2345),
       (null, "balveer", "balveer@gmail.com", 2345);

-- Select

select * from practice.smartphones;

select model, price, rating from practice.smartphones;

select model, os, battery_capacity from practice.smartphones;

select model, os as "operating_system", battery_capacity as "mAh" from practice.smartphones;

select model, sqrt(resolution_width*resolution_width + resolution_height*resolution_height) as "ppi" from practice.smartphones; 

select model, rating/10 from practice.smartphones;

select *, "smartphone" as "type" from practice.smartphones;

-- Distinct

select distinct(brand_name) as "all_brands" from practice.smartphones;

select distinct(processor_brand) as "all_processors" from practice.smartphones;

select distinct brand_name, processor_brand from practice.smartphones;

-- Where

select * from practice.smartphones
where brand_name="Samsung";

select * from practice.smartphones
where price>60000 and price<70000;

-- between

select * from practice.smartphones
where price between 60000 and 70000;

select * from practice.smartphones
where rating>80 and price<15000;

select * from practice.smartphones
where brand_name="Samsung" and ram_capacity>8;

select * from practice.smartphones
where brand_name="Samsung" and processor_brand>"snapdragon";

select distinct(brand_name) from practice.smartphones
where price>100000;

select * from practice.smartphones
where processor_brand="snapdragon" or processor_brand="exynos" or processor_brand="dimensity";

-- In and Not in

select * from practice.smartphones
where processor_brand in ("snapdragon", "exynos", "dimensity");

select * from practice.smartphones
where processor_brand not in ("snapdragon", "exynos", "dimensity");

-- Update

update practice.smartphones
set processor_brand="dimensity"
where processor_brand="mediatek";

select * from practice.smartphones
where processor_brand="mediatek";

-- Delete

delete from practice.smartphones
where price>200000;

select * from practice.smartphones
where price>200000;

delete from practice.smartphones
where primary_camera_rear>150 and brand_name="samsung";

select * from practice.smartphones
where primary_camera_rear>150 and brand_name="samsung";

-- Aggregate functions

select max(price) from practice.smartphones;

select min(processor_speed) from practice.smartphones;

select max(price) from practice.smartphones
where brand_name="samsung";

select * from practice.smartphones
where brand_name="samsung" and price=110999;

select avg(price) from practice.smartphones 
where brand_name="apple";

select sum(price) from practice.smartphones 
where brand_name="apple";

select count(*) from practice.smartphones
where brand_name="oneplus";

select count(distinct(brand_name)) from practice.smartphones;

select std(screen_size) from practice.smartphones;

select variance(screen_size) from practice.smartphones;

-- Scalar Functions

select abs(price-100000) as "temp" from practice.smartphones;

select model, round(sqrt(resolution_width*resolution_width + resolution_height*resolution_height), 2) as "ppi" from practice.smartphones; 

select ceil(screen_size) from practice.smartphones;

select floor(screen_size) from practice.smartphones;








