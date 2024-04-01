-- Last 30 days Revenue

SELECT
  country,
  SUM(purchase_price_in_usd) as gross_revenue,
  SUM(price_in_usd) as revenue_net_of_refunds, -- "Total Revenue" in the Revenue Chart */
  SUM(price_in_usd * (1 - tax_percentage - commission_percentage)) as proceeds
FROM
  `labhouse-418514.notespace.Notespace`
WHERE date(start_time) >= date_add(date('2024-01-01'), INTERVAL 30 DAY)
  AND is_trial_period is false
  AND ownership_type != 'FAMILY_SHARED'
  AND store != 'promotional'
  AND is_sandbox is not true
GROUP BY 1
