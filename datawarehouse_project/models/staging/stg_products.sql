SELECT
    product_key,
    product_id,
    product_number,
    product_name,
    category_id,
    COALESCE(category, 'Unknown') AS category,
    COALESCE(subcategory, 'Unknown') AS subcategory,
    product_line,
    cost,
    maintenance,
    start_date
FROM {{ source('gold','dim_products') }}