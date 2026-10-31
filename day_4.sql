-----1.total no of customer registers in a database---
select count(*) as total_customers
from customers;

---there are 1000 customers in them

---2.count the total no of customers in each  city to find the city having the most customers

select city, count(*) as customers
from customers
group by city
order by customers desc ;

--- the out of 20 city thre are the lucknow is having most customers 


------3.top 10 customer place heighest orders on non_canclled orders
select c.customer_id, count(o.customer_id) as total_orders
from customers c
join orders o
on c.customer_id = c.customer_id
where status != 'Cancelled'
group by c.customer_id
order by total_orders desc
limit 10
;
 
-----4.calculate the total spending of each customer based on order item value

select c.customer_id, c.full_name, sum(oi.quantity*oi.unit_price) as total_spend
from customers c
join orders o
on c.customer_id = o.customer_id
join order_items oi
on oi.order_id = o.order_id
where status != 'Cancelled'
group by c.customer_id
order by total_spend desc
;

-----5.calculate average spending among customer of all customers who have non canclled order
select avg(spend) as avg_spend
from (
select o.customer_id,sum(oi.quantity*oi.unit_price) as spend
from orders o
join order_items oi
on o.order_id = oi.order_id
where status != 'Cancelled'
group by o.customer_id

) s

-----6.customers with more than 5 orders
SELECT
    c.customer_id,
    c.full_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status <> 'Cancelled'
GROUP BY
    c.customer_id
HAVING COUNT(o.order_id) > 5
ORDER BY total_orders DESC;

---- all most the customers

----7.customer segment analysis
select segment, count(*) as total_numbers
from customers
group by segment

------8.avg of customers 

SELECT
    AVG(order_count) AS avg_orders_per_customer
FROM (
    SELECT
        c.customer_id,
        COUNT(o.order_id) AS order_count
    FROM customers c
    LEFT JOIN orders o
        ON c.customer_id = o.customer_id
        AND o.status <> 'Cancelled'
    GROUP BY c.customer_id
) AS customer_orders;

-----9.Identify the customers who top 10 customers who are not, who generated the highest item sales value for non-cancelled order.

SELECT
    c.customer_id,
    c.full_name,
    SUM(oi.quantity * oi.unit_price) AS total_sales_value
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.status <> 'Cancelled'
GROUP BY
    c.customer_id,
    c.full_name
ORDER BY total_sales_value DESC
LIMIT 10;

-----10.Count the number of new customers registration per month and display the results chronologically.  

SELECT
    DATE_TRUNC('month', signup_date):: DATE AS registration_month,
    COUNT(customer_id) AS new_customers
FROM customers
GROUP BY DATE_TRUNC('month', signup_date)
ORDER BY registration_month ASC;

select * from customers;
select * from orders;
select * from order_items;
select * from products;