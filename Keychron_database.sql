CREATE TABLE Products(
    product_id INT(9) NOT NULL AUTO_INCREMENT,
    supplier_id INT(3) NOT NULL,
    product_category_id INT (3) NOT NULL,
    product_name VARCHAR(50) NOT NULL,
    product_price DECIMAL(6,2) NOT NULL,
   	   PRIMARY KEY(product_id));

CREATE TABLE Product_Category(
    product_category_id INT(3) NOT NULL AUTO_INCREMENT,
    product_category_name VARCHAR(20) NOT NULL,
    status VARCHAR(10) NOT NULL,
    description TEXT(250) DEFAULT NULL,
   	   PRIMARY KEY(product_category_id));

CREATE TABLE Orders(
    order_id INT(9) NOT NULL AUTO_INCREMENT,
    customer_id INT(9) NOT NULL,
    staff_id INT(9) NOT NULL,
    invoice_id INT(9) NOT NULL,
    shipping_company_id INT(3) NOT NULL,
    order_date DATETIME,
        PRIMARY KEY(order_id));

CREATE TABLE Invoices(
    invoice_id INT(9) NOT NULL AUTO_INCREMENT,
    order_id INT(9) NOT NULL,
    customer_id INT(9) NOT NULL,
    invoice_date DATETIME NOT NULL,
    invoice_amount DECIMAL(6,2) NOT NULL,
    warranty_expiration_date DATETIME DEFAULT (invoice_date + INTERVAL 1 YEAR),
        PRIMARY KEY(invoice_id));


CREATE TABLE Ordered_Product(
    ordered_product_id INT(9) NOT NULL AUTO_INCREMENT,
    order_id INT(9) NOT NULL,
    product_id INT(9) NOT NULL,
    quantity INT(9) NOT NULL,
    	PRIMARY KEY(ordered_product_id, order_id));


CREATE TABLE Suppliers(
    supplier_id int(3) NOT NULL AUTO_INCREMENT,
    supplier_name VARCHAR(50) NOT NULL,
    supplier_contact_name VARCHAR(50) NOT NULL,
    supplier_address VARCHAR(120) NOT NULL,
    supplier_city VARCHAR(30) NOT NULL,
    supplier_province_or_state VARCHAR(30) NOT NULL,
    supplier_country VARCHAR(100) NOT NULL,
    supplier_postal_code VARCHAR(20) NOT NULL,
    supplier_phone_number CHAR(20) NOT NULL,
    supplier_email_address VARCHAR(100) NOT NULL,
        PRIMARY KEY(supplier_id));


CREATE TABLE Staff(
    staff_id INT(9) NOT NULL AUTO_INCREMENT,
    staff_first_name VARCHAR(50) NOT NULL,
    staff_last_name VARCHAR(50) NOT NULL,
    staff_birth_date DATE NOT NULL,
    supervisor_id INT(9),
    staff_phone_number CHAR(20) NOT NULL,
    staff_email_address VARCHAR(100) NOT NULL,
    staff_notes TEXT,
        PRIMARY KEY (staff_id),
        CONSTRAINT fk_has_supervisor FOREIGN KEY (supervisor_id) REFERENCES staff(staff_id));


CREATE TABLE Customers(
    customer_id INT(9) NOT NULL AUTO_INCREMENT,
    customer_name VARCHAR(50) NOT NULL,
    customer_last_name VARCHAR(50) NOT NULL,
    customer_address VARCHAR(120) NOT NULL,
    customer_city VARCHAR(30) NOT NULL,
    customer_province_or_state VARCHAR(30) NOT NULL,
    customer_country VARCHAR(100) NOT NULL,
    customer_postal_code VARCHAR(20) NOT NULL,
    customer_phone_number CHAR(20) NOT NULL,
    customer_email_address VARCHAR(100),
    customer_password VARCHAR(100),
  	    PRIMARY KEY(customer_id));


CREATE TABLE Inventory(
    inventory_id INT(4) NOT NULL AUTO_INCREMENT,
    product_id INT(9) NOT NULL,
    warehouse_id INT(2) NOT NULL,
    inventory_amount INT(5),  -- reorder amount trigger?
        PRIMARY KEY(inventory_id));


CREATE TABLE Warehouses(
    warehouse_id INT(2) NOT NULL AUTO_INCREMENT,
    warehouse_contact_name VARCHAR(50) NOT NULL,
    warehouse_address VARCHAR(120) NOT NULL,
    warehouse_city VARCHAR(30) NOT NULL,
    warehouse_province_or_state VARCHAR(30) NOT NULL,
    warehouse_country VARCHAR(50) NOT NULL,
    warehouse_postal_code VARCHAR(20) NOT NULL,
    warehouse_phone_number VARCHAR(20) NOT NULL,
    warehouse_email_address VARCHAR(100) NOT NULL,
        PRIMARY KEY(warehouse_id));


