-- 5. To see what tables actually exist in the 'so' schema:
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'so' 
  AND table_type = 'BASE TABLE'
ORDER BY table_name;
