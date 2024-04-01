-- Active subscriptions
SELECT
  country,
  COUNT(*) as active_subs,
FROM
  `labhouse-418514.notespace.Notespace`
WHERE is_trial_period is false
  AND date(effective_end_time) > current_date()
  AND store != 'promotional'
  AND is_sandbox is false
GROUP BY
  1
