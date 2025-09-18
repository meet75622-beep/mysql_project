-- Create the customer table (1)
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    address VARCHAR(255)
);

-- Insert 5 sample entries into the customer table
INSERT INTO customer (customer_id, name, email, address) VALUES
(1, 'Alice Johnson', 'alice.johnson@example.com', '123 Maple Street, Springfield'),
(2, 'Bob Smith', 'bob.smith@example.com', '456 Oak Avenue, Lincoln'),
(3, 'Catherine Lee', 'catherine.lee@example.com', '789 Pine Road, Centerville'),
(4, 'David Kim', 'david.kim@example.com', '1010 Birch Blvd, Franklin'),
(5, 'Emily Davis', 'emily.davis@example.com', '2020 Cedar Lane, Fairview');

--retrieve all customer details.
select * from customer;

--update a customer's address.
update customer set address='tokyo' where customer_id=3;

--delete a customer using their customerID.
delete from customer where customer_id=2;

--display all customers whose name is 'Alice'.
select * from customer where name='Alice JOhnson';


-----------------------------------------------------------

-- Create the orders table    (2)
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

-- Insert 5 sample entries into the orders table
INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(101, 1, '2025-09-10', 250.75),
(102, 2, '2025-09-12', 130.50),
(103, 1, '2025-09-15', 499.99),
(104, 3, '2025-09-16', 89.00),
(105, 4, '2025-09-17', 320.00);

--retrieve all orders made by a specific customer.
select * from orders where customer_id=4;

--update an order's total amount.
update orders set total_amount=535 where customer_id=3;

--delete an order using its orderid.
delete from orders where order_id=1;

--retrieve orders placed in the last 30 days.
select * from orders where order_date >= CURRENT_DATE - INTERVAL 30 DAY;

--fetch all details.
select * from orders;

--retrieve the highest, lowest and average order amount using aggregate functions.
select max(total_amount) from orders;
select min(total_amount) from orders;
select avg(total_amount) from orders;


--------------------------------------------------------------

-- Create the products table  (3)
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    stock INT
);

-- Insert 5 sample entries into the products table
INSERT INTO products (product_id, product_name, price, stock) VALUES
(1, 'Wireless Mouse', 25.99, 150),
(2, 'Mechanical Keyboard', 89.50, 80),
(3, '27" Monitor', 199.99, 40),
(4, 'USB-C Hub', 34.75, 120),
(5, 'Webcam 1080p', 49.99, 60);

--retrieve all products sorted by price in descending order.
select * from products ORDER BY price DESC;

--update the price of a specific product.
update products set price=150 WHERE product_id=2;

--delete a product if it's out of stock.
delete from products where stock=0;

--retrieve products whose price is between Rs.500 to Rs.2000.
select * from products where price in(500, 2000);

--retrieve the most expensive and cheapest product using max() and min().
select max(price) from products;

select min(price) from products;

--fetch all details.
select * from products;


------------------------------------------------------------------------

-- Create the orderdetails table (4)
CREATE TABLE orderdetails (
    orderdetails_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    subtotal DECIMAL(10, 2)
);

-- Insert 5 sample entries into the orderdetails table
INSERT INTO orderdetails (orderdetails_id, order_id, product_id, quantity, subtotal) VALUES
(1, 101, 1, 2, 51.98),     -- 2 x 25.99
(2, 101, 2, 1, 89.50),     -- 1 x 89.50
(3, 102, 4, 3, 104.25),    -- 3 x 34.75
(4, 103, 3, 2, 399.98),    -- 2 x 199.99
(5, 104, 5, 1, 49.99);     -- 1 x 49.99

--retreive all order details for a specific order.
select * from orderdetails where order_id=101;

--calculate the total revenue generated from all orders using sum().
select sum(subtotal) from orderdetails;

--retrieve the top 3 most ordered products.
select * from orderdetails ORDER BY quantity DESC;

--count how many times a specific product has been sold using count().
SELECT COUNT(*) AS times_sold
FROM orderdetails
WHERE order_id = 101;

--------------------------------------------------------------------------------------