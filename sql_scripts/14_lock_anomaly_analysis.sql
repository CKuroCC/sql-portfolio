-- 14. Understand lock patterns to catch anomalies
SELECT
    campaign_nm,
    TO_CHAR(shift_start, 'Day') AS day_name,
    TO_CHAR(shift_start, 'HH24:MI') AS time_slot,
    ROUND(AVG(locked_hrs)) AS avg_lock,
    MIN(locked_hrs) AS min_lock,
    MAX(locked_hrs) AS max_lock
FROM
    so.vrpt_campaign_shift_demand2
WHERE
    shift_start::date >= CURRENT_DATE - INTERVAL '14 days'
    AND campaign_nm IN ('NRTC', 'Citizens', 'CARS', 'Nations Benefits', 'Hello Heart')
GROUP BY
    campaign_nm,
    day_name,
    time_slot,
    EXTRACT(DOW FROM shift_start)
ORDER BY
    campaign_nm,
    EXTRACT(DOW FROM shift_start),
    time_slot;
