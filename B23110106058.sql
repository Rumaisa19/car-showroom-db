CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    JoinDate DATE
);

CREATE TABLE Cars (
    CarID SERIAL PRIMARY KEY,
    Model VARCHAR(100),
    Brand VARCHAR(50),
    Year INT,
    Price NUMERIC(12,2),
    Color VARCHAR(50),
    InventoryCount INT
);

CREATE TABLE Salespersons (
    SalespersonID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    HireDate DATE
);

CREATE TABLE Sales (
    SaleID SERIAL PRIMARY KEY,
    CustomerID INT REFERENCES Customers(CustomerID),
    CarID INT REFERENCES Cars(CarID),
    SaleDate DATE,
    SalePrice NUMERIC(12,2),
    SalespersonID INT REFERENCES Salespersons(SalespersonID)
);

CREATE TABLE ServiceRecords (
    RecordID SERIAL PRIMARY KEY,
    CarID INT REFERENCES Cars(CarID),
    ServiceDate DATE,
    ServiceType VARCHAR(50),
    Cost NUMERIC(10,2),
    TechnicianID INT
);


INSERT INTO Customers (CustomerName, City, State, JoinDate) VALUES
('Ali Khan', 'Lahore', 'Punjab', '2023-01-10'),
('Sara Malik', 'Karachi', 'Sindh', '2023-03-15'),
('John Smith', 'Islamabad', 'ICT', '2023-05-20'),
('Fatima Noor', 'Multan', 'Punjab', '2024-01-25'),
('David Lee', 'Quetta', 'Balochistan', '2024-04-12'),
('Maryam Khan', 'Peshawar', 'KP', '2024-06-05');

INSERT INTO Cars (Model, Brand, Year, Price, Color, InventoryCount) VALUES
('Civic', 'Honda', 2024, 45000, 'White', 5),
('City', 'Honda', 2023, 30000, 'Black', 3),
('Corolla', 'Toyota', 2024, 40000, 'White', 4),
('Camry', 'Toyota', 2023, 55000, 'Silver', 2),
('Fortuner', 'Toyota', 2024, 70000, 'Black', 1),
('Mehran', 'Suzuki', 2020, 15000, 'Red', 7),
('Alto', 'Suzuki', 2023, 18000, 'White', 8),
('Swift', 'Suzuki', 2024, 22000, 'Blue', 3),
('Model S', 'Tesla', 2024, 80000, 'White', 2),
('Model 3', 'Tesla', 2023, 60000, 'Black', 3),
('Cybertruck', 'Tesla', 2024, 90000, 'Silver', 1);

INSERT INTO Salespersons (Name, Department, HireDate) VALUES
('Ahmed Raza', 'Sales', '2022-01-15'),
('Bilal Khan', 'Sales', '2021-07-20'),
('Chris Martin', 'Sales', '2020-05-30');

INSERT INTO Sales (CustomerID, CarID, SaleDate, SalePrice, SalespersonID) VALUES
(1, 1, '2024-06-15', 45000, 1),
(2, 4, '2024-07-10', 55000, 2),
(3, 5, '2024-07-15', 70000, 1),
(4, 9, '2024-08-01', 80000, 3),
(5, 11, '2024-08-05', 90000, 2),
(6, 10, '2024-08-08', 60000, 1),
(1, 2, '2024-08-09', 30000, 2),
(2, 3, '2024-08-09', 40000, 1),
(3, 7, '2024-08-09', 18000, 3),
(4, 6, '2024-08-09', 15000, 1),
(5, 8, '2024-08-09', 22000, 3),
(1, 1, '2024-08-09', 45000, 2),
(2, 1, '2024-08-09', 45000, 1),
(3, 1, '2024-08-09', 45000, 3),
(4, 1, '2024-08-09', 45000, 2);

INSERT INTO ServiceRecords (CarID, ServiceDate, ServiceType, Cost, TechnicianID) VALUES
(1, '2024-06-20', 'Oil Change', 200, 1),
(2, '2024-07-05', 'Brake Replacement', 800, 2),
(3, '2024-07-15', 'Tire Replacement', 600, 3),
(4, '2024-07-20', 'Engine Repair', 1500, 1),
(5, '2024-07-25', 'Oil Change', 250, 2),
(6, '2024-08-01', 'Transmission Repair', 1200, 3),
(7, '2024-08-02', 'Brake Replacement', 900, 1),
(8, '2024-08-03', 'Oil Change', 180, 2),
(9, '2024-08-04', 'Engine Repair', 2000, 3),
(10, '2024-08-05', 'Brake Replacement', 700, 1);


SELECT COUNT(*) AS total_customers FROM Customers;
SELECT AVG(SalePrice) AS avg_sale_price FROM Sales;
SELECT MAX(SalePrice) AS most_expensive_car_sold FROM Sales;
SELECT SUM(InventoryCount) AS total_inventory FROM Cars;
SELECT MIN(SaleDate) AS earliest_sale, MAX(SaleDate) AS latest_sale FROM Sales;


SELECT Brand, COUNT(DISTINCT Model) AS model_count FROM Cars GROUP BY Brand;
SELECT SalespersonID, SUM(SalePrice) AS total_sales FROM Sales GROUP BY SalespersonID;
SELECT CarID, AVG(SalePrice) AS avg_price FROM Sales GROUP BY CarID;
SELECT ServiceType, AVG(Cost) AS avg_service_cost FROM ServiceRecords GROUP BY ServiceType;
SELECT Brand, Color, COUNT(*) AS car_count FROM Cars GROUP BY Brand, Color;


SELECT Brand FROM Cars GROUP BY Brand HAVING COUNT(DISTINCT Model) > 5;
SELECT CarID FROM Sales GROUP BY CarID HAVING COUNT(*) > 10;
SELECT SalespersonID FROM Sales GROUP BY SalespersonID HAVING AVG(SalePrice) > 50000;
SELECT DATE_TRUNC('month', SaleDate) AS month FROM Sales GROUP BY month HAVING COUNT(*) > 20;
SELECT ServiceType FROM ServiceRecords GROUP BY ServiceType HAVING AVG(Cost) > 500;
