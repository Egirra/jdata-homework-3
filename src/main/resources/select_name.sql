SELECT o.product_name
FROM orders o
JOIN customers c ON c.id = o.customer_id
WHERE LOWER(c.name) = LOWER(:name)