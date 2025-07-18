-- sql grouping + sorting

select * from smartphones
where brand_name = "samsung"
order by screen_size desc
limit 5;

select *, (num_front_cameras+num_rear_cameras) as "total_cameras" from smartphones
order by total_cameras desc;

select model, round((sqrt(resolution_width*resolution_width+resolution_height*resolution_height)/screen_size), 2) as "ppi" from smartphones
order by ppi desc;

select * from smartphones
order by battery_capacity desc
limit 1 offset 1;

select model, rating from smartphones
where brand_name="apple"
order by rating asc
limit 1;

select * from smartphones
order by brand_name asc, rating desc;

select * from smartphones
order by brand_name asc, price desc;

select brand_name, count(*) as "number_of_phones", 
round(avg(price),2) as "average_price", 
max(rating) as "max_rating",
round(avg(screen_size),2) as "avg_screen_size",
round(avg(battery_capacity),2) as "avg_battery_capacity"
from smartphones
group by brand_name
order by number_of_phones desc;

select has_nfc, round(avg(price),2) as "avg_price", round(avg(rating),2) as "avg_rating" from smartphones
group by has_nfc;

select has_5g, round(avg(price),2) as "avg_price", round(avg(rating),2) as "avg_rating" from smartphones
group by has_5g;

select extended_memory_available, round(avg(price),2) as "avg_price" from smartphones
group by extended_memory_available;

select brand_name, processor_brand, count(*) as "count_of_models", round(avg(primary_camera_rear),2) as "avg_primary_camera_resolution_rear" from smartphones
group by brand_name, processor_brand