CREATE TABLE Shipping_Company(
    shipping_company_id INT(3) NOT NULL AUTO_INCREMENT,
    shipping_company_name VARCHAR(50) NOT NULL,
    shipping_contact_name VARCHAR(50) NOT NULL,
    shipping_company_address VARCHAR(120) NOT NULL,
    shipping_company_city VARCHAR(30) NOT NULL,
    shipping_company_province_or_state VARCHAR(30) NOT NULL,
    shipping_company_country VARCHAR(100) NOT NULL,
    shipping_company_postal_code VARCHAR(20) NOT NULL,
    shipping_company_phone_number CHAR(20) NOT NULL,
    shipping_company_email_address VARCHAR(100) NOT NULL,
 	    PRIMARY KEY(shipping_company_id));


        INSERT INTO Products VALUES
        (1, 100, 1, 'Keychron K3 Blue Switch', '69.00'),
        (2, 100, 1, 'Keychron K3 Red Switch', '69.00'),
        (3, 100, 1, 'Keychron K3 Brown Switch', '69.00'),
        (4, 200, 2, 'Keychron K6 Blue Switch', '79.00'),
        (5, 200, 2, 'Keychron K6 Red Switch', '79.00'),
        (6, 200, 2, 'Keychron K6 Brown Switch', '79.00'),
        (7, 300, 2, 'Keychron C2', '49.00');

        INSERT INTO Product_Category VALUES
        (1, 'K3 Keyboard', 'Active', 'Ultra-slim Wireless Mechanical Keyboard'),
        (2, 'K6 Keyboard', 'Active', 'Wireless Mechanical Keyboard'),
        (3, 'C2 Keyboard', 'Active', 'Ultra-slim Wireless Mechanical Keyboard');


        INSERT INTO Orders (order_id, customer_id, staff_id, invoice_id, shipping_company_id, order_date) VALUES
        (23445, 350, 23691, 3711, 20, '2020-11-05'),
        (23446, 630, 23401, 3712, 30, '2020-11-07'),
        (23447, 790, 23489, 3713, 40, '2020-11-13'),
        (23448, 201, 23691, 3714, 10, '2020-11-15'),
        (23449, 1000, 23401, 3716, 50, '2020-11-19');


        INSERT INTO Invoices (invoice_id, order_id, customer_id, invoice_date, invoice_amount) VALUES
        (3711, 23445, 350, '2020-11-06', '77.28'),
        (3712, 23446, 630, '2020-11-08', '88.48'),
        (3713, 23447, 790, '2020-11-14', '54.88'),
        (3714, 23448, 201, '2020-11-15', '135.7'),
        (3716, 23449, 1000, '2020-11-19', '77.28');


        INSERT INTO Ordered_Product VALUES
        (1199, 23445, 1, 1),
        (1201, 23446, 2, 1),
        (1205, 23447, 3, 1),
        (1210, 23448, 1, 1),
        (1211, 23448, 5, 1),
        (1213, 23449, 3, 1);


        INSERT INTO Suppliers VALUES
        (100, 'Pacific Electronics Inc.', 'Zicheng Wang',  '6612 Knight Street' , 'Hong Kong', 'NA', 'Hong Kong Special Administrative Region', '999077', '8522407710', 'zwang@pacificelectronics.com'),
        (200, 'Richmond Electronics', 'Dave Dao', '6631 Bridgewater Avenue', 'Richmond', 'British Columbia', 'Canada', 'V5X 1S7',  '7782217392', 'dave_dao@richmondelectronics.com'),
        (300, 'Orange Electronics', 'Alex Smith', '889 Road Avenue', 'Etobicoke', 'Ontario', 'Canada', 'V5X 1S7', '7782217392', 'asmith@orangelectronics@.ca');


        INSERT INTO Staff (staff_id, staff_first_name, staff_last_name, staff_birth_date, staff_phone_number, staff_email_address, staff_notes) VALUES
        (90741, 'Mikaela', 'Lee', '1975-12-31', '604-913-9721', 'mikaela_lee@keychron.com','Mikaela is the CEO of our company');

        INSERT INTO Staff VALUES
        (60731, 'Aurora', 'Lights', '1988-02-14', 90741, '604-221-5679', 'a_lights@keychron.com', 'Aurora is the manager of IT Department'),
        (23691, 'Donkey', 'Kong', '1995-01-21', 60731, '213-056-9994','donkey_kong@keychron.com', 'Donkey is a hardworking co-op student. He loves pineapple pizza'),
        (23401, 'Mich', 'Kyle', '1990-05-21', 60731, '213-045-9978', 'm_kyle@keychron.com','Mich is our full-stack developer'),
        (23489, 'Eric', 'Li', '1991-06-21', 60731, '213-552-452', 'eric_li@keychron.com','Eric is our Business analyst');



        INSERT INTO Customers VALUES
        (350, 'James', 'Nguyen', '3025 John Avenue', 'New York City', 'New York', 'United States', '100022', '213-300-7894', 'jnguyen3@gmail.com', '3144dsddeqw32'),
        (630, 'Michaela', 'Higgins', '2014 Makner Street', 'Toronto','Ontario', 'Canada', 'M3C R4I', '226-013-0123', 'michaela_h@423yahoo.com', 'asdfasdfasasdf'),
        (790, 'Felicia', 'Star', '5546 Smith Street', 'Miami', 'Florida', 'United States', '33186', '430-019-0125', 'star_felicia@gmail.com', '31412341234'),
        (201, 'Sarah', 'Dang', '9821 Skeena', 'Burnaby','British Columbia', 'Canada', 'V5N 9I8', '778-321-456','sarah_dang@telus.net','314asdfgadsdfg'),
        (1000, 'Donald', 'Lee', '2155 Jackson Avenue', 'Orange County', 'California', 'United States', '552213', '233-221-556', 'dlee@hotmail.com','abcsdfas21234');


        INSERT INTO Inventory VALUES
        (33, 1, 1, 50),
        (43, 1, 2, 150),
        (79, 2, 3, 250),
        (30, 3, 4, 300);


        INSERT INTO Warehouses VALUES
        (1,'Roger Smith','2321 Broadway Street','New York City','New York','United States','10022','718-524-2697', 'nyc_warehouse@keychron.com'),
        (2,'Eric Wong','3268 John Avenue','Burnaby','British Columbia','Canada','V6N 2W9','604-552-4122', 'bc_warehouse@keychron.com'),
        (3,'Ethan Singh','9607 Calvin Drive', 'Etobicoke','Ontario','Canada','M3C R4I', '226-901-4211', 'on_warehouse@keychron.com'),
        (4,'Ali Khan','2351 Richmond Highway','Miami','Florida','United States','33186','786-441-9011', 'fl_warehouse@keychron.com'),
        (5,'Derek Inamoto','1265 Unit 104-5010 Bridge Way', 'Los Angeles','California','United States','90201', '213-552-1134', 'la_warehouse@keychron.com');



        INSERT INTO Shipping_Company VALUES
        (10, 'DHL', 'Mark Moser', '1225 Duthie Avenue', 'Burnaby', 'British Columbia', 'Canada', 'V5A 1G2', '604-556-3312','hastings@dhl.ca'),
        (20, 'Fedex', 'John Hutchinson', '4425 Westgate Avenue', 'Brooklyn', 'New York', 'United States', '10023', '718-221-3321', 'westgate_brooklyn@fedex.com'),
        (30, 'UPS', 'Alina Kartkovski', '3145 Hortons Avenue', 'Etobicoke', 'Ontario', 'Canada', 'M8V 1V2', '226-221-6723', 'ups_etobicoke@ups.ca'),
        (40, 'USPS', 'Jeremy Muller', '224 Gators Street', 'Orlando', 'Florida', 'United States', '223144', '321-442-8891', 'usps_orlando@usps.com'),
        (50, 'TNT', 'Rocky Hung', '442 Diefenbaker Avenue', 'Los Angeles', 'California', 'United States', '552224', '213-442-5512', 'tnt_losangeles@tnt.com');



