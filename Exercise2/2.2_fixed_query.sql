-- To make sure we're only selecting the most up-to-date batch for a given date
-- we use a subquery to filter out the highest batch for each date before joining.

WITH ranked_batches AS (
  SELECT
    date,
    batch,
    ROW_NUMBER() OVER (PARTITION BY date ORDER BY batch DESC) AS batch_rank
  FROM `appsflyer_cost.ext_channel`
)
SELECT
  a.date,
  a.app_id,
  CAST(SUM(a.cost) AS INT) AS cost_cost,
  CAST(SUM(a.original_cost) AS INT) AS cost_original_cost,
  SUM(a.installs) AS cost_installs,
  SUM(a.install_dif) AS cost_installs_diff,
  SUM(a.impressions) AS impressions,
  SUM(a.reported_impressions) AS reported_impressions,
  SUM(a.clicks) AS clicks,
  SUM(a.reported_clicks) AS reported_clicks
FROM `appsflyer_cost.ext_channel` AS a
JOIN (
  SELECT
    date,
    MAX(batch) AS max_batch
  FROM ranked_batches
  WHERE batch_rank = 1
  GROUP BY date
) AS b ON a.date = b.date AND a.batch = b.max_batch
GROUP BY 1, 2
ORDER BY 1 DESC;
