CREATE TABLE if not exists CUSTOMERS
(
    id           SERIAL PRIMARY KEY,
    name         varchar(80),
    surname      varchar(80),
    age          int,
    phone_number varchar(80)
);

CREATE TABLE if not exists ORDERS
(
    id           SERIAL PRIMARY KEY,
    date         varchar(80),
    customer_id int REFERENCES CUSTOMERS (id),
    product_name varchar(80),
    amount       int
);