-- 12. Get tomorrow's locks to pre-populate sheets
SELECT
    campaign_nm,
    shift_start::date AS "date",
    TO_CHAR(shift_start, 'HH24:MI') AS start_time,
    locked_hrs AS lock_count
FROM
    so.vrpt_campaign_shift_demand2
WHERE
    shift_start::date = CURRENT_DATE + INTERVAL '1 day'
    AND campaign_nm IN ('NRTC', 'Citizens', 'CARS', 'Nations Benefits', 'Hello Heart')
ORDER BY
    campaign_nm,
    shift_start;
