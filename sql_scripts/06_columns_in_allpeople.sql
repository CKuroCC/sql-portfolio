-- 6. Check what columns exist in t_at_allpeople
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'so' 
  AND table_name = 't_at_allpeople'
ORDER BY ordinal_position
LIMIT 20;
