DROP TABLE IF EXISTS fact_provider_utilization;
DROP TABLE IF EXISTS dim_provider;
DROP TABLE IF EXISTS dim_location;
DROP TABLE IF EXISTS dim_date;

CREATE TABLE dim_provider
(
    provider_key BIGINT PRIMARY KEY,
    provider_npi BIGINT UNIQUE NOT NULL,
    provider_last_org_name TEXT,
    provider_first_name TEXT,
    provider_middle_initial TEXT,
    provider_credentials TEXT,
    entity_code VARCHAR(5),
    provider_type TEXT,
    medicare_participation_flag VARCHAR(5)
);

CREATE TABLE dim_location
(
    location_key BIGINT PRIMARY KEY,
    city TEXT,
    state_abbreviation VARCHAR(10),
    state_fips VARCHAR(10),
    zip_code VARCHAR(10),
    ruca_code NUMERIC,
    ruca_description TEXT,
    country VARCHAR(20)
);

CREATE TABLE dim_date
(
    date_key INTEGER PRIMARY KEY,
    reporting_year INTEGER,
    quarter VARCHAR(20),
    month VARCHAR(20)
);

CREATE TABLE fact_provider_utilization
(
    provider_key BIGINT,
    location_key BIGINT,
    date_key INTEGER,

    total_hcpcs_codes NUMERIC,
    total_beneficiaries NUMERIC,
    total_services NUMERIC,

    total_submitted_charge NUMERIC,
    total_medicare_allowed_amount NUMERIC,
    total_medicare_payment_amount NUMERIC,
    total_medicare_standardized_amount NUMERIC,

    average_beneficiary_age NUMERIC,
    average_risk_score NUMERIC,

    PRIMARY KEY
    (
        provider_key,
        location_key,
        date_key
    ),

    CONSTRAINT fk_provider
        FOREIGN KEY (provider_key)
        REFERENCES dim_provider(provider_key),

    CONSTRAINT fk_location
        FOREIGN KEY (location_key)
        REFERENCES dim_location(location_key),

    CONSTRAINT fk_date
        FOREIGN KEY (date_key)
        REFERENCES dim_date(date_key)
);