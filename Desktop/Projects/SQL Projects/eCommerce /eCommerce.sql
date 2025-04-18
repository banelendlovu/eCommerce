/* Creating Tables for eCommerce database */

create table customers(
    custID int primary key auto_increment,
    custName varchar(100),
    email varchar(100) unique,
    address text
);

create table orders (
    orderID int primary key auto_increment,
    custID int,
    orderDate datetime,
    orderStatus enum('Pending', 'Shipped', 'Delivered', 'Cancelled', 'Returned') not null,

    foreign key(custID) references customers(custID)
);

create table products(
    productID int primary key auto_increment,
    productName varchar(100),
    price decimal,
    stock int
);

create table suppliers (
    supplierID int primary key auto_increment,
    supplierName varchar(100),
    productID int,
    mobile varchar(20),

    foreign key(productID) references products(productID)
);

create table payments (
    paymentID int primary key auto_increment,
    amount decimal,
    paymentMethod enum('Credit Card', 'Apple Pay', 'Paypal', 'Bank Transfer') not null,
    paymentStatus enum('Pending', 'Completed', 'Failed', 'Returned') not null,
    orderID int,

    foreign key(orderID) references orders(orderID)
);

create table orderDetails (
    orderDetID int primary key auto_increment,
    quantity int,
    price int,
    orderID int,
    productID int,

    foreign key(orderID) references orders(orderID),
    foreign key(productID) references products(productID)
);

create table category (
    categoryID int primary key auto_increment,
    catName varchar(100),
    productID int,

    foreign key category(productID) references products(productID)
);

/* Inserting values into the eCommerce tables */


/* Customers */

insert into customers (custID, custName, email, address)
values
(1, 'John Doe','john.doe@email.com', '123 Main St, NY'),
(2, 'Jane Smith', 'jane.smith@email.com', '456 Elm St, CA'),
(3, 'Mike Johnson', 'mike.j@email.com', '789 Oak St, TX'),
(4, 'Emily Davis', 'emily.d@email.com', '321 Pine St, FL'),
(5, 'David Brown', 'david.b@email.com', '654 Cedar St, IL'),
(6, 'Sarah White', 'sarah.w@email.com', '987 Maple St, WA'),
(7, 'Kevin Lee', 'kevin.l@email.com', '741 Birch St, NV'),
(8, 'Laura Wilson', 'laura.w@email.com', '852 Palm St, AZ'),
(9, 'Tom Harris', 'tom.h@email.com', '369 Cherry St, NJ'),
(10, 'Olivia Moore', 'olivia.m@email.com', '147 Spruce St, MI');

/* Orders */

insert into orders (orderID, custID, orderDate, orderStatus)
values
(1, 1, '2024-03-01 10:30:00', 'Pending'),
(2, 2, '2024-03-02 14:45:00', 'Shipped'),
(3, 3, '2024-03-03 16:20:00', 'Delivered'),
(4, 4, '2024-03-04 09:10:00', 'Cancelled'),
(5, 5, '2024-03-05 11:50:00', 'Returned'),
(6, 6, '2024-03-06 13:15:00', 'Pending'),
(7, 7, '2024-03-07 15:40:00', 'Shipped'),
(8, 8, '2024-03-08 18:05:00', 'Delivered'),
(9, 9, '2024-03-09 20:30:00', 'Pending'),
(10, 10, '2024-03-10 22:00:00', 'Shipped');

/* Products */

insert into products (productID, productName, price, stock)
values 
(1, 'Wireless Mouse', 15.99, 100),
(2, 'Mechanical Keyboard', 49.99, 50),
(3, 'USB-C Charger', 19.99, 200),
(4, 'Gaming Headset', 89.99, 30),
(5, 'Smartwatch', 129.99, 20),
(6, 'Bluetooth Speaker', 39.99, 80),
(7, 'External SSD', 99.99, 40),
(8, 'Laptop Stand', 25.99, 120),
(9, 'Phone Case', 9.99, 500),
(10, 'LED Desk Lamp', 34.99, 70);

