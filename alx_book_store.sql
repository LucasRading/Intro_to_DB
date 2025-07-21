-- CREATE DATABASE
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- CREATE TABLE: AUTHORS
CREATE TABLE AUTHORS (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(215) NOT NULL
);

-- CREATE TABLE: BOOKS
CREATE TABLE BOOKS (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES AUTHORS(author_id)
);

-- CREATE TABLE: CUSTOMERS
CREATE TABLE CUSTOMERS (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL,
    address TEXT
);

-- CREATE TABLE: ORDERS
CREATE TABLE ORDERS (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
);

-- CREATE TABLE: ORDER_DETAILS
CREATE TABLE ORDER_DETAILS (
    orderdetailid INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
    FOREIGN KEY (book_id) REFERENCES BOOKS(book_id)
);

-- INSERT SAMPLE DATA INTO AUTHORS
INSERT INTO AUTHORS (author_name) VALUES
('Chinua Achebe'),
('Ngũgĩ wa Thiong\'o'),
('Margaret Atwood');

-- INSERT SAMPLE DATA INTO BOOKS
INSERT INTO BOOKS (title, author_id, price, publication_date) VALUES
('Things Fall Apart', 1, 1200.00, '1958-06-17'),
('Weep Not, Child', 2, 950.50, '1964-03-12'),
('The Handmaid\'s Tale', 3, 1800.00, '1985-09-01');

-- INSERT SAMPLE DATA INTO CUSTOMERS
INSERT INTO CUSTOMERS (customer_name, email, address) VALUES
('Alice Wanjiku', 'alice@example.com', '123 Nairobi Rd, Kenya'),
('Brian Otieno', 'brian@example.com', '456 Kisumu Ave, Kenya');

-- INSERT SAMPLE DATA INTO ORDERS
INSERT INTO ORDERS (customer_id, order_date) VALUES
(1, '2025-07-01'),
(2, '2025-07-01');

-- INSERT SAMPLE DATA INTO ORDER_DETAILS
INSERT INTO ORDER_DETAILS (order_id, book_id, quantity) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1);
