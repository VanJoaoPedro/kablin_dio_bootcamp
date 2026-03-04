CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- TABELA CUSTOMERS

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(10),
    last_name VARCHAR(20),
    CPF CHAR(11) NOT NULL UNIQUE,
    address VARCHAR(150) NOT NULL,
	city VARCHAR(100) NOT NULL,
    state VARCHAR(50) NOT NULL,
    postal_code CHAR(8) NOT NULL,
    country VARCHAR(100) NOT NULL DEFAULT 'Brazil'
);

-- TABELA ORDERS

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_status ENUM('Canceled','Confirmed','Processing','Shipped','Delivered') 
        NOT NULL DEFAULT 'Processing',
    order_description VARCHAR(255),
    shipping DECIMAL(10,2) NOT NULL DEFAULT 10.00,
    CONSTRAINT fk_order_customer FOREIGN KEY (customer_id) 
		REFERENCES customers(customer_id) 
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

-- TABELA PAYMENTS

CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_method ENUM('Pix','Bank Slip','Two Credit Cards','Credit Card'),
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATETIME,
    payment_status ENUM('Pending','Approved','Declined','Refunded'),
    transaction_code VARCHAR(100) UNIQUE,
    CONSTRAINT  fk_payments_order FOREIGN KEY (order_id) 
    REFERENCES orders(order_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT chk_amount CHECK (amount > 0)
);

-- TABELA PRODUCT

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
	product_status ENUM('Available','Out of Stock') DEFAULT 'Available',
    category ENUM('Electronics','Clothing','Toys','Food') NOT NULL,
    information VARCHAR(150),
    price DECIMAL(10,2) NOT NULL,
    brand VARCHAR(20) NOT NULL,
    rating DECIMAL(2,1),
    CONSTRAINT chk_rating CHECK (rating BETWEEN 0 AND 5)
);

-- TABELA PRODUCT ORDER

CREATE TABLE product_order (
    product_id INT NOT NULL,
    order_id INT NOT NULL,
    quantity INT DEFAULT 1,
    PRIMARY KEY (product_id, order_id),
    CONSTRAINT fk_product_order_product FOREIGN KEY (product_id) 
		REFERENCES products(product_id)
        ON DELETE RESTRICT,
    CONSTRAINT fk_product_order_order FOREIGN KEY (order_id)
		REFERENCES orders(order_id)
		ON DELETE CASCADE
);

-- TABELA SELLER

CREATE TABLE sellers (
    seller_id INT AUTO_INCREMENT PRIMARY KEY,
    social_name VARCHAR(255) NOT NULL,
    CNPJ CHAR(14) UNIQUE,
	contact CHAR(11) NOT NULL,
    location VARCHAR(255)
);


-- TABELA PRODUCT SELLER

CREATE TABLE product_seller (
    seller_id INT,
    product_id INT,
    quantity INT DEFAULT 1,
    PRIMARY KEY (seller_id, product_id),
    CONSTRAINT fk_productseller_seller FOREIGN KEY (seller_id) 
		REFERENCES sellers(seller_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_productseller_product FOREIGN KEY (product_id) 
		REFERENCES products(product_id)
		ON DELETE CASCADE
);	


-- TABELA PRODUCT STORAGE

CREATE TABLE storages (
    storage_id INT AUTO_INCREMENT PRIMARY KEY,
    storage_location VARCHAR(20),
    quantity INT DEFAULT 0
);

-- TABELA STORAGE LOCATION

CREATE TABLE storage_location (
    product_id INT,
    storage_id INT,
    location VARCHAR(255) NOT NULL,
    PRIMARY KEY (product_id, storage_id),
    CONSTRAINT fk_storagelocation_product FOREIGN KEY (product_id) 
		REFERENCES products(product_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_storagelocation_storage FOREIGN KEY (storage_id) 
		REFERENCES storages(storage_id)
        ON DELETE CASCADE
);

-- TABELA SUPPLIER

CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    social_name VARCHAR(255) NOT NULL,
    CNPJ CHAR(14) UNIQUE,
    contact CHAR(11) NOT NULL
);
