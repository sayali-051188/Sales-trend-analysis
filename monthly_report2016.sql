SELECT
    STRFTIME('%Y-%m', 
        SUBSTR("Order Date", 7, 4) || '-' || 
        SUBSTR("Order Date", 1, 2) || '-' || 
        SUBSTR("Order Date", 4, 2)
    ) AS year_month,
    SUM(Sales) AS total_revenue,
    COUNT(DISTINCT "Order ID") AS order_volume
FROM
    orders
WHERE
    STRFTIME('%Y',
        SUBSTR("Order Date", 7, 4) || '-' || 
        SUBSTR("Order Date", 1, 2) || '-' || 
        SUBSTR("Order Date", 4, 2)
    ) = '2016'
GROUP BY
    year_month
ORDER BY
    year_month;

	


