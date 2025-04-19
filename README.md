# Superstore SQL Sales Trend Analysis – 2016

This project performs a monthly sales trend analysis on the **Sample Superstore** dataset using SQL in **DB Browser for SQLite**. The goal is to calculate and understand revenue and order trends during the year 2016.

---

## Objective

To analyze the **monthly revenue** and **order volume** from the orders table using SQL aggregation functions.

---

## Dataset Used

- **Name:** Sample - Superstore
- **Format:** CSV, imported into SQLite
- **Main Table Used:** `orders`
- **Important Columns:**  
  - `Order Date` (stored as TEXT in MM/DD/YYYY format)  
  - `Sales` (Revenue per order)  
  - `Order ID` (for counting unique orders)

---

## Tools & Technologies

- **DB Browser for SQLite**
- **SQL**
- **Google Sheets** (for result saving/exporting)

---

## Summary of Procedure

1. Imported the CSV into **SQLite** and created a table named `orders`.
2. Explored the dataset structure and verified data types.
3. Wrote and executed an SQL query to:
   - Extract `month` and `year` from the `Order Date`
   - Filter for year 2016
   - Calculate monthly `SUM(Sales)` as total revenue
   - Calculate `COUNT(DISTINCT Order ID)` as order volume
4. Exported the results and visualized them using Google Sheets.

---

## SQL Query

```sql
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
