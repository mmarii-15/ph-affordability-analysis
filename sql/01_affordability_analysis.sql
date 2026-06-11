SELECT match_status, COUNT(*) AS region_count
FROM analysis_region_affordability
GROUP BY match_status;