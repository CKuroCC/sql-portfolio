-- Find most predictable staffing patterns for automation
SELECT 
    campaign_nm,
    EXTRACT(HOUR FROM shift_start) as hour,
    EXTRACT(DOW FROM shift_start) as day_of_week,
    AVG(locked_hrs) as avg_lock,
    STDDEV(locked_hrs) as lock_variance,
    COUNT(*) as data_points
FROM so.vrpt_campaign_shift_demand2
WHERE shift_start >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY campaign_nm, hour, day_of_week
HAVING COUNT(*) >= 4  -- Enough data for reliability
ORDER BY lock_variance  -- Most consistent patterns first
LIMIT 50;