-- Find users with unusual record patterns (potential VPN users)
SELECT 
    email,
    full_name,
    COUNT(DISTINCT DATE("ImportTS")) as days_seen,
    COUNT(DISTINCT record_id) as unique_records,
    ARRAY_AGG(DISTINCT stage ORDER BY stage) as stages,
    MIN("ImportTS") as first_seen,
    MAX("ImportTS") as last_seen
FROM so.t_at_allpeople
WHERE "ImportTS" >= CURRENT_DATE - INTERVAL '30 days'
  AND stage IN ('ID / BG / Interview', 'Ready to Work')
GROUP BY email, full_name
HAVING COUNT(DISTINCT record_id) > 1  -- Multiple records might indicate issues
ORDER BY unique_records DESC;