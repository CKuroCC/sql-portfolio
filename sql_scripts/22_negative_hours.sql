-- Find specific instances of negative hours
SELECT 
    campaign_nm,
    shift_start,
    actual_hrs,
    reliable_hrs,
    scheduled_hrs,
    locked_hrs,
    id
FROM so.vrpt_campaign_shift_demand2
WHERE actual_hrs < 0 
   OR reliable_hrs < 0
ORDER BY shift_start DESC
LIMIT 20;