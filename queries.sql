-- 1. List all movies along with their genres
SELECT 
    m.title, 
    GROUP_CONCAT(g.genre_name, ', ') AS genres  -- Concatenate genres into comma-separated string
FROM Movies m
JOIN MovieGenres mg ON m.movie_id = mg.movie_id  -- Link movies to genres
JOIN Genres g ON mg.genre_id = g.genre_id
GROUP BY m.movie_id, m.title;  -- Group by movie to aggregate genres

-- 2. Find the average rating and number of ratings for each movie
SELECT 
    m.title, 
    ROUND(AVG(r.rating_value), 2) AS avg_rating,  -- Average rating rounded to 2 decimals
    COUNT(r.rating_id) AS rating_count             -- Number of ratings per movie
FROM Movies m
LEFT JOIN Ratings r ON m.movie_id = r.movie_id    -- Left join to include movies with no ratings
GROUP BY m.movie_id, m.title
ORDER BY avg_rating DESC, rating_count DESC;      -- Sort by rating desc, then count desc

-- 3. List users who rated a specific movie, e.g. '3 Idiots'
SELECT 
    u.name, 
    r.rating_value, 
    r.rating_date
FROM Ratings r
JOIN Users u ON r.user_id = u.user_id
JOIN Movies m ON r.movie_id = m.movie_id
WHERE m.title = '3 Idiots'                         -- Filter for specific movie title
ORDER BY r.rating_date DESC;                        -- Most recent ratings first

-- 4. Get all reviews for a specific movie with reviewer name and review date, e.g. 'Dangal'
SELECT 
    u.name, 
    rev.review_text, 
    rev.review_date
FROM Reviews rev
JOIN Users u ON rev.user_id = u.user_id
JOIN Movies m ON rev.movie_id = m.movie_id
WHERE m.title = 'Dangal'                           -- Filter for specific movie
ORDER BY rev.review_date DESC;                      -- Most recent reviews first

-- 5. Find the favorite genre of a user (genre with most ratings by that user)
SELECT 
    g.genre_name, 
    COUNT(*) AS ratings_count
FROM Ratings r
JOIN MovieGenres mg ON r.movie_id = mg.movie_id
JOIN Genres g ON mg.genre_id = g.genre_id
WHERE r.user_id = 1                                -- Replace with desired user_id
GROUP BY g.genre_name
ORDER BY ratings_count DESC                         -- Most rated genre on top
LIMIT 1;                                           -- Only the top genre

-- 6. Recommend movies in the user's favorite genre that the user has NOT rated yet
WITH FavoriteGenre AS (
    SELECT 
        g.genre_id
    FROM Ratings r
    JOIN MovieGenres mg ON r.movie_id = mg.movie_id
    JOIN Genres g ON mg.genre_id = g.genre_id
    WHERE r.user_id = 1                             -- Replace with desired user_id
    GROUP BY g.genre_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
)
SELECT 
    m.title
FROM Movies m
JOIN MovieGenres mg ON m.movie_id = mg.movie_id
JOIN FavoriteGenre fg ON mg.genre_id = fg.genre_id
WHERE m.movie_id NOT IN (
    SELECT movie_id FROM Ratings WHERE user_id = 1 -- Exclude movies already rated by user
);
-- 7.Recommend movies for new users
SELECT 
    m.title,
    ROUND(AVG(r.rating_value), 2) AS avg_rating,
    COUNT(r.rating_id) AS rating_count
FROM Movies m
LEFT JOIN Ratings r ON m.movie_id = r.movie_id
GROUP BY m.movie_id, m.title
ORDER BY avg_rating DESC, rating_count DESC
LIMIT 5;
