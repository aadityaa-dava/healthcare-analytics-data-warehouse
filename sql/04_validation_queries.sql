SELECT COUNT(*) AS provider_count
FROM dim_provider;

SELECT COUNT(*) AS location_count
FROM dim_location;

SELECT COUNT(*) AS date_count
FROM dim_date;

SELECT COUNT(*) AS fact_count
FROM fact_provider_utilization;

SELECT COUNT(*)
FROM fact_provider_utilization
WHERE provider_key IS NULL;

SELECT COUNT(*)
FROM fact_provider_utilization
WHERE location_key IS NULL;

SELECT COUNT(*)
FROM fact_provider_utilization
WHERE date_key IS NULL;