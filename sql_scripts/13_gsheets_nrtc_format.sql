-- 13. Format ready for Google Sheets automation for the NRTC campaign
SELECT
    campaign_nm AS "Campaign",
    TO_CHAR(shift_start, 'MM/DD/YYYY') AS "Date",
    TO_CHAR(shift_start, 'HH:MI AM') AS "Time-Frame",
    locked_hrs AS "Lock",
    '' AS "Actual",
    '' AS "Percentage"
FROM
    so.vrpt_campaign_shift_demand2
WHERE
    shift_start::date = CURRENT_DATE
    AND campaign_nm = 'NRTC'
ORDER BY
    shift_start;
