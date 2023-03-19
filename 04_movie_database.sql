select * from movies;
select * from ratings;
select * from links;
select * from genre;
select * from tags;

-- Harry Potter movies
select *
from movies
where title ilike '%Harry Potter%'

--  
select movies.movieid as movieid, ratings.userid as userid, movies.title as title, movies.year as year, ratings.rating as rating, tags.tag as tag 
from movies
join tags
on movies.movieid = tags.movieid
join ratings
on movies.movieid = ratings.movieid
where title ilike '%Harry Potter%'
order by year;

/* it assigns one different rating for each tag that the person chose */


-- AVERAGE RATING FOR EACH MOVIE
select movies.movieid as movieid, movies.title as title, movies.year as year, avg(rating) as av_rating
from movies
join ratings
on movies.movieid = ratings.movieid
where title ilike '%Harry Potter%'
group by movies.movieid, movies.title, year
order by year;

-- AVERAGE RATING AND NUMBER OF RATINGS FOR EACH MOVIE
select movies.movieid as movieid, title as title, movies.year as year, avg(rating) as av_rating, count(rating) as n_rating
from movies
join ratings
on movies.movieid = ratings.movieid
where title ilike '%Harry Potter%'
group by title, movies.movieid
order by year;

-- MOVIES AND TAGS  
select movies.movieid as movieid, title as title, year as year, tags.tag as tag
from movies
full join tags
on movies.movieid = tags.movieid
where title ilike '%Harry Potter%'
group by title, movies.movieid, year, tags.tag;

-- with inner join doesnt show the last movies --> they dont have tags 
select movies.movieid as movieid, title as title, year as year, tags.tag as tag
from movies
join tags
on movies.movieid = tags.movieid
where title ilike '%Harry Potter%'
group by title, movies.movieid, year, tags.tag;

-- HOW MANY TIMES THE TAG WAS USED
select tags.tag as tag, movies.movieid as movieid, year, title,  count(tag) as tag_n
from movies
join tags
on movies.movieid = tags.movieid
where title ilike '%Harry Potter%'
group by tag, movies.movieid;

/*
 * it shows that each tag was used only once except for Magic
 * but if I look for people who used the tag 'everything you want is here
 * it applies the tag to each rating (107 is the number of ratings the movie got
 * ´*/ 

select ratings.userid as userid, movies.movieid as movieid, tags.tag as tag, ratings.rating as rating
from movies
join tags
on movies.movieid = tags.movieid
join ratings
on movies.movieid = ratings.movieid
where tag ilike '%everything%'
group by movies.movieid, ratings.userid, tags.tag, ratings.rating ;

-- same thing with magoc gets more results because it was used for more movies
select ratings.userid as userid, movies.movieid as movieid, tags.tag as tag, ratings.rating as rating, title
from movies
join tags
on movies.movieid = tags.movieid
join ratings
on movies.movieid = ratings.movieid
where tag ilike '%magic%' and title ilike '%Harry%'
group by movies.movieid, ratings.userid, tags.tag, ratings.rating, title ;


-- people who tagged the movie as 'everything you want is here' and then have a low rating
select ratings.userid as userid, movies.movieid as movieid, title, tags.tag as tag, ratings.rating as rating
from movies
join tags
on movies.movieid = tags.movieid
join ratings
on movies.movieid = ratings.movieid
where tag ilike '%everything%' and rating <= 2
group by movies.movieid, ratings.userid, tags.tag, ratings.rating, title ;

-- result of people who gave a low rating
select distinct ratings.userid as userid, movies.movieid as movieid, title, tags.tag as tag, ratings.rating as rating
from movies
join tags
on movies.movieid = tags.movieid
join ratings
on movies.movieid = ratings.movieid
where title ilike '%Harry Potter%' and rating <= 2
group by movies.movieid, ratings.userid, tags.tag, ratings.rating ;

--

select ratings.userid as userid, tags.movieid as movieid, tag, rating
from tags
join ratings
on ratings.movieid = tags.movieid
where ratings.movieid = 4896
group by ratings.userid,tags.movieid,tag, rating  ;


/* user id = 63 (1.5)
user id = 274 (2) , 414, 427, 593 */

-- stalking user id 63 
-- how many movies did he rate and average ratings -
select ratings.userid as userid, count(ratings.rating) as number_rating, avg(ratings.rating) as avg_rating, count( distinct title) as n_movies
from movies
join tags
on movies.movieid = tags.movieid
join ratings
on movies.movieid = ratings.movieid
where ratings.userid = 63
group by ratings.userid;

/*  count of ratings doesnt match the umber of movies he rated --> number_ratings counts every rating per tag
 *  user id = 63 / movies rated: 971  / avg_rating */

-- 
select ratings.userid as userid, title, ratings.rating as rating
from movies
join tags
on movies.movieid = tags.movieid
join ratings
on movies.movieid = ratings.movieid
where ratings.userid = 63
group by ratings.userid, title, rating;

-- number of rows matched with count of distinct movies rated

-- adding the tags column the entries are many more 
select ratings.userid as userid, movies.movieid as movieid, title, tags.tag as tag, ratings.rating as rating
from movies
join tags
on movies.movieid = tags.movieid
join ratings
on movies.movieid = ratings.movieid
where ratings.userid = 63
group by movies.movieid, ratings.userid, tags.tag, ratings.rating;


select ratings.userid as userid, movies.movieid as movieid, title, tags.tag as tag, ratings.rating as rating
from movies
join tags
on movies.movieid = tags.movieid
join ratings
on movies.movieid = ratings.movieid
where ratings.userid = 274
group by movies.movieid, ratings.userid, tags.tag, ratings.rating
order by ratings.rating;