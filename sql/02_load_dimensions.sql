\copy dim_provider FROM 'warehouse/dim_provider.csv' DELIMITER ',' CSV HEADER;

\copy dim_location FROM 'warehouse/dim_location.csv' DELIMITER ',' CSV HEADER;

\copy dim_date FROM 'warehouse/dim_date.csv' DELIMITER ',' CSV HEADER;