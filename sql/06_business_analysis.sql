SELECT
    COUNT(*) AS total_providers,
    SUM(Tot_Benes) AS total_beneficiaries,
    SUM(Tot_Srvcs) AS total_services,
    ROUND(SUM(Tot_Sbmtd_Chrg)::numeric, 2) AS total_submitted_charges,
    ROUND(SUM(Tot_Mdcr_Pymt_Amt)::numeric, 2) AS total_medicare_payments
FROM fact_provider_utilization;

SELECT
    p.provider_npi,
    p.provider_last_org_name,
    p.provider_type,
    ROUND(SUM(f.Tot_Mdcr_Pymt_Amt)::numeric,2) AS total_payments
FROM fact_provider_utilization f
JOIN dim_provider p
    ON f.provider_key = p.provider_key
GROUP BY
    p.provider_npi,
    p.provider_last_org_name,
    p.provider_type
ORDER BY total_payments DESC
LIMIT 10;

SELECT
    provider_type,
    COUNT(*) AS provider_count
FROM dim_provider
GROUP BY provider_type
ORDER BY provider_count DESC
LIMIT 15;

SELECT
    p.provider_type,
    ROUND(
        AVG(f.Tot_Mdcr_Pymt_Amt)::numeric,
        2
    ) AS avg_payment
FROM fact_provider_utilization f
JOIN dim_provider p
    ON f.provider_key = p.provider_key
GROUP BY p.provider_type
ORDER BY avg_payment DESC
LIMIT 15;

SELECT
    l.state_abbreviation,
    SUM(f.Tot_Benes) AS beneficiaries,
    SUM(f.Tot_Srvcs) AS services,
    ROUND(SUM(f.Tot_Mdcr_Pymt_Amt)::numeric,2) AS medicare_payments
FROM fact_provider_utilization f
JOIN dim_location l
    ON f.location_key = l.location_key
GROUP BY l.state_abbreviation
ORDER BY medicare_payments DESC
LIMIT 20;