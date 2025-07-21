-- 9. Search for myself via email
SELECT *
FROM so.t_at_allpeople
WHERE email ILIKE '%julianwaits@shyftoff.com%'
  AND "ImportTS" >= CURRENT_DATE - INTERVAL '7 days'
ORDER BY "ImportTS" DESC
LIMIT 10;
