-- Total Daily Revenue Query

SELECT 
  CAST(start_time as DATE) AS date,
  country,
  SUM(price_in_usd * (1 - tax_percentage - commission_percentage)) AS total_revenue
FROM 
  `labhouse-418514.notespace.Notespace`
GROUP BY 
  1,2
ORDER BY 
  1,2;
