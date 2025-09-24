USE elevatelabs; //Select database

Purchaser 
CREATE TABLE purchaser (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,  // primary key and auto increment
    name VARCHAR(100) NOT NULL, 
    email VARCHAR(100) UNIQUE NOT NULL, // email must be unique
    phone VARCHAR(15),
    address TEXT
);

Products table
// stores product details and includes name, description, price, and stock availability.
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL
);

Orders table
//Tracks customer orders.
//customer_id links orders to purchasers.
//Default status = Pending.
CREATE TABLE Orders1 (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES purchaser(customer_id)
);

Order_items table
//Connects Orders ↔ Products (many-to-many).
//Stores quantity of each product in an order.
CREATE TABLE Order_Items1 (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders1(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


Payments
//Records payments for orders.
//Stores amount, method (UPI, Card, etc.), and payment date.
CREATE TABLE Payments1 (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10,2) NOT NULL,
    method VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES Orders1(order_id)
);




