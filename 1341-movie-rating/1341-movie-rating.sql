   /* Write your T-SQL query statement below */
WITH CTE AS (
    SELECT TOP 1 u.name as results FROM (
        SELECT 
        u.user_id
        , u.name
        , COUNT(DISTINCT MR.movie_id) cnt
        FROM Users U
        JOIN MovieRating MR
            ON U.user_id = MR.user_id
        GROUP BY 
        u.user_id
        , u.name
    ) u
    ORDER BY u.cnt DESC, u.name ASC
), CTE1 AS (
    SELECT TOP 1 M.title as results
    FROM Movies M
    JOIN (
        SELECT 
        movie_id
        , AVG(CAST(rating AS DECIMAL)) as rat
        FROM MovieRating 
        WHERE FORMAT(created_at, 'yyyyMM') = 202002
        GROUP BY 
        movie_id
    ) MR 
        on M.movie_id = MR.movie_id
    ORDER BY MR.rat DESC, M.Title ASC
)
SELECT * FROM CTE
UNION ALL
SELECT * FROM CTE1