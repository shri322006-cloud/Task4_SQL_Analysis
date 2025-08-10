-- Select All Customers
SELECT * FROM customers;

-- Total Orders per Customer
SELECT c.name, COUNT(o.order_id) AS total_orders
        FROM customers c
        LEFT JOIN orders o ON c.customer_id = o.customer_id
        GROUP BY c.name;

-- Average Order Value
SELECT AVG(total_amount) AS avg_order_value FROM orders;

-- Orders Above $300
SELECT * FROM orders WHERE total_amount > 300 ORDER BY total_amount DESC;

-- Inner Join Example
SELECT o.order_id, c.name, o.total_amount
        FROM orders o
        INNER JOIN customers c ON o.customer_id = c.customer_id;

-- Subquery Example (Customers with total spend > $400)
SELECT name FROM customers
        WHERE customer_id IN (
            SELECT customer_id FROM orders
            GROUP BY customer_id
            HAVING SUM(total_amount) > 400
        );

-- Create View for High Value Orders
CREATE VIEW high_value_orders AS SELECT * FROM orders WHERE total_amount > 400;

-- Select from View
SELECT * FROM high_value_orders;

