select genre, round(avg(score),2) from movies
group by genre
having avg(score)>(select avg(score) from movies)