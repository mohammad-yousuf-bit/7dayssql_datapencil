----- q.1 total sales -----
select sum(oi.quantity *unit_price) as total_amount 
from order_items oi
join orders o
on oi.order_id = o.order_id
where status != 'Cancelled'
;
---there are to sales of 57624820.18 of revenue

---Q.2 Revenu product category--
select p.category,
sum(oi.quantity *unit_price) as total_amount 
from order_items oi
join orders o
on  oi.order_id = o.order_id
join products p
on p.product_id = oi.product_id
where o.status <> 'Cancelled'
group by p.category
order by total_amount  ;

/*---- in the category of product-----
  max sales of the Sports & Fitness :- 11008290.30
*/


---- top 10 products highest revenue-------
select oi.product_id,
sum(oi.quantity*oi.unit_price) as total_revenue
from order_items oi
join orders o
on o.order_id = oi.order_id
where o.status != 'Cancelled'
group by oi.product_id
order by total_revenue desc
limit 10
;

/*----top 10 product of heighest revenue----
product_id     total_revenue
26             941213.73
31             869831.94
150            798315.68
56             791818.19
13             787686.90
146            780867.50
18             774431.77
3              757783.84
39             754826.52
70             748359.38
*/

---- monthly revenue ------

select 
extract(month from o.order_date) as month,
sum(oi.quantity*oi.unit_price) as total
from order_items  oi
join orders o
on oi.order_id = o.order_id
where o.status != 'Cancelled'
group by month
order by total desc
;

----there are the most sales month is 8, 1, 6, 5, 9 on top 5 months of my query

----revenue by sales channel
select o.channel,
sum(oi.quantity*oi.unit_price) as total_revenue
from order_items oi
join orders o
on  o.order_id = oi.order_id
group by channel
order by total_revenue DESC
;

-----the heighest sales are produced on the 'social commerce' ordering---

----total product sold by product category-----
select p.category,
sum(oi.quantity) as total_sales
from order_items oi
join products p
on oi.product_id = p.product_id
join orders o
on o.order_id = oi.order_id
where o.status != 'Cancelled'
group by category
order by total_sales desc
;

--- there are all most all product cross the more than 2000 sales on them

----payment method analysis-----
select payment_method,
count(*) as total_payments
from payments
group by payment_method
order by total_payments desc
;
---there is payment of car is more used in the payment method

----payment status analysis----
select payment_status,
count(*) as total
from payments
group by payment_status
;
 
-----three types like paid=2542, failed=222 and refunded=236 

----average payment amount
select 
round(avg(amount),2) as average_amount
from payments;

----average amount is 20886.06 on them


-----payment amount by payment method
select payment_method,
sum(amount) as total
from payments
group by payment_method
order by total desc
;

--- the most payment are pay by the card method 



select * from orders;
select*from payments;
select * from order_items;
select * from products;