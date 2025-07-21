-- 8. Find myself in the database using the correct column name
SELECT *
FROM so.t_at_allpeople
WHERE (first_name ILIKE '%Julian%' AND last_name ILIKE '%Waits%')
  AND "ImportTS" >= CURRENT_DATE - INTERVAL '7 days'
ORDER BY "ImportTS" DESC
LIMIT 10;
