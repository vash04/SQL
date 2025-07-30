-- Independent SubQueries

select * from movies 
where score = (select max(score) from movies);

select * from movies 
where gross - budget = (select max(gross-budget) from movies);

select count(*) from movies 
where score>(select avg(score) from movies); 

select * from movies
where year=2000 and score = (select max(score) from movies
			                 where year=2000);
                             
select * from movies
where score = (select max(score) from movies
			  where votes > (select avg(votes) from movies));
              
select * from users
where user_id not in (select distinct(user_id) from orders);

-- by CTE

with top_directors as (select director from movies 
                       group by director
                       order by sum(gross) desc
				       limit 3)
select * from movies
where director in (select * from top_directors); 

select * from movies
where star = (select star from movies
              group by star
              having avg(score)>8.5);
              
select * from movies
where (year, gross-budget) in (select year, max(gross - budget) as "MaxProfit" from movies
                               group by year
					           order by MaxProfit desc);
                               
select * from movies
where (genre, score) in (select genre, max(score) as "MaxScore" from movies
                         where votes>=25000
                         group by genre)
and votes>=25000;

with top_actor_director as
(select star, director, max(gross) from movies
group by star, director
order by sum(gross) desc
limit 5)
select * from movies
where (star, director, gross) in (select * from top_actor_director);

-- Correlated SubQueries

select * from movies m1
where score>(select avg(score) from movies m2
			where m1.genre=m2.genre);
            
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

with fav_food as (SELECT t2.user_id, name, f_name, COUNT(*) as "frequency"
                  FROM users t1
				  JOIN orders t2 ON t1.user_id = t2.user_id
                  JOIN order_details t3 ON t2.order_id = t3.order_id
                  JOIN food t4 ON t3.f_id = t4.f_id
                  GROUP BY name, f_name, t2.user_id, t3.f_id)
select * from fav_food f1
where frequency = (select max(frequency) from fav_food f2
					  where f2.user_id=f1.user_id);
                      
select name, round((votes/(select sum(votes) from movies))*100, 5) as "Percentage_of_votes" from movies;

select name, genre, score, round((select avg(score) from movies m2 where m2.genre=m1.genre), 2) as "avg_score_by_genre" from movies m1;

select r_name, AvgRating from (select r_id, avg(restaurant_rating) as "AvgRating" from orders
                               group by r_id) t1
join restaurants t2
on t1.r_id=t2.r_id;

select genre, round(avg(score), 2) as "AvgScore" from movies 
group by genre
having avg(score) > (select round(avg(score),2) from movies);

select t1.user_id, t2.name, count(*) from orders t1
join users t2 on t1.user_id=t2.user_id
group by user_id

