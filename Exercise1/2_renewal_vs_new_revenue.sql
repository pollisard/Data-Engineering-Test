-- Renewal Revenue vs New Revenue

SELECT
    cast(start_time as date) AS transaction_date,
    SUM(CASE WHEN is_trial_conversion THEN (price_in_usd * (1 - tax_percentage - commission_percentage)) ELSE 0 END) AS new_revenue,
    SUM(CASE WHEN is_trial_conversion is false THEN (price_in_usd * (1 - tax_percentage - commission_percentage)) ELSE 0 END) AS renewal_revenue
FROM
    `labhouse-418514.notespace.Notespace`
WHERE
	is_trial_period is false
GROUP BY
    transaction_date
ORDER BY
    transaction_date desc;
