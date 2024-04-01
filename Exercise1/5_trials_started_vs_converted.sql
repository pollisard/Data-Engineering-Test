-- Trials started vs converted
SELECT
  DATE(start_time) AS date,
  SUM(CASE WHEN is_trial_period THEN 1 ELSE 0 END) AS trials_started,
  SUM(CASE WHEN is_trial_conversion THEN 1 ELSE 0 END) AS trials_converted
FROM
  `labhouse-418514.notespace.Notespace`
WHERE start_time > '2023-11-01'
GROUP BY
  1
ORDER BY
  1 DESC;
