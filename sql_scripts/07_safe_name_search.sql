-- 7. Ultra-safe query with strict limit
SELECT *
FROM so.t_at_allpeople
WHERE (first_name ILIKE '%Julian%' AND last_name ILIKE '%Waits%')
LIMIT 5;
