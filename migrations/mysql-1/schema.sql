CREATE DATABASE public;

USE public;

CREATE TABLE transactions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  company_id INT NOT NULL,
  amount INT NOT NULL,
  description VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Insert data example
INSERT INTO transactions (company_id, amount, description) VALUES (1, 100, 'Payment for service');
INSERT INTO transactions (company_id, amount, description) VALUES (1, 100, 'Payment for service');
INSERT INTO transactions (company_id, amount, description) VALUES (2, 150, 'Payment for product');
INSERT INTO transactions (company_id, amount, description) VALUES (3, 200, 'Payment for service');
INSERT INTO transactions (company_id, amount, description) VALUES (3, 250, 'Payment for product');