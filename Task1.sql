USE  elevatelabs;
-- Customers Table
CREATE TABLE purchaser (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address TEXT
);
SELECT * FROM purchaser;

-- Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL
);
SELECT * FROM products;

-- Orders Table
CREATE TABLE Orders1 (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES purchaser(customer_id)
);
SELECT * FROM Orders1;

-- Order_Items Table (many-to-many relation)
CREATE TABLE Order_Items1 (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders1(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
SELECT * FROM order_items1;

-- Payments Table
CREATE TABLE Payments1 (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10,2) NOT NULL,
    method VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES Orders1(order_id)
);
SELECT * FROM payments1;
