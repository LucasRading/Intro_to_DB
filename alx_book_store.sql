CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

CREATE TABLE Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(215) NOT NULL
);


CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL,
    address TEXT
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
);

CREATE TABLE Order_Details (
    orderdetailid INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

INSERT INTO Authors (author_name) VALUES
('Chinua Achebe'),
('Ngũgĩ wa Thiong\'o'),
('Margaret Atwood');

INSERT INTO Books (title, author_id, price, publication_date) VALUES
('Things Fall Apart', 1, 1200.00, '1958-06-17'),
('Weep Not, Child', 2, 950.50, '1964-03-12'),
('The Handmaid\'s Tale', 3, 1800.00, '1985-09-01');

INSERT INTO Customers (customer_name, email, address) VALUES
('Alice Wanjiku', 'alice@example.com', '123 Nairobi Rd, Kenya'),
('Brian Otieno', 'brian@example.com', '456 Kisumu Ave, Kenya');

INSERT INTO Orders (customer_id, order_date) VALUES
(1, '2025-07-01'),
(2, '2025-07-01');

INSERT INTO Order_Details (order_id, book_id, quantity) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1);
