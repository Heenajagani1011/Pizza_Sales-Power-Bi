show databases;
use pizza_sales;

select * from pizza_sales;

#1. Total Revenue
select sum(total_price) as total_revenue from pizza_sales ps ;

#2. Average Order Value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id))
AS Avg_order_Value FROM pizza_sales;


#3. Total Pizzas Sold
 select sum(quantity) as total_pizza_sold from pizza_sales;

#4. Total Orders
select count(distinct order_id) as total_orders from pizza_sales ps ;

#5. Average Pizzas Per Order
#cast: for getting integer or a decimal number 
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales;

#6. daily trend for total orders


#7. Monthly Trend for Orders
SELECT YEAR(order_date) AS Order_Year, MONTH(order_date) AS Order_Month, COUNT(*) AS Total_Orders
FROM pizza_sales ps 
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY Order_Year, Order_Month;


#8. % of Sales by Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as
total_revenue,
CAST(SUM(total_price) * 100 / 
(SELECT SUM(total_price) from pizza_sales) as DECIMAL(10,2)) AS 
PCT
FROM pizza_sales
GROUP BY pizza_category;


#9. % of Sales by Pizza Size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

#10. Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold desc;

#11.Top 5 Pizzas by Revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;

#12. Bottom 5 Pizzas by Revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue asc
limit 5;

#13. Top 5 Pizzas by Quantity
SELECT  pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold desc;


#14. Bottom 5 Pizzas by Quantity
SELECT  pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold asc;




#15 Top 5 Pizzas by Total Orders
SELECT  pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders desc;

#16. Borrom 5 Pizzas by Total Orders
SELECT  pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders asc;





 


