-- 2. Check what BigQuery tables are replicated
SELECT * 
FROM bq.t_table_definitions
ORDER BY created_at DESC
LIMIT 20;