/* Suppliers */

insert into suppliers (supplierID, supplierName, productID, mobile)
values
(1, 'TechSupplies Inc.', 1, '1234567890'),
(2, 'Gadget Hub', 2, '2345678901'),
(3, 'PowerTech', 3, '3456789012'),
(4, 'SoundWave Electronics', 4, '4567890123'),
(5, 'Wearable Solutions', 5, '5678901234'),
(6, 'AudioTech Co.', 6, '6789012345'),
(7, 'Storage Solutions Ltd.', 7, '7890123456'),
(8, 'Office Essentials', 8, '8901234567'),
(9, 'Mobile Accessories', 9, '9012345678'),
(10, 'BrightLights Tech', 10, '123456789');

/* Payments */

insert into payments (paymentID, amount, paymentMethod, paymentStatus, orderID)
values 
(1, 15.99, 'Credit Card', 'Completed', 1),
(2, 49.99, 'PayPal', 'Pending', 2),
(3, 19.99, 'Apple Pay', 'Completed', 3),
(4, 89.99, 'Bank Transfer', 'Failed', 4),
(5, 129.99, 'Credit Card', 'Returned', 5),
(6, 39.99, 'PayPal', 'Completed', 6),
(7, 99.99, 'Apple Pay', 'Pending', 7),
(8, 25.99, 'Credit Card', 'Completed', 8),
(9, 9.99, 'Bank Transfer', 'Failed', 9),
(10, 34.99, 'PayPal', 'Completed', 10);

/* Order Details */

insert into orderDetails (orderDetID, quantity, price, orderID, productID)
values
(1, 2, 15.99, 1, 1),
(2, 1, 49.99, 2, 2),
(3, 3, 19.99, 3, 3),
(4, 1, 89.99, 4, 4),
(5, 2, 129.99, 5, 5),
(6, 1, 39.99, 6, 6),
(7, 1, 99.99, 7, 7),
(8, 4, 25.99, 8, 8),
(9, 5, 9.99, 9, 9),
(10, 2, 34.99, 10, 10);

/* Category */

insert into category (categoryID, catName, productID)
values
(1, 'Computer Peripherals', 1),
(2, 'Computer Peripherals', 2),
(3, 'Accessories', 3),
(4, 'Audio', 4),
(5, 'Wearable Tech', 5),
(6, 'Audio', 6),
(7, 'Storage', 7),
(8, 'Office Equipment', 8),
(9, 'Accessories', 9),
(10, 'Home Office', 10);

/* Queries to retrieve data from the eCommerce tables */

/* 1. Retrieve all orders with customer details (order ID, date, status, customer name, email, address) */

select o.orderID, o.orderDate, o.orderStatus, c.custName, c.email, c.address
from orders o 
join customers c 
on o.custID = c.custID;


/* Extract product details with their respective categories (product ID, name, price, stock, category) */

select p.productID, p.productName, p.price, p.stock, c.catName
from products p
join category c
on p.productID = c.productID; 

/* Get order details, including product names, quantities, and prices for each order */

select p.productName, od.quantity, od.price
from products p
join orderDetails od
on p.productID = od.productID;

/* Calculate the total revenue per product sale */

select orderID, sum(price * quantity) as total_revenue
from orderDetails
group by orderID;

/* Categorize orders based on status (Pending → Processing, Shipped → In Transit, Delivered → Completed) */

select orderID, orderStatus,
case
    when orderStatus = 'Pending' then 'Processing'
    when orderStatus = 'Shipped' then 'In Transit'
    when orderStatus = 'Delivered' then 'Completed'
    else orderStatus
end as currentStatus
from orders;

/* Identify the top 5 best-selling products based on total quantity sold. */

select p.productName, od.quantity
from products p
join orderDetails od
on p.productID = od.productID
order by quantity desc
limit 5;

