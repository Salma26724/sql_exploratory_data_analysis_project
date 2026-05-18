-- >> Changes Over Time Analysis

-- Analyze sales performance over time
SELECT
DATETRUNC(month, order_date) AS order_date,
SUM(sales_amount) AS total_sales,
COUNT(DISTINCT customer_key) AS total_customers,
SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(month, order_date)
ORDER BY DATETRUNC(month, order_date)

-- >> Cumulative Analysis

-- Calculate the total sales per month
-- and the running total of sales over time
SELECT
order_date,
total_sales,
SUM(total_sales) OVER (ORDER BY order_date) AS running_total_sales
FROM
(
SELECT 
DATETRUNC(month, order_date) AS order_date,
SUM(sales_amount) AS total_sales
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(month, order_date)
)t

-- >> Performance Analysis

/* Analyze the yearly performance of products by comparing their sales
to both the average sales performance of the product and the previous year's sales */

WITH yearly_product_sales AS
(
    SELECT
        p.product_name,
        YEAR(f.order_date) AS order_year,
        SUM(f.sales_amount) AS total_sales
    FROM gold.fact_sales AS f
    LEFT JOIN gold.dim_products AS p
        ON f.product_key = p.product_key
    WHERE f.order_date IS NOT NULL
    GROUP BY
        p.product_name,
        YEAR(f.order_date)
)

SELECT 
    product_name,
    order_year,
    total_sales,
    AVG(total_sales) OVER (PARTITION BY product_name) avg_sales,
    total_sales - AVG(total_sales) OVER (PARTITION BY product_name) diff_avg,
    CASE 
        WHEN total_sales - AVG(total_sales) OVER (PARTITION BY product_name) > 0 THEN 'Above Average'
        WHEN total_sales - AVG(total_sales) OVER (PARTITION BY product_name) < 0 THEN 'Below Average'
        ELSE 'Average'
    END flag_avg,
    -- year over year analysis
    LAG(total_sales) OVER (PARTITION BY product_name ORDER BY order_year) py_sales,
    total_sales - LAG(total_sales) OVER (PARTITION BY product_name ORDER BY order_year) diff_py,
    CASE 
        WHEN total_sales - LAG(total_sales) OVER (PARTITION BY product_name ORDER BY order_year) > 0 THEN 'Increasing'
        WHEN total_sales - LAG(total_sales) OVER (PARTITION BY product_name ORDER BY order_year) < 0 THEN 'Decreasing'
        ELSE 'No Change'
    END flag_py
FROM yearly_product_sales
ORDER BY product_name, order_year

-- >> Part-To-Whole Analysis

-- Which categories contribute the most to overall sales?
WITH category_sales AS (
SELECT
p.category,
SUM(f.sales_amount) total_sales
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON f.product_key = p.product_key
GROUP BY p.category
)

SELECT 
category,
total_sales,
SUM(total_sales) OVER() overall_sales,
CONCAT(ROUND((CAST(total_sales AS FLOAT) / SUM(total_sales) OVER()) * 100, 2), '%') Percentage_sales
FROM category_sales
ORDER BY total_sales DESC

-- >> Data Segmentation

/* Segment products into cost ranges and
count how many products fall into each segment */
WITH cost_ranges AS (
SELECT 
product_key,
product_name,
cost,
CASE
    WHEN cost < 100 THEN 'Below 100'
    WHEN cost BETWEEN 100 AND 500 THEN '100-500'
    WHEN cost BETWEEN 500 AND 1000 THEN '500-1000'
    ELSE 'Above 1000'
END cost_range
FROM gold.dim_products
)

SELECT
cost_range,
COUNT(product_key) total_products
FROM cost_ranges
GROUP BY cost_range
ORDER BY total_products DESC

/* Group customers into three segments based on their spending behaviour:
    VIP: customers with at least 12 months of history and spending more than $5000.
    Regular: customers with at least 12 months of history but spending $5000 or less.
    New: customers with a lifespan less than 12 months.
and find the total number of customers by each group.*/
WITH customer_category AS (
SELECT 
c.customer_key,
SUM(f.sales_amount) total_spending,
MIN(order_date) first_order,
MAX(order_date) last_order,
DATEDIFF(month, MIN(order_date), MAX(order_date)) lifespan_months,
CASE
    WHEN DATEDIFF(month, MIN(order_date), MAX(order_date)) >= 12 AND SUM(f.sales_amount) > 5000 THEN 'VIP'
    WHEN DATEDIFF(month, MIN(order_date), MAX(order_date)) >= 12 AND SUM(f.sales_amount) <= 5000 THEN 'Regular'
    ELSE 'New'
END customer_tag
FROM gold.fact_sales f 
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
GROUP BY c.customer_key
)

SELECT 
COUNT(customer_key) total_customers,
customer_tag
FROM customer_category
GROUP BY customer_tag
ORDER BY total_customers DESC
