-- Compare NRTC's metrics to find root cause
SELECT 
    campaign_nm,
    AVG(actual_hrs/NULLIF(locked_hrs,0)) as fill_rate,
    AVG(reliable_hrs/NULLIF(scheduled_hrs,0)) as reliability_rate,
    AVG(scheduled_hrs/NULLIF(locked_hrs,0)) as schedule_coverage,
    SUM(actual_hrs - reliable_hrs) as unreliable_hours_total,
    COUNT(CASE WHEN actual_hrs < locked_hrs * 0.8 THEN 1 END) as understaffed_intervals
FROM so.vrpt_campaign_shift_demand2
WHERE shift_start >= CURRENT_DATE - INTERVAL '14 days'
GROUP BY campaign_nm
ORDER BY reliability_rate;