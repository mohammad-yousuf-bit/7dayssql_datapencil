----number of orders----
select count(*) from orders;

--- there are 3000 orders in the orders table

----order status all----
select
status,
count(*)
from orders
group by status;
/*---delivery status-------
Delivered  === 1796
Shipped    === 385
Processing === 303
Cancelled  === 236
Returned   === 280*/ 

------most recent orders------
select *
from orders
order by order_date asc
limit 10
;

-----there are are most least order from the date of----
/*2025-01-01
  2025-01-02
  2025-01-03*/

--------highest value orders-------

select order_id, 
sum(quantity* unit_price) as total_amount
from order_items
group by order_id
order by total_amount desc
limit 10;

/*-----in the highest orders are them -----
  order_id    total_amount
     637        62489.96
     2905       62409.52
     1773       59828.72
     2918       59372.12
     1649       59201.36
     2528       57165.76
     2992       56970.76
     1497       56825.24
     2839       56368.68
     2978       55483.76  */

----chromlogical order----	 

select order_date,
count(*) as total_orders
from orders 
group by order_date
order by order_date asc;

----- orders are placed are changed by by day not standard----

---(Q6)Monthly Order Trend---
select EXTRACT(MONTH FROM order_date) as order_month,
count(*) as total_orders
from orders
group by EXTRACT(MONTH FROM order_date)
order by count(*) desc
;


---there are the peak month are 8 they orders are 300  and low volume are 11 they are 130 order only----


--- average  order value----
select 
round(avg(order_amount),2)
from(
select order_id, sum(quantity*unit_price) as order_amount
from order_items
group by order_id
) as order_total;

---there are 20886.06 of total average amount on them---

---rank customer----
select 
c.customer_id,
c.full_name,
count(o.order_id) as orders,
rank() over (order by count(o.order_id) desc) rank_
from customers c
join orders o
on c.customer_id =o.customer_id
group by c.customer_id
order by rank_
limit 10
;


/*----- top 10 customers are 
customer_name:
  Siddharth Khanna
  Tanya Kulkarni
  Krishna Das
  Neha Kumar
  Priya Verma
  Aditya Bose
  Priya Bose
  Simran Patel
  Riya Pillai
  Kabir Sethi*/
