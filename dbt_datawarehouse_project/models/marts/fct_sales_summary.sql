SELECT

    category,
    COUNT(order_number)      AS total_orders,
    SUM(quantity)            AS total_quantity,
    SUM(sales_amount)        AS total_sales

FROM {{ ref('int_sales_enriched') }}

GROUP BY
    category
