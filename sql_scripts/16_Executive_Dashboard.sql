WITH campaign_summary AS (
    -- Step 1: Aggregate raw metrics for each campaign
    SELECT
        campaign_nm,
        SUM(locked_hrs) AS total_locked_hours,
        SUM(actual_hrs) AS total_actual_hours,
        SUM(scheduled_hrs) AS total_scheduled_hours,
        SUM(reliable_hrs) AS total_reliable_hours,
        -- Count specific data quality and performance issues
        COUNT(CASE WHEN actual_hrs < 0 OR reliable_hrs < 0 THEN 1 END) AS negative_hour_incidents,
        COUNT(CASE WHEN avg_shift_reliability > 1 OR avg_agent_reliability > 1 THEN 1 END) AS high_reliability_incidents,
        COUNT(CASE WHEN actual_hrs < (locked_hrs * 0.85) THEN 1 END) AS understaffed_intervals
    FROM
        so.vrpt_campaign_shift_demand2
    WHERE
        -- Look at the last 14 full days of performance data
        shift_start >= CURRENT_DATE - INTERVAL '14 days'
        AND shift_start < CURRENT_DATE
    GROUP BY
        campaign_nm
)
-- Step 2: Calculate KPIs and assign a health status
SELECT
    campaign_nm,
    -- Core KPIs as percentages
    ROUND((total_actual_hours / NULLIF(total_locked_hours, 0)) * 100, 2) AS fill_rate_pct,
    ROUND((total_reliable_hours / NULLIF(total_scheduled_hours, 0)) * 100, 2) AS reliability_rate_pct,
    -- Diagnostic KPI to see if scheduling is the issue
    ROUND((total_scheduled_hours / NULLIF(total_locked_hours, 0)) * 100, 2) AS schedule_coverage_pct,
    -- Data Quality & Performance Flags
    (negative_hour_incidents + high_reliability_incidents) AS total_data_quality_issues,
    understaffed_intervals,
    total_locked_hours,
    -- Assign an overall health status based on the most critical KPIs
    CASE
        WHEN (total_reliable_hours / NULLIF(total_scheduled_hours, 0)) < 0.80 THEN '🚨 Critical Reliability'
        WHEN (total_actual_hours / NULLIF(total_locked_hours, 0)) < 0.85 THEN '🚨 Critical Fill Rate'
        WHEN (total_reliable_hours / NULLIF(total_scheduled_hours, 0)) < 0.90 THEN '⚠️ Warning'
        ELSE '✅ Healthy'
    END AS campaign_health_status
FROM
    campaign_summary
-- CORRECTED ORDER BY CLAUSE
ORDER BY
    -- Must repeat the entire CASE expression here instead of using the alias
    CASE
        WHEN (total_reliable_hours / NULLIF(total_scheduled_hours, 0)) < 0.80 THEN 1
        WHEN (total_actual_hours / NULLIF(total_locked_hours, 0)) < 0.85 THEN 2
        WHEN (total_reliable_hours / NULLIF(total_scheduled_hours, 0)) < 0.90 THEN 3
        ELSE 4
    END,
    -- Also repeat the calculation for the second-level sort
    (total_reliable_hours / NULLIF(total_scheduled_hours, 0));
