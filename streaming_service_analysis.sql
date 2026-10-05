#Количество пользователей зарегистрировалось в 2024
SELECT count(*) AS count_2024
FROM users
WHERE YEAR(registration_date)=2024; 

#Количество пользователей из каждой страны
SELECT count(*) AS count_users,country
FROM users
group by country;

#Средняя длительность просмотра фильма пользователями из США
SELECT ROUND(avg(watch_time_min),1) AS avg_time_min_usa
FROM views v
JOIN users u 
ON v.user_id=u.user_id
WHERE u.country='USA';

#5 фильмов с наименьшим количеством уникальных зрителей
SELECT movie_id,count(DISTINCT(user_id)) AS count_users
FROM views
GROUP BY movie_id
ORDER BY count_users 
LIMIT 5;

#Месячная выручка от подписок за 2024
SELECT sum(price) AS month_price,date_format(start_date,'%Y-%m') AS period
FROM subscriptions
WHERE year(start_date)=2024
GROUP BY period;

# Дата последнего просмотра
SELECT u.user_id,max(view_date) AS max_date
FROM users u
LEFT JOIN views v
ON v.user_id=u.user_id
GROUP BY user_id
;