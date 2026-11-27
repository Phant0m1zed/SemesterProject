DROP DATABASE IF EXISTS pharmacy_db;
CREATE DATABASE pharmacy_db;

CREATE USER IF NOT EXISTS 'pharmacy_app'@'127.0.0.1' IDENTIFIED BY 'Pharmacy@123';
GRANT SELECT, INSERT, UPDATE, DELETE ON pharmacy_db.* TO 'pharmacy_app'@'127.0.0.1';
FLUSH PRIVILEGES;

USE pharmacy_db;

-- 1. Suppliers
CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL
);

-- 2. Medicines
CREATE TABLE medicines (
    medicine_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
    stock INT NOT NULL CHECK (stock >= 0),
    expiry_date DATE NOT NULL,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id) ON DELETE SET NULL
);

-- 3. Sales (Invoices)
CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) DEFAULT 'Walk-in Customer',
    sale_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL DEFAULT 0.00
);

-- 4. Sale Items (Links Sales <-> Medicines)
CREATE TABLE sale_items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    sale_id INT NOT NULL,
    medicine_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (sale_id) REFERENCES sales(sale_id) ON DELETE CASCADE,
    FOREIGN KEY (medicine_id) REFERENCES medicines(medicine_id) ON DELETE RESTRICT
);

-- Trigger: Auto-deduct medicine stock when sold
DELIMITER //
CREATE TRIGGER trg_reduce_stock
BEFORE INSERT ON sale_items
FOR EACH ROW
BEGIN
    DECLARE current_stock INT;
    SELECT stock INTO current_stock FROM medicines WHERE medicine_id = NEW.medicine_id;

    IF current_stock < NEW.quantity THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Not enough stock available!';
    ELSE
        UPDATE medicines SET stock = stock - NEW.quantity WHERE medicine_id = NEW.medicine_id;
    END IF;
END //
DELIMITER ;

-- Sample Data
INSERT INTO suppliers (name, phone) VALUES
('Getz Pharma', '0300-1234567'),
('GSK Pakistan', '0321-7654321');

INSERT INTO medicines (name, category, price, stock, expiry_date, supplier_id) VALUES
('Panadol 500mg', 'Painkiller', 35.00, 150, '2027-08-15', 2),
('Augmentin 625mg', 'Antibiotic', 420.00, 40, '2027-04-10', 2),
('Brufen Syrup', 'Syrup', 180.00, 8, '2027-01-20', 1);