ALTER TABLE Staff ADD CHECK(staff_birth_date <= (CURRENT_DATE() - INTERVAL '18' YEAR));

ALTER TABLE Customers ADD CHECK(LENGTH(customer_password) >= 6);

ALTER TABLE Products
ADD CONSTRAINT fk_products_has_supplier FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id),
ADD CONSTRAINT fk_has_category_id FOREIGN KEY (product_category_id) REFERENCES Product_Category(product_category_id);

ALTER TABLE Orders
ADD CONSTRAINT fk_order_has_customer FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
ADD CONSTRAINT fk_order_has_staff FOREIGN KEY (staff_id) REFERENCES Staff(staff_id),
ADD CONSTRAINT fk_order_has_shipping_company FOREIGN KEY (shipping_company_id) REFERENCES Shipping_Company(shipping_company_id),
ADD CONSTRAINT fk_order_has_invoice FOREIGN KEY (invoice_id) REFERENCES Invoices(invoice_id),
ADD CONSTRAINT UNIQUE KEY unique_invoice(invoice_id);

ALTER TABLE Ordered_Product
ADD CONSTRAINT fk_op_has_orders FOREIGN KEY (order_id) REFERENCES Orders(order_id),
ADD CONSTRAINT fk_op_has_products FOREIGN KEY (product_id) REFERENCES Products(product_id);

ALTER TABLE Inventory
ADD CONSTRAINT fk_inventory_has_product FOREIGN KEY (product_id) REFERENCES Products(product_id),
ADD CONSTRAINT fk_inventory_has_warehouse FOREIGN KEY (warehouse_id) REFERENCES Warehouses(warehouse_id);

ALTER TABLE Invoices
ADD CONSTRAINT fk_invoice_has_order FOREIGN KEY (order_id) REFERENCES Orders(order_id),
ADD CONSTRAINT fk_invoice_has_customer FOREIGN KEY (customer_id) REFERENCES Customers(customer_id);
