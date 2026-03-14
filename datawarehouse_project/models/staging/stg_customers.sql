SELECT
    customer_key,
    customer_id
FROM {{ source('gold','dim_customers') }}
