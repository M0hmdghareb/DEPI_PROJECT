-- Database Implementation

-- Create Customer Table
CREATE TABLE Customer (
    CustomerId INT PRIMARY KEY,
    CustomerEmail VARCHAR(100),
    CustomerPassword VARCHAR(100),
    Fname VARCHAR(100),
    Lname VARCHAR(100),
    Segment VARCHAR(50),
    City VARCHAR(100),
    State VARCHAR(100),
    Country VARCHAR(100),
    Street VARCHAR(255),
    Zipcode VARCHAR(20)
);

-- Create Orders Table
CREATE TABLE Orders (
    OrderId INT PRIMARY KEY,
    OrderDate DATETIME,
    ShippingDate DATETIME,
    ShippingMode VARCHAR(100),
    Type VARCHAR(50),
    OrderStatus VARCHAR(50),
    OrderCity VARCHAR(100),
    OrderCountry VARCHAR(100),
    OrderState VARCHAR(100),
    OrderRegion VARCHAR(100),
    CustomerId INT,
    LateDeliveryRisk INT,
    DaysForShippingReal INT,
    DaysForShipmentScheduled INT,
    BenefitPerOrder DECIMAL(10, 2),
    DeliveryStatus VARCHAR(50),
    Market VARCHAR(100),
    FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId)
);

-- Create Sales Table
CREATE TABLE Sales (
    SalesId INT PRIMARY KEY,
    OrderId INT,
    SalesAmount DECIMAL(10, 2),
    ProfitPerOrder DECIMAL(10, 2),
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId)
);

-- Create Department Table
CREATE TABLE Department (
    DepartmentId INT PRIMARY KEY,
    Latitude DECIMAL,
    Longitude DECIMAL(10, 2),
    Name VARCHAR(100)
);

-- Create Category Table
CREATE TABLE Category (
    CategoryId INT PRIMARY KEY,
    Name VARCHAR(100),
    DepartmentId INT,
    FOREIGN KEY (DepartmentId) REFERENCES Department(DepartmentId)
);

-- Create Product Table
CREATE TABLE Product (
    ProductCardId INT PRIMARY KEY,
    Name VARCHAR(100),
    ProductDescription VARCHAR(100),
    Price DECIMAL(10, 2),
    CategoryId INT,
    Image VARCHAR(255),
    ProductStatus VARCHAR(20),
    FOREIGN KEY (CategoryId) REFERENCES Category(CategoryId)
);

-- Create OrderItem Table
CREATE TABLE OrderItem (
    OrderItemId INT PRIMARY KEY,
    ProductCardId INT,
    OrderId INT,
    Quantity INT,
    ProductPrice DECIMAL(10, 2),
    Discount DECIMAL(10, 2),
    Total DECIMAL(10, 2),
    ProfitRatio DECIMAL(10, 2),
    DiscountRate DECIMAL(10, 2),
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId),
    FOREIGN KEY (ProductCardId) REFERENCES Product(ProductCardId)
);
