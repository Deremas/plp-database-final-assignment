-- ========================================
-- Week 8 Final Project: E-commerce Store
-- Scalable SQL Database Schema
-- ========================================

-- Create database
CREATE DATABASE IF NOT EXISTS ECommerceDB;
USE ECommerceDB;

-- ========================================
-- TABLE: Customers
-- ========================================
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(20),
    RegistrationDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ========================================
-- TABLE: Categories
-- Products can belong to multiple categories (Many-to-Many via ProductCategories)
-- ========================================
CREATE TABLE IF NOT EXISTS Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE NOT NULL
);

-- ========================================
-- TABLE: Products
-- ========================================
CREATE TABLE IF NOT EXISTS Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(150) NOT NULL,
    Description TEXT,
    Price DECIMAL(10,2) NOT NULL,
    StockQuantity INT DEFAULT 0,
    UNIQUE(Name)
);

-- ========================================
-- TABLE: ProductCategories (Many-to-Many: Products <-> Categories)
-- ========================================
CREATE TABLE IF NOT EXISTS ProductCategories (
    ProductID INT NOT NULL,
    CategoryID INT NOT NULL,
    PRIMARY KEY (ProductID, CategoryID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ========================================
-- TABLE: Orders
-- One-to-Many: Customer -> Orders
-- ========================================
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    Status ENUM('Pending','Processing','Shipped','Delivered','Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ========================================
-- TABLE: OrderItems
-- Many-to-One: Order -> OrderItems, Product -> OrderItems
-- ========================================
CREATE TABLE IF NOT EXISTS OrderItems (
    OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ========================================
-- TABLE: Staff
-- ========================================
CREATE TABLE IF NOT EXISTS Staff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Role VARCHAR(50) NOT NULL,
    HireDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ========================================
-- INDEXES for optimization
-- ========================================
CREATE INDEX idx_orders_customer ON Orders(CustomerID);
CREATE INDEX idx_orderitems_order ON OrderItems(OrderID);
CREATE INDEX idx_orderitems_product ON OrderItems(ProductID);
CREATE INDEX idx_productcategories_product ON ProductCategories(ProductID);
CREATE INDEX idx_productcategories_category ON ProductCategories(CategoryID);


-- Execute from terminal:
-- Run from terminal: mysql -u your_username -p salesdb < answers.sql (enter password when prompted)
-- Or with root: mysql -u root -p salesdb < answers.sql (enter password when prompted)