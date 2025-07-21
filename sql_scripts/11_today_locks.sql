-- 11. Get today's lock numbers by campaign and time interval
SELECT
    campaign_nm,
    shift_start,
    locked_hrs AS lock_count
FROM
    so.vrpt_campaign_shift_demand2
WHERE
    shift_start::date = CURRENT_DATE
    AND campaign_nm IN ('NRTC', 'Citizens', 'CARS', 'Nations Benefits', 'Hello Heart')
ORDER BY
    campaign_nm,
    shift_start;
