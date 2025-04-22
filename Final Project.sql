use lx_get16905;

CREATE TABLE Products (
    Product_ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Description TEXT,
    Price DECIMAL(10,2),
    Merchandise_Division VARCHAR(50)
);

CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Address TEXT,
    City VARCHAR(100),
    State VARCHAR(50),
    Postal_Code VARCHAR(10),
    Country VARCHAR(50)
);

CREATE TABLE Warehouses (
    Warehouse_ID INT PRIMARY KEY,
    Warehouse_Name VARCHAR(255),
    Address TEXT,
    City VARCHAR(100),
    State VARCHAR(50),
    Postal_Code VARCHAR(10),
    Country VARCHAR(50)
);

CREATE TABLE Order_Status (
    Status_Code VARCHAR(5) PRIMARY KEY,
    Description TEXT
);


CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Product_ID INT,
    Order_Date DATETIME,
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Order_Status_Code VARCHAR(5),
    Shipped_Date DATETIME,
    Warehouse_ID INT,
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID),
    FOREIGN KEY (Order_Status_Code) REFERENCES Order_Status(Status_Code),
    FOREIGN KEY (Warehouse_ID) REFERENCES Warehouses(Warehouse_ID)
);

CREATE VIEW Orders_View AS
SELECT Order_ID, Customer_ID, Product_ID, Order_Date, Quantity, Unit_Price,
       (Quantity * Unit_Price) AS Total_Amount,
       Order_Status_Code, Shipped_Date
FROM Orders;

CREATE TABLE Warehouses_has_Products (
    Warehouse_ID INT,
    Product_ID INT,
    PRIMARY KEY (Warehouse_ID, Product_ID),
    FOREIGN KEY (Warehouse_ID) REFERENCES Warehouses(Warehouse_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

INSERT INTO Products (Product_ID, Name, Description, Price, Merchandise_Division)
VALUES
(10001, 'Widget A', 'High-quality widget', 19.99, 'Electronics'),
(10002, 'Gadget B', 'Latest tech gadget', 299.99, 'Gadgets'),
(10003, 'Appliance C', 'Energy-efficient appliance', 450.00, 'Home Appliances'),
(10004, 'Tool D', 'Durable and reliable tool', 24.99, 'Hardware'),
(10005, 'Accessory E', 'Stylish new accessory', 9.99, 'Apparel');

INSERT INTO Customers (Customer_ID, Name, Address, City, State, Postal_Code, Country)
VALUES
(2001, 'John Doe', '123 Elm St', 'Springfield', 'IL', '62704', 'USA'),
(2002, 'Jane Smith', '456 Oak Ave', 'Lincoln', 'NE', '68521', 'USA'),
(2003, 'Sam Johnson', '789 Pine Rd', 'Madison', 'WI', '53703', 'USA'),
(2004, 'Pat Lee', '321 Maple Ln', 'Austin', 'TX', '73301', 'USA'),
(2005, 'Kim Brown', '654 Cedar Blvd', 'Denver', 'CO', '80014', 'USA');

INSERT INTO Warehouses (Warehouse_ID, Warehouse_Name, Address, City, State, Postal_Code, Country)
VALUES
(101, 'Warehouse A', '100 Industrial Way', 'Nashville', 'TN', '37210', 'USA'),
(102, 'Warehouse B', '200 Shipping Ln', 'Omaha', 'NE', '68107', 'USA'),
(103, 'Warehouse C', '300 Logistics Blvd', 'Reno', 'NV', '89502', 'USA'),
(104, 'Warehouse D', '400 Distribution Dr', 'Orlando', 'FL', '32824', 'USA'),
(105, 'Warehouse E', '500 Freight St', 'Dallas', 'TX', '75212', 'USA');

INSERT INTO Order_Status (Status_Code, Description)
VALUES
('SH', 'Shipped'),
('PR', 'Processing'),
('RT', 'Returned'),
('DL', 'Delivered'),
('CN', 'Cancelled');


INSERT INTO Orders (Order_ID, Customer_ID, Product_ID, Order_Date, Quantity, Unit_Price, Order_Status_Code, Shipped_Date, Warehouse_ID)
VALUES
(5001, 2001, 10001, '2024-01-10 14:00:00', 2, 19.99, 'SH', '2024-01-12 10:00:00', 101),
(5002, 2002, 10003, '2024-01-11 09:30:00', 1, 450.00, 'PR', '2024-01-13 08:45:00', 102),
(5003, 2003, 10002, '2024-01-12 16:20:00', 3, 299.99, 'RT', '2024-01-14 16:00:00', 103),
(5004, 2004, 10005, '2024-01-13 11:15:00', 1, 9.99, 'DL', '2024-01-15 09:00:00', 104),
(5005, 2005, 10004, '2024-01-14 13:45:00', 2, 24.99, 'SH', '2024-01-16 12:00:00', 105);


SELECT * FROM Orders;







