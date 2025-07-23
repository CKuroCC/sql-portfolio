-- Since agent table doesn't exist, check what agent data we can access
SELECT 
    table_name,
    column_name
FROM information_schema.columns
WHERE table_schema = 'so'
  AND column_name LIKE '%agent%'
  AND table_name LIKE 'v%'  -- Views might have agent data
ORDER BY table_name;