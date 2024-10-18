-- Data Warehouse Implementation (DW)


-- Create DimDate (Date Dimension)
CREATE TABLE DimDate (
    DateKey INT NOT NULL,
    DateValue DATE,
    year INT,
    month INT,
    day INT
)
WITH (
    DISTRIBUTION = REPLICATE,
    CLUSTERED COLUMNSTORE INDEX
);

-- Create DimCustomer (Customer Dimension)
CREATE TABLE DimCustomer (
    CustomerKey INT NOT NULL,
    CustomerFName NVARCHAR(100),
    CustomerLName NVARCHAR(100),
    CustomerSegment NVARCHAR(50)
)
WITH (
    DISTRIBUTION = REPLICATE,
    CLUSTERED COLUMNSTORE INDEX
);

-- Create DimProduct (Product Dimension)
CREATE TABLE DimProduct (
    ProductKey INT NOT NULL,
    ProductName NVARCHAR(100),
    ProductPrice DECIMAL(18, 2),
    ProductStatus NVARCHAR(50),
    CategoryKey INT
)
WITH (
    DISTRIBUTION = REPLICATE,
    CLUSTERED COLUMNSTORE INDEX
);

-- Create DimCategory (Category Dimension)
CREATE TABLE DimCategory (
    CategoryKey INT NOT NULL,
    CategoryName NVARCHAR(100),
    DepartmentName NVARCHAR(100)
)
WITH (
    DISTRIBUTION = REPLICATE,
    CLUSTERED COLUMNSTORE INDEX
);

-- Create DimGeography (Geography Dimension)
CREATE TABLE DimGeography (
    GeographyKey INT NOT NULL,
    City NVARCHAR(100),
    State NVARCHAR(100),
    Country NVARCHAR(100),
    ZipCode NVARCHAR(20),
    Latitude DECIMAL(9, 6),
    Longitude DECIMAL(9, 6),
    Market NVARCHAR(100),
    Region NVARCHAR(100)
)
WITH (
    DISTRIBUTION = REPLICATE,
    CLUSTERED COLUMNSTORE INDEX
);

-- Create DimShippingMode (Shipping Mode Dimension)
CREATE TABLE DimShippingMode (
    ShippingModeKey INT NOT NULL,
    ShippingMode NVARCHAR(100),
    DaysForShippingReal INT,
    DaysForShippingScheduled INT
)
WITH (
    DISTRIBUTION = REPLICATE,
    CLUSTERED COLUMNSTORE INDEX
);

-- Create DimDeliveryStatus (Delivery Status Dimension) with LateDeliveryRisk column
CREATE TABLE DimDeliveryStatus (
    DeliveryStatusKey INT NOT NULL,
    DeliveryStatus NVARCHAR(100),
    LateDeliveryRisk INT   -- Added new column with default value
)
WITH (
    DISTRIBUTION = REPLICATE,
    CLUSTERED COLUMNSTORE INDEX
);

-- Create FactOrders (Fact Table)
CREATE TABLE FactOrders (
    OrderID INT NOT NULL,
    CustomerKey INT,
    ProductKey INT,
    DeliveryStatusKey INT,
    GeographyKey INT,
    ShippingModeKey INT,
    OrderDate DATE,
    SaleAmount DECIMAL(18, 2),
    OrderItemQuantity INT,
    OrderItemDiscount DECIMAL(18, 2)
)
WITH (
    DISTRIBUTION = HASH(OrderID),
    CLUSTERED COLUMNSTORE INDEX
);
