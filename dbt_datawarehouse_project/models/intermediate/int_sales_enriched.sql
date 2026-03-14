SELECT

    s.order_number,
    s.order_date,
    s.sales_amount,
    s.quantity,
    s.price,

    c.customer_id,

    p.product_name,
    p.category,
    p.subcategory

FROM {{ ref('stg_sales') }} s

LEFT JOIN {{ ref('stg_customers') }} c
    ON s.customer_key = c.customer_key

LEFT JOIN {{ ref('stg_products') }} p
    ON s.product_key = p.product_key
