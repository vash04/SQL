-- Joins

select * from users t1
cross join groop t2;

select * from users t1
join membership t2
on t1.user_id=t2.user_id;

select * from users t1
left join membership t2
on t1.user_id=t2.user_id;

select * from users t1
right join membership t2
on t1.user_id=t2.user_id;

-- Set Functions

select * from person1
Union
select * from person2;

select * from person1
Union all
select * from person2;

select * from person1
intersect
select * from person2;

select * from person1
except
select * from person2;

-- for full outer join in mysql

select * from person1 t1
left join person2 t2
on t1.id=t2.id
union
select * from person1 t1
right join person2 t2
on t1.id=t2.id;

select t1.name, t2.name as "Emergency Contact" from users1 t1
join users1 t2 
on t1.user_id=t2.emergency_contact;

-- three column join

select * from students t1
join class t2 
on t1.class_id=t2.class_id and t1.enrollment_year=t2.class_year;

-- three table join

select t1.order_id, t3.name, t3.city from order_details t1
join orders t2
on t1.order_id=t2.order_id
join users t3
on t2.user_id=t3.user_id;

select * from order_details t1
join orders t2
on t1.order_id=t2.order_id
join users t3
on t2.user_id=t3.user_id
where city="Pune";

select * from order_details t1
join orders t2
on t1.order_id=t2.order_id
join users t3
on t2.user_id=t3.user_id
where city="Pune";




