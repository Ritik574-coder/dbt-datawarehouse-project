--===============================================================
-- customer dimantion Metadata info 
--===============================================================
SELECT 
    table_catalog ,
    table_schema ,
    table_name ,
    column_name ,
    data_type ,
    ordinal_position
FROM INFORMATION_SCHEMA.COLUMNS
WHERE
    TABLE_SCHEMA = 'Gold' 
AND
    TABLE_NAME = 'dim_customers' ;
/*===============================================================
=========DIM_CUSTOMERS METADATA INFO=============================
=================================================================
DataWarehouse	Gold	fact_sales	order_number	nvarchar	1
DataWarehouse	Gold	fact_sales	product_key	bigint	2
DataWarehouse	Gold	fact_sales	customer_key	bigint	3
DataWarehouse	Gold	fact_sales	product_number	nvarchar	4
DataWarehouse	Gold	fact_sales	customer_id	int	5
DataWarehouse	Gold	fact_sales	order_date	date	6
DataWarehouse	Gold	fact_sales	shipping_date	date	7
DataWarehouse	Gold	fact_sales	due_date	date	8
DataWarehouse	Gold	fact_sales	sales_amount	decimal	9
DataWarehouse	Gold	fact_sales	quantity	int	10
DataWarehouse	Gold	fact_sales	price	decimal	11
===============================================================*/
-- products dimantion Metadata info 
--===============================================================
SELECT 
    table_catalog ,
    table_schema ,
    table_name ,
    column_name ,
    data_type ,
    ordinal_position
FROM INFORMATION_SCHEMA.COLUMNS
WHERE
    TABLE_SCHEMA = 'Gold' 
AND
    TABLE_NAME = 'dim_products' ;

/*===============================================================
=========DIM_PRODUCTS METADATA INFO=============================
=================================================================
DataWarehouse	Gold	dim_products	product_key	bigint	1
DataWarehouse	Gold	dim_products	product_id	int	2
DataWarehouse	Gold	dim_products	product_number	nvarchar	3
DataWarehouse	Gold	dim_products	product_name	nvarchar	4
DataWarehouse	Gold	dim_products	category_id	nvarchar	5
DataWarehouse	Gold	dim_products	category	nvarchar	6
DataWarehouse	Gold	dim_products	subcategory	nvarchar	7
DataWarehouse	Gold	dim_products	product_line	nvarchar	8
DataWarehouse	Gold	dim_products	cost	decimal	9
DataWarehouse	Gold	dim_products	maintenance	nvarchar	10
DataWarehouse	Gold	dim_products	start_date	date	11
===============================================================*/
-- fact sales Metadata info 
--===============================================================
SELECT 
    table_catalog ,
    table_schema ,
    table_name ,
    column_name ,
    data_type ,
    ordinal_position
FROM INFORMATION_SCHEMA.COLUMNS
WHERE
    TABLE_SCHEMA = 'Gold' 
AND
    TABLE_NAME = 'fact_sales' ;
/*===============================================================
=========FACT_SALES METADATA INFO=============================
=================================================================
DataWarehouse	Gold	fact_sales	order_number	nvarchar	1
DataWarehouse	Gold	fact_sales	product_key	bigint	2
DataWarehouse	Gold	fact_sales	customer_key	bigint	3
DataWarehouse	Gold	fact_sales	product_number	nvarchar	4
DataWarehouse	Gold	fact_sales	customer_id	int	5
DataWarehouse	Gold	fact_sales	order_date	date	6
DataWarehouse	Gold	fact_sales	shipping_date	date	7
DataWarehouse	Gold	fact_sales	due_date	date	8
DataWarehouse	Gold	fact_sales	sales_amount	decimal	9
DataWarehouse	Gold	fact_sales	quantity	int	10
DataWarehouse	Gold	fact_sales	price	decimal	11
===============================================================*/

SELECT *
FROM dbo.fct_sales_summary

SELECT SUM(sales_amount)
FROM Gold.fact_sales;

SELECT SUM(total_sales)
FROM dbo.fct_sales_summary;

SELECT
    TABLE_NAME,
    TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = 'fct_sales_summary';

SELECT TOP 10 *
FROM dbo.fct_sales_summary;

SELECT *
FROM dbo.stg_products
WHERE category IS NULL;