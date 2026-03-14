SELECT
    order_number,
    product_key,
    customer_key,
    product_number,
    customer_id,
    order_date,
    shipping_date,
    due_date,
    sales_amount,
    quantity,
    price
FROM {{ source('gold','fact_sales') }}