-- Current day performance by campaign (for a dashboard)
SELECT 
    campaign_nm,
    COUNT(CASE WHEN shift_start <= NOW() THEN 1 END) as completed_intervals,
    AVG(CASE WHEN shift_start <= NOW() THEN actual_hrs/NULLIF(locked_hrs,0) END) as current_fill_rate,
    SUM(CASE WHEN shift_start > NOW() THEN locked_hrs ELSE 0 END) as remaining_locked_hours,
    MAX(CASE WHEN shift_start <= NOW() THEN shift_start END) as last_interval_time
FROM so.vrpt_campaign_shift_demand2
WHERE shift_start::date = CURRENT_DATE
GROUP BY campaign_nm
ORDER BY current_fill_rate;