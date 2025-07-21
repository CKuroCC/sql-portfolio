-- 3. Find all the report views (vrpt_*)
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'so' 
  AND table_name LIKE 'vrpt_%'
ORDER BY table_name;
