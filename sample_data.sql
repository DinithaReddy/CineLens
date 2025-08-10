-- Users: Mix of Indian and American names
INSERT INTO Users (user_id, name, email) VALUES
(1, 'Aarav Singh', 'aarav.singh@example.in'),
(2, 'Emily Johnson', 'emily.johnson@example.com'),
(3, 'Priya Sharma', 'priya.sharma@example.in'),
(4, 'Michael Brown', 'michael.brown@example.com'),
(5, 'Saanvi Patel', 'saanvi.patel@example.in'),
(6, 'David Wilson', 'david.wilson@example.com'),
(7, 'Rohan Mehta', 'rohan.mehta@example.in'),
(8, 'Sophia Davis', 'sophia.davis@example.com');

-- Movies: Mix of Bollywood and Hollywood hits
INSERT INTO Movies (movie_id, title, release_year) VALUES
(1, '3 Idiots', 2009),
(2, 'Dangal', 2016),
(3, 'Bahubali: The Beginning', 2015),
(4, 'The Dark Knight', 2008),
(5, 'Avengers: Endgame', 2019),
(6, 'Titanic', 1997),
(7, 'Lagaan', 2001),
(8, 'Sholay', 1975),
(9, 'Forrest Gump', 1994),
(10, 'Piku', 2015);

-- Genres (reusing previous genre_ids and adding a few more)
INSERT INTO Genres (genre_id, genre_name) VALUES
(1, 'Drama'),
(2, 'Action'),
(3, 'Biography'),
(4, 'Historical'),
(5, 'Adventure'),
(6, 'Romance'),
(7, 'Comedy');

-- MovieGenres linking movies to genres
INSERT INTO MovieGenres (movie_id, genre_id) VALUES
(1, 7), -- 3 Idiots - Comedy
(1, 1), -- 3 Idiots - Drama
(2, 3), -- Dangal - Biography
(2, 1), -- Dangal - Drama
(3, 2), -- Bahubali - Action
(3, 5), -- Bahubali - Adventure
(4, 2), -- Dark Knight - Action
(4, 1), -- Dark Knight - Drama
(5, 2), -- Avengers Endgame - Action
(5, 5), -- Avengers Endgame - Adventure
(6, 6), -- Titanic - Romance
(6, 1), -- Titanic - Drama
(7, 4), -- Lagaan - Historical
(7, 1), -- Lagaan - Drama
(8, 2), -- Sholay - Action
(8, 1), -- Sholay - Drama
(9, 1), -- Forrest Gump - Drama
(9, 6), -- Forrest Gump - Romance
(10, 7); -- Piku - Comedy

-- Ratings with mixed users and movies
INSERT INTO Ratings (rating_id, user_id, movie_id, rating_value, rating_date) VALUES
(1, 1, 1, 5, '2024-08-01'),
(2, 2, 4, 5, '2024-08-02'),
(3, 3, 2, 4, '2024-08-03'),
(4, 4, 5, 4, '2024-08-04'),
(5, 5, 3, 5, '2024-08-05'),
(6, 6, 6, 4, '2024-08-06'),
(7, 7, 7, 5, '2024-08-07'),
(8, 8, 9, 4, '2024-08-08'),
(9, 1, 10, 5, '2024-08-09');

-- Reviews corresponding to ratings
INSERT INTO Reviews (review_id, user_id, movie_id, review_text, review_date) VALUES
(1, 1, 1, '3 Idiots is a timeless comedy-drama.', '2024-08-01'),
(2, 2, 4, 'Dark Knight sets a high bar for superhero movies.', '2024-08-02'),
(3, 3, 2, 'Dangal is inspiring and well-made.', '2024-08-03'),
(4, 4, 5, 'Avengers: Endgame was epic!', '2024-08-04'),
(5, 5, 3, 'Bahubali has incredible action sequences.', '2024-08-05'),
(6, 6, 6, 'Titanic is a classic romance.', '2024-08-06'),
(7, 7, 7, 'Lagaan beautifully depicts historical India.', '2024-08-07'),
(8, 8, 9, 'Forrest Gump is heartwarming.', '2024-08-08'),
(9, 1, 10, 'Piku is a delightful comedy.', '2024-08-09');
