-- Database: datapencil_store

-- CUSTOMER TABLE---
CREATE TABLE customers(
customer_id integer PRIMARY KEY,
full_name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
city VARCHAR(80) NOT NULL,
signup_date DATE NOT NULL,
segment VARCHAR(50) NOT NULL
);

----- PRODUCT TABLE----

CREATE TABLE products(
product_id integer primary key,
product_name varchar(100) not null,
category varchar(80),
price numeric(15,2) not null,
cost numeric(15,2) not null
);

----orders----

create table orders(
order_id integer primary key,
customer_id integer not null,
order_date date not null,
status varchar(30) not null,
channel varchar(50) not null,
 foreign key (customer_id)
 references customers(customer_id)
);

----order_items---

create table order_items(
order_item_id integer primary key,
order_id integer not null,
product_id integer not null,
quantity integer not null,
unit_price numeric(15,2),
foreign key (order_id)
references orders(order_id),
foreign key (product_id)
references product(product_id)
);

---- payments -----

create table payments(
payment_id integer primary key,
order_id integer not null,
payment_method varchar(30) not null,
payment_status varchar(20) not null,
amount numeric(15,2) not null,
foreign key (order_id)
references orders(order_id)
);

---- deliveries -----
create table deliveries(
deliveries_id integer primary key,
order_id integer not null,
dispatch_date date not null,
delivery_date date,
delivery_status varchar(30) not null,
foreign key (order_id)
references orders(order_id)
);

select * from payments;

