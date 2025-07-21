-- 10. Check what columns exist in vrpt_campaign_shift_demand2
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'so' 
  AND table_name = 'vrpt_campaign_shift_demand2'
ORDER BY ordinal_position;
