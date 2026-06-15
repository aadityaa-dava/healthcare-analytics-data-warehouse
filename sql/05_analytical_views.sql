CREATE OR REPLACE VIEW vw_executive_kpis AS

SELECT
    COUNT(*) AS total_providers,

    SUM(Tot_Benes) AS total_beneficiaries,

    SUM(Tot_Srvcs) AS total_services,

    ROUND(
        SUM(Tot_Sbmtd_Chrg)::numeric,
        2
    ) AS total_submitted_charges,

    ROUND(
        SUM(Tot_Mdcr_Pymt_Amt)::numeric,
        2
    ) AS total_medicare_payments

FROM fact_provider_utilization;

CREATE OR REPLACE VIEW vw_top_provider_payments AS

SELECT
    p.provider_npi,
    p.provider_last_org_name,
    p.provider_type,

    ROUND(
        SUM(f.Tot_Mdcr_Pymt_Amt)::numeric,
        2
    ) AS total_medicare_payments

FROM fact_provider_utilization f

JOIN dim_provider p
    ON f.provider_key = p.provider_key

GROUP BY
    p.provider_npi,
    p.provider_last_org_name,
    p.provider_type

ORDER BY total_medicare_payments DESC;

CREATE OR REPLACE VIEW vw_state_medicare_payments AS

SELECT
    l.state_abbreviation,

    SUM(f.Tot_Benes) AS beneficiaries,

    SUM(f.Tot_Srvcs) AS services,

    ROUND(
        SUM(f.Tot_Mdcr_Pymt_Amt)::numeric,
        2
    ) AS medicare_payments

FROM fact_provider_utilization f

JOIN dim_location l
    ON f.location_key = l.location_key

GROUP BY l.state_abbreviation

ORDER BY medicare_payments DESC;

CREATE OR REPLACE VIEW vw_specialty_performance AS

WITH specialty_metrics AS
(
    SELECT
        p.provider_type,

        COUNT(*) AS provider_count,

        SUM(f.Tot_Mdcr_Pymt_Amt) AS total_payments,

        AVG(f.Tot_Mdcr_Pymt_Amt) AS avg_payment

    FROM fact_provider_utilization f

    JOIN dim_provider p
        ON f.provider_key = p.provider_key

    GROUP BY p.provider_type
)

SELECT

    provider_type,

    provider_count,

    ROUND(total_payments::numeric,2) AS total_payments,

    ROUND(avg_payment::numeric,2) AS avg_payment,

    ROUND(
        (
            total_payments /
            SUM(total_payments) OVER ()
        )::numeric * 100,
        2
    ) AS payment_share_pct,

    RANK() OVER (
        ORDER BY total_payments DESC
    ) AS specialty_rank

FROM specialty_metrics;