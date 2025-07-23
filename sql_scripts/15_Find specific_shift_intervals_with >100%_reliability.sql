SELECT
    id,
    campaign_nm,
    shift_start,
    avg_shift_reliability,
    avg_agent_reliability,
    actual_hrs,
    reliable_hrs,
    scheduled_hrs,
    locked_hrs
FROM
    so.vrpt_campaign_shift_demand2
WHERE
    (avg_shift_reliability > 1 OR avg_agent_reliability > 1)
    AND shift_start >= CURRENT_DATE - INTERVAL '14 days'
    AND shift_start < CURRENT_DATE
ORDER BY
    campaign_nm, shift_start
LIMIT 100;