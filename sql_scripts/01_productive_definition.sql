-- 1. Explore the productivity definition
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_schema = 'so' 
  AND table_name = 'vmv_productive_cas'
ORDER BY ordinal_position;
