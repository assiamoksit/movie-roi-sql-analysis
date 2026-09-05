SELECT
    CASE
        WHEN budget < 5000000 THEN 'Low Budget (<$5M)'
        WHEN budget < 50000000 THEN 'Mid Budget ($5M-$50M)'
        ELSE 'High Budget (>$50M)'
    END AS budget_tier,
    COUNT(*) AS movie_count,
    ROUND(AVG(revenue * 1.0 / budget), 2) AS avg_roi_multiplier
FROM tmdb_5000_movies
WHERE budget >= 10000 AND revenue > 0
GROUP BY budget_tier
ORDER BY avg_roi_multiplier DESC;  -- Query: Average ROI by genre
SELECT
    json_extract(genres, '$[0].name') AS primary_genre,
    COUNT(*) AS movie_count,
    ROUND(AVG(revenue * 1.0 / budget), 2) AS avg_roi_multiplier
FROM tmdb_5000_movies
WHERE budget >= 10000 AND revenue > 0
GROUP BY primary_genre
HAVING COUNT(*) >= 20
ORDER BY avg_roi_multiplier DESC;  -- Query: Average ROI by release month
SELECT
    strftime('%m', release_date) AS release_month,
    COUNT(*) AS movie_count,
    ROUND(AVG(revenue * 1.0 / budget), 2) AS avg_roi_multiplier
FROM tmdb_5000_movies
WHERE budget >= 10000 AND revenue > 0
GROUP BY release_month
ORDER BY avg_roi_multiplier DESC;